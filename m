From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] darray: Add darray_insert() to insert a value at
 a specified index
Date: Mon, 28 Aug 2017 12:42:00 +1000
Message-ID: <20170828024200.GA2578@umbus.fritz.box>
References: <20170827025918.GP2772@umbus.fritz.box>
 <20170827194057.10533-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7420094683001619340=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgdJx4jvLzDqM1
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 13:57:53 +1000 (AEST)
In-Reply-To: <20170827194057.10533-1-damien@grassart.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Damien Grassart <damien@grassart.com>, '@umbus.fritz.box
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============7420094683001619340==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2017 at 09:40:57PM +0200, Damien Grassart wrote:
> This module currently supports removing but not inserting at a
> specified index, so this adds that along with some tests. Inserting a
> value moves all existing data beyond index over one element.
>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>

Applied, thanks.

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

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmjgvUACgkQbDjKyiDZ
s5JLsw/8C2iICLk9KFwnfyELmZxkEr5nI0vgyJw5C9VN+cKC8FOkI4+JAZmyDUNo
ZwGd/WoX3VrJyvX2ZxpDCUNFH5jmfgFA1nX4nc+9e3J4CyNp0sawoXJQoNA7BjdQ
2iWPphUfug5f1TLvEgxQDG7519/xxAk/Orgr8wZadztBnsqN79Q5bJzhNWxdoDFx
JTL66PiZzTItWaVw4grikQVSyA3eUsBbPyW7yOGwD2bpQ91KrmrGm2xujC2MY+2u
htm7W/0yrCCknLvtU3Kug8qJF5QF0efduTxjgMmPRpr/8X6OsxLbo1bMvSL8TqaD
DP2aVxIRA9o7gzb6CwiVpta27XhtQtLmlds6kzJlTrWZUVba1LWxPpqitmGcvgta
lIXhLXoEGQHnJSbIKcxL1kzHiRQSHIHUZqVwvjUawc0Q8kOddcKsumFUdxt2Jnor
jX6XQGLHKNOWDFGIW1S4Pw1eRSXZULNpGS9cqb/E4oXHDajz4AfB3tdq8C5THXti
VrZwEnd2JOPryEOuFTjX5L8WZXehVSmLnW/oxBbgcrgTB5a33+C6FkweUTsKo0cz
w9cr+aKQzVp4qBP9r4VKiJc3HRp7OlVzCTKDlAnJ2GV24OzAevTLAhRoe7W5zOOc
ykaFZOXgY6ivk92it9Szam6AS6pOKTjrg/csKvmny+PTJky7WXo=
=dHaT
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============7420094683001619340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7420094683001619340==--
