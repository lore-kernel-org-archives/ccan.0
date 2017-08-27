From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] darray: Evaluate the index parameter only
 once in darray_remove()
Date: Sun, 27 Aug 2017 12:58:53 +1000
Message-ID: <20170827025853.GO2772@umbus.fritz.box>
References: <20170826162652.16072-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4843319083193703645=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xg03v5d2ZzDqfh
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 12:59:23 +1000 (AEST)
In-Reply-To: <20170826162652.16072-1-damien@grassart.com>
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


--===============4843319083193703645==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx/LfW4V5TfZLeq7"
Content-Disposition: inline


--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2017 at 06:26:52PM +0200, Damien Grassart wrote:
> To be consistent with the rest of the code, the index paramater should
> not be evaluated multiple times. Calling this with rand() % arr.size
> would otherwise generally segfault.
> ---
>  ccan/darray/darray.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Looks like a definite improvement, but I need a Signed-off-by line in
order to apply it.

Also.. identifiers starting with _ are technically reserved for system
use.  You'd probably get away with it, but it's best to avoid them.  I
usually put _ after the name instead for this sort of thing.

>=20
> diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> index 8d47645b..6dd34f08 100644
> --- a/ccan/darray/darray.h
> +++ b/ccan/darray/darray.h
> @@ -224,8 +224,9 @@ typedef darray(unsigned long)  darray_ulong;
>  #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NULL)
>  /* Warning, slow: Requires copying all elements after removed item. */
>  #define darray_remove(arr, index) do { \
> -	if (index < arr.size-1)    \
> -		memmove(&(arr).item[index], &(arr).item[index+1], ((arr).size-1-index)=
*sizeof(*(arr).item)); \
> +	size_t __index =3D index; \
> +	if (__index < arr.size-1)    \
> +		memmove(&(arr).item[__index], &(arr).item[__index+1], ((arr).size-1-__=
index)*sizeof(*(arr).item)); \
>  	(arr).size--;  \
>  	} while(0)
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmiNW0ACgkQbDjKyiDZ
s5LXmQ//e5ZZb9cbjOOL5qgjHoyH9sOu+oNe8raRYGJomhF2pcHMmCoC7A4foyYQ
5FM07zHF7czxAPxeaEA42URGCMtj/4sMdVJfGrij4i+4CfawLVsYTI/9cwfm27XN
YKXAqnztuk06VsTIrhO8wO31lyIj1oD+LiRb/QsDgJMu2N46V132Gw3Ig3UdnCwf
M27cfNH96Ec9FN/cfOAAbNl/7lxJy6S6IcIjayt4m6zk+jr4oEOzLWe6umfg9mwH
EuqosKpnF7JC8wv303phx2KsN4gNIKI2+hzJh1XEek6subiOP/AYrIeS/xjZ7mq2
2Wcj2qEkzhYIR9saR2rF+8PAp4KU+KAH8KAXlsVcswuOyTzn05y6KNuPcSsmBxHd
o2Q5PhqawDfKM7Mva9zhAIwVuHC9ezLYVABLvsa1IoPO7xnOWUDdKAtWTkijpiIF
HgLdpGjRNMHBS1krvZYdSinDEUR+apCynX5RXkCixv4gLSZmb51WletM+qJ1dPye
naWXKViZdQiiL3YcOPV1Vv5aaZfzezIQxZKMAFEO45nDRAHBR9Cm0o4c2E9ma/N1
fo7u1z0DYiFsXWY91YdC5zh5ZnZeNjrYYnPUuztsZIOh3UUZI4Rz2w98MVPV5Q8S
r926V+iLHd6KLDgHjWw+Ghs5oY05LPGpH6XBg1T+0UEfm9jE2Jw=
=pdfG
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--

--===============4843319083193703645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4843319083193703645==--
