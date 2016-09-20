From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/9] configurator: Inline err.h functions from
 musl libc
Date: Tue, 20 Sep 2016 15:03:09 +1000
Message-ID: <20160920050309.GM20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <d7b109044f3d73a3f91c56136ad487fe07b518a7.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6775916984427583844=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjl5wc9zDsfh
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:31 +1000 (AEST)
In-Reply-To: <d7b109044f3d73a3f91c56136ad487fe07b518a7.1474239353.git.kevin@kevinlocke.name>
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


--===============6775916984427583844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XlS4q8O07AKt4+K1"
Content-Disposition: inline


--XlS4q8O07AKt4+K1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:52:00PM -0600, Kevin Locke wrote:
> Since we can't use HAVE_ERR_H in configurator, provide a definition for
> the err.h functions used.  The version provided is the one from musl
> libc, since it is concise and shares the MIT License with configurator.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Right, so this is a general problem of how do we make the configurator
itself sufficiently portable, since it hasn't yet worked out the
portbility macros.

Personally, I think duplicating these here is an acceptable
workaround.  Rusty, any opinion?

> ---
>  tools/configurator/configurator.c | 54 +++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 9817fcd..9dcf307 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -3,6 +3,9 @@
>   *
>   * Copyright 2011 Rusty Russell <rusty@rustcorp.com.au>.  MIT license.
>   *
> + * err, errx, verr, verrx, vwarn, vwarnx functions from musl libc
> + * Copyright 2005-2013 Rich Felker.  MIT license.
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
>   * of this software and associated documentation files (the "Software"),=
 to deal
>   * in the Software without restriction, including without limitation the=
 rights
> @@ -22,9 +25,9 @@
>   * THE SOFTWARE.
>   */
>  #include <stdio.h>
> +#include <stdarg.h>
>  #include <stdbool.h>
>  #include <stdlib.h>
> -#include <err.h>
>  #include <string.h>
> =20
>  #ifdef _MSC_VER
> @@ -38,6 +41,7 @@
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> =20
> +static const char *progname =3D "";
>  static int verbose;
> =20
>  enum test_style {
> @@ -367,6 +371,51 @@ static struct test tests[] =3D {
>  	},
>  };
> =20
> +static void vwarn(const char *fmt, va_list ap)
> +{
> +	fprintf (stderr, "%s: ", progname);
> +	if (fmt) {
> +		vfprintf(stderr, fmt, ap);
> +		fputs (": ", stderr);
> +	}
> +	perror(0);
> +}
> +
> +static void vwarnx(const char *fmt, va_list ap)
> +{
> +	fprintf (stderr, "%s: ", progname);
> +	if (fmt) vfprintf(stderr, fmt, ap);
> +	putc('\n', stderr);
> +}
> +
> +static void verr(int status, const char *fmt, va_list ap)
> +{
> +	vwarn(fmt, ap);
> +	exit(status);
> +}
> +
> +static void verrx(int status, const char *fmt, va_list ap)
> +{
> +	vwarnx(fmt, ap);
> +	exit(status);
> +}
> +
> +static void err(int status, const char *fmt, ...)
> +{
> +	va_list ap;
> +	va_start(ap, fmt);
> +	verr(status, fmt, ap);
> +	va_end(ap);
> +}
> +
> +static void errx(int status, const char *fmt, ...)
> +{
> +	va_list ap;
> +	va_start(ap, fmt);
> +	verrx(status, fmt, ap);
> +	va_end(ap);
> +}
> +
>  static char *grab_stream(FILE *file)
>  {
>  	size_t max, ret, size =3D 0;
> @@ -593,6 +642,9 @@ int main(int argc, const char *argv[])
>  	const char *default_args[]
>  		=3D { "", DEFAULT_COMPILER, DEFAULT_FLAGS, NULL };
> =20
> +	if (argc > 0)
> +		progname =3D argv[0];
> +
>  	if (argc > 1) {
>  		if (strcmp(argv[1], "--help") =3D=3D 0) {
>  			printf("Usage: configurator [-v] [<compiler> <flags>...]\n"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XlS4q8O07AKt4+K1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MMNAAoJEGw4ysog2bOSl4UP/RWgbNEsuFN4XLlYcCMFoIcG
xR9gNcs+jR3IiK2WMK/cfZhPkRM7flbdqRweqdvcYJpcdXeEx38Ud4QpuPFwbbXB
9/6f/TaONHCeotYmOn8xnFjcUrVU4GBNIPmU2Vh/0fRY/+JvHGKPmqSNf7xwTzb6
rYWu/EJn7eM26uFCTJRd7NoMAoZqzrH+oM1jeCIvGxoUAygCnUEo8qUC3nXzoZ29
W0Zc8TCPq6/prXaAq0LQlKJchvwwN9gWafrvgSYWR4nrPl22Pomck4Pzxex9sbtc
JSlvK/xgVMrzU0+2f5nJQHYsydip58Dl1o8kJc4+5zMsirzIWJP01h6IKPyKigTV
3FbkH7Vb2zugPuHlMIl3yC7DLLF1iuQcQQNyLvsNsyrG9ZWfUyowZgn7uKgleqVe
iZ5hTeNTq2wmKj2REluR43SYN1xofbuxIl7ppOjYjN1FToeEGhWlGnX19MDQWXOd
jR7/l6C3vmJTGW78qurYjwfmyATRqg2qsFyubNTjA720Ce0TWo+3bzUmW81XMQ1v
rbXk0dXk9eID5dRXEGQ0fyD+SgtXQ8xZGk7VFQbSGatN9VgPsbcRv0L0I8u9kznh
ioIwVtfUwt18ZIMADD0tp/Aexvud0sstTeD2d92iZRY+fh9IzgMKxLn3OhW3BXQW
INXApgs0jRxJGLpgJjAI
=wNCS
-----END PGP SIGNATURE-----

--XlS4q8O07AKt4+K1--

--===============6775916984427583844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6775916984427583844==--
