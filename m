From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/3] darray: Add darray_insert() to insert a
 value at a specified index
Date: Tue, 29 Aug 2017 23:04:21 +1000
Message-ID: <20170829130421.GQ2578@umbus.fritz.box>
References: <20170829100842.25077-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7586481518008054270=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhTTk1PDFzDqnQ
 for <ccan@lists.ozlabs.org>; Tue, 29 Aug 2017 23:08:26 +1000 (AEST)
In-Reply-To: <20170829100842.25077-1-damien@grassart.com>
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


--===============7586481518008054270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1LW0Rr0Uq98qh6Rv"
Content-Disposition: inline


--1LW0Rr0Uq98qh6Rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2017 at 12:08:40PM +0200, Damien Grassart wrote:
> This module currently supports removing but not inserting at a
> specified index, so this adds that along with some tests. Inserting a
> value moves all existing data beyond index over one element.
>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>

Series applied, thanks.

> ---
>  ccan/darray/darray.h   |  7 +++++++
>  ccan/darray/test/run.c | 22 ++++++++++++++++++++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
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
> diff --git a/ccan/darray/test/run.c b/ccan/darray/test/run.c
> index 3d96fa56..5888af60 100644
> --- a/ccan/darray/test/run.c
> +++ b/ccan/darray/test/run.c
> @@ -38,7 +38,7 @@ int main(void) {
>  	trace("Generating amalgams (internal)");
>  	generateAmalgams();
>  =09
> -	plan_tests(41);
> +	plan_tests(47);
>  =09
>  	testLits();
>  =09
> @@ -70,7 +70,25 @@ int main(void) {
>  		ok1(darray_size(arr) =3D=3D 0);
>  	}
>  	reset(arr);
> -=09
> +
> +	testing(darray_insert);
> +	{
> +		size_t middle_i;
> +
> +		for (i=3D0; i < ARRAY_SIZE(lotsOfNumbers); i++)
> +			darray_insert(arr, i, lotsOfNumbers[i]);
> +		ok1(darray_size(arr) =3D=3D ARRAY_SIZE(lotsOfNumbers));
> +		ok1(darray_alloc(arr) >=3D darray_size(arr));
> +		ok1(!memcmp(arr.item, lotsOfNumbers, sizeof(lotsOfNumbers)));
> +
> +		middle_i =3D ARRAY_SIZE(lotsOfNumbers) / 2;
> +		darray_insert(arr, middle_i, 42);
> +		ok1(darray_size(arr) =3D=3D ARRAY_SIZE(lotsOfNumbers) + 1);
> +		ok1(arr.item[middle_i] =3D=3D 42);
> +		ok1(arr.item[middle_i + 1] =3D=3D lotsOfNumbers[middle_i]);
> +	}
> +	reset(arr);
> +
>  	testing(darray_from_c, darray_foreach, darray_foreach_reverse);
>  	{
>  		long   *i;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1LW0Rr0Uq98qh6Rv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmlZlMACgkQbDjKyiDZ
s5LUsBAA05JhLRv6Sm3aSAEjRXxtG/fnxtfN1f5FR8F1+aNsZwatsHtDazuYXCyV
FauMuerKNGsiusRhDu0E11lQDHUXKTsul02WNit4FKaqh1tmqeGtxM4VJEvjkJTo
+t7FhdyQ9jilra7MrvLm+YzN9ESpHGVgmiBxB5A3oq2F/VxOk7mVftuYeCAZ2coQ
knUG5A8XPh8lAmdo2Tycb9UcrZUYubwqLt65GSFoYN5H3HuC4L+t+MbPkXHsOBOx
35YsPwufIcKiX1pqcJ5COBQ7IsslEKkbrT+E5oRKyYZGw+Q8jg5iR4Ad7OeWW/AX
ezQSBg57pHaVeWyK0OnpbVEi9yh492ewS7lCVDvrx7JTE25uVeJiSjaRXsOB4EiN
/y1hHa8Wa3U2gaBv6EQS/gu4FrazMfGcy3euTgxzFq9jAn3MsUWiIIqEmUgCG/Z8
hfb50f9j7KPY8JeC/EmK+oTrtb0SwrCQ7rC9tZ0RhPQEUHxp9ZIp+xJT6OMPI1Yf
XxkyDRNiNAgmi3Lj560BK3Rwx/nV4i4bBVzEdGmXgYd70savDEBvyTBsTda0hLc+
y+Rv/2xzG+PHN+VDfhDy/6t7yDe9X+tqecdE2QSLkQundKKUNPl+pu2yK7Gv/RTY
N/QPqmpIm4nT0X8Nnk2sSpQwog8w8xEZFnD19jq99N9AP4UWScc=
=0qqH
-----END PGP SIGNATURE-----

--1LW0Rr0Uq98qh6Rv--

--===============7586481518008054270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7586481518008054270==--
