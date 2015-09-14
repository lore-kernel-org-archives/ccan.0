From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] strgrp: Fix compile errors in example
Date: Tue, 15 Sep 2015 09:55:36 +1000
Message-ID: <20150914235536.GQ2547@voom.fritz.box>
References: <1442229919-5163-1-git-send-email-david@gibson.dropbear.id.au>
 <1442232882.16095.17.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3715974013997777875=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A575E1A2BD6
 for <ccan@lists.ozlabs.org>; Tue, 15 Sep 2015 10:05:58 +1000 (AEST)
In-Reply-To: <1442232882.16095.17.camel@aj.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============3715974013997777875==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XQ/JOjNzrAcf1KaA"
Content-Disposition: inline


--XQ/JOjNzrAcf1KaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2015 at 09:44:42PM +0930, Andrew Jeffery wrote:
> Hi David,
>=20
> On Mon, 2015-09-14 at 21:25 +1000, David Gibson wrote:
> > Commit 63f13d6 "strgrp: Tidy up kerneldoc in _info" introduced some
> > compile
> > errors into the example in strgrp/_info.  This fixes them.
>=20
> Ah damn :( Apologies for that!
> =20
> I was hacking around with `make webpages` to check the rendering and
> clearly forgot to run `make check`. I'll make sure to configure Travis
> CI.

Well, make check is pretty slow since it checks the whole repo.
Running ccanlint individually on the module you're working on is
generally a good idea though.

> Separately, I had tried to post the initial patch to the mailing list
> to get some feedback but `git send-email` was failing to send it, not
> sure why. I figured that as the original patch only really appeared on
> Rusty's radar that posting just the "documentation" fixup for review
> might've lacked context, but clearly I should've done so (and clearly
> it was more than "just" documentation).

TBH, I doubt I would have spotted this breakage on inspection so I
don't know that posting for review would have helped.

> Thanks for cleaning up after me :/

No problem :)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XQ/JOjNzrAcf1KaA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV9154AAoJEGw4ysog2bOS1OYP/3o5aDENcD7PZWGr4/TXA3nL
3SC1dgXN3AqsjSIuzMRYfZKzn7NunHZEpcPTxwr1T39rMNOJ3C+EFmZmQleDx3yD
eQSp4gg4JOQ44aM9n0loc+HW7NNPlNhJLzYQr1ohzHRM+MZbGj/CrxR3my5XeYrB
p2ZuyhnbjNYhx2ac8YTi083VgdgEfD0toI5gmXLePY8OnjC07oXQhyMuZcUF8t63
pJW0IbTg0OXspkPt2tc07BGmUsA3H3/Qq0NEHJ9a2YoxTbBHAlcgL5Ay6/7LYOeo
FYxkO10/AWDZ4pDZnrKfxw7UoRYf0U8KZcH8B+/ln7caF3TilAfb6WNeA4giW83K
/toKK4svvCwCBg0CtYlzMNN5bfpDrzEfwENqvmdobGDrtVTk9L/2GzYVGHMFwK5g
ocRmbRrNLVeT676an1mOX0dyvfXPbqwz6H37GJs7WbIF8/2Ao+7+kQb2DzkY8LPA
Bw+QeojhEpsHHaioJInW+a/oiH6jwFLO7FAHp6ytWjqUbSJEqkvo0SLOySrWfcj7
x2YQBqgwBKZzOCAl2VQJUVcI6uTmhlZWB6OmOu1D+Fuc6oJ8stlDX/nNJ/N9s0nd
Mre1ZWnKwAveZmqu2V38hv18EelL+0AVuUwNqmm9+2LeDVG+EW38xztGi7BTqCNJ
wuDy1GNqGOJFELZKo21C
=NsOu
-----END PGP SIGNATURE-----

--XQ/JOjNzrAcf1KaA--

--===============3715974013997777875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3715974013997777875==--
