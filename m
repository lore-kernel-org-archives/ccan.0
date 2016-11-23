From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] edit_distance: calculate edit distance between
 strings
Date: Wed, 23 Nov 2016 23:58:36 +1100
Message-ID: <20161123125836.GG17795@umbus.fritz.box>
References: <f253995d1f82ebc3dbb69f9ad2dfbcff6605c71a.1479527608.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6178509037259397298=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP49g0hhxzDwB9
 for <ccan@lists.ozlabs.org>; Thu, 24 Nov 2016 01:15:19 +1100 (AEDT)
In-Reply-To: <f253995d1f82ebc3dbb69f9ad2dfbcff6605c71a.1479527608.git.kevin@kevinlocke.name>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============6178509037259397298==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m0vRWufqUC70IDnR"
Content-Disposition: inline


--m0vRWufqUC70IDnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 09:19:25PM -0700, Kevin Locke wrote:
> This commit creates the edit_distance module for calculating various
> edit distance measures.  The edit distance quantifies the similarity
> between two strings based on the number of modifications necessary to
> turn one string into the other.  There are several edit distance
> measures which differ in the operations which are permitted and the
> cost (aka weight) of the operations.  This module provides functions
> for calculating the Longest Common Subsequence (LCS), Levenshtein, and
> Damerau-Levenshtein (restricted and unrestricted) distances.  Weighted
> versions of these functions can be created by defining cost functions
> as preprocessor macros when compiling this module.  Distances over
> other array types (e.g. wide strings, integers, structs) can be
> accomplished by defining the element type and equality test macros.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
>=20
> ---
>=20
> I have tried to make the inline documentation work with both
> doc_extract and Doxygen.  The formatting of code examples in the
> module comments contains some odd-looking additional formatting to
> make the examples work, but otherwise the combination seemed
> reasonable.  If there's a strong feeling that Doxygen is against the
> project style, I can remove the Doxygen-specific formatting.
>=20
> There are a number of additional auxiliary files which I did not
> include in this commit (e.g. .indent.pro, Doxyfile, scripts for
> performance testing and testing against reference libraries), since
> these sorts of files do not appear to be present in any of the other
> modules.  If they would be desirable, I can submit them in an
> additional commit.
>=20
> I hope you find the module useful and I look forward to your
thoughts.

I've merged this module in, along with a fix to make the Travis build
happy with it.

Can you please send me an ssh public key, and I'll authorize you to
push changes to this module.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m0vRWufqUC70IDnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYNZJ6AAoJEGw4ysog2bOS+sUP/1JAnE6M87IjEVmV/3eB0nIk
mnqVfsQgoiFONu2IoaLtotQRC1h6hA4q9wiBmXZ1WpiiKMUFIuI00QtuD0txuz15
7JDcZ43IvyqV8bIadaNjkCO7ZogN9xxA3XZ2FaJaB90qhnZuS5dyr/0FSLsNRCvZ
2M+ZfLKMbE9fxfKMUkgEG3SxBGYAdZO2hQZSPIakUTno8r8cJnsCal5N9tW7n5sS
0LNJEudTJunnGPM+19pxtSsPPVjcZo5LO8yvz9Jz61Z2+kdQOY1LE+6Th4+5mgmA
YB0Hr+NcHkGItLmJwp4A9lHYeL2gjX0w2LvuzBoTXP+UI5ccpxRybXfj7OIiC1yy
E1ZeRaC9PdS5IKAgqjkwtsml5deyUwihyCyRRRNXnG+8jzKMHbrWVuYbRi8HYMDn
wlS7EX7i/QXSj6aDB5z6WRQFWFT2I1VXsREvJzrMX5YXyFysduMRchjBrGKxaf56
1ZhbvMreTL0Dh+28M/9dklhcYMASiAceusdI6FZ4alxctJqZSxYqg9EBuVUg9Ri/
E0o3462acRVdiTCEYIGyq0uiqT/qrruSYn6XtU5+U38jniZU791+vZUlN03K1SEk
E7uprXDMSXiqZY2Leqx9xLHwWKX4G3ucte9ixriwd/Hg27Wi9KeNUHwRmMq3z8B+
4bjce3+2/XF7nXI8OGU8
=7qOY
-----END PGP SIGNATURE-----

--m0vRWufqUC70IDnR--

--===============6178509037259397298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6178509037259397298==--
