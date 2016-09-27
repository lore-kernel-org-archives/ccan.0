From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 07/13] configurator: Fix compiler warning with
 compare
Date: Tue, 27 Sep 2016 15:09:40 +1000
Message-ID: <20160927050940.GO30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <2b6fe8f4ad3a5cd16ef3fc8cc0280266380f0de4.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6595488427665951729=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1hXkzDrT7
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <2b6fe8f4ad3a5cd16ef3fc8cc0280266380f0de4.1474600863.git.kevin@kevinlocke.name>
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


--===============6595488427665951729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c2gYorpyS4gG0T74"
Content-Disposition: inline


--c2gYorpyS4gG0T74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:10PM -0600, Kevin Locke wrote:
> Visual Studio prints warning C4706 "assignment within conditional
> expression" when there is an assignment without a comparison in a
> conditional expression.  Therefore, to silence the warning, add an
> explicit comparison.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Applying.

> ---
>  tools/configurator/configurator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 51d7ac8..acf6cc0 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -572,7 +572,7 @@ static bool run_test(const char *cmd, struct test *te=
st)
>  		char *dep;
> =20
>  		/* Space-separated dependencies, could be ! for inverse. */
> -		while ((len =3D strcspn(deps, " "))) {
> +		while ((len =3D strcspn(deps, " ")) !=3D 0) {
>  			bool positive =3D true;
>  			if (deps[len]) {
>  				dep =3D strdup(deps);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--c2gYorpyS4gG0T74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f8UAAoJEGw4ysog2bOSamMQANxiu06BjZOmYqLr3p+7Oc8S
RH9oqoWTUVeXO2Bul0mOVG47l0cGzfDM83M2EFGX7I8ATuyOktzvNk37YxsMbfEV
2nX05rG0qeKIs/q3GaRZgKUBHBNYc4H7tcKD4M36+g31ws8SLcemhALrf/xIvS9r
091BWfJnSrs1KrG+Xu8E5AoG8ZAr724J6g+PijpYWG12IAfpdRW+eRyDm0Q33lAd
UEU2aoghsvAabEwHdBBwLgYlDqynlfRaS5yM3t4hRL33lBKnK90K0MZVhkJkeN0A
8iNvuDa8+kHZgM54U0vt0V/YZjexQ9BM7grmsrC821+ZN02BOP5MUAAmfGLxFJRP
fdh/d9fQ9DeTEHR935b04YVjky4SjC3uKHFHGhHGWSMUfV0R+04asWRq00c7DUN+
98lLNIV/xwAee0CtI1FaUvK9ESlrDjboXssZ2PKRLcbsyVRVPtCf+HMvrtM5PDSX
Iils2fSjyg22lvvvMEbvquY473ewcIPvkFC1g0XC1zgH50S3kgZLaQyUx3srt+Kh
THxppqMSp7h4biq/O6nGPHWATdAZcHsgQL+D1U/wB8Y17eZldvEGrBM2XPlkwf8/
+ulXRQ/21uh8XpRtpNMa4qvbaHqp/Gyw59zKQr18wTa9v5Lm+Jnmecf/fo6yDFuB
wvNJpZrNIhNc2Hkx2oAM
=dDq0
-----END PGP SIGNATURE-----

--c2gYorpyS4gG0T74--

--===============6595488427665951729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6595488427665951729==--
