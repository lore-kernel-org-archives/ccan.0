From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 03/13] configurator: Inline err.h functions
 from musl libc
Date: Tue, 27 Sep 2016 15:01:10 +1000
Message-ID: <20160927050110.GK30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <dd1ebbc938062637de9860ec21cd680b088b2e1d.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6224778849508330145=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0v1vH5zDrSx
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:31 +1000 (AEST)
In-Reply-To: <dd1ebbc938062637de9860ec21cd680b088b2e1d.1474600863.git.kevin@kevinlocke.name>
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


--===============6224778849508330145==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g4MvFqI7wmANiPDo"
Content-Disposition: inline


--g4MvFqI7wmANiPDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:06PM -0600, Kevin Locke wrote:
> Since we can't use HAVE_ERR_H in configurator, provide a definition for
> the err.h functions used.  The version provided is the one from musl
> libc, since it is concise and shares the MIT License with configurator.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

For me this breaks Linux build, because we get "static declaration
follows non-static" on these functions.

I think we instead want to stop using the err() etc. functions and use
similar functions with a different name that we always define locally.

> ---
>  tools/configurator/configurator.c | 54 +++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 4eed188..5929355 100644
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
> @@ -25,9 +28,9 @@
> =20
>  #include <errno.h>
>  #include <stdio.h>
> +#include <stdarg.h>
>  #include <stdbool.h>
>  #include <stdlib.h>
> -#include <err.h>
>  #include <string.h>
> =20
>  #ifdef _MSC_VER
> @@ -41,6 +44,7 @@
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> =20
> +static const char *progname =3D "";
>  static int verbose;
> =20
>  enum test_style {
> @@ -370,6 +374,51 @@ static struct test tests[] =3D {
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
>  static size_t fread_noeintr(void *ptr, size_t size, size_t nitems,
>  		FILE *stream)
>  {
> @@ -610,6 +659,9 @@ int main(int argc, const char *argv[])
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

--g4MvFqI7wmANiPDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f0WAAoJEGw4ysog2bOS5tQP+gLB4PI3lBVN1x2UknljM9zx
R3uy+VYSF7JvyNt0IZNNUEboYe7S+KfeIzmp53O0UFq7O9JrQt56r3L3Zy3tgzeJ
IswXNTY89oQAJs3j8IC3KSiuvqtZyKbvu7Al8AD1QzMpscwMkQDZbTqELMHunU+1
gL41DpFeFWMh2IqHBq53G5O8XF7iWJgjIhl6SQ4KelUo1/dahAjTzveaRlJYRjXY
+HjT19+h7628pkd4SxbbSbfHUaF47klHefIyXZMAQ2VZP5CSgcGDb/bvhVZ12XXk
2MTBjMoe/eufqP2GaJySd0yuhXMDPc76N2yXWC1kNrYGyJIhOa4w4ZSYl/i5FH/Q
XnSWRj9MxPDqjkFFf21juVCaGooy/TRv7sDy+4pEcHMHBjgElR8R8GgP5x6C2H2N
Lpf4/vO2pm83p+pVU9Nz2jrg0o2lWw4NR1S2lfxgfPhV3KLgRUGIDDA+dTpz16d0
zYZVf1A1H0YL/cdtN1eHANlMMasBa6lNUDdCHJSxGHXWGT+4izWC+qdAfPMQD0J/
wQF4Ik5dg7pya226NRdj+njMGFqAZyXzfFP6wkoFIKcefwtdqCPxocxJoFocH9k4
E6QxNDIwXcUgcmF3E+z8oQe0bhnO7GAxmA8oCcuLo09ejTi4l7Ghs/M9x0e0kIrI
NOjnXxX3t4PkZITz6S2Q
=UsHX
-----END PGP SIGNATURE-----

--g4MvFqI7wmANiPDo--

--===============6224778849508330145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6224778849508330145==--
