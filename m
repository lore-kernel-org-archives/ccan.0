From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/9] configurator: Support for Windows and MSVC
Date: Tue, 20 Sep 2016 22:25:24 +1000
Message-ID: <20160920122524.GE20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <20160920044822.GJ20488@umbus>
 <b317f282-f357-e3f8-deeb-048c5793492f@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8636484522154600846=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdjlJ1jh2zDsky
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 23:09:32 +1000 (AEST)
In-Reply-To: <b317f282-f357-e3f8-deeb-048c5793492f@kevinlocke.name>
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


--===============8636484522154600846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Th5JPit8I3Q6/gDv"
Content-Disposition: inline


--Th5JPit8I3Q6/gDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 12:21:25AM -0600, Kevin Locke wrote:
> Hi David,
>=20
> Thank you for taking the time to review these patches, especially for a
> platform that you don't have a strong stake in.  I really appreciate it.
>=20
> On 09/19/2016 10:48 PM, David Gibson wrote:
> > On Sun, Sep 18, 2016 at 06:51:57PM -0600, Kevin Locke wrote:
> > > This patch series adds support for building configurator with Microso=
ft
> > > Visual C++ and running it on Windows.  The motivation is to add
> > > sufficient support for Windows to allow using header-only modules
> > > with minimal hassle.  For me, this patch series is sufficient, so I
> > > don't have any further plans for changes to other files or the build
> > > system at the moment.
> >=20
> > First, thanks for this.  ccan isn't supposed to be platform specific,
> > but it kind of is at the moment, simply because most of the
> > contributions have been from Linux developers.  I'm really happy to
> > see some work to make it useful on different platforms.
> >=20
> > Second, because I'm not and have never been a Windows dev, my ability
> > to review these is limited - so I'm inclined to apply anything that
> > doesn't break builds on Linux / POSIX.
> >=20
> > Third, because most of the main ccan contributors are not Windows
> > devs, I'm a bit worried about bitrot.  If you can think of any way of
> > making some kind of automated smoke test form builds on Windows, that
> > would be terrific.  Otherwise, I guess we'll just hope for the best.
>=20
> I think that's a very legitimate concern.  I'm not a frequent Windows
> developer myself, but had a need for a current project.  I've tried to
> minimize the amount of Windows-specific code, with good results I think, =
but
> that's obviously not much of a guarantee that it won't rot or subtly break
> on Windows going forward.
>=20
> I've seen appveyor.com used quite often for Windows CI, and it is free for
> FOSS projects.  I'd be happy to work up some basic smoke tests if it seems
> like that might be useful and not too much of a maintenance burden.  Let =
me
> know what you think.

Sounds good to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Th5JPit8I3Q6/gDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4SqvAAoJEGw4ysog2bOSto0P/RCQezXGibx5yZj3z8qPpfUw
AobmgpKEbylBhapJTAovuOwVQudgTepcPaHNkhAxXhRZv+DIDVd6Doh91FeLaiXK
r6gTtazXJhAqU2/gYFAujjVessLqH55tyi5D1MB1JILMmDiJzf8gNyrCSXUT35DO
N1LXsw785HQ00VzuftFS5j+J8CvIJiEWBLW9r5sWlDYFBKYvg3BFWG9QKvgMLtsw
Pu8stwbjH7UP5dQby48wodcWi89Np65PMILjFykshTStmhdm7fXa5YoRLuUwPwrZ
noJ3H1fOb+v7EYDd30R8/NgZp4BUrpUJFRRbY/f4C9cNdT72ttnkTJ2QezrBODlW
vGt04peP0FIkBeyDaZLxz1XrTSebsiXEWoOKuwvYkxa/qEDZC/AWceL25b7F1R2Z
+5SsKdjbsGJolEwszbUSMkmSqAfcuLjjO+2L0M3FKZjVq4fcPaYK0HzqvrdzZDk9
eGhZhE7+9ZuW+8rbH9klx388eTnr878OauhaeJ33qeyofRJYlB4n6hUYVPiA/Eq0
DXSobw80VUDMggl/ldgmyo2XDK2OqTUwwRtAJhSJeo3BiJIl7f0+86XzaWiPuteO
yriYzpPopoOEEMk4aXooWbS7M3/GoeJfbkG0R1JW+OaxIMNz5vaS9rTCjbiJYIQG
NRioLfwLpeTXMZxZ8+OT
=5YM8
-----END PGP SIGNATURE-----

--Th5JPit8I3Q6/gDv--

--===============8636484522154600846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8636484522154600846==--
