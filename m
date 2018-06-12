From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] timer: remove unnecessary dependency on likely
Date: Tue, 12 Jun 2018 12:36:32 +1000
Message-ID: <20180612023632.GW2737@umbus.fritz.box>
References: <20180608024542.dm4s6s4flmsi3jqm@dcvr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8771802940332707308=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414YtF4RB0zF3vK
 for <ccan@lists.ozlabs.org>; Tue, 12 Jun 2018 12:36:37 +1000 (AEST)
In-Reply-To: <20180608024542.dm4s6s4flmsi3jqm@dcvr>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Eric Wong <normalperson@yhbt.net>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============8771802940332707308==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c7rykKtsZvepKFKR"
Content-Disposition: inline


--c7rykKtsZvepKFKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 08, 2018 at 02:45:42AM +0000, Eric Wong wrote:
> I don't see likely/unlikely being used by ccan/timer or any of its
> dependencies right now.
>=20
> Running `tools/ccanlint/ccanlint ccan/timer' reveals no regressions
>=20
> Signed-off-by: Eric Wong <normalperson@yhbt.net>

Applied, thanks.

> ---
>  ccan/timer/_info   | 1 -
>  ccan/timer/timer.c | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/ccan/timer/_info b/ccan/timer/_info
> index 9f5ec7a2..d76a7e67 100644
> --- a/ccan/timer/_info
> +++ b/ccan/timer/_info
> @@ -70,7 +70,6 @@ int main(int argc, char *argv[])
>  	if (strcmp(argv[1], "depends") =3D=3D 0) {
>  		printf("ccan/array_size\n");
>  		printf("ccan/ilog\n");
> -		printf("ccan/likely\n");
>  		printf("ccan/list\n");
>  		printf("ccan/time\n");
>  		return 0;
> diff --git a/ccan/timer/timer.c b/ccan/timer/timer.c
> index 91f46393..84d7aa14 100644
> --- a/ccan/timer/timer.c
> +++ b/ccan/timer/timer.c
> @@ -2,7 +2,6 @@
>  #include <ccan/timer/timer.h>
>  #include <ccan/array_size/array_size.h>
>  #include <ccan/ilog/ilog.h>
> -#include <ccan/likely/likely.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--c7rykKtsZvepKFKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsfMbAACgkQbDjKyiDZ
s5IvTxAArnbV7RS8dMV6v6QGNiyanx7VUQOdi5ihaa+AthjxvCvDGl3fnMLwmWkT
uXDbYppw4xgEeCLINB5wmiuZeL2axG9Ney1BV056x5pttqx5VUkIZZzv+bG+19Fg
VwN0qfO6uFifVFydt93fIPpM1kq5RtrjASGBAITB4Ps8WT5SnChM82uDeGYyTz+m
3ipscouZ/mRDRdgfNVyyQcxnc7DC7dqnqcpxZ0iSvXrti9muguDHGcSjQ17zEaR3
wQLevnyXkwzRe9rZKCRuJROn2EN9w5iCiH7+EKvWitMVGMM+vo9+q7xAgklLVBsl
HoA9j1Y0LNx17NxHEgCXmGAvkTlnxbI9SkMtss6XvXfBpOHZc60S9TOvim3Wrwhv
WVbg+9ML+TAB6L8LV8HwGOKtzaabVKBrkBLcpL+q6/FZNA42Y9rldmiuRggXB163
Drk9PwU30R6XZLosGHE30hRqSva/oOweU9N4tXPrUsQP0QD23IyeszBjt9d4jQUb
wPjdCpH2D8u1LDqrPZTeDjwWML2Y0SunJTxM94WqfQXuR7SIx3SfVlkz9Y2s0o5w
ewFIgnakUAgMUHekCAiDxzpmIod5ueXjXSqMLWjAKOb7PCTXL3CtIhTF+aXNRC38
ipG65xS/7wGFWnKzrQw56hWz7eu0aY3gB1R2i+tyjpKQiHWhaf8=
=p6k6
-----END PGP SIGNATURE-----

--c7rykKtsZvepKFKR--

--===============8771802940332707308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8771802940332707308==--
