From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] darray: Add darray_insert() to insert a value at
 a specified index
Date: Sun, 27 Aug 2017 12:59:18 +1000
Message-ID: <20170827025918.GP2772@umbus.fritz.box>
References: <20170826180108.20693-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6208344317974655413=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xg03v6N1TzDqg5
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 12:59:23 +1000 (AEST)
In-Reply-To: <20170826180108.20693-1-damien@grassart.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Damien Grassart <damien@grassart.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============6208344317974655413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bd2KlmcTHfsQFEJ+"
Content-Disposition: inline


--Bd2KlmcTHfsQFEJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2017 at 08:01:08PM +0200, Damien Grassart wrote:
> This module currently supports removing but not inserting at a
> specified index, so this adds that. Inserting a value moves all
> existing data beyond index over one element.

Looks good but I need an S-o-b.  Adding a testcase would also be good.

> ---
>  ccan/darray/darray.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index 75112419..fca20b8a 100644
> --- a/ccan/darray/darray.h
> +++ b/ccan/darray/darray.h
> @@ -56,6 +56,7 @@
>   *
>   *     void   darray_append(darray(T) arr, T item);
>   *     void   darray_prepend(darray(T) arr, T item);
> + *     void   darray_insert(darray(T) arr, size_t index, T item);
>   *     void   darray_push(darray(T) arr, T item); // same as darray_appe=
nd
>   *
>   * Insertion (multiple items):
> @@ -169,6 +170,12 @@ typedef darray(unsigned long)  darray_ulong;
>  		memmove((arr).item+1, (arr).item, ((arr).size-1)*sizeof(*(arr).item));=
 \
>  		(arr).item[0] =3D (__VA_ARGS__); \
>  	} while(0)
> +#define darray_insert(arr, index, ...) do { \
> +		size_t __index =3D index; \
> +		darray_resize(arr, (arr).size+1); \
> +		memmove((arr).item+__index+1, (arr).item+__index, ((arr).size-__index-=
1)*sizeof(*(arr).item)); \
> +		(arr).item[__index] =3D (__VA_ARGS__); \
> +	} while(0)
>  #define darray_push(arr, ...) darray_append(arr, __VA_ARGS__)
> =20
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bd2KlmcTHfsQFEJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmiNYYACgkQbDjKyiDZ
s5IJPhAAyrzywibdRKjhKAYFU44LCHP+HbJ/7wP0JCmw9EOtUuh94IATMPGJStLu
jUeVEL6l+rlmBYvcJaGxRIDVv3DcPvRiCuitRplC9c0nYdokIMH6+Z63Jwmk0532
iG2r8S4KcTghytAld6lc7f8TZm4kOXUS4o9e01gg1Q1Jb6m2WFAoag7LGL9aoMFr
toz5uqneqVC2cQOX+UJnwXg2gE7V1P0iKu17vA1hg8tTwS8T2gsGG29eONH7lSnX
+6mWTeOtTnL/HUmL9W6i7IwPSvqudzCToh+RHlaxYAwp+3q+a5tgblCutMq2aw49
6bGtkr5AFt6OLs0IvD4A5Pngtq+ushcfr+5lTSIZeYLvZUF/WGpeXUGhrFKhF6k4
Bd4PN2YCGz+1xgxPUCL5/8ZJaBepVHvcQeineIKE/m4DN3+LUL+KhB1K9H6Sl88l
qyKjmEg+JY9LfsRiliqsLdav9fjnC8q7m6A5M+uujMcLqkjj1gDu0l9BcBPssLRo
rIf6XVyzXqwV6P4VJ4het2O5pRhdX5ArXDgMgQdxSZH2M4X1z0OqaZQ7e/g1G9vG
rE23tLONg3cCiqE2NLpu1Ym2EE34dcw3rzuZTJIq0Jayzpp6kkH76XTekKFuZ2Du
8xCljAXFHlRk1tBFrO6h1XzHN4RuvqXDpSAOSRjxRh6l8STtSOM=
=P8B2
-----END PGP SIGNATURE-----

--Bd2KlmcTHfsQFEJ+--

--===============6208344317974655413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6208344317974655413==--
