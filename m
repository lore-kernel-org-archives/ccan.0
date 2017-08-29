From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] darray: Fix bug in the darray_remove() macro
Date: Tue, 29 Aug 2017 14:54:55 +1000
Message-ID: <20170829045455.GF2578@umbus.fritz.box>
References: <20170828024841.GC2578@umbus.fritz.box>
 <20170828050935.16047-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5570880955365751113=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhHVh2djbzDqNY
 for <ccan@lists.ozlabs.org>; Tue, 29 Aug 2017 15:38:36 +1000 (AEST)
In-Reply-To: <20170828050935.16047-1-damien@grassart.com>
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


--===============5570880955365751113==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2017 at 07:09:35AM +0200, Damien Grassart wrote:
> The memmove() call should be using the index argument to determine the
> number of bytes to copy. To be consistent with the rest of the code,
> we should also not evaluate the index parameter multiple
> times. Calling this with rand() % arr.size would otherwise generally
> segfault.
>=20
> Finally, we want to avoid using "index" as an identifier so as to not
> shadow index(3) in the C library.

Uh.. sorry, I think we're in a state of confusion because applied some
of the patches then removed them again due to problems discovered
later.

Can you please rebase on the latest ccan tree and send me the whole
set of patches as a batch.

>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>
> ---
>  ccan/darray/darray.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index 82726c05..58470fde 100644
> --- a/ccan/darray/darray.h
> +++ b/ccan/darray/darray.h
> @@ -170,8 +170,8 @@ typedef darray(unsigned long)  darray_ulong;
>  		memmove((arr).item+1, (arr).item, ((arr).size-1)*sizeof(*(arr).item));=
 \
>  		(arr).item[0] =3D (__VA_ARGS__); \
>  	} while(0)
> -#define darray_insert(arr, index, ...) do { \
> -		size_t index_ =3D index; \
> +#define darray_insert(arr, i, ...) do { \
> +		size_t index_ =3D (i); \
>  		darray_resize(arr, (arr).size+1); \
>  		memmove((arr).item+index_+1, (arr).item+index_, ((arr).size-index_-1)*=
sizeof(*(arr).item)); \
>  		(arr).item[index_] =3D (__VA_ARGS__); \
> @@ -230,9 +230,10 @@ typedef darray(unsigned long)  darray_ulong;
>  #define darray_pop(arr) ((arr).item[--(arr).size])
>  #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NULL)
>  /* Warning, slow: Requires copying all elements after removed item. */
> -#define darray_remove(arr, index) do { \
> -	if (index < arr.size-1)    \
> -		memmove(&(arr).item[index], &(arr).item[index+1], ((arr).size-1-i)*siz=
eof(*(arr).item)); \
> +#define darray_remove(arr, i) do { \
> +	size_t index_ =3D (i); \
> +	if (index_ < arr.size-1)    \
> +		memmove(&(arr).item[index_], &(arr).item[index_+1], ((arr).size-1-inde=
x_)*sizeof(*(arr).item)); \
>  	(arr).size--;  \
>  	} while(0)
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmk850ACgkQbDjKyiDZ
s5L/Ug//Tn480GDpDTxiBAICpY4CUor1W0SdN+ktU6aftEEToOyrJdw2AfFDrXTs
Cjpt3h2VOFUwud7F85HUGiaP/oVQFBkRioVkgEBWbtauZ7FTSYBCL93SCE1vsg43
dcVW4Wsfg+/OW5kL56fZSTM873fyQQ4gdiVUmOYJHxNmojpstPwh2EmJGM4abhkL
s2nfYqIUZutNzfU+OLcKN3yrxnYq84XAC2A2zQ11gV8AE/s+/EdA1xpgm5lnzlyL
7hwNMtx+gupB10F2cSNeqm4R47sj54P7OBDNl5+WYeEVt+BwQQliT5uZK2f3v9Oq
Pnbv6xd57IxuO7djbpYSUfEsvU/Gf1MmVaUjIfDZ7hGYATNvpbhjRNw1ER4NuP1D
HM424dlijO+GenO9Q9taDxl5+dS877aFDkuy3Uwe+DFbtCjztZxlj20aWWudyzE8
M7MAPM4lWrKKpg+BU9ngSqosCJ0Y/0VgSkMHcuZOV2IJfmqaNWdJRYb65LF40C3h
AQ75uCvxyw1kPK4yRMa9IPbYIQuwykBnSMSO/cvG0xY/YYYTUN9gR5oDiiTKmVUy
U18GAMJPMg7lA8OqqAMJhcFCKlX1RJYuf7vG3t3CIS7+ZqBZwuF7Xn0ZAGRpPoZ0
6ouA1d0pYE4LwF1YJvBaBgtCEAeRvkXs1D20Z0CrjfO0XkTuyZA=
=tz6L
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--

--===============5570880955365751113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5570880955365751113==--
