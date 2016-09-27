From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 02/13] configurator: Reimplement run using
 popen
Date: Tue, 27 Sep 2016 14:52:15 +1000
Message-ID: <20160927045215.GJ30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <bd664ad818923efca7c5ca72a6f71abdc7e7af9e.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8655229059333373434=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0v0KZnzDrSt
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:31 +1000 (AEST)
In-Reply-To: <bd664ad818923efca7c5ca72a6f71abdc7e7af9e.1474600863.git.kevin@kevinlocke.name>
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


--===============8655229059333373434==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Re2uCLPLNzqOLVJA"
Content-Disposition: inline


--Re2uCLPLNzqOLVJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:05PM -0600, Kevin Locke wrote:
> Rather than using fork+pipe+system+waitpid, most of which are only
> available on POSIX-like systems, use popen which is also available on
> Windows (under the name _popen).
>=20
> Changes since v1:
> - Create fread_noeintr to avoid EINTR in fread without reading any data.
> - Handle short reads from fread.  This can happen with non-conformant
>   libc or if EINTR occurs after reading some data.

Hrm.  Have you actually confirmed this problem with EINTR?  My
previous objections to not handling short read were based entirely on
not realizing that fread() wasn't supposed to do that, rather than
thinking of some edge case you hadn't.

Unless we have a confirmed case where fread() can give a short read
that won't have feof() or ferror() set afterwards, I'm inclined to go
back to your initial implementation.

> - Define _POSIX_C_SOURCE for popen/pclose with strict implementations
>   which require it (e.g. gcc with -std=3Dc11).
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---
>  tools/configurator/configurator.c | 90 +++++++++++++++++++--------------=
------
>  1 file changed, 44 insertions(+), 46 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index e322c76..4eed188 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -21,17 +21,20 @@
>   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
>   * THE SOFTWARE.
>   */
> +#define _POSIX_C_SOURCE 200809L		/* For pclose, popen, strdup */
> +
> +#include <errno.h>
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
> @@ -367,20 +370,33 @@ static struct test tests[] =3D {
>  	},
>  };
> =20
> -static char *grab_fd(int fd)
> +static size_t fread_noeintr(void *ptr, size_t size, size_t nitems,
> +		FILE *stream)
> +{
> +	size_t ret;
> +
> +	do {
> +		errno =3D 0;
> +		ret =3D fread(ptr, size, nitems, stream);
> +	} while (ret =3D=3D 0 && errno =3D=3D EINTR);
> +
> +	return ret;
> +}
> +
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
> +	while ((ret =3D fread_noeintr(buffer + size, 1, max - size, file)) > 0)=
 {
>  		size +=3D ret;
>  		if (size =3D=3D max)
>  			buffer =3D realloc(buffer, max *=3D 2);
>  	}
> -	if (ret < 0)
> +	size +=3D ret;
> +	if (ferror(file))
>  		err(1, "reading from command");
>  	buffer[size] =3D '\0';
>  	return buffer;
> @@ -388,43 +404,25 @@ static char *grab_fd(int fd)
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

--Re2uCLPLNzqOLVJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6fr+AAoJEGw4ysog2bOS3QEP/id1L1Q1fuOr8s8iBVAa1T0g
Ye1SC4p3UQniBLf0sTlNdB+LxbTeR3DV0EqXRB6vs9Jtu2Ia11s+0+vBlrImNyQD
GkFFezvouCjuG3U8AoIbsA8X3movUc6e6MDjRiq5vYWCtgbAYsfrKpze198hKKBo
62wqskAWkYF1afvV1jz+Q54y58jbxkgrDeYw7OFLw/5ReQBPu/HNRPCSAEookRH/
MuLz5KrBu6YoaF5KWvugDckyxTD6Jcy/1FCMTPgtouZc64HwkDnG8DC2KyIQm8vD
ERVHV1s9Ml6jql32qHvFRjTb7s2ONyaoWdFSfpqAhzLfYC3SBN+3lZehRrOKvIF6
FCNHpej3hbZfK6QFzF6aJXXzeTQH1L3EGZjwEx3uh8Guv+OtfYxNC6xwiXkjvlxG
hPaphdRPWr+XY5DILxUCP9V2zQuqlAgfTC0gzUfGHBdQ28t4zMjrVvXJUszbOnxY
+nH0Xpb7rIjitLvW95BnwgVX/8U9I2sFRFIWzKspujKwydtAWlL8BBfQFQElE1Fy
22BrE4krq9DOb6u20BlHjz5K7tV2rWSdOGt+2E3jWw8OwJy6hP337ST0m6LttNPB
WFtfU7jUHAoGrEUrbTQ5d5FGdiLe25LFD7rIbNmYqiSVXUXNsr1Rf2nqsABkH80U
Suey1tuGMHZXY3GGYMjT
=CjNt
-----END PGP SIGNATURE-----

--Re2uCLPLNzqOLVJA--

--===============8655229059333373434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8655229059333373434==--
