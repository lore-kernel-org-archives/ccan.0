From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] time: add timemono_since
Date: Wed, 28 Sep 2016 11:26:00 +1000
Message-ID: <20160928012600.GB14447@umbus.fritz.box>
References: <1475013473-18813-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9174600852162838796=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skMD77374zDrWX
 for <ccan@lists.ozlabs.org>; Wed, 28 Sep 2016 12:32:07 +1000 (AEST)
In-Reply-To: <1475013473-18813-1-git-send-email-cota@braap.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============9174600852162838796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2016 at 05:57:53PM -0400, Emilio G. Cota wrote:
> time_mono()'s documentation references time_since(), which is nowhere
> to be found.
>=20
> A possible fix would be to just remove that stale reference.
>=20
> Instead, this patch adds timemono_since(), which hopefully
> captures the meaning of the original time_since().

Indeed it does.  Thanks for filling in that gap.

> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied to master.

> ---
>  ccan/time/test/run-monotonic.c |  3 ++-
>  ccan/time/time.h               | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/ccan/time/test/run-monotonic.c b/ccan/time/test/run-monotoni=
c.c
> index ed70f3d..787ca68 100644
> --- a/ccan/time/test/run-monotonic.c
> +++ b/ccan/time/test/run-monotonic.c
> @@ -7,7 +7,7 @@ int main(void)
>  	struct timemono t1, t2;
>  	struct timerel t3;
> =20
> -	plan_tests(2);
> +	plan_tests(3);
> =20
>  	/* Test time_mono */
>  	t1 =3D time_mono();
> @@ -19,6 +19,7 @@ int main(void)
>  	t3.ts.tv_nsec =3D 0;
> =20
>  	ok1(time_less(timemono_between(t1, t2), t3));
> +	ok1(time_less(timemono_since(t1), t3));
> =20
>  	return exit_status();
>  }
> diff --git a/ccan/time/time.h b/ccan/time/time.h
> index 5c916f4..54d92c5 100644
> --- a/ccan/time/time.h
> +++ b/ccan/time/time.h
> @@ -127,7 +127,7 @@ struct timeabs time_now(void);
>   * This value is only really useful for measuring time intervals.
>   *
>   * See also:
> - *	time_since()
> + *	timemono_since()
>   */
>  struct timemono time_mono(void);
> =20
> @@ -321,6 +321,17 @@ static inline struct timerel timemono_between(struct=
 timemono recent,
>  }
> =20
>  /**
> + * timemono_since - elapsed monotonic time since @old
> + * @old: a monotonic time from the past.
> + */
> +static inline struct timerel timemono_since(struct timemono old)
> +{
> +	struct timemono now =3D time_mono();
> +
> +	return timemono_between(now, old);
> +}
> +
> +/**
>   * timeabs_sub - subtract a relative time from an absolute time
>   * @abs: the absolute time.
>   * @rel: the relative time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6xwmAAoJEGw4ysog2bOSDfkP/jVR9ZjhfMdh25tmM+Zra6dS
5cNClvO2P6KDCj/BOUXqZQ/l7wJgtD0Qaj0adp2NUu2tZ6MHNCyEUdESIY12Xb6X
WQds2IEwLw8JOTUxJhL3H7UCyMRNyAPZRA4PzDuDzmH7NBC83X1iKsa/Tdt0vnGU
iNfNMAPViqN0IKNXjEqL1Kja11CjYIHv6azyvKs3fj+fOB8mO2GiRA4VFg5LkSmr
hmls6ppLajHSTEFyCPDcFrrJ1KNJSB4o0ZUwM1mFaagkKoy5f94cKCiLJJSfuBxb
aIHwAnJ96U1iRwmSUiRKpXIYEV9RAlSQwL5Lhhy0WXETvlF5csGQlIEIyd6ukQ+n
Tterg5kpJS3UKZMSIW49fwOOJTAp19aa86Sm/TNOIz3vZOLucRYaU3lv5ve4ifFN
bvI0PHMm35PS/8lPQsIqIHufDL5wl3DshtgZ06DpaCZhUhBe4bRiDY8/FZbEdoF7
HtxQsnNyyLGYjlSiurX38e1sJjP9J5eBHCDicl+W2CQKJwqIH2vHhFqWa4ku6uhA
pYWLsb11+2MeSvyso5ALhwf+fXFpywpDRG1c2pvibM4CageLaaLDXHM4QIqnk3Aj
3gMIWhGsA6daou8+Uz194x0EnSRwkL0xxBgVPcniqQkfdKl/MTfwFiY0Y38PyBvO
nZWfw0Ra7ixoPxJHw3hG
=6FCp
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--

--===============9174600852162838796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============9174600852162838796==--
