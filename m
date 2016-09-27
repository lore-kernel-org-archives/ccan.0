From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 00/13] configurator: Support for Windows and
 MSVC
Date: Tue, 27 Sep 2016 15:23:42 +1000
Message-ID: <20160927052342.GV30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4645117682417576258=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjqSp58j0zDrSv
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:41:14 +1000 (AEST)
In-Reply-To: <cover.1474600863.git.kevin@kevinlocke.name>
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


--===============4645117682417576258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q/AGl/UrDvkbRExF"
Content-Disposition: inline


--Q/AGl/UrDvkbRExF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:03PM -0600, Kevin Locke wrote:
> Hi all,
>=20
> This is the second revision of my patch series which adds support for
> building configurator with Microsoft Visual C++ and running it on
> Windows.  The motivation is to add sufficient support for Windows to
> allow using header-only modules with minimal hassle.
>=20
> The major change in this revision is the handling of the output cflag,
> which can now be specified by a command-line option to configurator and
> is set in a separate config.h macro.  This both fixes the ccanlint
> breakage in the previous series and preserves backwards-compatibility
> for any code calling configurator or using CCAN_CFLAGS.
>=20
> Patches which need special attention:
>=20
> As before, patch 3 adds a copy of the err.h functions used by
> configurator to work around the lack of err.h on Windows.  If this is
> too much code to lump into configurator.c, I can split it out (and copy
> err.{c,h} verbatim from musl) or call fprintf+exit directly or consider
> modifying the ccan/err module for use by configurator.
>=20
> Patch 8 changes the configurator API by adding a command-line option and
> config.h macro.  The names are different than I had previously
> suggested, as noted in the commit message.
>=20
> Patch 13 adds appveyor.yml for AppVeyor CI.  This will require (free)
> account setup on ci.appveyor.com once merged to enable automatic
> building and GitHub integration (if desired).  You may also wish to
> consider whether to add a README badge or email notification or other
> mechanism to be notified of build status (beyond the default pull
> request hooks).
>=20
> Thanks for considering once again,

Thanks for sending again.  I've applied a number of the simpler ones
already.  The remainder I still have some comments on.

Incidentally you are introducing a new concept here which isn't really
comment on.  The use of more #ifdefs on system macros into
configurator means that the way our default compiler options will be
set up is basically going to be dependent on the setup used to compile
configurator itself.

That seems like a sensible approach to me; we just need to be a bit
careful of interactions with make and/or other build systems when we
could have a system with multiple compilation options (e.g. both MSVC
and cygwin/gcc installed on a Windows machine).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q/AGl/UrDvkbRExF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6gJeAAoJEGw4ysog2bOSz8wP/1eWDzwnlVjc4GgD8jZoanJ6
eoHV5qSv1MMXohWTmt3BtZUZtd4JZRMbbyYJoLvwRrrOGV44tUmf9PPPdUto3jgc
eikUDYr6+PGf0Co+q3YVrZdWwQ+4dgIkZ/RxPbhNkrr+id9qUOgeiv99FfhZh90V
p1wncx/uUxfdGV/7fyj2s2CMg8QM0nj4ontHoB68JmaFxKpiukDiSbCZ7po5HywS
y/cFiJcBvTo8NUZFdMc1juBHq+FMOv/1ftN89Uz/Z98JCJKIz+lktjTxiQi3LTGk
ygT5S+jpV1zgdnrgsqj4Vg73lKEss5rx+tZAAzGsVRN+AKinqP7LAD7Bmkwm62QY
n4vNWTLxXirszPiQAwIrRpjSKE2LPAbtOALB7y1vteZLB8fko2EoTX+trJbiZ28Y
oozloxZnNdsmgih30NIDOrCjit655tzquW/0dDIF2eJClY2jOVFO7b6F8GEGRq1C
y9Q6mhER5JjZ1WEhIWZ+ObjQrgxgS01Me/QVOUSvtF5mNtP+55Y2XPzBp8HrwrBi
tEIwkIy6wVBDj7KR7f9/858nwvV0t66nmDr0hi8CmByqDWi2+6U+/PgubW/huQBG
CtrFh96VlubQeSp6akyVeyAVkhwCyi5WiLNTN2xkQxeW5DAwsNKgkuWeVvs/or09
TaoDMLK6zx+O0RbHZsXM
=ZEQr
-----END PGP SIGNATURE-----

--Q/AGl/UrDvkbRExF--

--===============4645117682417576258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4645117682417576258==--
