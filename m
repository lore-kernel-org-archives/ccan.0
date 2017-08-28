From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/2] darray: Rename identifiers starting with an
 underscore
Date: Mon, 28 Aug 2017 12:43:13 +1000
Message-ID: <20170828024313.GB2578@umbus.fritz.box>
References: <20170827025642.GN2772@umbus.fritz.box>
 <20170827212624.14673-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833380766443615881=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgdJx5nqPzDqMY
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 13:57:53 +1000 (AEST)
In-Reply-To: <20170827212624.14673-1-damien@grassart.com>
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


--===============0833380766443615881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2017 at 11:26:23PM +0200, Damien Grassart wrote:
> Identifiers starting with underscores are technically reserved for
> system use, so rename all of them to end with one instead.
>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>

Applied, thanks.

> ---
>  ccan/darray/darray.h | 68 ++++++++++++++++++++++++++--------------------=
------
>  1 file changed, 34 insertions(+), 34 deletions(-)
>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index fca20b8a..82726c05 100644
> --- a/ccan/darray/darray.h
> +++ b/ccan/darray/darray.h
> @@ -171,10 +171,10 @@ typedef darray(unsigned long)  darray_ulong;
>  		(arr).item[0] =3D (__VA_ARGS__); \
>  	} while(0)
>  #define darray_insert(arr, index, ...) do { \
> -		size_t __index =3D index; \
> +		size_t index_ =3D index; \
>  		darray_resize(arr, (arr).size+1); \
> -		memmove((arr).item+__index+1, (arr).item+__index, ((arr).size-__index-=
1)*sizeof(*(arr).item)); \
> -		(arr).item[__index] =3D (__VA_ARGS__); \
> +		memmove((arr).item+index_+1, (arr).item+index_, ((arr).size-index_-1)*=
sizeof(*(arr).item)); \
> +		(arr).item[index_] =3D (__VA_ARGS__); \
>  	} while(0)
>  #define darray_push(arr, ...) darray_append(arr, __VA_ARGS__)
> =20
> @@ -182,30 +182,30 @@ typedef darray(unsigned long)  darray_ulong;
>  /*** Insertion (multiple items) ***/
> =20
>  #define darray_append_items(arr, items, count) do { \
> -		size_t __count =3D (count), __oldSize =3D (arr).size; \
> -		darray_resize(arr, __oldSize + __count); \
> -		memcpy((arr).item + __oldSize, items, __count * sizeof(*(arr).item)); \
> +		size_t count_ =3D (count), oldSize_ =3D (arr).size; \
> +		darray_resize(arr, oldSize_ + count_); \
> +		memcpy((arr).item + oldSize_, items, count_ * sizeof(*(arr).item)); \
>  	} while(0)
> =20
>  #define darray_prepend_items(arr, items, count) do { \
> -		size_t __count =3D (count), __oldSize =3D (arr).size; \
> -		darray_resize(arr, __count + __oldSize); \
> -		memmove((arr).item + __count, (arr).item, __oldSize * sizeof(*(arr).it=
em)); \
> -		memcpy((arr).item, items, __count * sizeof(*(arr).item)); \
> +		size_t count_ =3D (count), oldSize_ =3D (arr).size; \
> +		darray_resize(arr, count_ + oldSize_); \
> +		memmove((arr).item + count_, (arr).item, oldSize_ * sizeof(*(arr).item=
)); \
> +		memcpy((arr).item, items, count_ * sizeof(*(arr).item)); \
>  	} while(0)
> =20
>  #define darray_append_items_nullterminate(arr, items, count) do { \
> -		size_t __count =3D (count), __oldSize =3D (arr).size; \
> -		darray_resize(arr, __oldSize + __count + 1); \
> -		memcpy((arr).item + __oldSize, items, __count * sizeof(*(arr).item)); \
> +		size_t count_ =3D (count), oldSize_ =3D (arr).size; \
> +		darray_resize(arr, oldSize_ + count_ + 1); \
> +		memcpy((arr).item + oldSize_, items, count_ * sizeof(*(arr).item)); \
>  		(arr).item[--(arr).size] =3D 0; \
>  	} while(0)
> =20
>  #define darray_prepend_items_nullterminate(arr, items, count) do { \
> -		size_t __count =3D (count), __oldSize =3D (arr).size; \
> -		darray_resize(arr, __count + __oldSize + 1); \
> -		memmove((arr).item + __count, (arr).item, __oldSize * sizeof(*(arr).it=
em)); \
> -		memcpy((arr).item, items, __count * sizeof(*(arr).item)); \
> +		size_t count_ =3D (count), oldSize_ =3D (arr).size; \
> +		darray_resize(arr, count_ + oldSize_ + 1); \
> +		memmove((arr).item + count_, (arr).item, oldSize_ * sizeof(*(arr).item=
)); \
> +		memcpy((arr).item, items, count_ * sizeof(*(arr).item)); \
>  		(arr).item[--(arr).size] =3D 0; \
>  	} while(0)
> =20
> @@ -215,12 +215,12 @@ typedef darray(unsigned long)  darray_ulong;
>  #endif
> =20
>  #define darray_appends_t(arr, type, ...) do { \
> -		type __src[] =3D {__VA_ARGS__}; \
> -		darray_append_items(arr, __src, sizeof(__src)/sizeof(*__src)); \
> +		type src_[] =3D {__VA_ARGS__}; \
> +		darray_append_items(arr, src_, sizeof(src_)/sizeof(*src_)); \
>  	} while(0)
>  #define darray_prepends_t(arr, type, ...) do { \
> -		type __src[] =3D {__VA_ARGS__}; \
> -		darray_prepend_items(arr, __src, sizeof(__src)/sizeof(*__src)); \
> +		type src_[] =3D {__VA_ARGS__}; \
> +		darray_prepend_items(arr, src_, sizeof(src_)/sizeof(*src_)); \
>  	} while(0)
> =20
> =20
> @@ -239,23 +239,23 @@ typedef darray(unsigned long)  darray_ulong;
> =20
>  /*** Replacement ***/
> =20
> -#define darray_from_items(arr, items, count) do {size_t __count =3D (cou=
nt); darray_resize(arr, __count); memcpy((arr).item, items, __count*sizeof(=
*(arr).item));} while(0)
> +#define darray_from_items(arr, items, count) do {size_t count_ =3D (coun=
t); darray_resize(arr, count_); memcpy((arr).item, items, count_*sizeof(*(a=
rr).item));} while(0)
>  #define darray_from_c(arr, c_array) darray_from_items(arr, c_array, size=
of(c_array)/sizeof(*(c_array)))
> =20
> =20
>  /*** String buffer ***/
> =20
> -#define darray_append_string(arr, str) do {const char *__str =3D (str); =
darray_append_items(arr, __str, strlen(__str)+1); (arr).size--;} while(0)
> +#define darray_append_string(arr, str) do {const char *str_ =3D (str); d=
array_append_items(arr, str_, strlen(str_)+1); (arr).size--;} while(0)
>  #define darray_append_lit(arr, stringLiteral) do {darray_append_items(ar=
r, stringLiteral, sizeof(stringLiteral)); (arr).size--;} while(0)
> =20
>  #define darray_prepend_string(arr, str) do { \
> -		const char *__str =3D (str); \
> -		darray_prepend_items_nullterminate(arr, __str, strlen(__str)); \
> +		const char *str_ =3D (str); \
> +		darray_prepend_items_nullterminate(arr, str_, strlen(str_)); \
>  	} while(0)
>  #define darray_prepend_lit(arr, stringLiteral) \
>  	darray_prepend_items_nullterminate(arr, stringLiteral, sizeof(stringLit=
eral) - 1)
> =20
> -#define darray_from_string(arr, str) do {const char *__str =3D (str); da=
rray_from_items(arr, __str, strlen(__str)+1); (arr).size--;} while(0)
> +#define darray_from_string(arr, str) do {const char *str_ =3D (str); dar=
ray_from_items(arr, str_, strlen(str_)+1); (arr).size--;} while(0)
>  #define darray_from_lit(arr, stringLiteral) do {darray_from_items(arr, s=
tringLiteral, sizeof(stringLiteral)); (arr).size--;} while(0)
> =20
> =20
> @@ -263,11 +263,11 @@ typedef darray(unsigned long)  darray_ulong;
> =20
>  #define darray_resize(arr, newSize) darray_growalloc(arr, (arr).size =3D=
 (newSize))
