From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 0/7] configurator: Support for Windows and MSVC
Date: Sat, 1 Oct 2016 01:08:28 +1000
Message-ID: <20160930150828.GC23399@umbus.fritz.box>
References: <20160929002122.GK18880@umbus>
 <cover.1475109043.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7656959200658473046=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slvw66yVnzDvJR
 for <ccan@lists.ozlabs.org>; Sat,  1 Oct 2016 01:08:38 +1000 (AEST)
In-Reply-To: <cover.1475109043.git.kevin@kevinlocke.name>
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


--===============7656959200658473046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2016 at 06:44:41PM -0600, Kevin Locke wrote:
> On Thu, 2016-09-29 at 10:21 +1000, David Gibson wrote:
> > Right.  Can you rebase your current patches and post them as a new
> > series.  That's makes my life easier compared to updated versions of
> > each patch in various places in the thread.
>=20
> Certainly.  No problem.
>=20
> Here is the third revision of the patch series which adds support for
> building configurator with Microsoft Visual C++ and running it on
> Windows.
>=20
> Significant changes from v2:
> * Removing the unnecessary EINTR and short read/write handling code.
> * Switching from the musl libc err.h implementation to the CCAN err
>   module one in hopes of reducing maintenance burden and code
>   proliferation.
> * Additional documentation comments for AppVeyor.

I've merged these to master.

Judging by the FIXMEs in appveyor.yml there's still a lot of things
broken, but it's a start.

I set myself up an appveyor account and tweaked your comment to point
at that instead of the hypothetical one Rusty may or may not set up at
some point.

I've actually set up two appveyor projects: one which tracks my github
ccan repository at:
    https://ci.appveyor.com/project/dgibson/ccan-c44x3

And another which tracks the upstream master git for ccan at:
    https://ci.appveyor.com/project/dgibson/ccan

Bizarrely, the github one is working great, whereas the direct git one
is giving errors, even though they're showing as building exactly the
same commit :/.  It kind of looks like the master one is ignoring the
appveyor.yml for no apparent reason - it seems to be looking for a
vcproj file instead of using the build scripts you've supplied.

Oh well, maybe we'll figure it out in future.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7n/pAAoJEGw4ysog2bOSYMYP/RKABQ3d0Sqhsxmw0EE5BdpA
9ax7y9eI5+R5y+pWWOB7SlODWFyp13TAOFpTWrkAHtIoafQoD/pL52NK0Eq3gtUA
j/C+UF2A1h16PslAXU+MhKkJfLlFW6oj8g7B7zdjDWTO4z2hYVK0HQgRzCaURkuS
TCsBh5Z6PqwyTKrw0MQJL8kzOwNLQ4uxCEs1DljjPdjcf2O13GP2sPyWZlm/9ey0
q5UeqtncJI6PdM3eN0Jl0pYhgngks63yTySUKSXxczsf6VKyFnPJ6lOuAYQ7vI+b
Kv/4sN6dn3Z4KbhfguR+7rES4DeyLUnYWhzPbGHcS7LFSrNOmznVVdnSvifqrTxi
4coGohhF6Hs34JvLIt/BYPKWWNNnRp2lfd3VTY9u3jtrM0go5MUqSdKIcoljhn4J
qoBf3rbO/DdEHfVsT6E7YW9Vi0tpVpq+MqgceBnQW+o1Avxnkm8MDVY/LDSc/LmU
0HKY0erHfAJcCeF7d77v47A481KS3HPl2Vhmh8AplynaQpabSFDdf//C+1CTZBCK
Yv8QRfOqpIic9e2Jqbl+q3C50RRS8OK+KmZZn7h6N6CoDZCTEszx+A253nbi0ZVd
MDW9apiCnpKiDC9+SP9ScwGz0rQAlkNLqqgLoVX6gRoiFWS4qW6rdRgYbpn/Xpxk
Hcxmo8ufSk2E1RddoqbV
=9w0q
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--

--===============7656959200658473046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7656959200658473046==--
