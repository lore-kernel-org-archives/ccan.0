From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/9] configurator: Support for Windows and MSVC
Date: Thu, 22 Sep 2016 12:00:31 +1000
Message-ID: <20160922020031.GB2085@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <20160920044822.GJ20488@umbus>
 <b317f282-f357-e3f8-deeb-048c5793492f@kevinlocke.name>
 <20160920122524.GE20488@umbus>
 <CAGqEwiYXyGJn0qTVpzXinzdEXdzrE7ngLzM8mTYcY21WmjWHBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8062648409225776105=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfjvk07f7zDsgg
 for <ccan@lists.ozlabs.org>; Thu, 22 Sep 2016 14:20:18 +1000 (AEST)
In-Reply-To: <CAGqEwiYXyGJn0qTVpzXinzdEXdzrE7ngLzM8mTYcY21WmjWHBA@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Daniel Burke <dan.p.burke@gmail.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============8062648409225776105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 11:46:23PM +0930, Daniel Burke wrote:
> I do have a bit of experience with windows/linux C code interop, and while
> Visual C++ tends to be somewhat... unpredictable (It's getting much better
> than it used to be), I can tell you that...
>=20
> x86_64-w64-mingw32-gcc
>=20
> will output binaries that will happily run on windows, so long as you're
> using a version at least as new as is provided with Debian Jessie. (the
> wheezy version produced broken binaries). Wine can then be used to test
> them quite reliably. That compiler comes with enough windows libraries and
> headers to do most reasonable jobs, and quite a few unix headers mangled =
to
> work in windows environments.
>=20
> sudo apt-get install mingw-w64
>=20
> There's a 32bit version if you're that way inclined (which is also broken
> on wheezy), although I haven't used it recently enough to recall it.

Thanks for the info.  We should try to get some mingw builds and wine
tests into Travis (although at the moment the Travis builds are
already broken due to a problem on clang I haven't had a chance to
debug :).

However, as noted elsewhere, mingw shouldn't be our only or primary
way of building for windows.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4zs/AAoJEGw4ysog2bOSvlIQAOWI4hmWTDXKGqRqhQZt0ZSa
4VBN2tzM/cABzrwlZmXBEJ8mBgOAwJNiCkqo4THnQY+zWFjHY/YJrezfzFoBBgub
ZkM6b/cqYxMITbBt0dy9ugWeutXyXsu5PXSnf+VjTXmbh4XQhi4EW0KbUFBLQM7+
BrdDAaP/58qFhZhUJJ+/4+PgSA5+VcgtEfO8imaIy0JqjnL+Ezfn9FW9DypUeWe5
IG9WkTjRqECHprPK3tshPFor3BkSeAoxXxGZIiajpQs+DuvyUpeh/7mMnI0g2W0j
A8yC9510jkd9JTawOMp+wkR/B/PKNpWyvdkBuMssUzr1jVfs210/QekL9a3aDoFe
3EwAitItErRDOIYi5oXH4SPUq5VnTeGLFAW9xvhHcUokFZCUu6AkQkKVsANRg05i
nQgX/utIEYE6hMsYXwwclzddSk5q3m6dOgTo++nqHJJtv7K9WQBV/FKH7olGEtqZ
NHItIR/79Tk+UIn1zkL2tNafS2UOgMOatSpo6b3yuU6VINnRqvSBmnb2sKj2CoS9
FzaWxxJpy8Vyx48RysF7s/fgqTotvgxyN09nQyZyOlrEQUkP/q7evAI3WDf4eNLY
GQpCzW74QAia8/GHXRE35shlbqT+alY62Yd29dBt81FxTuBENUXpeINecmyCIORH
2Jxu+cwLpUibu/zRmnK8
=jbdN
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

--===============8062648409225776105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8062648409225776105==--
