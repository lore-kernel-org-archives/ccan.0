From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] fix misuse of typesafe_cb_cast() in example
Date: Wed, 14 Mar 2018 15:54:28 +1100
Message-ID: <20180314045428.GG4182@umbus.fritz.box>
References: <20180314031641.GB6951@HP>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5657772077710758748=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401KbX1Js8zF0pl
 for <ccan@lists.ozlabs.org>; Wed, 14 Mar 2018 16:12:24 +1100 (AEDT)
In-Reply-To: <20180314031641.GB6951@HP>
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


--===============5657772077710758748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 11:16:42AM +0800, Yubin Ruan wrote:
> From 32f86c701ab0e0ad0ad6981314a9bff2dc5ebb74 Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Wed, 14 Mar 2018 11:14:54 +0800
> Subject: [PATCH] fix misuse of typesafe_cb_cast() in example
>=20
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>

Applied, thanks.

> ---
>  ccan/typesafe_cb/typesafe_cb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ccan/typesafe_cb/typesafe_cb.h b/ccan/typesafe_cb/typesafe_c=
b.h
> index 942d5c2..126d325 100644
> --- a/ccan/typesafe_cb/typesafe_cb.h
> +++ b/ccan/typesafe_cb/typesafe_cb.h
> @@ -27,7 +27,7 @@
>   *	// We can take either an unsigned long or a void *.
>   *	void _set_some_value(void *val);
>   *	#define set_some_value(e)			\
> - *		_set_some_value(typesafe_cb_cast(void *, (e), unsigned long))
> + *		_set_some_value(typesafe_cb_cast(void *, unsigned long, (e)))
>   */
>  #define typesafe_cb_cast(desttype, oktype, expr)			\
>  	__builtin_choose_expr(						\

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqoqwQACgkQbDjKyiDZ
s5JBFxAAxW2fOE3LQubNOH6+G23mlKXb8hIIfY/8t2ElzR8CCI66kC+b223Rr3nW
Uzo1ARJ7I8rIcdQwDuFsj3LCEv6OhOwgVC0r3jgSR/U6zk53xQG7SHlpe4tbZPgs
f7Z67qtOcEe6NsWXkUC701ys0ubtXSwO2U7zDG29BSfYKnuJungQBRRFjb2LGzI9
9DJ8LI0bNtqVrKZuaMVr9scjkaCnVZnm69uP+eoFsbyJlPlqjORGlKwYAofB3bzt
DzEtkK7My81B53vQrtzaazicZeGpTKmVD48QoiwkmruLN3i5RYo0lya+ozyhWLTe
RwVIhnIjGOJ2vbLL28vK59Hw8Pmz//E1wZ0BaOiF2jw/cFkRTh9xpaxW7v+1lYD1
H+ge5hJfFQiofQWamvqkQcYURVaDFdHHOfIQ3mgmiQY9DYbqz44teQQ2kDy8qi4R
Qjg9/SbOjw87U2sq7yjHIJ41gDK4I01SVOHy1xfJQYMHfHHBx1mwdJvx015nA9o8
R9PWuCiULdclk7Tz7iaTBllUuY/16/0r5QQ3DzW1PGxoAMLG2FCXHRifPN/srirb
S8dXWz+4i0fwlhUrBilwdMgn8Z8HfHSZccdd76A7ttnUZzgI+bT/gIpSkxOkzAsV
zir9SEf5kag+zJ4hpyHXT6+0rc1V/yoDhD3u1QWxbopbuF9Iqhs=
=LYa+
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--

--===============5657772077710758748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5657772077710758748==--
