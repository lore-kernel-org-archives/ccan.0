From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Tue, 9 Feb 2016 12:14:59 +1000
Message-ID: <56B94BA3.4060405@longlandclan.id.au>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <20160208021734.GE3702@voom> <56B818F5.7070204@longlandclan.id.au>
 <20160208234057.GC29288@voom.bne.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2007067641954810054=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from atomos.longlandclan.id.au (atomos.longlandclan.id.au
 [IPv6:2001:44b8:21ac:7000::1])
 by lists.ozlabs.org (Postfix) with ESMTP id 9B1D81A0191
 for <ccan@lists.ozlabs.org>; Tue,  9 Feb 2016 13:16:05 +1100 (AEDT)
In-Reply-To: <20160208234057.GC29288@voom.bne.redhat.com>
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
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2007067641954810054==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PjsXjjOknkWlOtRSv4grdBVM2m3pwLECU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PjsXjjOknkWlOtRSv4grdBVM2m3pwLECU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/02/16 09:40, David Gibson wrote:
> On Mon, Feb 08, 2016 at 02:26:29PM +1000, Stuart Longland wrote:
>> On 08/02/16 12:17, David Gibson wrote:
>>>> +static void* default_malloc(const struct btree_allocator* alloc, si=
ze_t size);
>>> Existing style in this function suggests "void *foo" rather than
>>> "void* foo".
>>
>> Ahh, call it habit, I'm used to having the "pointer" bit with the type=

>> (as to me; "pointer to void" is a distinct type from "void").  Caught
>> myself doing it elsewhere but missed it here, I'll fix it.
>=20
> So, from a language design point of view, I agree with you.  However,
> I dislike that style in C because it obscures the fact that C
> importantly *does not* have that sensible handling of types.
>=20
> More specifically this style:
>     int*  a, b;
>=20
> Suggests that a and b have the same type, but of course they don't.

Yeah, for that reason I tend to write:
int* a;
int* b;

thus being explicit about it.  In fact I do that for non-pointers too as
it's just clearer.  (I'd make lousy submissions to the IOCCC.)

It also lets me document what each variable is doing with a comment.

However, we digress, the style is definitely the 'void *foo' style
already, and so in the interests of code consistency, that shall be the
style used. ;-)

>>> [snip]
>>>>> +/* Default allocator implementation */
>>>>> +const struct btree_allocator BTREE_DEFAULT_ALLOCATOR =3D {
>>> Use of all-caps for a non-macro is a bit unexpected.
>>>
>>
>> Good point.  I guess I wanted to visually differentiate a constant fro=
m
>> other member types.
>=20
> I applaud the idea, but unfortunately I don't think that use of caps
> is common enough to make it really clear.

Yeah, I did it without thinking, elsewhere like in Python, that's the
convention; ALL_CAPS =E2=86=92 constant.  I know C has a convention for m=
acros
being capitalised, but none really for const members, my fingers just
went on autopilot.

I shall fix this though when I get to everything else. :-)

Regards,
--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--PjsXjjOknkWlOtRSv4grdBVM2m3pwLECU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWuUukAAoJEE36GRQQveO3V6wQAI0+LPf7d93X8qeHnEBO4Bci
KfLGklV0ELkisovXyNwSy74woDO+uQCGiguhuHgqnd+/UlwCgc3t4GBURbmb2oTy
tKIZa6sj9JDldN1DngQEPZSIYGuUvlxyaD9EmOERX/uoQXeBlCavM6o7UzdDVB5X
nBGykhNQCB49kGii1O2KUEiw/modFa+c0PryF9Nfxq3kFxZdmVt/Li3VgqZpImq0
2NaYL3EXstpjC9Pk6AYSMP6T8VaO8TiHoU1gANj0Fyeah1lsaHtpVdWgHHO1578Z
l+7sAvLSe/77N4NNVn2azSXyGvq5je4vWPdL6zOkE8jGGG/V4pWp/0OdWhAXx5dT
d+DsKSQQlA4UHcB8f+wg8M7Onpqrm2/d3ymIdWj2c33w2hzeh56IQ56/3vsPdqLf
5zf0hsxeTH6PxK2X6+Bc2G3XWJGzkCQzK4jO403QZhGHkzqa+Sz1PImTvCZh3VIw
3bD9M/GvgBY/kcYiKcE6hunBDAgOb5Mv+kOH9tsZ6HGyqP8ld0orpb/xE1tWeBYF
6LNewCQxh9dy3UFMG8rz9rCDSvbAyL8U+pMu/m0sNBL+RkNuFir7FppciZ7B2y+w
2lQ033fBaAVO5x7IFysDRo+UULN+/LImT2sL5yHrtB1OlRlhgABFw9Y7MOGrFwY/
60TDIB3nmqYHBSovxAv1
=Fe08
-----END PGP SIGNATURE-----

--PjsXjjOknkWlOtRSv4grdBVM2m3pwLECU--

--===============2007067641954810054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2007067641954810054==--
