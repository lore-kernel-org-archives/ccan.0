From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 5/9] configurator: Mark non-Windows tests
 MAY_NOT_COMPILE
Date: Tue, 20 Sep 2016 15:06:23 +1000
Message-ID: <20160920050623.GO20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <9e7915fbf32298965ec0e33c0666c766ab76a014.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2573075913062690872=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjm68mDzDsfn
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:32 +1000 (AEST)
In-Reply-To: <9e7915fbf32298965ec0e33c0666c766ab76a014.1474239353.git.kevin@kevinlocke.name>
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


--===============2573075913062690872==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="31zvzas5NXT9fief"
Content-Disposition: inline


--31zvzas5NXT9fief
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Sun, Sep 18, 2016 at 06:52:02PM -0600, Kevin Locke wrote:
> Several of the EXECUTABLE tests depend on headers not available on
> Windows.  Mark these tests MAY_NOT_COMPILE to handle this.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tools/configurator/configurator.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index e95fd70..0307635 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -72,7 +72,7 @@ struct test {
>  };
> =20
>  static struct test tests[] =3D {
> -	{ "HAVE_32BIT_OFF_T", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_32BIT_OFF_T", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NULL,=
 NULL,
>  	  "#include <sys/types.h>\n"
>  	  "int main(void) {\n"
>  	  "	return sizeof(off_t) =3D=3D 4 ? 0 : 1;\n"
> @@ -177,7 +177,7 @@ static struct test tests[] =3D {
>  	{ "HAVE_COMPOUND_LITERALS", INSIDE_MAIN, NULL, NULL,
>  	  "int *foo =3D (int[]) { 1, 2, 3, 4 };\n"
>  	  "return foo[0] ? 0 : 1;" },
> -	{ "HAVE_FCHDIR", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_FCHDIR", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NULL, NULL,
>  	  "#include <sys/types.h>\n"
>  	  "#include <sys/stat.h>\n"
>  	  "#include <fcntl.h>\n"
> @@ -198,7 +198,7 @@ static struct test tests[] =3D {
>  	  "	if (arg =3D=3D 4)\n"
>  	  "		warnx(\"warn %u\", arg);\n"
>  	  "}\n" },
> -	{ "HAVE_FILE_OFFSET_BITS", DEFINES_EVERYTHING|EXECUTE,
> +	{ "HAVE_FILE_OFFSET_BITS", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE,
>  	  "HAVE_32BIT_OFF_T", NULL,
>  	  "#define _FILE_OFFSET_BITS 64\n"
>  	  "#include <sys/types.h>\n"
> @@ -244,7 +244,7 @@ static struct test tests[] =3D {
>  	  "static void *func(int fd) {\n"
>  	  "	return mmap(0, 65536, PROT_READ, MAP_SHARED, fd, 0);\n"
>  	  "}" },
> -	{ "HAVE_PROC_SELF_MAPS", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> +	{ "HAVE_PROC_SELF_MAPS", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE, NU=
LL, NULL,
>  	  "#include <sys/types.h>\n"
>  	  "#include <sys/stat.h>\n"
>  	  "#include <fcntl.h>\n"
> @@ -329,7 +329,7 @@ static struct test tests[] =3D {
>  	  "-Werror -fopenmp" },
>  	{ "HAVE_VALGRIND_MEMCHECK_H", OUTSIDE_MAIN, NULL, NULL,
>  	  "#include <valgrind/memcheck.h>\n" },
> -	{ "HAVE_UCONTEXT", DEFINES_EVERYTHING|EXECUTE,
> +	{ "HAVE_UCONTEXT", DEFINES_EVERYTHING|EXECUTE|MAY_NOT_COMPILE,
>  	  NULL, NULL,
>  	  "#include <ucontext.h>\n"
>  	  "static int x =3D 0;\n"
> @@ -350,7 +350,7 @@ static struct test tests[] =3D {
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

--31zvzas5NXT9fief
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MPPAAoJEGw4ysog2bOSf+QP+wZfYvs0xIQh4VgQHi/DElYu
abzbtGCJHZnveuHfYAjD+TJ4pxeeplSXoboqiSFEd1kjnil23y6bnKxrUwL/s+K7
umL9feaZho1Zw6eDQUC/Srdqkg0R3mJiXIHZhCcb1daHr8SgKN38uYz8/SF9Ou6A
q8BUHO285U+4dzGSLsLIG1TBK5z2ib/mnnP6TM1Z72H1nunIsKs73fe6mcGFVYd0
6nbvqQ2ZPpkb97G3uzO/LaTGTdK2LBYCxARl3SYc5SUytmjJ7On6nILwcYAXev9u
RrCFI+6YDmvxB3wzX3KM1ySxq6wDNM6r+LM76beJeAlll3u7O+onEEJStODmb/wV
QS5Fk6mviEGtPyPC78Fh7515kTzPcRn9NFKI5I5Q8wqj8QlJomdOTxrwrn3fWhva
gnUcLHvGpRgpVB8G50YEWp4CH43ny+UA5dPo5ZGr2aDKCxcwOqbmzUsEKolSZbEe
PtcN2M8h9XM2OnVkZAHhEuemM6XQCNrZtw3JkKkDgRdRBPNEXrlnYfpSNEwmHCrt
fnm9X5sqvoJ+wfSqN9iX++S2QxTUizoIfyF2RZ7+Ib5sXBFlbbegIImiAJ+eKEeP
q/IKoksj2DEYiWVFEQSP8J4vaYx/yNG0Zp56gxMQpdHXH831nXC5dwm9zabTIyx9
+IHPapH686DUz6vTnoSA
=EKGH
-----END PGP SIGNATURE-----

--31zvzas5NXT9fief--

--===============2573075913062690872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2573075913062690872==--
