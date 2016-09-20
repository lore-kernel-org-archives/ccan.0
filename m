From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 6/9] configurator: Print test source without cat
Date: Tue, 20 Sep 2016 15:09:06 +1000
Message-ID: <20160920050906.GP20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <03564cb12e21c8568c5efbaa9680b02212cd24a2.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3313333692470468065=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjm68GfzDsfl
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:32 +1000 (AEST)
In-Reply-To: <03564cb12e21c8568c5efbaa9680b02212cd24a2.1474239353.git.kevin@kevinlocke.name>
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


--===============3313333692470468065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vhqu5qQ3bjg0ZI9i"
Content-Disposition: inline


--Vhqu5qQ3bjg0ZI9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:52:03PM -0600, Kevin Locke wrote:
> Windows does not provide cat.  Instead, copy the test source to stdout
> using the file stream to which it was written.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---
>  tools/configurator/configurator.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 0307635..0386930 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -422,6 +422,22 @@ static void errx(int status, const char *fmt, ...)
>  	va_end(ap);
>  }
> =20
> +static size_t fcopy(FILE *fsrc, FILE *fdst)
> +{
> +	char buffer[BUFSIZ];
> +	size_t rsize, wsize;
> +	size_t copied =3D 0;
> +
> +	while ((rsize =3D fread(buffer, 1, BUFSIZ, fsrc)) > 0) {
> +		wsize =3D fwrite(buffer, 1, rsize, fdst);
> +		copied +=3D wsize;
> +		if (wsize !=3D rsize)
> +			break;

Similar to 2/9 you're assuming you'll never get a short fwrite() here.
Since the output stream is very likely to be a terminal in this case,
that seems a lot more likely to break than just assuming no short
reads on fread().  I think this one really does need to handle short
writes here.

> +	}
> +
> +	return copied;
> +}
> +
>  static char *grab_stream(FILE *file)
>  {
>  	size_t max, ret, size =3D 0;
> @@ -545,7 +561,7 @@ static bool run_test(const char *cmd, struct test *te=
st)
>  		}
>  	}
> =20
> -	outf =3D fopen(INPUT_FILE, "w");
> +	outf =3D fopen(INPUT_FILE, verbose > 1 ? "w+" : "w");
>  	if (!outf)
>  		err(1, "creating %s", INPUT_FILE);
> =20
> @@ -576,11 +592,13 @@ static bool run_test(const char *cmd, struct test *=
test)
>  		abort();
> =20
>  	}
> -	fclose(outf);
> =20
> -	if (verbose > 1)
> -		if (system("cat " INPUT_FILE) =3D=3D -1)
> -			;
> +	if (verbose > 1) {
> +		fseek(outf, 0, SEEK_SET);
> +		fcopy(outf, stdout);
> +	}
> +
> +	fclose(outf);
> =20
>  	newcmd =3D strdup(cmd);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Vhqu5qQ3bjg0ZI9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MRyAAoJEGw4ysog2bOSt1QQALe0El+6ACPbrBWI2ylNvZE7
g16A9WqSd602MuaaY2P5WIsxP5uaJjkXUm15lho2BbDQI7Vq3sKrV33t4ramhY1m
a8V+adDsGf6TCZubm7Znwv2gaSqR/CZxz9FNv0qBMXviccmdqNRYv/D5JtadmrVW
X4ti9a2hNeNLfwf6GRwS2X5M67TW7BEjLrat6Jt5Jqnso9M1aXK4mijYd0z0n0uD
hCH4G3scX5abH0h3MaXorwcIoQ0U+74Zu7V1d5wC++Sad5qwXwDvcirIuoIcbEH+
PIybPJ09OClJI/ID/xQPRPvWCdHyYRoqQoNNy4op/gATbK53qzxDJ/N3DIs/tYBY
tbPqIlbMjQ7ECTLsiqpmfiV3oNPW46dr+Z0va2mxeAy3lI0A300/wPgKBvWTk0LP
V+6mpURMseDsVvJtRXxK072EpQk6dwSO522pzHDweWz/boGSMHpbK1YbTyfjeh0e
QeNqTlvzrpWRPe8P5flOi6gImT2K81yxw2J/c+W4RFOg6SSsAme9ZhvUIifq5Cp0
LwCsbaGVpzxhVm9uqNp/1rfet8kYDHczXIOV7UQ7BJ7A4hCNq8yf8imJsKhGQ2ri
ScZAQjeRWOROM+Fue+xmyDfZJA8I/wJAs02OeLCHJ/oMCWm2PhCbMVz0CutNabbg
cFQqB9ZBfdRdByMs3gGx
=iZhy
-----END PGP SIGNATURE-----

--Vhqu5qQ3bjg0ZI9i--

--===============3313333692470468065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3313333692470468065==--