>  #define darray_resize0(arr, newSize) do { \
> -		size_t __oldSize =3D (arr).size, __newSize =3D (newSize); \
> -		(arr).size =3D __newSize; \
> -		if (__newSize > __oldSize) { \
> -			darray_growalloc(arr, __newSize); \
> -			memset(&(arr).item[__oldSize], 0, (__newSize - __oldSize) * sizeof(*(=
arr).item)); \
> +		size_t oldSize_ =3D (arr).size, newSize_ =3D (newSize); \
> +		(arr).size =3D newSize_; \
> +		if (newSize_ > oldSize_) { \
> +			darray_growalloc(arr, newSize_); \
> +			memset(&(arr).item[oldSize_], 0, (newSize_ - oldSize_) * sizeof(*(arr=
).item)); \
>  		} \
>  	} while(0)
> =20
> @@ -275,9 +275,9 @@ typedef darray(unsigned long)  darray_ulong;
>  		(arr).item =3D realloc((arr).item, ((arr).alloc =3D (newAlloc)) * size=
of(*(arr).item)); \
>  	} while(0)
>  #define darray_growalloc(arr, need) do { \
> -		size_t __need =3D (need); \
> -		if (__need > (arr).alloc) \
> -			darray_realloc(arr, darray_next_alloc((arr).alloc, __need)); \
> +		size_t need_ =3D (need); \
> +		if (need_ > (arr).alloc) \
> +			darray_realloc(arr, darray_next_alloc((arr).alloc, need_)); \
>  	} while(0)
> =20
>  #if HAVE_STATEMENT_EXPR=3D=3D1

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmjg0EACgkQbDjKyiDZ
s5J9ng/5AbFhVUiYT0uiGlvLjeFFCRaeqWxdOVgI9EPn1TIF7mkFAPwNey1oQ9j7
ac1hqolvSMBBSe1b8VyRTUIRQ7hfVB7g+/hRhEWUErxCl81IGnnP+fNKbU44c2yT
/SeTN37HGEj3jS2WyLj7xc03xVV0Zac/gwWN+BnrXFopv/hPrN4NQfMiJHyVdcH5
OlckK699Z4b2FGqzBtf9KrEaKUnG/T5y9pEaRV39F17J6MFOXKEQKF0zhPYlYXXM
Ru5a7rFLVzJbA3PIyO+Z1NeyutPus8HdkhtN8+n4Nzir2swjX0rVMzjCtfB+bVdE
S9IWhzYsmT1hyLuQVVmtKCj7PM1q9M+p+CL3cVSJSiK3CUSn6HdNSmBBWasCwDOy
RXRmE9aenCZKHC59E+j5sOCOWc+cBzePyv2pVzn8GnCphZyy/SIzViQkIIPYn/8t
3kOHAToG59xlwPZE1hKfMIMtea/e6oU9PTmsqH7Id7W8m+t8llKLNGFUQP8+txhi
Gj5Wj3rA3V4nvzOpFrmORTiD4gWvDyFzhjZmEKjJAbfKcjB/OclJeoh3hJ0a8c6p
q0a0TrR1WC8Zpf4fAQdS/HTkrXx3vKZ08jN3c8tEYWNAY7bdtHI5KQtcv/PO+Qz7
rzy0SNXFidZBFlImVtNeueZRpcUJ+LD7dPLqpg7kBn3yj2s2soo=
=iYYL
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--

--===============0833380766443615881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0833380766443615881==--
