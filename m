From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Test failure in rszshm
Date: Wed, 3 Feb 2016 00:36:32 +1100
Message-ID: <20160202133632.GE15080@voom.fritz.box>
References: <20160201110809.GK23043@voom.redhat.com>
 <CACNkOJNJS=8MOqHQA-kGwJV6odXzYY3Tz2HjmWuaj_0tPg_yYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8351932956842162297=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6C8F71A0066
 for <ccan@lists.ozlabs.org>; Wed,  3 Feb 2016 10:36:29 +1100 (AEDT)
In-Reply-To: <CACNkOJNJS=8MOqHQA-kGwJV6odXzYY3Tz2HjmWuaj_0tPg_yYQ@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@gooddan.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============8351932956842162297==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 04:15:06PM +0000, Dan Good wrote:
> That particular test is asking mmap to create a mapping of size UINT64_MAX
> and expecting it to fail with ENOMEM.  Are you getting a different
> errno?

Yes, it seems I'm getting EINVAL.  But the EINVAL is coming from the
mmap() call, *not* the initial tests in rszshm_mk() which explicitly
set EINVAL.

But what's *really* weird, is I get it when I run ccanlint directly,
but not when it then re-runs the tests under gdb.  And as far as I can
tell mmap() is getting exactly the same arguments :/.

>=20
> On Mon, Feb 1, 2016 at 6:07 AM David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > So, for me at least, ccanlint is failing on the rszshm module (and
> > therefore make check is failing as well).  I only see one commit for
> > that module, so I think it must have always been broken.
> >
> > not ok 13 - rszshm_mk(&t, 4096, NULL, scan) =3D=3D NULL && errno =3D=3D=
 ENOMEM
> > #     Failed test (/home/dwg/src/ccan/ccan/rszshm/test/run.c:main() at
> > line 96)
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsLDfAAoJEGw4ysog2bOSyBcP+wRBToy76rx3cfK2yw2H7u2N
c8cC5LYS+uNMJzkKbsL2Sq+i4MURApiOEvwWyB8QkhPQ81aAvRtaVBMbuxHuUVhU
x5bKr+31zk9cdA2iFaMDlDyQF5OR1x0ovXp0Fr2cHOPW93DqGKz1FznGGdHwIZqN
Ed60vQxPOrsxmBAsbSWqiwgnfqoKXMowinOTLd5FNpBwxIdIVqnYPWI0KdiZiM62
zuLDdxuNKA0XA3btPneuLqNebyIp4FW1uZkoSw41HS0MYa1p1u4aqDdY2wJrxsQF
/6NFDdZtr6zDC+M2Qnf1/HtSfgSt/e4ZHAhJphB9nz/q/qcaoZV3uqJt1KblyWEU
qYBvHHeVq08QZzzfFd/WHTMtSeb9u/OI+l9FgK5H5fb6SIsEF5yJ5MtI66dY5v+R
dhHbHvsx/cIOC2RLuIJoz/dMO6OuHJtC3650J8ykMz7KYBZDAIlDWRB1ckvXpMzm
AWNjD+Lz6Dq/oEVFmNO7Y5VTPkF64O8YuhMSQ/tObZOTNHcZa0iWELzbuke+sfXa
EhzeVM9Fo01Ouyp214NyOSIXrvBQb6RMU1EXg1Q+Uw4yPVMFoHCb4fHWyAWjal6d
vAVaRc2P+kVL3tUK/+Ys7/dFXr8fTGerHU9S3mJOM8QcScDUPIYAGeqqtzKHvkXA
LF5f0wOSfpx/ncXYbutD
=KWY8
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--

--===============8351932956842162297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8351932956842162297==--
