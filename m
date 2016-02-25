From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/3] generators in C
Date: Thu, 25 Feb 2016 22:26:16 +1100
Message-ID: <20160225112616.GK22216@voom.redhat.com>
References: <1455538404-1823-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3168674795250107130=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 33DD21A0341
 for <ccan@lists.ozlabs.org>; Thu, 25 Feb 2016 22:45:47 +1100 (AEDT)
In-Reply-To: <1455538404-1823-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au
List-Id: ccan@lists.ozlabs.org


--===============3168674795250107130==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Content-Disposition: inline


--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 11:13:21PM +1100, David Gibson wrote:
> This series add's the 'generator' module which implements Python-like
> generators in C.  By use of some extremely hairy macros, it's able to
> have a surprisingly natural interface, even with arbitrary parameters
> and return types.

I'm taking silence as assent and have merged this module.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzuTYAAoJEGw4ysog2bOS8oMP/iRQqzVN3pYpYVw+6we9+GAA
OC1SxAX4VKGYODSJ143BH4r90/1Gm0QDGIJ14v/Gu5Ii3m/9out163fkqXvIiXVA
HXAm+FUa/p62PnkqBZl/nOfDacvRjpdneaCofxD2HWkljsAfJ2CzP43WWhvIGy38
mTSTVFKqlybRu2z49QT7SMm9/k4tNZlKlgXM9XggWkbVAQQvtvGMU/NgVHqchD70
TGwqXkE6ZEeWRmSP5lyTEZCi1K9fgA3MYZl6kZd40zeVcZ9UUfp/hXRSW0wZR6cr
bn1pgbe1h5KzdU/y0mkc2PGuGNCml8rIdufDXMk90EY/sjfSWmSVJsiJ7Jv4wXpj
ZDyZLmb54yi+VFhgD8LfV90gKs9QwP+/QtvJ4QHIeYc29xiOwTTHTTzTpbEQ/23P
YhUaHfUJP6fRmIDHShHkvZUw41Uo+Tkj/wnR+91sRd6MunPRmOVd+fuCZi38YCFu
GUKYrwU9ycK/BbGx3QkiK5hgMqXjMDUFMbaOzMIEUgCQCDOFHcGYrCUUXx3u1e96
UBg3gVouEk0aVtm//4kBZH+U2gXTioaCx26Mhp+x+JNESpd9cYT3AQEn0yaJg45/
Tax0gmIwMPJlooKu0FR4L+SN6ZZjJw88893u8Uw+v6qlaQQuPhZsBl0eE/sijsYH
g9pLy/vBHKm+lmWotIJZ
=Tnl+
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--

--===============3168674795250107130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3168674795250107130==--
