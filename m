From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/9] configurator: Support for Windows and MSVC
Date: Tue, 20 Sep 2016 14:48:22 +1000
Message-ID: <20160920044822.GJ20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6394120736892486721=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjl3TkxzDsTW
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:31 +1000 (AEST)
In-Reply-To: <cover.1474239353.git.kevin@kevinlocke.name>
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


--===============6394120736892486721==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdJFN6SSISdF2ksn"
Content-Disposition: inline


--sdJFN6SSISdF2ksn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:51:57PM -0600, Kevin Locke wrote:
> Hi all,
>=20
> This patch series adds support for building configurator with Microsoft
> Visual C++ and running it on Windows.  The motivation is to add
> sufficient support for Windows to allow using header-only modules
> with minimal hassle.  For me, this patch series is sufficient, so I
> don't have any further plans for changes to other files or the build
> system at the moment.

First, thanks for this.  ccan isn't supposed to be platform specific,
but it kind of is at the moment, simply because most of the
contributions have been from Linux developers.  I'm really happy to
see some work to make it useful on different platforms.

Second, because I'm not and have never been a Windows dev, my ability
to review these is limited - so I'm inclined to apply anything that
doesn't break builds on Linux / POSIX.

Third, because most of the main ccan contributors are not Windows
devs, I'm a bit worried about bitrot.  If you can think of any way of
making some kind of automated smoke test form builds on Windows, that
would be terrific.  Otherwise, I guess we'll just hope for the best.

> The two patches that are particularly likely to raise objections are
> patch 3 and 8:
>=20
> Patch 3 adds a copy of the err.h functions used by configurator to work
> around the lack of err.h on Windows.  If this is too much code to lump
> into configurator.c, I can split it out (and copy err.{c,h} verbatim
> from musl) or call fprintf+exit directly.
>=20
> Patch 8 adds the output cflag (-o) to DEFAULT_CFLAGS and the expected
> configurator cflags argument.  This changes both the configurator API
> and the config.h API and will break existing code which depend on these.
> If that is unacceptable, I'd be open to implementing a
> backwards-compatible alternative.  One idea would be to add an
> --output-cflag option to configurator, although it will require quite a
> bit of argument parsing code.  I'm open to other alternatives as well.
>=20
> Thanks for considering,
> Kevin
>=20
> Kevin Locke (9):
>   configurator: Replace unlink with remove
>   configurator: Reimplement run using popen
>   configurator: Inline err.h functions from musl libc
>   configurator: Use native directory separator
>   configurator: Mark non-Windows tests MAY_NOT_COMPILE
>   configurator: Print test source without cat
>   configurator: Fix compiler warning with compare
>   configurator: Pass output cflag to configurator
>   configurator: DEFAULT_{COMPILER,FLAGS} for MSVC
>=20
>  Makefile                          |   2 +-
>  tools/configurator/configurator.c | 197 +++++++++++++++++++++++++-------=
------
>  2 files changed, 131 insertions(+), 68 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sdJFN6SSISdF2ksn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4L+QAAoJEGw4ysog2bOSuHUQAM9Ynsmc7XXj8fxpArKaKdMV
omDYI6X/BWMz9xjR1JpOrTt1/EvQ8Tr17/sbbvHDqwviYP2tlkmClhg6/sd+isaO
fvHTwUcR1vzud6hMscPjsvcO7kMIH/GIHx+TPqJx9BHBNQma5bxCdmLmV2iCWPee
iB+IW2cdK8YUHqCdSqqaD6Mw6F/XH0gxmIQDj+gLAW9ffo8MACjBlPPOKsK5RJiU
gxU1RrP0WOsleb6q06mfF9cZsYMv8FOPZrsuQEx+rDghtUoZbmnxk5O5pE8wT6y2
MX9ZNGqjS1ZWQP2PxydW79AWOVJz1VqKV/c1QFoOEEBfvaz9e2T3hSs3reustCMQ
6zTKbI385kzKhHSRri6q7EGEXT0tAqyUZrP3bws6iczrr1iAB7UtZL7HggZvnRr/
YmfrlGMqr6VYMwdR8iom5Tky5gZ14KVOMUCTFFgwTWqB/bQEZBdp7QLH5x0XOsSG
5PwcglX0IiSrToKaq9HzpOSPqpGcEfO1gHtSLnWOQhAVIPw6z0BL0/VYb1TOUh+N
bhEGM2nZs7G0Hw6BLxQbmonJmiBoiMRJrv0pFYq1s+8SSUO6NmLHE5CWq+NLZOcm
pMEt1JLqNdeWW0IXt+4/XrnvbJ77FboRRf0MoEAbEbJc8iLAkg4Qpi8DgXBtmTIy
Gv1h3C6pjESNWG1sZGzK
=eCNA
-----END PGP SIGNATURE-----

--sdJFN6SSISdF2ksn--

--===============6394120736892486721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6394120736892486721==--
