From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 0/4] mem: extend with a few additional helpers
 similar to existing string-only functions
Date: Mon, 7 Sep 2015 00:24:48 +1000
Message-ID: <20150906142448.GE6537@voom.redhat.com>
References: <1441502466-4754-1-git-send-email-dev@codyps.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1357496256465982951=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5012B1A1E4B
 for <ccan@lists.ozlabs.org>; Mon,  7 Sep 2015 00:34:11 +1000 (AEST)
In-Reply-To: <1441502466-4754-1-git-send-email-dev@codyps.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Cody P Schafer <dev@codyps.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============1357496256465982951==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Dz7ZkHOyZKsJidB"
Content-Disposition: inline


--9Dz7ZkHOyZKsJidB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2015 at 09:21:02PM -0400, Cody P Schafer wrote:
> since v3:
>=20
>  - fix memeq() return value
>  - add memends_str() helper
>=20
> since v2:
>=20
>  - switch all the macros to static inline to avoid multiple evaluations o=
f args
>  - add patch adding PURE_FUNCTION attributes
>=20
> since v1:
>=20
>  - drop a patch that David pulled in
>  - add extra macro parens
>  - add blank lines after defintions
>  - covert memcchr's while loop to a for.
>  - change examples for mempbrkm and mempbrk to use '\0' in places
>  - fix spelling
>  - use memeq() even where we know the mem lengths are equal in memstarts()
>  - add a reviewed-by to the 2nd patch, no other changes to that patch.

Looks good, I've applied this to the repository.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9Dz7ZkHOyZKsJidB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7EywAAoJEGw4ysog2bOSW08QAK8JSgePRMUtyen1tOMCvytt
QZHZK2h1RcKLX01LlHNJJDmpAMa0duWArgLkpvEq92PdBrpAOM3n1gkPkAl57BsA
0rAgVilrhKNeQxW4nyWugUL2y9ZeMr+LNCqE6j5IUeYqPHLVfYkbKq2PLyQsh0b3
pocoqiA5eaWCdXdRm3GHtKo6+/M/k48mhNNCk8TUN2YD+6CgBR1IiQAmCTWzPVXM
PWh/KYI/Ai9lNM2Kb+/Bqsy3Mcl7L+zTnUMx0jRJUCObT1EfW1KEn13odVJNmpoe
nELsZvXR+ISptB8mUrTi6ItoI5ECgJnBvC1cZuk6pgRLVdLHTadJ5KDjbWntOOIZ
0UzhRljTi3LxDFp1rdyUTJ8cYazCYZLZgVnAA/ZbsVq/9U37qGj8OruiBrJ26oXC
Myd0f4VfNBLmgipscYy6YYt9YCi/ESHjL/r968asQZZ0nAA7N6MKyulUgZd4D2hY
n0q3N4L7UdpcO1m4T33pe5Rvvf+Fy64i3tQ8UO0QBxN6yzh0Y/23RQ3Daqu6vmYn
o+jNZ0I2FAlv2onmVVlLwpxkYFzM/LiST7aGO6QJVFRXPi8EO7gKnJzllmGAlx+V
8P5STF3+63KNxpY2/l9xH6+bFi53zFT5ddEBcgD1GPCcz1qxRJpDIFLYKsvVe1ZG
KJqrZH+9ILRhlMgcWDt/
=V+Lc
-----END PGP SIGNATURE-----

--9Dz7ZkHOyZKsJidB--

--===============1357496256465982951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1357496256465982951==--
