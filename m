From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 10/13] configurator: Fix warning in
 HAVE_FOR_LOOP_DECLARATION
Date: Tue, 27 Sep 2016 15:10:11 +1000
Message-ID: <20160927051011.GP30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <9ea3d4767d9c89fad47facb5d51f4b7b9ccd813f.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0903780133483484540=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1hXWzDrT4
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <9ea3d4767d9c89fad47facb5d51f4b7b9ccd813f.1474600863.git.kevin@kevinlocke.name>
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


--===============0903780133483484540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6iXXu7NwgEt9u5a7"
Content-Disposition: inline


--6iXXu7NwgEt9u5a7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:13PM -0600, Kevin Locke wrote:
> Visual C++ prints "warning C4702: unreachable code" due to the return
> statement after the for loop which is never reached.  Fix this by
> setting a variable returned by a single return statement at the end.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Applying.

> ---
>  tools/configurator/configurator.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index d3e01cd..a43061b 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -222,8 +222,9 @@ static struct test tests[] =3D {
>  	  "	return sizeof(off_t) =3D=3D 8 ? 0 : 1;\n"
>  	  "}\n" },
>  	{ "HAVE_FOR_LOOP_DECLARATION", INSIDE_MAIN, NULL, NULL,
> -	  "for (int i =3D 0; i < argc; i++) { return 0; };\n"
> -	  "return 1;" },
> +	  "int ret =3D 1;\n"
> +	  "for (int i =3D 0; i < argc; i++) { ret =3D 0; };\n"
> +	  "return ret;" },
>  	{ "HAVE_FLEXIBLE_ARRAY_MEMBER", OUTSIDE_MAIN, NULL, NULL,
>  	  "struct foo { unsigned int x; int arr[]; };" },
>  	{ "HAVE_GETPAGESIZE", DEFINES_FUNC, NULL, NULL,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6iXXu7NwgEt9u5a7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f8zAAoJEGw4ysog2bOSWKEQAOCtYq0I/W3bymcNL2S+AQVd
btzeOmXzR1eVy5DLy3XCWBEXoD/sA8828iEZzHyxxHTDlDhl621IcUhhzEbimtwj
mavqKNIauNWu7clQKGkshYRFXiHGcSI49fLXohVBNJgzpMOwiMR73SV7LpYwzv1m
0NzmScCJAC2YiqcTb1nsscbOlaXngxaUNuE1gmsPpJ4jNoief+fZ8pNT6huf7L57
GtM43KpODCKR4aaaSCQKL32RLs61tYRacZ2ElpfOZrzn+06Z6yIu8yiCwFp9Jg9m
eHgC2a3O1uXcj3RkaWD9g4AN/5IQ6pSh7B+6p295fuiaxkpY+qvcs09W61H+0wAy
pZ0zwBAeTOdSjYj849uczB7dCWa5vKMCa6uxj4sDuG4bSJabEvCWfxtpl8M6V/56
POmmpiS2jzwc2Lwk5jdzqp9OHQ+Za9qDRXT2guHKtO3JLOGccfZD9FCYlYdZfL8G
qGu/etYDzyT3mjp8P43cou86cDp6LigKNqcIrpqoDpxsPqNukQcN1bV5Lke2ErR2
VxdvS1gnxeQmSzzDL6o/pgWWPqvcm1Q6FrwZvW3CTHGYwRCLpeZC5Fai4muD3g9y
pGso46pKzwqn+/LK9H8ckbut9chHKIgAp8Mn6n270AkaVjo6IN+vKSq6ACX7CQep
lcIcYQqtfCsvLjFCE2kB
=o/8Y
-----END PGP SIGNATURE-----

--6iXXu7NwgEt9u5a7--

--===============0903780133483484540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0903780133483484540==--
