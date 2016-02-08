From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Mon, 8 Feb 2016 14:26:29 +1000
Message-ID: <56B818F5.7070204@longlandclan.id.au>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <20160208021734.GE3702@voom>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4776918545395742585=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from atomos.longlandclan.id.au (eth2015.qld.adsl.internode.on.net
 [150.101.176.226])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B5B91A0018
 for <ccan@lists.ozlabs.org>; Mon,  8 Feb 2016 15:27:24 +1100 (AEDT)
In-Reply-To: <20160208021734.GE3702@voom>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org, Stuart Longland <me@vk4msl.id.au>
List-Id: ccan@lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4776918545395742585==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Far1UDtXf17E878G8pgUwKchAcBeGp9rM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Far1UDtXf17E878G8pgUwKchAcBeGp9rM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/02/16 12:17, David Gibson wrote:
>> +static void* default_malloc(const struct btree_allocator* alloc, size=
_t size);
> Existing style in this function suggests "void *foo" rather than
> "void* foo".

Ahh, call it habit, I'm used to having the "pointer" bit with the type
(as to me; "pointer to void" is a distinct type from "void").  Caught
myself doing it elsewhere but missed it here, I'll fix it.

> [snip]
>> > +/* Default allocator implementation */
>> > +const struct btree_allocator BTREE_DEFAULT_ALLOCATOR =3D {
> Use of all-caps for a non-macro is a bit unexpected.
>=20

Good point.  I guess I wanted to visually differentiate a constant from
other member types.

Regards,
--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--Far1UDtXf17E878G8pgUwKchAcBeGp9rM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWuBj1AAoJEE36GRQQveO3gi4QAKhc2vgGf+9djn8im5VHwv1Q
xcg4AYUS3xISJe80fIeiOGPWpKs/NbQTk42oOwK5kxvPsrkC2+m5paQxi8BhVdcS
HO7ee9IrSRURqH3p6/x/qvf56riYIRTIu5ylh62y9CXpWB9iyX2UA+HIfSfbe1v1
6CVA2EYzOlbxcgsHnvcHKhku+fXxsDeoUVKKz2BXrAt3p61a4lkGQZirWtikxohk
ujbnItKzeEBQr6REkJkg3rjmc/VjyR26Ev0Ld2EUe+n/DnRnWjqhWwp8dAh+Jccw
BKS8rNWGK32J1c0KL5cu8redE+qQLuUCqhuChzyn92Od+hISip/gbCJWitSfN7Db
ve3/JI/hCuyq1uysnBJiN2CCVNVdhH+JxxOTVMu7GpalPn9HvnQSGwQLZsEW+rDP
9kegnPZWkiTVN0FN9FEmROvdeyfMrqsdSAZBtb639y4hAGzgKnmdKt/NuooFrGyT
qiLxKA+SjfHGXugyf+VKXZVTQ0qZKJ/2Y09ueNBG/kBXS59zzvDgkYSex6FK1Jgz
xMST+hzyF9KosKmFWm6bHcdvlGLZBrx0bYqQUpdWpYSAYWkmHGIqacCGnQx5sdtg
AZJArIeKc607l/bjlVWDcWPHqqun5wlrUrGjztVihbEraujlicKH/zlp8srmz+Su
KTr7GRTzQl/6TRZHb8C/
=NXfL
-----END PGP SIGNATURE-----

--Far1UDtXf17E878G8pgUwKchAcBeGp9rM--

--===============4776918545395742585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4776918545395742585==--
