Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4918CC25B75
	for <ccan@archiver.kernel.org>; Mon,  3 Jun 2024 04:01:56 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202312 header.b=cIheLC0C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt0R60TNsz3cLQ
	for <ccan@archiver.kernel.org>; Mon,  3 Jun 2024 14:01:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202312 header.b=cIheLC0C;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt0Qw42fCz3bNs
	for <ccan@lists.ozlabs.org>; Mon,  3 Jun 2024 14:01:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1717387301;
	bh=9ZhAmSdzwe/SXzBrYx3x2RpVvKRzqvh6D5MT/Jn5y7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cIheLC0CycFBbh4b9TWRSQf8/pGcphgkN4Z+iE/b91WAp2FNyXVxdxmMDCMb7CdJm
	 JVx0d7Hcjmy+0Eb9SbUw6iBdEuKDTUI7HLZa9HuiHJtW6+N5LEGvnEy3aPbQZDDu/B
	 WVrb6N9TuFO4mQyXCcgsf5Pi8bRWAgV4BPEWJiuXlrJsGFvJH6uI2FCx40IMnELKFL
	 Wz1dQ36FmSiAn5QTvD9yw4e7NXa8fk2ng8N/h7d+nKIm0ApMpZsBneocnbql2eLnpP
	 J93NOfbm3lGK8hxRGqAxGETUa1yr2N5CQdxNKwEM5GA46NaxejAoxVtXqNDpdgXsGn
	 r8+viqfFzbumQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Vt0Qs0FhGz4wx6; Mon,  3 Jun 2024 14:01:41 +1000 (AEST)
Date: Mon, 3 Jun 2024 13:56:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ashok Raj <ashok.raj@intel.com>
Message-ID: <Zl0-8XRTWkv_D2lS@zatzit>
References: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
 <ZjwL8iUYUeJQZl8m@a4bf019067fa.jf.intel.com>
 <Zlroeyxsa_d80DuA@zatzit>
MIME-Version: 1.0
In-Reply-To: <Zlroeyxsa_d80DuA@zatzit>
Subject: Re: [ccan] New to ccan
X-BeenThere: ccan@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "If perl can, maybe ccan?" <ccan.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Cc: ccan@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============1203476716209864755=="
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>


--===============1203476716209864755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o5TzMHKeQOUdPdVL"
Content-Disposition: inline


--o5TzMHKeQOUdPdVL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2024 at 07:23:07PM +1000, David Gibson wrote:
> On Wed, May 08, 2024 at 04:34:10PM -0700, Ashok Raj wrote:
> > On Tue, May 07, 2024 at 12:54:07PM -0700, Ashok Raj wrote:
> > > Hi
> > >=20
> > > I'm new to ccan. I'm trying to use just part of the project (just one
> > > module) in another tool.=20
> > >=20
> > > I didn't catch the exact method to replicate a single module.
>=20
> As I recall, we talked about this a bit, but never did come up with a
> great method.
>=20
> > So I went past this step and able to include it in my project.
> >=20
> > But I see the following warning
> >=20
> > [16/247] Compiling C object libccan.a.p/ccan_bitmap_bitmap.c.o
> > In file included from ../ccan/bitmap/bitmap.c:5:
> > ../ccan/bitmap/bitmap.h: In function bitmap_set_bit:
> > ../ccan/bitmap/bitmap.h:61:43: warning: declaration of bitmap shadows a=
 global declaration [-Wshadow]
> >    61 | static inline void bitmap_set_bit(bitmap *bitmap, unsigned long=
 n)
> >       |                                   ~~~~~~~~^~~~~~
> > ../ccan/bitmap/bitmap.h:26:3: note: shadowed declaration is here
> >    26 | } bitmap;
> >       |   ^~~~~~
> >=20
> >=20
> > If I were to change the parameter name to _bitmap and in all usages the
> > warning disappears. Weird the definition its pointing to is this
> > typedewf
>=20
> Huh.  Looks like the code is relying on types and variables/parameters
> being in different namespaces, but that warning doesn't like that.  I
> guess we must not have had the relevant warning enabled before.
>=20
> I made a fix, but it's been so long since I pushed things to the ccan
> repo, I've forgotten how and will have to figure it out again.

Ok, I figured it out.  Fix is now pushed to https://github.com/rustyrussell=
/ccan.git

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--o5TzMHKeQOUdPdVL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmZdPvEACgkQzQJF27ox
2GcCrA/8C0A4Bsnz7WcbTlOXxicVe2wVO1lhceqChKA7e2btNMWTr8srjR+B82P9
65qJ/d3K9wvxBhtOQMdUTu+rPdf4WqkUdaawY/VfcXeKebZANcvTDk67pumNME+U
J1NjIUZi2qs5QpDMuzutD10h/sE9URbofUQY8dGSUU5T4n9Q37GTpYo+QMDNdyMB
clPSIRvqYa93sMhYXvAHFiWXLV0v0fxq6vjt4h/34BJqJYzD8YKJnyHtk+l96pvE
AEaemGrO1xm/JFRx9UCGOVRs2AsXcIHHpzg/HMjMY1GHwgVCy/8IC2LGbU2f1BfA
R3K5819p6UMAkVO0tKxIX98WTmQOTpOyHJGUq7w8wXOYuhVmtyqHURtAdLddRRPH
bInBe5ofEE6x0CVHgUZcpTO8Qn1bg1RrdkTHvsqkHitAZ2fa9reIU6yt0IoNMcTH
58M+tqAPrjsZE+J2sNLk/tblOqFwON8V63pg0NQF99tDirMilactHzquuTRKO3+/
ZOxU2juIFxStAUfbC08dJoVNQwyvhJrQ0yKmxFLxr8SYTsQGp9MgNcYB1VfhnYow
8N+IYK9S9ScL4FdarbSFe1hLyGOE6Y0Pp51Crlf3NVnxwy3qh5kDjIMmGJFuxhuZ
fwIifdvUTEhfdeEuJLbp5Ij6dby9GXTgtcgSPD30JaStoUYUY/E=
=uvqI
-----END PGP SIGNATURE-----

--o5TzMHKeQOUdPdVL--

--===============1203476716209864755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============1203476716209864755==--
