From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Annoying warning, a.k.a. how to add to CFLAGS
Date: Fri, 1 Sep 2017 15:11:17 +1000
Message-ID: <20170901051117.GO3386@umbus.fritz.box>
References: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3336779843637746746=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xk6tS28dmzDqj8
 for <ccan@lists.ozlabs.org>; Fri,  1 Sep 2017 15:17:04 +1000 (AEST)
In-Reply-To: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============3336779843637746746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24/piotZLKF/SXqU"
Content-Disposition: inline


--24/piotZLKF/SXqU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 08:23:50PM -0700, Ian Zimmerman wrote:
> When I checkout current master, run ./tools/configurator/configurator >
> config.h and then make, I get exactly 1 warning for the whole thing:
>=20
> ccan/strgrp/strgrp.c: In function =E2=80=98grp_for=E2=80=99:
> ccan/strgrp/strgrp.c:296:0: warning: ignoring #pragma omp parallel [-Wunk=
nown-pragmas]
>      #pragma omp parallel for schedule(dynamic)
>=20
> I figured out that I can silence that by adding -fopenmp to my CFLAGS.
> But how to do that permanently?  I don't want to specify that on the
> command line every time, and I also don't want to set it in the
> environment because sometimes I compile other things than ccan ;-)
>=20
> Is there a reason why this is not in the master Makefile?

Because working out how to make module specific CFLAGS additions in
the Makefile isn't entirely trivial.  Working out how to do so in a
reasonably portable fashion is even harder - I don't expect -fopenmp
will work for all compilers, so applying it there would change a
cosmetic warning into a compile failure.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--24/piotZLKF/SXqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmo6/QACgkQbDjKyiDZ
s5Jr8Q/+OwGMb7BY2U4/zQo588yhpZZyJ8L7f67E9271/6TaKrv75JeqP8acJnQ3
RQfSROZdUXl7yAt2fjo7jpicp3NejBk712V5wdwEKSvQnH6HjjaSkXcJDFrj3Onl
7VDTg9txRKbfJkCmnhshbyhY8aJxHtpJZLSR8ETTbzom+YINXq53uG984CJtQW5N
b0WgaK4fQqEY4CtgDzayCDD9CnjT4+dl3KjXBDYV3/e8h6DmWVWJUNoxwREAX0tL
f4rbn8VyDUhIiReFRMO2CGJxtxk1AKl4ZDd9u7xnMg4uGyTqVeB3yO4TtVyzMrFI
VdX3p2Okk5GOVgmN8M4Mubdu/7L7iolmH27wKeteiBizMD90o5WXScV6z1PV3fwn
PkgWEcwHtHOyaglSQrHomYYJfmFRmP+V+Y7Hb+VmatlncD7Mi0rSwZgOP4SfiJzy
E5Wx1VhQIAeSFtIJnihhehea7FxwYzXTyRYXPfPlGjuYwXSm9ee+gYAo3U5veEGb
MhmQuZ/EHgR1peGbyyYJdNBPosmN+lxOPlqyz5eq2nLeeHuSewFNzYEizw8weMML
k74vhJhSoGLRVl6Pvb9NMf5s0+0C1jwc3eLwF6y542PPLR8ruq/yIaoNwe/4N/4V
m049Y3yqyY86pXm4O7ENg4jLmTMR9HANawSp9MZZe3HnlmUFnX0=
=Ki0d
-----END PGP SIGNATURE-----

--24/piotZLKF/SXqU--

--===============3336779843637746746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3336779843637746746==--
