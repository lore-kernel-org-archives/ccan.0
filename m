From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 05/13] configurator: Mark non-Windows tests
 MAY_NOT_COMPILE
Date: Tue, 27 Sep 2016 15:05:46 +1000
Message-ID: <20160927050546.GM30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <b3432cf596ddef2adc56136ef292c1e26a078eb4.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2445735860476034754=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1hWBzDrT1
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <b3432cf596ddef2adc56136ef292c1e26a078eb4.1474600863.git.kevin@kevinlocke.name>
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


--===============2445735860476034754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8m/hfNLtAhX2NvnO"
Content-Disposition: inline


--8m/hfNLtAhX2NvnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:08PM -0600, Kevin Locke wrote:
> Several of the EXECUTABLE tests depend on headers not available on
> Windows.  Mark these tests MAY_NOT_COMPILE to handle this.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Applying.

> ---
>  tools/configurator/configurator.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 7c4dd4a..31e3d11 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -75,7 +75,7 @@ struct test {
>  };
> =20
>  static struct test tests[] =3D {
> -	{ "HAVE_32BIT_OFF_T", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_32BIT_OFF_T", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NULL,=
 NULL,
>  	  "#include <sys/types.h>\n"
>  	  "int main(void) {\n"
>  	  "	return sizeof(off_t) =3D=3D 4 ? 0 : 1;\n"
> @@ -180,7 +180,7 @@ static struct test tests[] =3D {
>  	{ "HAVE_COMPOUND_LITERALS", INSIDE_MAIN, NULL, NULL,
>  	  "int *foo =3D (int[]) { 1, 2, 3, 4 };\n"
>  	  "return foo[0] ? 0 : 1;" },
> -	{ "HAVE_FCHDIR", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_FCHDIR", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NULL, NULL,
>  	  "#include <sys/types.h>\n"
>  	  "#include <sys/stat.h>\n"
>  	  "#include <fcntl.h>\n"
> @@ -201,7 +201,7 @@ static struct test tests[] =3D {
>  	  "	if (arg =3D=3D 4)\n"
>  	  "		warnx(\"warn %u\", arg);\n"
>  	  "}\n" },
> -	{ "HAVE_FILE_OFFSET_BITS", DEFINES_EVERYTHING|EXECUTE,
> +	{ "HAVE_FILE_OFFSET_BITS", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE,
>  	  "HAVE_32BIT_OFF_T", NULL,
>  	  "#define _FILE_OFFSET_BITS 64\n"
>  	  "#include <sys/types.h>\n"
> @@ -247,7 +247,7 @@ static struct test tests[] =3D {
>  	  "static void *func(int fd) {\n"
>  	  "	return mmap(0, 65536, PROT_READ, MAP_SHARED, fd, 0);\n"
>  	  "}" },
> -	{ "HAVE_PROC_SELF_MAPS", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_PROC_SELF_MAPS", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NU=
LL, NULL,
>  	  "#include <sys/types.h>\n"
>  	  "#include <sys/stat.h>\n"
>  	  "#include <fcntl.h>\n"
> @@ -332,7 +332,7 @@ static struct test tests[] =3D {
>  	  "-Werror -fopenmp" },
>  	{ "HAVE_VALGRIND_MEMCHECK_H", OUTSIDE_MAIN, NULL, NULL,
>  	  "#include <valgrind/memcheck.h>\n" },
> -	{ "HAVE_UCONTEXT", DEFINES_EVERYTHING|EXECUTE,
> +	{ "HAVE_UCONTEXT", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE,
>  	  NULL, NULL,
>  	  "#include <ucontext.h>\n"
>  	  "static int x =3D 0;\n"
> @@ -353,7 +353,7 @@ static struct test tests[] =3D {
>  	  "	return (x =3D=3D 3) ? 0 : 1;\n"
>  	  "}\n"
>  	},
> -	{ "HAVE_POINTER_SAFE_MAKECONTEXT", DEFINES_EVERYTHING|EXECUTE,
> +	{ "HAVE_POINTER_SAFE_MAKECONTEXT", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_C=
OMPILE,
>  	  "HAVE_UCONTEXT", NULL,
>  	  "#include <stddef.h>\n"
>  	  "#include <ucontext.h>\n"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8m/hfNLtAhX2NvnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f4qAAoJEGw4ysog2bOSDSwQAOWrEYEv+oJ0U8j59boprcl9
T+y7BA9s0ogTQNF3KKKccMTwlOxIBAfT9JQkTVETNgdz6Q9rcQMm1eVUXvNLAfBD
DCbWXSlCN4Eom77uW+jSfg2Vq73cbqE5FKlXsMmvFx280BPYVOoCcjW7y7Ti9VOQ
JQ/Y7ms73a/+/jhUAyXZwdaYaaM0vPqiy34Ka6GBcV0/yc4pKGxjC7rQtjNrkqxw
cO77lLODtNR2ink6e81bzMTBL6Vm6GsiG8YjoWwg5qNzc9x8paLHrm2F0V7crAG1
ygB3zwNF7oUglAKZhzpAn+4to0E/nG8nA5SGclgbruxP5O43HbjUmrIr+XkO94a4
pxOV0AkcB0KLd+zorFKxzpwZyWpXaXvhFF22Spx+kJ0wVX361vnXj57NEVJd/cVm
8mWHmcmw6sbp9cNGE4qiiLMsr+WmZTiIzFLzQlyB3LlfAcA7P4RvBGQ23ji6BZu4
GwrGmAFZ9DoP2GOw5BN7j6hEVYfD/66vb9cs+mwWKrLIZw7jSO6UZQBDmS6EkkgU
VSqCFzvyWEyJTIKZAWhL9xACU7vMgGex7WMiZVkH4V1auXj8h5EXWRFhPE5zrzOv
KI3xOJZTcCx7JNxPlrgDKi0LGmpRmrIOaxCTkXnwRCtDiFKe74hYKybS+ir+9Y1V
9gfc+rljtV56wFNId3Fb
=73US
-----END PGP SIGNATURE-----

--8m/hfNLtAhX2NvnO--

--===============2445735860476034754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2445735860476034754==--
