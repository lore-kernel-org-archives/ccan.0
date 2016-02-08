From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Mon, 8 Feb 2016 12:37:11 +1000
Message-ID: <56B7FF57.1010704@longlandclan.id.au>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <87wpqgm3mb.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6391706390907576227=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from atomos.longlandclan.id.au (atomos.longlandclan.id.au
 [IPv6:2001:44b8:21ac:7000::1])
 by lists.ozlabs.org (Postfix) with ESMTP id 24C021A0190
 for <ccan@lists.ozlabs.org>; Mon,  8 Feb 2016 13:38:15 +1100 (AEDT)
In-Reply-To: <87wpqgm3mb.fsf@rustcorp.com.au>
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
Cc: Stuart Longland <me@vk4msl.id.au>
List-Id: ccan@lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6391706390907576227==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ENAB3UlwDeQOBtbPpS9XnnutFbn9tONHH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ENAB3UlwDeQOBtbPpS9XnnutFbn9tONHH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/02/16 10:45, Rusty Russell wrote:
> stuartl@longlandclan.id.au writes:
>> From: Stuart Longland <me@vk4msl.id.au>
>>
>> This provides a way for btree to be used with external allocator
>> libraries such as the tal or talloc modules.
>=20
> Sure.  In my libraries I generally use a global allocator override;
> it's not thread-safe, but much easier to use in practice.
>=20
> Since I don't use btree, I'm agnostic about it though!

Indeed, actually I'm half considering whether we make it a separate
module that `btree` (and others) can pull into their code.  There are
lots of cases where `tal` or `talloc` is desirable over the standard C
malloc/free.

> Minor nits below:
> =E2=80=A6
>>  /*
>>   * If iter->node has parent, returns 1 and ascends the iterator such =
that
>> @@ -65,11 +68,19 @@ static int node_walk_forward(const struct btree_no=
de *node,
>> =20
>>  struct btree *btree_new(btree_search_t search)
>>  {
>> -	struct btree *btree =3D calloc(1, sizeof(struct btree));
>> -	struct btree_node *node =3D node_alloc(0);
>> +	return btree_new_with_alloc(search, &BTREE_DEFAULT_ALLOCATOR);
>> +}
>> +
>> +struct btree *btree_new_with_alloc(btree_search_t search,
>> +		const struct btree_allocator *alloc)
>> +{
>> +	struct btree *btree =3D (*(alloc->malloc))(alloc, sizeof(struct btre=
e));
>=20
> You can call a function pointer, so alloc->malloc(alloc, sizeof(struct =
btree));
> should work. =20

Ahh, didn't know about that.  I presume a more recent C standard?  I'll
admit I had to look up the syntax for function pointers off Wikipedia as
I don't do it often enough.

(In fact, I don't do *C* often enough.)

> Lots of whitespace cleanups.  Not a problem, but prefer a separate patc=
h
> for clarity.

Yep, I often do a whitespace cleanup first up and ordinarily do that as
a first commit.  I'll split these out.

> Put default_malloc and default_free above the BTREE_DEFAULT_ALLOCATOR
> definition, and you don't need to pre-declare them.

Will do.
Regards,
--=20
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.


--ENAB3UlwDeQOBtbPpS9XnnutFbn9tONHH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWt/9XAAoJEE36GRQQveO3EpEP/1Go0x5zq4OgKYyvUJYnKMzr
H3JIKwOmIh8rY5/Y7UwEa1ygDGfRvyZml73RHnNpvfzZPS28sJbbSm7IGh33QWAU
5K128Oq1zS8MMUqzFWl/2ChJxSLVU1QrAbCFrBMC/JIZweOgBPkJyERhRun8MbVV
pPLoES664i9/LfsqJkPdcGwMvWci5ndPwRdWQU76G4M+hYOyVV1vI2ikTppXSaRM
Tw4x7juEYVAmji0L6HzDSgwP3OATgTGgBIPI69mwIwcxjfWZlMYb7q46QrAvJ/Zg
I/jNbB8GawjksOPxrm+fnayIZf5yEmvn/Qgy5anZ1U9NLJMw8Nz7BFWstEp6Gj0Z
yf2ACNwT8xGnqxcDkkBxicaf/q5B1kZsGpvjI1ks5vxnpv0n3eNIDQMojRhpewJt
cQn5lqtsZVi1acSt+SXHobwGZNN/JuQALpqPHrFE2IulHE9bo4XkM8zgKQijkHxG
GxZjtKMs08t4yBtmL1Wk/8Zvb8sGyew9SCnB0L8ruqnrYjZ9BQwAhCDp0Xhw8qgu
wACQL6nlTcDomIXPJ0ZwFojDpdhDDHx9Y+IKEnExRZWZQoq/hb2aZ/fPT51P2fcp
JVsqx4kYyNnJus/A/B56ZdJRJWcLG4qduMsnRPjUAHKiwo0Il7dXLt6bnblbrCN/
u1h/5wLHHbbH7LoUY/h1
=yMeG
-----END PGP SIGNATURE-----

--ENAB3UlwDeQOBtbPpS9XnnutFbn9tONHH--

--===============6391706390907576227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6391706390907576227==--
