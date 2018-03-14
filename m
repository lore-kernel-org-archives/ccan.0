From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] fix misspelling in the example of container_of
Date: Wed, 14 Mar 2018 12:16:45 +1100
Message-ID: <20180314011645.GE4182@umbus.fritz.box>
References: <20180312032414.GA30245@HP>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1772948801788405933=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401DQ81Vk8zF0vW
 for <ccan@lists.ozlabs.org>; Wed, 14 Mar 2018 12:18:56 +1100 (AEDT)
In-Reply-To: <20180312032414.GA30245@HP>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============1772948801788405933==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 11:24:14AM +0800, Yubin Ruan wrote:
> From 47c92fe951545e780ca31c598bbcbe5347059b27 Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Mon, 12 Mar 2018 11:22:35 +0800
> Subject: [PATCH] fix misspelling in the example of container_of
>=20
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>

Applied, thanks.

> ---
>  ccan/check_type/check_type.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ccan/check_type/check_type.h b/ccan/check_type/check_type.h
> index 77501a9..837aef7 100644
> --- a/ccan/check_type/check_type.h
> +++ b/ccan/check_type/check_type.h
> @@ -43,7 +43,7 @@
>   *	#define container_of(mbr_ptr, encl_type, mbr)			\
>   *		(check_types_match((mbr_ptr), &((encl_type *)0)->mbr),	\
>   *		 ((encl_type *)						\
> - *		  ((char *)(mbr_ptr) - offsetof(enclosing_type, mbr))))
> + *		  ((char *)(mbr_ptr) - offsetof(encl_type, mbr))))
>   */
>  #if HAVE_TYPEOF
>  #define check_type(expr, type)			\

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqod/0ACgkQbDjKyiDZ
s5KnfQ//Yh+Y7a10fNhCE5x+q9ubA1kuPKGEsq0w9sN9X7Rx1FzyeRmOR2OIHK+p
guZxFPohklbQldOb0t76RdWSAWGpe03HuM1Cg8salbt794YzXwK0Dx8zBQFsW/s6
61POTs9QoPfMtWBzPjGiHzZ3lU3ly9tHnQXn4bs7DiIz9uz2efsV6tLitU8PNSRb
DIGL+Pdi0mVaojrzmzvvjcwi7O57ZHNz2AiAWIYIGvxlYL5sE4CSCAlN6G+JeTJC
th0a6nwL54d3qFi1S5jnU7fN/YZH+LUtHoZxrbNX2jiRoE8Sq7qw8rYsmDiLTXGg
j7ukRpclxForqhyEXviq84L7bdFl5FzCVnnuSt2dUEgl97Zdtau/OPNrPK2aftSb
Lh5Oi9w8vluq7YHeeWbCdP6bKpeRICqD9a7L4Wu1cmt+alR0Z9DGdgaeuafyEwv6
ipAYmUILbCDNVJ7GzSc0+lvOj49OHWT9H+KlUo+QWJBafY2U0fChkcSuOK8+vQ54
jLgtQrhfKAxXzom0TsXvYEw6Fk1V57j/A5GEcHD6Acm92DjoXtJOx9h9jwg9oH3o
krgerxJxWwcTwU3bDdc385Kg0rEBJ+wcC/zWgHfCrWhObg8cQQE8Wy3mtM/TUsLd
+wvaKDA2dyRxep89DrKYx0uM1rjMUHv9rX+UYdF6ZUx0yTEohBo=
=Cg+o
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--

--===============1772948801788405933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1772948801788405933==--
