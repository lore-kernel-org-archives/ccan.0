From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: make check fails in coroutine module
Date: Wed, 27 Mar 2019 23:08:54 +1100
Message-ID: <20190327120854.GM8544@umbus.fritz.box>
References: <20190317223944.rebtzvfszp63qrze@matica.foolinux.mooo.com>
 <20190326043129.GP9393@umbus.fritz.box>
 <20190326195806.zpxnolrlw243k72y@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5567566282420460376=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44V1tv0cRYzDqTn
 for <ccan@lists.ozlabs.org>; Thu, 28 Mar 2019 08:52:23 +1100 (AEDT)
In-Reply-To: <20190326195806.zpxnolrlw243k72y@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Ian Zimmerman <itz@very.loosely.org>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============5567566282420460376==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Content-Disposition: inline


--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 12:58:06PM -0700, Ian Zimmerman wrote:
> On 2019-03-26 15:31, David Gibson wrote:
>=20
> > > ... more (use -vv to see them all)
> > > coroutine: Total score: 35/43 FAIL!
> > > make: *** [Makefile:78: ccan/coroutine/.ok] Error 1
> > >=20
> > > Perhaps it is relevant that the configurator check causing the
> > > segfault - as discussed in the other thread - is
> > > HAVE_POINTER_SAFE_MAKECONTEXT which, I believe, is only used by
> > > coroutine module.
>=20
> > Urgh, yeah, it's broken.  Finding time to debug and fix it is proving
> > difficult.
>=20
> Ok, I understand that perfectly.  But I'd like to contrbiute to ccan,
> and I'll only feel comfortable doing that when I have a clean test suite
> to start with.  What would you suggest as a workaround?  Maybe a local
> branch with the coroutine module removed?

That would work, assuming you don't want the coroutine module or
anything it relies on.

But, I'm not sure that's the right approach.  ccan isn't really
intended as a monolithic project, each module should be more or less
independent, with the check everything at the top level being just a
convenience.

If you're looking to contribute you can run ccanlint to build and test
a single module (and its dependencies) and that should suffice.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlybZ9YACgkQbDjKyiDZ
s5JeyA/+Iey4GW/I/3evk0ajCZXqj37aUG+JBy2Xx0yI2z4theTN+htbXcZJ/hw3
7TKmvtUeWU7c7UQGDRReeMjdTqMH4533vwsHviQU7I7TkNZ5xnanldFdcWSwzLWo
QnWv6PNrHXQXWVN5HlAUX76D2kPN4TIOPGuhRk2HsBpZZl623CCvr/dEMnsmU6pb
FJLAiDa6ZFp8jD0T3Hc0RhA+Q9f4+mtrEdvXSqGRYb7FJGxKp6aXB1MINSS2WjlV
Dn+I+wZ+GgpNTn8T7Z9rUn2Yzo0q9Sy83qYEOWS0eczulftqLtfHY6vVr4Kw61y1
6CUOVjitb+lSuaCOs3A2vACE4f9kF00N98/WG6j9n3yvQqDW+9pO2z2qd26eVz/V
eD08UfnX8u587qxarCSBQ484FqMzsBKhOHUitOBpOCjOGMc1UGv2eNbB6UMkNNxB
UZp3u9juI5XI9aqnGYmIKiiptc7wce/p7+ZgGcL3vlyVfa8nD+EbYzcSGcuZkXEH
qYlorxfV+5PJz83z0+iaIt0/R2izgW1PZlBbdzeuLPFdHp51CkgwWOvxLbzU5JaH
KIgmajaZ3u0vyylyIz4B2r+1d3ZcJcPKFNHdxhNJStEDh76etJghGsdik3sSmRch
CgHen7tFqRxn0U07yQF9WIXfnKENO7licF+BA1nUgSqsl21xQ9U=
=28db
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--

--===============5567566282420460376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============5567566282420460376==--
