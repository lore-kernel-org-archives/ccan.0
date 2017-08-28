From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] darray: Fix bug in the darray_remove() macro
Date: Mon, 28 Aug 2017 12:48:41 +1000
Message-ID: <20170828024841.GC2578@umbus.fritz.box>
References: <20170827025642.GN2772@umbus.fritz.box>
 <20170827212624.14673-1-damien@grassart.com>
 <20170827212624.14673-2-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7711354696845264212=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgdJx53t4zDqMX
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 13:57:53 +1000 (AEST)
In-Reply-To: <20170827212624.14673-2-damien@grassart.com>
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


--===============7711354696845264212==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2017 at 11:26:24PM +0200, Damien Grassart wrote:
> The memmove() call should be using the index argument to determine the
> number of bytes to copy. To be consistent with the rest of the code,
> we should also not evaluate the index parameter multiple
> times. Calling this with rand() % arr.size would otherwise generally
> segfault.
>=20
> Finally, we want to avoid using "index" as an identifier so as to not
> shadow index(3) in the C library.
>=20
> Signed-off-by: Damien Grassart <damien@grassart.com>

This breaks compile for me, though I can't quickly see why.

$ make
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmis=
sing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCC=
AN_STR_DEBUG=3D1 -I.  -MMD -MP -MFccan/strgrp/strgrp.o.d -MTccan/strgrp/str=
grp.o -c ccan/strgrp/strgrp.c -o ccan/strgrp/strgrp.o
In file included from ccan/strgrp/strgrp.c:26:0:
=2E/ccan/darray/darray.h:235:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98if=E2=80=99
  if (index_ < arr.size-1)    \
  ^~
=2E/ccan/darray/darray.h:237:7: error: expected =E2=80=98=3D=E2=80=99, =E2=
=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__=
attribute__=E2=80=99 before =E2=80=98.=E2=80=99 token
  (arr).size--;  \
       ^
=2E/ccan/darray/darray.h:238:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98}=E2=80=99 token
  } while(0)
  ^
=2E/ccan/darray/darray.h:238:4: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98while=E2=80=99
  } while(0)
    ^~~~~

I also noticed that both this and the earlier patches use:
	size_t index_ =3D i;
in the macro, without parentheses around the 'i' macro paramater.
That's not the cause of the error above, but it's not good practice as
a rule.

So, I've backed out these darray patches for now.  Can you debug the
compile problem above and resend the whole lot as a single series.

> ---
>  ccan/darray/darray.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index 82726c05..6787f14c 100644
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
> +		size_t index_ =3D i; \
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
> +	size_t index_ =3D i;
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

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmjhIkACgkQbDjKyiDZ
s5LGYBAAgTgm4vgnTVeQu3jQ9SST0zTbE26mCf7g9Arh6NfIrhIiyVxOg1EmXmwY
d982ElF8wYpg82B6HQDbLwRW8SjCxKjFA5FuR5J5CtutfpTbB3UYyn0o6SlzFip3
CD/2yr+eG70rsJNm3dbvUehZlvEyXdP+obcuHOCONx0Dk7uDz0iOR582QBPvQrkS
9BXCzqqW8rQKne8o2tkDJxZ3XxrqwC0KJPqlxIrPHgpu1XL1ADBZHfGIQtRV+1uo
P0YzVtFhqviTCcy58/boBRQycorVYlWiyg55adydDT2r2o6qYzZmNZtSfLAM+Y92
qJagfVPHUscKtMxL2tEq1BULaGch3AIP/grBp7lhm8moFLe8BRFxuAxf+H92ysHl
B7z9N6C8+HqgLRMlJ8ki9PElcsPODYEomzqg7FqyrBUFB9qMXGbDdON3cLMzVFn3
z/rvG1Jx77XH08e9j5j5nkagUxZU6d+3spTuzvlLdrMbCZIX3vkBXP3bTf+lKoX4
4an2FKM9e/G15LWkUqFEEZ/K0yQXiNZ0J10bHlPqScVr1MxIGuTzFNQEyMy1jhG6
803nzgUcIouwtDvfGK4xdP77sh5VpA9OO6+nJhAPjjiTmkCq83BpOh8fzqESSlq3
b04bSrK/3idfD/59wMXGm9K24XGyW48ZKGf5FQuZQSl1nWwynV4=
=vHpB
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--

--===============7711354696845264212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7711354696845264212==--
