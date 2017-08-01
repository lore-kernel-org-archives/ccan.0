From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/4] jset: Use TCON_WRAP instead of TCON
Date: Tue, 1 Aug 2017 15:17:26 +1000
Message-ID: <20170801051726.GN2652@umbus.fritz.box>
References: <20170723122907.10686-1-david@gibson.dropbear.id.au>
 <20170723122907.10686-3-david@gibson.dropbear.id.au>
 <87y3r5p1h1.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0695975403071782018=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM4MH5P2LzDrD2
 for <ccan@lists.ozlabs.org>; Tue,  1 Aug 2017 15:17:31 +1000 (AEST)
In-Reply-To: <87y3r5p1h1.fsf@rustcorp.com.au>
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


--===============0695975403071782018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S66JdqtemGhvbcZP"
Content-Disposition: inline


--S66JdqtemGhvbcZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 03:55:14PM +0930, Paul 'Rusty' Russell wrote:
> OK, these all look good.
>=20
> Please apply!

Done.

> Rusty.
>=20
> David Gibson <david@gibson.dropbear.id.au> writes:
> > TCON() uses flexible-array members which aren't allowed in the middle
> > of structures, except as a gcc extension.  TCON_WRAP() avoids this and =
so
> > is more portable.
> >
> > This doesn't change the jset interface, only its internals.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  ccan/jset/jset.h     | 45 ++++++++++++++++++++++++++++-----------------
> >  ccan/jset/test/run.c |  9 +++++----
> >  2 files changed, 33 insertions(+), 21 deletions(-)
> >
> > diff --git a/ccan/jset/jset.h b/ccan/jset/jset.h
> > index ba72f097..904982d6 100644
> > --- a/ccan/jset/jset.h
> > +++ b/ccan/jset/jset.h
> > @@ -30,8 +30,7 @@ struct jset {
> >   *	};
> >   */
> >  #define JSET_MEMBERS(type)			\
> > -	struct jset raw;			\
> > -	TCON(type canary)
> > +	TCON_WRAP(struct jset, type canary) jset_
> > =20
> >  /**
> >   * jset_new - create a new, empty jset.
> > @@ -47,6 +46,14 @@ struct jset {
> >   */
> >  #define jset_new(type) ((type *)jset_new_(sizeof(type)))
> > =20
> > +
> > +/**
> > + * jset_raw_ - unwrap the typed set (without type checking)
> > + * @set: the typed jset
> > + */
> > +#define jset_raw_(set)	(tcon_unwrap(&(set)->jset_))
> > +
> > +
> >  /**
> >   * jset_free - destroy a jset.
> >   * @set: the set returned from jset_new.
> > @@ -54,7 +61,7 @@ struct jset {
> >   * Example:
> >   *	jset_free(set);
> >   */
> > -#define jset_free(set) jset_free_(&(set)->raw)
> > +#define jset_free(set) jset_free_(jset_raw_(set))
> > =20
> >  /**
> >   * jset_error - test for an error in the a previous jset_ operation.
> > @@ -74,8 +81,8 @@ struct jset {
> >   *	if (errstr)
> >   *		errx(1, "Woah, error on newly created set?! %s", errstr);
> >   */
> > -#define jset_error(set) \
> > -	jset_error_(&(set)->raw)
> > +#define jset_error(set) jset_error_(jset_raw_(set))
> > +
> > =20
> >  /**
> >   * jset_raw - unwrap the typed set and check the type
> > @@ -86,7 +93,9 @@ struct jset {
> >   * variable is of an unexpected type.  It is used internally where we
> >   * need to access the raw underlying jset.
> >   */
> > -#define jset_raw(set, expr) (&tcon_check((set), canary, (expr))->raw)
> > +#define jset_raw(set, expr) \
> > +	(tcon_unwrap(tcon_check(&(set)->jset_, canary, (expr))))
> > +
> > =20
> >  /**
> >   * jset_test - test a bit in the bitset.
> > @@ -137,8 +146,8 @@ struct jset {
> >   *	// We expect 1000 entries.
> >   *	assert(jset_count(set) =3D=3D 1000);
> >   */
> > -#define jset_count(set)				\
> > -	jset_popcount_(&(set)->raw, 0, -1UL)
> > +#define jset_count(set)	\
> > +	jset_popcount_(jset_raw_(set), 0, -1UL)
> > =20
> >  /**
> >   * jset_popcount - get population of (some part of) bitset.
> > @@ -186,7 +195,7 @@ struct jset {
> >   *	}
> >   */
> >  #define jset_nth(set, n, invalid)					\
> > -	tcon_cast((set), canary,					\
> > +	tcon_cast(&(set)->jset_, canary,				\
> >  		  jset_nth_(jset_raw((set), (invalid)),			\
> >  			    (n), (unsigned long)(invalid)))
> > =20
> > @@ -205,7 +214,7 @@ struct jset {
> >   *	printf("\n");
> >   */
> >  #define jset_first(set)						\
> > -	tcon_cast((set), canary, jset_first_(&(set)->raw))
> > +	tcon_cast(&(set)->jset_, canary, jset_first_(jset_raw_(set)))
> > =20
> >  /**
> >   * jset_next - return the next bit which is set (must not contain 0).
> > @@ -216,7 +225,8 @@ struct jset {
> >   * jset_first.
> >   */
> >  #define jset_next(set, prev)						\
> > -	tcon_cast((set), canary, jset_next_(&(set)->raw, (unsigned long)(prev=
)))
> > +	tcon_cast(&(set)->jset_, canary,				\
> > +		  jset_next_(jset_raw_(set), (unsigned long)(prev)))
> > =20
> >  /**
> >   * jset_last - return the last bit which is set (must not contain 0).
> > @@ -230,7 +240,7 @@ struct jset {
> >   *	printf("\n");
> >   */
> >  #define jset_last(set)						\
> > -	tcon_cast((set), canary, jset_last_(&(set)->raw))
> > +	tcon_cast(&(set)->jset_, canary, jset_last_(jset_raw_(set)))
> > =20
> >  /**
> >   * jset_prev - return the previous bit which is set (must not contain =
0).
> > @@ -241,7 +251,8 @@ struct jset {
> >   * jset_last.
> >   */
> >  #define jset_prev(set, prev)						\
> > -	tcon_cast((set), canary, jset_prev_(&(set)->raw, (unsigned long)(prev=
)))
> > +	tcon_cast(&(set)->jset_, canary,				\
> > +		  jset_prev_(jset_raw_(set), (unsigned long)(prev)))
> > =20
> >  /**
> >   * jset_first_clear - return the first bit which is unset
> > @@ -251,17 +262,17 @@ struct jset {
> >   * set is full.
> >   */
> >  #define jset_first_clear(set)						\
> > -	tcon_cast((set), canary, jset_next_clear_(&(set)->raw, 0))
> > +	tcon_cast(&(set)->jset_, canary, jset_next_clear_(jset_raw_(set), 0))
> > =20
> >  #define jset_next_clear(set, prev)					\
> > -	tcon_cast((set), canary, jset_next_clear_(&(set)->raw,		\
> > +	tcon_cast(&(set)->jset_, canary, jset_next_clear_(jset_raw_(set), \
> >  						  (unsigned long)(prev)))
> > =20
> >  #define jset_last_clear(set)					\
> > -	tcon_cast((set), canary, jset_last_clear_(&(set)->raw))
> > +	tcon_cast(&(set)->jset_, canary, jset_last_clear_(jset_raw_(set)))
> > =20
> >  #define jset_prev_clear(set, prev)					\
> > -	tcon_cast((set), canary, jset_prev_clear_(&(set)->raw,		\
> > +	tcon_cast(&(set)->jset_, canary, jset_prev_clear_(jset_raw_(set), \
> >  						  (unsigned long)(prev)))
> > =20
> >  /* Raw functions */
> > diff --git a/ccan/jset/test/run.c b/ccan/jset/test/run.c
> > index a0fb8a8c..425546fd 100644
> > --- a/ccan/jset/test/run.c
> > +++ b/ccan/jset/test/run.c
> > @@ -34,7 +34,8 @@ int main(int argc, char *argv[])
> >  		jset_set(set, 1 + (i << 4));
> > =20
> >  	/* This only take 1.7MB on my 32-bit system. */
> > -	diag("%u bytes memory used\n", (unsigned)Judy1MemUsed(set->raw.judy));
> > +	diag("%u bytes memory used\n",
> > +	     (unsigned)Judy1MemUsed(jset_raw_(set)->judy));
> > =20
> >  	ok1(jset_popcount(set, 0, -1) =3D=3D 1000000);
> >  	ok1(jset_nth(set, 0, -1) =3D=3D 1);
> > @@ -53,13 +54,13 @@ int main(int argc, char *argv[])
> >  	ok1(jset_error(set) =3D=3D NULL);
> > =20
> >  	/* Test error handling */
> > -	JU_ERRNO(&set->raw.err) =3D 100;
> > -	JU_ERRID(&set->raw.err) =3D 991;
> > +	JU_ERRNO(&jset_raw_(set)->err) =3D 100;
> > +	JU_ERRID(&jset_raw_(set)->err) =3D 991;
> >  	err =3D jset_error(set);
> >  	ok1(err);
> >  	ok1(strstr(err, "100"));
> >  	ok1(strstr(err, "991"));
> > -	ok1(err =3D=3D set->raw.errstr);
> > +	ok1(err =3D=3D jset_raw_(set)->errstr);
> >  	jset_free(set);
> > =20
> >  	return exit_status();
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S66JdqtemGhvbcZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmADuMACgkQbDjKyiDZ
s5I1DBAAswtnC8lXPlFjx9R3ruiDG41AfcGljrFGyFV5GJddDMJhyeECYE8OQEmN
KH/+oFlaR8bx2TBJTOsuArFHhcCfLrOYozXiJOpAGChS7nrgO2+70BeFJoq/kZ74
+yQTI0Q9FxR775ngQTPYrYCxfMIv1LlFf4wRn0sdZukSSpui4DHOAgZ3XfWfFS/c
YUuHKvAl4VpJDH9lsSxg5zeUXwBMm0I0stjFpesLN/b0K+1RfATIsb09v408qkSb
0DDxzJNd9mr1Ckp13I1EULJnmI8k+2l+jh8QaBdjNG9+H2KFCGs+NNgx/0SW8Plw
ZW13TmCWpQvLayC75GaLc5YHlBLK7jcpDvb7AuShLpu2EqKN9UQZyelPNe5ZZL2i
YB/aApUfpBl+MLV3qOh0c/3Om5fvcXVfZm/rrOYDqO8PYVyokKIsqdPAkUTfy1lt
Bbn15FrJDm8Md5s++/BoHH8aikSrY2iR0PeK9YuLeawFU4oAR3f5gFdm78jgDmnJ
XzGI7PMb/294A85JE6gFUXMiFq0N1OENBbJARxII5As3G8ooGjmbyBaBQFDMMsX4
S8aAuFSv+Z3IjwTvbmo1MikQLzR95bO2Z+di1DPQsOWZZuKEJo1jH+oMehdg+5gr
h5zVWhHc56M1t0wgBDL/MCYPvspGWCTE+rys5s9FNusgaWAyYIE=
=VLYt
-----END PGP SIGNATURE-----

--S66JdqtemGhvbcZP--

--===============0695975403071782018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0695975403071782018==--
