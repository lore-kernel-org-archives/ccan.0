From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: why add the result of check_type in container_of
Date: Wed, 14 Mar 2018 12:18:49 +1100
Message-ID: <20180314011849.GF4182@umbus.fritz.box>
References: <20180312031939.GA29780@HP>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4800548537815480589=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401DQ82wFtzF11w
 for <ccan@lists.ozlabs.org>; Wed, 14 Mar 2018 12:18:56 +1100 (AEDT)
In-Reply-To: <20180312031939.GA29780@HP>
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


--===============4800548537815480589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 11:19:39AM +0800, Yubin Ruan wrote:
> Hi,
>=20
> I notice that in the implementation of container_of(), the resulting poin=
ter
> will be advanced by 1 if types mismatch:
>=20
> #define container_of(member_ptr, containing_type, member)   \
> 	 ((containing_type *)                                   \
> 	  ((char *)(member_ptr)                                 \
> 	   - container_off(containing_type, member))            \
> 	  + check_types_match(*(member_ptr), ((containing_type *)0)->member))
>=20
> where check_types_match() is defined as=20
>=20
> #define check_types_match(expr1, expr2)		\
> 	((typeof(expr1) *)0 !=3D (typeof(expr2) *)0)
>=20
> which will return 1 if types mismatch.

No.. it won't, it will have a type error.  That's not typeof(x) =3D=3D
typeof(y), which isn't valid C (or gcc) in any case.  It's checking if
NULL (0) cast to the first pointer type equals NULL cast to the second
pointer type.  If the types mismatch, there will be a type error.
=20
> IMO, advancing the wrong pointer (resulting from mismatch types) by 1 will
> only make things worse, and users usually only get garbage results and wi=
ll not
> be aware of the type-mismatch bug. Wouldn't it be better to throw an buil=
ding
> error/warning for that?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqoeHgACgkQbDjKyiDZ
s5LsBQ/5AQd2GKhO2TOHViCR+x9JGIzxyfsMKYXqH3EHZnBI4Pxn8c1gvwolWJJn
jKphIrFhUYIKUx14En0hL2OxvJDDM34CABKT+BLo4wvRqEuOG7LGGNSylZ9JShg/
caYzaz4e6dJnKDa6OYzXalPhQwcLaH0FfBoqXUkHdGDKhxlIxZyH1N9jgpQy7+Fv
2V+hohdG5gM1qv0mBm9p4pYPfE0WlDqyl3gsdywUnuZVHizj+ePY1EcxiAzDZbeK
tTT2+ozqikdxXEe+UBwIdaw7wEdn2lLWtUQ+2AKR4Iw/BdyH6uO/mJLsqf2i8Ha+
kGyqlBPWYG1u6RR6TSEU+ZW8+ORrkKyaciSOW8Kyb/f+iNLHx3i6y35b6yoKIzXl
/3sjK1/bLT9LIl5oEtVSXn70uV/4TrcVRQIMOVmPMibea3U9tqtolK3LIjpi5Rqp
q/zRVIMR5o8Gb2U5Fniq9gcbvIupS481gPXKZTu/vieVicX0RCHdC5IaF/6Mniy3
akgoG145Kc6Qxvj6fuNRz97U8aDu2Vl21bZ5tqsOzFJov3RmSq4axhquOKVSBqEy
B7+jw4A69YQqDpV1sB8Wwzi2hzRGvooSkRMoZssCuh2Rxij2TNjuXmUw0EiQ81cU
nxGZ6RIQ48qmy1L005KgZoso+4dnwR/4TEcEV62u940talEo5IQ=
=CbhF
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--

--===============4800548537815480589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4800548537815480589==--
