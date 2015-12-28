From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: deque: New module
Date: Mon, 28 Dec 2015 14:44:36 +1100
Message-ID: <20151228034436.GB15174@voom>
References: <20151223121144.GB27038@ip-172-31-61-248.ec2.internal>
 <20151228034337.GA15174@voom>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7967874455199010543=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 074961A0166
 for <ccan@lists.ozlabs.org>; Mon, 28 Dec 2015 14:45:03 +1100 (AEDT)
In-Reply-To: <20151228034337.GA15174@voom>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@dancancode.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============7967874455199010543==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2015 at 02:43:37PM +1100, David Gibson wrote:
> On Wed, Dec 23, 2015 at 12:11:44PM +0000, Dan Good wrote:
> > deque - type-preserving resizing circular deque
>=20
> Concept looks good.  There are some fairly minor nits in the
> implementation that I've noted below.  However, none are serious
> enough to hold up merging, so I've applied this.  I did modify
> trivially to remove some trailing whitespace.
>=20
> It would be nice to address some of the comments in follow up
> commits, particularly some of the portability issues.

Forgot to say:

I've also added this module to your key so you have push access.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWgLAjAAoJEGw4ysog2bOSHj4QALxxrpv3yOGBk/hD+wLebk1D
2c/YMSLV3de9Os+pW6EZjpJTIBrGv6dN4LFcqW0LoogAlaXL2avwI74Z0ipZEHA6
NrctJik2J+GV8SuBVQvo8ww/sCBtZFpl97y//9JzwfOTFtA+GlTYOPoO0Os5SSmv
azXig5vF1cEh04JTx8O1WjVUgRqRSAXJzFRneH5kXxX0B62/eP3znz+XotrGp+xw
WLqULphOUWvANkHMjnUI1UHseJ6dtprfXaF2GnO/ty5bXPXV7Dpx0C54/xAZKSIm
bZwsBJ/D4tB911/rjOOYjntBGK0yqU9huOufZCapizq+ZCcjbx6fMf7kaIlxBSIL
oIpdZu7qgWxd6DriVfmjv/m2v73c+tM+VVEiLHhpTQ+vDyk9ZEotXJky2zoZa0PQ
mWipuC980Mwp5hB4WzU3ippVXjqb5Bin44TVbYt7KmzT/yIBZWhaMFM8DIb7wkJN
QE9oboz93Ujpc79Aar7mA3bTcU5va2hw1JNWWX6PxTrVCGlpCEHuV1T8HvkMELDp
gDkFtZE7RZe4PkhRz/D7VNkCKlsKA79dSodQI7OvDrFMzC1qmtXzOy+D60pRt/AX
bWDkYoSQvKqOuTYEFhqkpBedAORORCdf6pluyGJ5KdZ3o0tYsagm2nvT7POf0ldf
oTlYYficXm0ANsy9FGei
=SuVc
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--

--===============7967874455199010543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7967874455199010543==--
