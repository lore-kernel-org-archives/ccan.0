Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06227C25B76
	for <ccan@archiver.kernel.org>; Sat,  1 Jun 2024 09:23:29 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202312 header.b=GT1ZBk+P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vrvg36cb5z30f8
	for <ccan@archiver.kernel.org>; Sat,  1 Jun 2024 19:23:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202312 header.b=GT1ZBk+P;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vrvfv4QFDz30Wf
	for <ccan@lists.ozlabs.org>; Sat,  1 Jun 2024 19:23:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1717233798;
	bh=oNnN5fV7CQuTJrAAFiFHwQBkBUmk3IvVXB8fiHISFo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GT1ZBk+PwwwgbOlU5eI0k3AVLDzppQogoLtUuR7JUwOVHGzIU09RqSRsCLpY38hRN
	 wUizTSPZSEuqFlb2JwS4LFvLTWmTyoto+uHEbZmRY5u5vzPDCtOy7gRMDG9EvZjeaH
	 arZ8Y/KlcwCCYJF3TkK6BdD5DiWgc1qDJ9JE957RGxIE/c5eH8qMxPeOd2O9qfAppP
	 pHgVl+LYoxcfGUPupgxAT/3Q14esGOpNggUtTLCH8+ynD45xJ2KHpSfvD7cDTS2lRy
	 TEj0T6QOFoEtGBqsNgbBbriCVzuHI1suoJVhZqbt6UxtZG2FW2cMjaUFz7QUnSovpc
	 0HIy/UD8wXAGA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Vrvft1Rzkz4x32; Sat,  1 Jun 2024 19:23:18 +1000 (AEST)
Date: Sat, 1 Jun 2024 19:23:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ashok Raj <ashok.raj@intel.com>
Message-ID: <Zlroeyxsa_d80DuA@zatzit>
References: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
 <ZjwL8iUYUeJQZl8m@a4bf019067fa.jf.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZjwL8iUYUeJQZl8m@a4bf019067fa.jf.intel.com>
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
Content-Type: multipart/mixed; boundary="===============9144317410404193508=="
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>


--===============9144317410404193508==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rr6AdlL9jklEc2VN"
Content-Disposition: inline


--rr6AdlL9jklEc2VN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 04:34:10PM -0700, Ashok Raj wrote:
> On Tue, May 07, 2024 at 12:54:07PM -0700, Ashok Raj wrote:
> > Hi
> >=20
> > I'm new to ccan. I'm trying to use just part of the project (just one
> > module) in another tool.=20
> >=20
> > I didn't catch the exact method to replicate a single module.

As I recall, we talked about this a bit, but never did come up with a
great method.

> So I went past this step and able to include it in my project.
>=20
> But I see the following warning
>=20
> [16/247] Compiling C object libccan.a.p/ccan_bitmap_bitmap.c.o
> In file included from ../ccan/bitmap/bitmap.c:5:
> ../ccan/bitmap/bitmap.h: In function bitmap_set_bit:
> ../ccan/bitmap/bitmap.h:61:43: warning: declaration of bitmap shadows a g=
lobal declaration [-Wshadow]
>    61 | static inline void bitmap_set_bit(bitmap *bitmap, unsigned long n)
>       |                                   ~~~~~~~~^~~~~~
> ../ccan/bitmap/bitmap.h:26:3: note: shadowed declaration is here
>    26 | } bitmap;
>       |   ^~~~~~
>=20
>=20
> If I were to change the parameter name to _bitmap and in all usages the
> warning disappears. Weird the definition its pointing to is this
> typedewf

Huh.  Looks like the code is relying on types and variables/parameters
being in different namespaces, but that warning doesn't like that.  I
guess we must not have had the relevant warning enabled before.

I made a fix, but it's been so long since I pushed things to the ccan
repo, I've forgotten how and will have to figure it out again.

Speaking of which... ccan is largely moribund at this point.  Neither
Rusty nor I has any real time to devote to it.  And in my case,
collecting C examples - even very nice ones - has become a lot
compelling with the emergence of viable alternative systems
programming languages (Rust, Go, Zig).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rr6AdlL9jklEc2VN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmZa6GUACgkQzQJF27ox
2GcWMQ/+JotSsUCRAcGzFqPlfQMo2j0ul7mluB3nnOaNatx2IYhVvkjuA5AstWim
96kIHCQf90lL4W2bY6pW8BIRJ2C349pMlKMqy0LKqAz4IPAWHXJHybG8ySbtMfmV
qEsojLYiz6Vfx9VTvEshIBUh2H+oyDVme5l8ivZZOABL7AbhlNGAWsF7KTD6/X9f
KI7dSVrkxeWiJ3rQCybgnTsoP42nl7ySDmN/5WashNytOo7dieQSYkUIondxAAZD
3jlTsq+Lyb2v7L1/W6l9By54PId57cmEQKW0jGmR57I3H5ERnfqwUKbhZJW6RhOz
d7TvzP45EHPiBZ7OhMhacAgkAbo8204CvJmdHaordlFwM9dSG+lV4FOkexHVLEoV
HyKbPfOZQAyjdyHw0GZbm0wrUMd/M+qPRlYo8216YQDKIwQq57EIPTrTuF7YiqYl
XPoBBXlB+X2UidffWZ24ARM0jlNtnQDDajM03/kiReFVvRf56OuzGnBmbwp/DBuY
xZXJL5ioWy03iLtdQdSsJcOIj1OKi7488Ilh56ihBgbPmWp1wSm9KJmq3ml2CTqK
uUQ6hiCqDBCUOKqzqaFtw1MziyDOfhsOCdrDL50pFC3UClKbiT0AXhTDr8QQ7Hf9
pd3hqFA3gVxlkXFOBK15TchSQv2z39pu5VK+EOCLOyyPkKQPxiM=
=17t8
-----END PGP SIGNATURE-----

--rr6AdlL9jklEc2VN--

--===============9144317410404193508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============9144317410404193508==--
