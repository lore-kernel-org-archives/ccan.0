From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/2] darray: Fix bug in the darray_remove() macro
Date: Sun, 27 Aug 2017 12:56:42 +1000
Message-ID: <20170827025642.GN2772@umbus.fritz.box>
References: <20170826162620.15989-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5789696812138194193=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xg03v5Y3DzDqZx
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 12:59:23 +1000 (AEST)
In-Reply-To: <20170826162620.15989-1-damien@grassart.com>
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


--===============5789696812138194193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fwXp2o0gOrkU5lS"
Content-Disposition: inline


--7fwXp2o0gOrkU5lS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2017 at 06:26:20PM +0200, Damien Grassart wrote:
> The memmove() call should be using the index argument to determine the
> number of bytes to copy.
>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>

No question that was a bug.  Fix applied.

Note for a possible future cleanup: calling identifiers 'index' is
usually a bad idea, because it shadows index(3) in the C library,
which means you can get really confusing errors (or lack of errors) if
you remove the declaration but not the users.

> ---
>  ccan/darray/darray.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index 75112419..8d47645b 100644
> --- a/ccan/darray/darray.h
> +++ b/ccan/darray/darray.h
> @@ -225,7 +225,7 @@ typedef darray(unsigned long)  darray_ulong;
>  /* Warning, slow: Requires copying all elements after removed item. */
>  #define darray_remove(arr, index) do { \
>  	if (index < arr.size-1)    \
> -		memmove(&(arr).item[index], &(arr).item[index+1], ((arr).size-1-i)*siz=
eof(*(arr).item)); \
> +		memmove(&(arr).item[index], &(arr).item[index+1], ((arr).size-1-index)=
*sizeof(*(arr).item)); \
>  	(arr).size--;  \
>  	} while(0)
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7fwXp2o0gOrkU5lS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmiNOgACgkQbDjKyiDZ
s5JtZw/+I/+SzLAdvrWbSXFUI6mVR7DTgzjkFUCHB7LyZSKbVqBngLI1Iri6tMRO
uV2H93XS61qbTMCtwTMv/8ux3PeQCWRnTX0fwHBiFmL+uszQkz+Gvv/ErNLUlevB
3bAd+6/L06G1E/kw95VRjZYvAZoYC0IB+O5WGBABV6pqYeEhSbSkgrLkVyVpB6Al
qLtzEUFUoSAhfLhD5r4EgL8kDiFANG/xDlGr5uTzpqQqqiNnvA9MvwTMln0bdBm6
EMKlkQeBn2cw4ah9ldMdq2vI4DwmIdPXL0yn8FyakWTy68bXRfvRGbdSfTfGV/3H
cyO7ZY2JAhTgsvJIEuI8iOBiLj4Gxer3iVNT0FG8Ki28a9m7VKstseeWrVM1opI8
81EtTXdefX/6OVZ+QkXJMPRv2JT1mUo3bnIYtgeISOMEdx5oTMetlJLX0CVlPjkC
1t9iY15fnghOISTgmX4lZdsbqh6vlsqzj1A2ZLkpBge+Ysie56Cplc/mZKTcoyig
bkSKOIUhQoLVhmoaJFrTK0YSK9vgdDN6yF1H3PmWFxdf7X5zI9L64l7PdQOG1Xzu
bV9au6wUI9jC5wha+D5fuRuwLKnnsDCFqp0fEVg9uTzd2d4zVKt4jgPHh2yWb/tf
8YJDRZHp7JOpyYLSXOep1auso1azMa7wR3NNHBNxXk7Yy4glVUU=
=qaB3
-----END PGP SIGNATURE-----

--7fwXp2o0gOrkU5lS--

--===============5789696812138194193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5789696812138194193==--
