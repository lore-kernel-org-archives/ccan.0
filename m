From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 7/9] configurator: Fix compiler warning with
 compare
Date: Tue, 20 Sep 2016 15:09:23 +1000
Message-ID: <20160920050923.GQ20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <22c2065f30c4f305aad816625ddc6535bb2ddda2.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8784937286136471851=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjm66qzzDsfk
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:32 +1000 (AEST)
In-Reply-To: <22c2065f30c4f305aad816625ddc6535bb2ddda2.1474239353.git.kevin@kevinlocke.name>
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


--===============8784937286136471851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QLVwfW7TUsi22t4P"
Content-Disposition: inline


--QLVwfW7TUsi22t4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:52:04PM -0600, Kevin Locke wrote:
> Visual Studio prints warning C4706 "assignment within conditional
> expression" when there is an assignment without a comparison in a
> conditional expression.  Therefore, to silence the warning, add an
> explicit comparison.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tools/configurator/configurator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 0386930..0c30aff 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -535,7 +535,7 @@ static bool run_test(const char *cmd, struct test *te=
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

--QLVwfW7TUsi22t4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MSDAAoJEGw4ysog2bOSHd8P/0Nh1vz6dMsqpviVxlyu5n0G
pqsV6GGtkEMNLRhJSqOd1t0IQYpJCQUXGxqNNzbqowubOWXEYls4EgtDvQTmFUks
molWPpEn5AYoO34O7/p39/ZtO7ozhxVCEA5rT2aR5XTtEc520sme2tqteaadBrE0
40WJAIjclNXwNyzOiHyznw+XRUDEqZR9jRPFYQFsxu3CEis91kc1/qNOglK9R4vL
Uti+maNBDKYK8m51BZCZqln+j+lQmVmFyp5zfxHnIDejfUZtnp3/E7vFR1jPOOiu
APLY7g33NO0Il/OtS0LS3xVuddLqcLNxhmxb/MZ4L0hcGRkyYAXnDRQYYxNQD5mI
NTOj+ONu3j19OGcusYrcTLo6cs0jZafiRZmXuR+miw9YiHgGdfS8jcy9fbIktFx2
uHaoSBpsPZA7j4GE1Qlx1FNXwrpxoDG/BpOidNb4evOGUUsQ3C4gKfJldIu+FLju
x0gn/hKn9FI6VTIkjgGpRKyFLpOnNrNMlrubjvwsP3iVoL1dYnIpFUT6jVumOvtF
QSpWFIl/erqctlu1UyCAs5LU0Ojwq3hv9Pu+MKV+pfJAbU8ROW3kWozOsBLqB+Tk
QvpovylC3poIZAV12pXOxLZBF/X4p3klEP8ht5QP2lR6v0skYtNsPZ2oa1RmNyC7
dquWnJpHv94IIIqBy+w3
=ZnXn
-----END PGP SIGNATURE-----

--QLVwfW7TUsi22t4P--

--===============8784937286136471851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8784937286136471851==--
