From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 09/13] configurator: DEFAULT_{COMPILER,
 FLAGS} for MSVC
Date: Tue, 27 Sep 2016 15:17:47 +1000
Message-ID: <20160927051747.GS30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <38a3e83cad6eb6574fd91f83ca0282d441ef43cf.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0234807068656360053=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w3HSLzDrSt
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <38a3e83cad6eb6574fd91f83ca0282d441ef43cf.1474600863.git.kevin@kevinlocke.name>
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


--===============0234807068656360053==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8N5nZmKALFZnI1Hj"
Content-Disposition: inline


--8N5nZmKALFZnI1Hj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:12PM -0600, Kevin Locke wrote:
> When compiling with Visual Studio, use default compiler name and flags
> which are likely to work with the known-available compiler.
>=20
> This is also a convenience for users who may not know what arguments
> cl.exe may need to compile the tests.
>=20
> Changes since v1:
> - Use "-option" instead of "/option" to avoid issues running under msys.
> - Disable C4200 warning for use of flexible array members, which MSVC
>   considers an extension (since it does not fully support C99).
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

But I won't apply it for now, since it makes no sense without the
previous one.

> ---
>  tools/configurator/configurator.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index d81f878..d3e01cd 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -38,9 +38,21 @@
>  #define pclose _pclose
>  #endif
> =20
> +#ifdef _MSC_VER
> +#define DEFAULT_COMPILER "cl"
> +/* Note:  Dash options avoid POSIX path conversion when used under msys =
bash
> + *        and are therefore preferred to slash (e.g. -nologo over /nolog=
o)
> + * Note:  Disable Warning 4200 "nonstandard extension used : zero-sized =
array
> + *        in struct/union" for flexible array members.
> + */
> +#define DEFAULT_FLAGS "-nologo -Zi -W4 -wd4200 " \
> +	"-D_CRT_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS"
> +#define DEFAULT_OUTPUT_EXE_FLAG "-Fe:"
> +#else
>  #define DEFAULT_COMPILER "cc"
>  #define DEFAULT_FLAGS "-g3 -ggdb -Wall -Wundef -Wmissing-prototypes -Wmi=
ssing-declarations -Wstrict-prototypes -Wold-style-definition"
>  #define DEFAULT_OUTPUT_EXE_FLAG "-o"
> +#endif
> =20
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8N5nZmKALFZnI1Hj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6gD7AAoJEGw4ysog2bOSxEwP/2IJHWkzpFpVojquCQymt4s4
dEucGZ2V+dlw8jyumn1IVANlWvhOSmZ5x2YSoulwG5TPBkE5utkPKnPzzuXzKtd1
5V1SJdxGQStlUDS2v11Bou75UHR2qN6evYh6dNbCZ22A3TIKNWuyKV/yMMfLk8VK
PZ9zZZIiMIXFGInq5wzsUcIq/EYyoYVMEGIXeVCebxs5+rNVDjSA/I57kEmhIIIz
eQcaLHZKoRwLbSVZChZGDVfFEMAQ1vuXUUiVACZ8jeR+utcZ430MZdv3P3AgtbUV
jtLjz7RXmnQ+waB27aT86MO5k0VgHxBhU4qFC56kgsR/rhldK98K0EAtd4vD7d5e
uoMY4WU+mfq5tkrAGbCwDGTuaadigZInD2L+SOCJ2riMhcSvAwpe+jeXx30+OFRO
XVR+PkBS57i03vfeVGGGBXSUy4zcsvqpQPq1Xf/Y5Q3XmNWnQWHWT3pqlVyrONxW
/v67e8VFWLzJ/HHfDO33dJceRsdiEqFWRnPhUa/IyMiLAUNjQZNqYTf1Nsb0hPF/
rqqOPfxmSqzPySC8fGz+sBkhW7orb+PQYjvp4fG3HvBRx2tSJjWja73EgkgpTcn6
pesyWMw9lriKpE5KxRqbENtI1EH7738PQsaO5Td7gUFOtVJEnd04FLX+OolBPlHR
ST7isJTslQWwR/MRHAsD
=n9LD
-----END PGP SIGNATURE-----

--8N5nZmKALFZnI1Hj--

--===============0234807068656360053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0234807068656360053==--
