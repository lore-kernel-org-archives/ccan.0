From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Mon, 8 Feb 2016 14:24:33 +1000
Message-ID: <56B81881.70204@longlandclan.id.au>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <87wpqgm3mb.fsf@rustcorp.com.au> <56B7FF57.1010704@longlandclan.id.au>
 <87egcnhnrn.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2126390442165337506=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from atomos.longlandclan.id.au (atomos.longlandclan.id.au
 [IPv6:2001:44b8:21ac:7000::1])
 by lists.ozlabs.org (Postfix) with ESMTP id 1D0FF1A0018
 for <ccan@lists.ozlabs.org>; Mon,  8 Feb 2016 15:25:34 +1100 (AEDT)
In-Reply-To: <87egcnhnrn.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>, ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2126390442165337506==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XTaSfbKmudqA5kGoPI18aiabIOoVkVV9f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XTaSfbKmudqA5kGoPI18aiabIOoVkVV9f
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/02/16 13:41, Rusty Russell wrote:
>> > Indeed, actually I'm half considering whether we make it a separate
>> > module that `btree` (and others) can pull into their code.  There ar=
e
>> > lots of cases where `tal` or `talloc` is desirable over the standard=
 C
>> > malloc/free.
> Yes, I've been all over the place on this.  Opt has opt_set_alloc(),
> (a global), rbuf takes an explicit realloc function, io just assumes
> tal, tal/grab_file is actually a tal submodule (the old one is
> deprecated, will be removed RSN).
>=20
> There's a balance of "big enough that needing tal is not an issue",
> "standalone enough that I want to avoid a dependency" and "API
> simplicity".

Yes this is true.  One thing I want to avoid though is having to say the
same things 10 different ways, as that occupies (small amounts) of space
too.

That's why I'm considering actually breaking this out into its own
module.  The thought is it should follow the standard
malloc/realloc/free conventions.  It's one less pointer to keep track of
in most places.
--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--XTaSfbKmudqA5kGoPI18aiabIOoVkVV9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWuBiBAAoJEE36GRQQveO3ivMP/1vAfbTWxi0tB++MkidvJXyU
dAKq+RJyqFyX2GcZbcbR0GFBzrCaVws7ytJlwiIr4O0O1Cn2l0BnqhXatEiRTbYU
CmhPIocSXhmICbgtENfqXuiXaJC4VWdsWZ0MrrBFaYvR0z8aXp2D5HduF/bHGS+U
FtkT5LA0Ru2rAik2jIrt5CVr/iPDd67RFwLVIYW82EPQoxipILXb0U4XScdY9tOA
nNHmr62rFtaO2mWzAFfDIVpsJiNhQBDzcWjEYn/dmNn4Ec/eyDswpzB422C3c59z
MmolmaKA29+XM9c5Kap+hXLmEWmVaZTvEby/xhlLvOHVD+BtSs1G/C9qnY4u6Jrb
oUyHlTS5Mt5RUVvaIBgkb0xMZ8G+odVcL2uusHmkLW3XAl53OzQXIJlyuy1UWfWo
zpm08Yf8fxe2v27riQdKcwkWT2ZJk/Xfl9LJ+56bboRmblxar7hYjJRN5BWVz/cR
w4t4T8qDTlRX0srW3Z6Kl1+EEmrO+eS/2+buPpjFPIr6oakNnmLinCZMa6PrWnXu
Ahbr65fp8SeoQ6XgZOkjjbKoYM3azxzCUG+uTnF0iCE9URlB1RWEg1uMWlaAUEal
ItIRljSvaEDWMytjV3Qpiw8KQdM60cda42TEHGz1asdQSMkBN4fA7yoYDUndH5it
P/IrnO5q51r2dyhlyGH6
=g9m9
-----END PGP SIGNATURE-----

--XTaSfbKmudqA5kGoPI18aiabIOoVkVV9f--

--===============2126390442165337506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2126390442165337506==--
