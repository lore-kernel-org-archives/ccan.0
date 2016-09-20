From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/9] configurator: Reimplement run using popen
Date: Tue, 20 Sep 2016 15:00:23 +1000
Message-ID: <20160920050023.GL20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <ecf5714e7fa8075e08d54911675aa0a55b95b014.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4398352803347202778=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjl4NczzDsff
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:31 +1000 (AEST)
In-Reply-To: <ecf5714e7fa8075e08d54911675aa0a55b95b014.1474239353.git.kevin@kevinlocke.name>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Kevin Locke <kevin@kevinlocke.name>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============4398352803347202778==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oY1uq2ONqt5kuovO"
Content-Disposition: inline


--oY1uq2ONqt5kuovO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:51:59PM -0600, Kevin Locke wrote:
> Rather than using fork+pipe+system+waitpid, most of which are only
> available on POSIX-like systems, use popen which is also available on
> Windows (under the name _popen).

Concept looks good, one little wart.

>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---
>  tools/configurator/configurator.c | 77 +++++++++++++++------------------=
------
>  1 file changed, 29 insertions(+), 48 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index e322c76..9817fcd 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -24,14 +24,14 @@
>  #include <stdio.h>
>  #include <stdbool.h>
>  #include <stdlib.h>
> -#include <unistd.h>
>  #include <err.h>
> -#include <sys/types.h>
> -#include <sys/wait.h>
> -#include <sys/stat.h>
> -#include <fcntl.h>
>  #include <string.h>
> =20
> +#ifdef _MSC_VER
> +#define popen _popen
> +#define pclose _pclose
> +#endif
> +
>  #define DEFAULT_COMPILER "cc"
>  #define DEFAULT_FLAGS "-g3 -ggdb -Wall -Wundef -Wmissing-prototypes -Wmi=
ssing-declarations -Wstrict-prototypes -Wold-style-definition"
> =20
> @@ -367,20 +367,19 @@ static struct test tests[] =3D {
>  	},
>  };
> =20
> -static char *grab_fd(int fd)
> +static char *grab_stream(FILE *file)
>  {
> -	int ret;
> -	size_t max, size =3D 0;
> +	size_t max, ret, size =3D 0;
>  	char *buffer;
> =20
> -	max =3D 16384;
> -	buffer =3D malloc(max+1);
> -	while ((ret =3D read(fd, buffer + size, max - size)) > 0) {
> +	max =3D BUFSIZ;
> +	buffer =3D malloc(max);
> +	while ((ret =3D fread(buffer+size, 1, max - size, file)) =3D=3D max - s=
ize) {

This assumes that fread() will never return a short read except on EOF
or error.  I expect that will be true in practice for regular files,
but I'm not sure if it's a good idea to rely on it.

>  		size +=3D ret;
> -		if (size =3D=3D max)
> -			buffer =3D realloc(buffer, max *=3D 2);
> +		buffer =3D realloc(buffer, max *=3D 2);
>  	}
> -	if (ret < 0)
> +	size +=3D ret;
> +	if (ferror(file))
>  		err(1, "reading from command");
>  	buffer[size] =3D '\0';
>  	return buffer;
> @@ -388,43 +387,25 @@ static char *grab_fd(int fd)
> =20
>  static char *run(const char *cmd, int *exitstatus)
>  {
> -	pid_t pid;
> -	int p[2];
> +	static const char redir[] =3D " 2>&1";
> +	size_t cmdlen;
> +	char *cmdredir;
> +	FILE *cmdout;
>  	char *ret;
> -	int status;
> =20
> -	if (pipe(p) !=3D 0)
> -		err(1, "creating pipe");
> -
> -	pid =3D fork();
> -	if (pid =3D=3D -1)
> -		err(1, "forking");
> -
> -	if (pid =3D=3D 0) {
> -		if (dup2(p[1], STDOUT_FILENO) !=3D STDOUT_FILENO
> -		    || dup2(p[1], STDERR_FILENO) !=3D STDERR_FILENO
> -		    || close(p[0]) !=3D 0
> -		    || close(STDIN_FILENO) !=3D 0
> -		    || open("/dev/null", O_RDONLY) !=3D STDIN_FILENO)
> -			exit(128);
> -
> -		status =3D system(cmd);
> -		if (WIFEXITED(status))
> -			exit(WEXITSTATUS(status));
> -		/* Here's a hint... */
> -		exit(128 + WTERMSIG(status));
> -	}
> +	cmdlen =3D strlen(cmd);
> +	cmdredir =3D malloc(cmdlen + sizeof(redir));
> +	memcpy(cmdredir, cmd, cmdlen);
> +	memcpy(cmdredir + cmdlen, redir, sizeof(redir));
> +
> +	cmdout =3D popen(cmdredir, "r");
> +	if (!cmdout)
> +		err(1, "popen \"%s\"", cmdredir);
> +
> +	free(cmdredir);
> =20
> -	close(p[1]);
> -	ret =3D grab_fd(p[0]);
> -	/* This shouldn't fail... */
> -	if (waitpid(pid, &status, 0) !=3D pid)
> -		err(1, "Failed to wait for child");
> -	close(p[0]);
> -	if (WIFEXITED(status))
> -		*exitstatus =3D WEXITSTATUS(status);
> -	else
> -		*exitstatus =3D -WTERMSIG(status);
> +	ret =3D grab_stream(cmdout);
> +	*exitstatus =3D pclose(cmdout);
>  	return ret;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oY1uq2ONqt5kuovO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MJmAAoJEGw4ysog2bOSwVEQALqw07ZBuVlL/MG9UlAGD7dJ
mAgrgBcf6IYq3O+aGlRtcEMyU7cyKab1g/1LzZjd+pXuINEHnw4lliSlTrHK3RPf
NugTxXDgDUB9EqYUYIX3v7GISQKj5kr5nCgtLoYefh5JtvLB1/nPDJBKj1VBCK6X
BGYm1vD7EUj9vy9sLYJjT4dDnA0qdWdfuJN7Ne26KlvUxcmr42p+AOWJcPOcIlC7
+wxdqmpgPMNVj6LtICqS8LykC2A9pwrMwOywKVA412gp5RJJvcwd6MYbeKz2LiXe
uz6edM3CRwtWkNEr71OLuIqDWepOeutAzVkivB3YAxhyrX7UqW+/RbIW4GxaS+GN
/VidXk1mfT/Bf61isjdENeNQsMHp9VBaCfo6/7CINa48dG6lKRhsKjfbYSDD9olA
KQAfKLatlGHGESzaODwAlEinTKzliLneSHdgmyz9gVNtx6jX/1d/KR7E0D2AmTLD
4mZWoJSyGH6wXKwto4dsQUAQY2sOmUGQzYr4+FAzulue/2Xrkwr3GBbHiA7WYIWD
bqeEEYWZHlGan+IYh9A0UDw0v301Xq+Il76aw+8p7hSPvpg1FxIInlueIKnoz2An
ILR5CSsHnchbyqkp6ZDTCSVaYQaZLasXEKNNjazORYjM+XqhBgGLpgUwjkGhBIC9
NKE8byHXWrKXr8W7Ubt+
=eZOv
-----END PGP SIGNATURE-----

--oY1uq2ONqt5kuovO--

--===============4398352803347202778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4398352803347202778==--
