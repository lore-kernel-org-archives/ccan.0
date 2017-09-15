From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: bitmap/tal again
Date: Fri, 15 Sep 2017 18:32:25 +1000
Message-ID: <20170915083225.GL5250@umbus.fritz.box>
References: <20170915080355.zc3ohlzeho5lkcsp@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1369144243618428112=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtpbq3KqxzDrWR
 for <ccan@lists.ozlabs.org>; Fri, 15 Sep 2017 18:34:31 +1000 (AEST)
In-Reply-To: <20170915080355.zc3ohlzeho5lkcsp@matica.foolinux.mooo.com>
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


--===============1369144243618428112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Content-Disposition: inline


--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2017 at 01:03:55AM -0700, Ian Zimmerman wrote:
> Hi, so I'd like to add the bitmap/tal submodule as discussed here:
>=20
> https://github.com/rustyrussell/ccan/pull/60
>=20
> but I'm not familiar enough with ccan dependency declarations yet :(
>=20
> 1. Should the dependency on tal be declared in bitmap/_info or in
> bitmap/tal/_info?  The latter seems more natural, but for some reason
> the final pull request on github shows the former.  I don't know if
> that's something I did and Rusty didn't correct, or something that Rusty
> did.  (I also don't quite understand github, ARGH!)

In bitmap/tal/_info, definitely.  Putting it in bitmap/_info will
change the dependencies of the base bitmap module, not your new
submodule.

> 2. Does bitmap/tal need to declare dependency on bitmap, or is that
> automatic?  Or maybe the other way?  I tried to look at other submodules
> in the tree, but there are only a few and none that quite match the
> relationship between this proposed pair.

Looking at ccan/tal/str, looks like the surrounding module should be
explicitly listed in dependencies.

>=20
> Well, if I know these 2 things it should get me started.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm7kBcACgkQbDjKyiDZ
s5KYzxAAvVdGmGbOoyCheiQNP1J3K622KCvgYjXLubBlKetybfug4wyPMcqyhL6v
DbZvMrf+gQM2t+Kz6IcsplhCbJUCbsOiCM4keYwzIlys/YFtSgPXGP2zux/z1NZt
vpaO0cSUWETZsApURlCwiOzi0okUbwcsp0snQP6CQOMzYBwg9QnrstPAqJ+NcRNo
hmatSNSd9cx0tsoYTDN9pne7c0Xwn/ndGx5Ae6IuR4RbuDuOT+2C6CowWn/XsvAt
a8ypy1MGPkI8dR8G/sEiaIXsA/+5C4ffq8DUxT9HB/mbq8oACQrz7wZbl68UyHqE
kjrC2mgE4F6H/faKX7CjBRcq5AJcsZbrXDWBbp46iQRQLtt9kKEsmfyvzWmBA5BD
cqd74irzN/lJJMTfCSONb8QtUSJRJlyFSLwA5K0zGOBJRq8tsBkw7Zywli6recXL
WoQjmJewhv9R4CW5nrvyejc73uc+vnJM7AempXIwcs8rZpbcgncl/GHEyfcRYpvy
OzwlFgjcxSDf1e0DOVp3HRKk6lVCa/h8wnR0XAlBuZ1wXfl8YwGrL7Rydp3aKTiV
nblQRnXVqd9Ks/gs6Abzg7pIOmiiEaVV1tGl2YDvNnMD8PxQXHexYsbhvBLTOBMZ
jGrb5213CzBwUaGCq76ZY/yvbIwkOqpoHpKCx82XiexCBV7ASWM=
=u2FJ
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--

--===============1369144243618428112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1369144243618428112==--
