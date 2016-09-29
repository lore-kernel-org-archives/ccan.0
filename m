From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 00/13] configurator: Support for Windows and
 MSVC
Date: Thu, 29 Sep 2016 10:21:22 +1000
Message-ID: <20160929002122.GK18880@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <20160927052342.GV30322@umbus.fritz.box>
 <20160928062803.zrjaxfylwcpog33l@kevinolos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7704539428991323842=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skwQq2C1pzDsTW
 for <ccan@lists.ozlabs.org>; Thu, 29 Sep 2016 10:28:19 +1000 (AEST)
In-Reply-To: <20160928062803.zrjaxfylwcpog33l@kevinolos>
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


--===============7704539428991323842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GmiNL4+5WUWrod5m"
Content-Disposition: inline


--GmiNL4+5WUWrod5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2016 at 12:28:03AM -0600, Kevin Locke wrote:
> On Tue, 2016-09-27 at 15:23 +1000, David Gibson wrote:
> > On Thu, Sep 22, 2016 at 09:33:03PM -0600, Kevin Locke wrote:
> >> This is the second revision of my patch series which adds support for
> >> building configurator with Microsoft Visual C++ and running it on
> >> Windows.  The motivation is to add sufficient support for Windows to
> >> allow using header-only modules with minimal hassle.
> >=20
> > Thanks for sending again.  I've applied a number of the simpler ones
> > already.  The remainder I still have some comments on.
>=20
> Thanks for reviewing again!  I think I've addressed everything, but if
> there is anything I've overlooked, let me know.

Right.  Can you rebase your current patches and post them as a new
series.  That's makes my life easier compared to updated versions of
each patch in various places in the thread.

>=20
> > Incidentally you are introducing a new concept here which isn't really
> > comment on.  The use of more #ifdefs on system macros into
> > configurator means that the way our default compiler options will be
> > set up is basically going to be dependent on the setup used to compile
> > configurator itself.
> >=20
> > That seems like a sensible approach to me; we just need to be a bit
> > careful of interactions with make and/or other build systems when we
> > could have a system with multiple compilation options (e.g. both MSVC
> > and cygwin/gcc installed on a Windows machine).
>=20
> That is a good point and probably deserves some more thought and
> discussion.  I've tried to keep most additions configurable at
> run-time (e.g. the new -O configurator flag) so if the compile-time
> deduction is wrong it can be overridden.  But it still changes the
> configurator behavior based on how it was compiled without any
> explicit configuration.  That may or may not be desirable.

I think it's desirable, on the whole.  But having overrides is
generally a good idea too.

> Has there
> been any discussion of being more explicit about specifying build vs
> host system at build time?  Anything in particular you have in mind?

No, I'm afraid not.

> A good example of something which can not be overridden at runtime is
> the directory separator passed to popen(3).  I don't think there are
> currently any problems, but the choice of directory separator could
> easily cause problems between Cygwin and native binaries in other
> situations.  Definitely worth thinking about.

Yeah.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GmiNL4+5WUWrod5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7F6AAAoJEGw4ysog2bOSwj4P/0HUoN4vEiZHQJbzG+EAVhBq
BLQbDvNSlMpWMB+cywm6jn+UeZcYHyJNtMDqkwpC1RiwwduX5gEFkmocGDmbUvD5
GUuWIn0hwsPaAyPe05MDBbovxIvtuGNYpepYjjJvVdZI/VlXC/xL6ex0cJ5iCigA
6C81ZBK9rOf5EI5/OcFqlB03itiJwgrs2ppZ46htYp+dxMtROWULQn5RS2gsiitd
8QtQ6RlRNqWkQ9cEwmtIJn/McYnVPo1o2yjQwgRtwYED0pzAFNk1mQAfEQeOIDle
DxWiazSJebNnSZKdAYj7TTNbdjmkD5qX0AsNRS5GmljXlVZNvvrFtWQPMYjru0cy
UWI8Lz9IYhMJ+g4JgkoAjd2CREYgfBMdjmPg623N+laAZsD2e1tqQj25Tndyy23Y
V1BxL6ht/jP1vXhAnjgY0t1gnOGs7rdvQ3Mee+6sCFe3112BYYwMiLWctBHcrw8j
5LuOLqhlBEhk1WLXIqGi0mrwKVF1WqT6/AceJwYUtwcSkcUApXYRNjVtlAgxWBm6
Pr8xIi9VSocdz1zEBiYas9OmXIzhUYRnOHGbdzubxBqXm4ahEVRtmnegbKYjUS22
takEig67QJ+tGZM2TyWd9Jw+xlFvNCZUXW83XUwAzHfPJv6pMianNen7d7Bbqyji
hiUOjwdmhfEElx3Yqt2z
=Bfmk
-----END PGP SIGNATURE-----

--GmiNL4+5WUWrod5m--

--===============7704539428991323842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7704539428991323842==--
