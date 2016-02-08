From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Mon, 8 Feb 2016 12:17:38 +1000
Message-ID: <20160208021734.GE3702@voom>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0819568078449128257=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 55E0D1A0190
 for <ccan@lists.ozlabs.org>; Mon,  8 Feb 2016 14:37:57 +1100 (AEDT)
In-Reply-To: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: stuartl@longlandclan.id.au
Cc: ccan@lists.ozlabs.org, Stuart Longland <me@vk4msl.id.au>
List-Id: ccan@lists.ozlabs.org


--===============0819568078449128257==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 07, 2016 at 10:10:39AM +1000, stuartl@longlandclan.id.au wrote:
> From: Stuart Longland <me@vk4msl.id.au>
>=20
> This provides a way for btree to be used with external allocator
> libraries such as the tal or talloc modules.

Rusty's comments seconded, and a couple of my own:

> ---
>  ccan/btree/btree.c | 194 +++++++++++++++++++++++++++++++----------------=
------
>  ccan/btree/btree.h |  29 +++++---
>  2 files changed, 136 insertions(+), 87 deletions(-)
>=20
> diff --git a/ccan/btree/btree.c b/ccan/btree/btree.c
> index 636edbc..5bb2435 100644
> --- a/ccan/btree/btree.c
> +++ b/ccan/btree/btree.c
> @@ -29,12 +29,15 @@
>  #define MAX (BTREE_ITEM_MAX)
>  #define MIN (BTREE_ITEM_MAX >> 1)
> =20
> -static struct btree_node *node_alloc(int internal);
> +static struct btree_node *node_alloc(const struct btree_allocator* alloc=
, int internal);
>  static void node_delete(struct btree_node *node, struct btree *btree);
> +static void node_free(struct btree_node *node);
> =20
>  static void branch_begin(btree_iterator iter);
>  static void branch_end(btree_iterator iter);
>  static void begin_end_lr(btree_iterator iter, struct btree_node *node, i=
nt lr);
> +static void* default_malloc(const struct btree_allocator* alloc, size_t =
size);

Existing style in this function suggests "void *foo" rather than
"void* foo".

[snip]
> +/* Default allocator implementation */
> +const struct btree_allocator BTREE_DEFAULT_ALLOCATOR =3D {

Use of all-caps for a non-macro is a bit unexpected.

> +	.malloc =3D default_malloc,
> +	.free =3D default_free,
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWt/q+AAoJEGw4ysog2bOSTewQAOOl1rvHLsyQR7Iej3QfJvrY
wmST53uSYa1KV7C3Yj4l6Ih1gUVuOGMTH0fl6JKAvl3cI8wo9gdt3NN5zueqAccJ
BMKFlfVFIuXXedSO0Be2WRhWlyM6uPf0hSXZQDWLliJKIPhJ5lc8mKkxWuwCionE
V8C+sZPAEhdGXh+EYl5VCeLXiwCaKHrb/l/WDKtIhr5EHAjFwxZWMVDisncqkdiA
MjeYo9VijQjWOpvZ3GDeZjOccfZfv7uZv7rx7m+v/x/ZHgg+9HYbEPzvLAhwrQ0h
eQpgScyfJxCPw7O7nKiaB+4OuVzFu6a6M/qeCjIwkbZJMR5Mzx1sGtiWzWc7l+85
oYqj30sftFMZ93Y3SiFsArHq/0soQ24yDKGUyl208YAHJwAS8RnSJ1R19Lo5eVhc
dbXNlviBr9rpXinmwBAN+1kbOlhL4d3nxP1e2mp6azFsVx9tX7PWDCAtHRyaUmwu
HYSjGwes3tbVj1GGyeNiMLYYxZUS369vQgpQ3RUAtN6RxtlAD78HaDbnpCmKFd0p
Quc/31ymfd2m0PyLBMZ7uHTeJOCgas62RFMb60MUwHM56YCr6iIZw4OXhJunRsle
B5/vlGTRgGf4EGz30/JdGYFsWlr4YCnkA2vKFaaECrA+hTKwrjCBjNl0lKZ2ZmV3
bgTagjWhqWxWSCZO+yiZ
=egRs
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--

--===============0819568078449128257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0819568078449128257==--
