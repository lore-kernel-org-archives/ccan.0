From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 04/13] configurator: Use native directory
 separator
Date: Tue, 27 Sep 2016 15:05:15 +1000
Message-ID: <20160927050515.GL30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <c698794abb06b766a90ac57602bc28a4d7b1520e.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3804761624216473782=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0v2PVjzDrSy
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:31 +1000 (AEST)
In-Reply-To: <c698794abb06b766a90ac57602bc28a4d7b1520e.1474600863.git.kevin@kevinlocke.name>
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


--===============3804761624216473782==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NZiXfHLGvOGtDZMn"
Content-Disposition: inline


--NZiXfHLGvOGtDZMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:07PM -0600, Kevin Locke wrote:
> Although Windows APIs generally permit "/" or "\\" for directory
> separators in paths, cmd.exe does not recognize "./" when invoking
> executables using a relative path and prints the following error:
>=20
>     '.' is not recognized as an internal or external command,
>     operable program or batch file.
>=20
> Therefore, use "\\" when invoking tests on Windows.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

This one also looks fine standalone (apart from a trivial context
conflict).  Applying.

> ---
>  tools/configurator/configurator.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 5929355..7c4dd4a 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -44,6 +44,12 @@
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> =20
> +#ifdef _WIN32
> +#define DIR_SEP   "\\"
> +#else
> +#define DIR_SEP   "/"
> +#endif
> +
>  static const char *progname =3D "";
>  static int verbose;
> =20
> @@ -632,7 +638,7 @@ static bool run_test(const char *cmd, struct test *te=
st)
>  		free(output);
>  		/* We run INSIDE_MAIN tests for sanity checking. */
>  		if ((test->style & EXECUTE) || (test->style & INSIDE_MAIN)) {
> -			output =3D run("./" OUTPUT_FILE, &status);
> +			output =3D run("." DIR_SEP OUTPUT_FILE, &status);
>  			if (!(test->style & EXECUTE) && status !=3D 0)
>  				errx(1, "Test for %s failed with %i:\n%s",
>  				     test->name, status, output);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NZiXfHLGvOGtDZMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f4LAAoJEGw4ysog2bOSmQIQAK+qL1Juu7t0t+LNp//PTSPT
nuHgnVVcCsUMsiNY3LxBgWhbBaHY6NF9tUWjasuQ8kRiOi3UZjSAFe6SW8MRj6hi
B0Ygj32AGf37wVRfJUBX6N+lEjHLZCQLTgH8pE1XgKFrTRusnk4MRpVmdE8kptvN
2lfgQ9ifUZfgM+4L9J/MtBgPqes6UKEp/MI2e6Tn4CP+RgV8EEh/QUUjLi/oRG7A
LsrxqQe/oxq79SFDsdqTWDG2N4Nh7GQWIDhhK4FwmwsyGRMnOGmdJLSd+34nIISC
ocBKLPUeyGZLRWQW5aO+haDv7z1zQYoqhz+6smYflLGZQ57YJDQqqqtuwtEHwNsx
scqlYM5rTO96LcFNnGJjmYaI6j43HlexV5tsJSP5sVQ1Nb7T+lKjoKIrwtvyD0vs
0ilyfBpcmTSPy2odBbHQIe3XeF8VpQNeFTHYrwLaFXMTyAqzXpy2+A+rmYO0XUGQ
9jeQbORST8bSVjsLV2aL2TW/FByLwhHiAXLS9x04N47xhCTG0Dsvvmjain/xPFeC
0m1CkhDexPgpKtzHc/mEiMXtaqHoynnegPxHLiPFO6OxoaykqWOyimIKwR1cfgs4
zQgoOXgHW2Mm54lVvPLFbK9JUsU2RhsqleyMkwBDHbzE6QW+YFoxjQvP7cR8ubcF
OI5VxMHq8yIViO57Dn96
=UjPL
-----END PGP SIGNATURE-----

--NZiXfHLGvOGtDZMn--

--===============3804761624216473782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3804761624216473782==--
