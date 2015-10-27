From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCHv2 3/6] tcon: Encode integer values into "type"
	canaries
Date: Tue, 27 Oct 2015 17:17:13 +1100
Message-ID: <20151027061713.GA3701@voom.redhat.com>
References: <1445496459-2948-1-git-send-email-david@gibson.dropbear.id.au>
 <1445496459-2948-4-git-send-email-david@gibson.dropbear.id.au>
 <87si4xvwd1.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3199508305311018583=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 888051A045F
 for <ccan@lists.ozlabs.org>; Tue, 27 Oct 2015 17:47:13 +1100 (AEDT)
In-Reply-To: <87si4xvwd1.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============3199508305311018583==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 01:41:38PM +1030, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > Add the ability to encode, as well as types, integer values (must be
> > positive, compile time constant and in the range of size_t) into TCON
> > constructed "type" canaries.
>=20
> Oh, wow.
>=20
> That is clever!
>=20
> Please apply this series.

I thought you'd like it :).

Applied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWLxbpAAoJEGw4ysog2bOS1AgP/3vxO+VRUYd4JWpO2caDvUOR
R+gEPYcfa3bRyGbcLHRRCuCoUPGUyIhrT9rIVKHxH1/7R0af3GFrV/Yvq1jwzOyU
kyfYtv+pmRgG1ZhS+yYiTAVQb8AWG4j3MbuOaZ/x/Zrn1ezwK4YqyWaDZD00SW8i
1iEr2C2VKpv6oGEM686ZFn+rlAuxjExWv6wEdEhNXroSRL+9AzZPS7pVOl+4QxFR
+U1i51vrZbKeqI2FE4OHkVkLvp7Psceoab0CX1qA/2nmBjvheaVkPn58Hiqrd1N6
s5BfHsX1CAk92FmH/Rc2TZpoHQahrCEIBYrwxXdmyzlUtJ8SIM4npM2b69h8ZWAN
c/1MEJNDkW5RTWsRW8JYx248x0ybivDFXXh+FWRv/tFx/YxDn2OF0ky+x/wnSZ5x
2LUtc/51w2z5d3RxjB7X8nCD/WzWY1BgC4FSS7PZIe3lDOt0M8qIxQ8kKLC2D4C+
jzByfiX9SWgrR7nZ5AyurItQZ6ZY/sGFd4guG7rU+g5KZN/s8gqemUGavkAhyHK9
AfsuinZ6mkJ86rQr5SFDabmxzVbkeUllOB8VPM+NotU+ghw8Ylx20aq1x80gbPu6
jQBVg34SphFZgvuwhim8NUFm3MdwI+Os8XgQoYcaROEW3kGptQMhsVgTNW2qto0l
nLq3DuoJfrWpX7vY9/H2
=4MKy
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

--===============3199508305311018583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3199508305311018583==--
