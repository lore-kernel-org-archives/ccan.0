From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] ccanlint: Move ccanlint test options from
 _info comments to code
Date: Thu, 29 Dec 2016 19:01:23 +1100
Message-ID: <20161229080123.GA18749@umbus.fritz.box>
References: <20161225044915.24219-1-david@gibson.dropbear.id.au>
 <20161225044915.24219-2-david@gibson.dropbear.id.au>
 <871swuf3is.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3869715927488895303=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tq2fm2mTLzDq8V
 for <ccan@lists.ozlabs.org>; Thu, 29 Dec 2016 19:23:12 +1100 (AEDT)
In-Reply-To: <871swuf3is.fsf@rustcorp.com.au>
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


--===============3869715927488895303==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2016 at 02:05:07PM +1030, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > Currently, _info files can specify options, or note expected failures, =
for
> > ccanlint checks in the _info file with specially structured comments. T=
hat
> > differs from most other things ccanlint gets from _info, where it inste=
ad
> > executes the info file with certain parameters.
> >
> > This changes ccanlint and existing _info files to use the normal method=
 for
> > the ccanlint test options as well.  This also has the advantage that an
> > info file can alter its test options based on things from config.h - in
> > some cases whether a test can work or not might depend on various thing=
s.
>=20
> Agreed, please apply!

Done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYZMLRAAoJEGw4ysog2bOSEqwP/RinAeJa0wigxhW3bJSTfcvV
3arfD/ZEk0MauFRkofZN6oSWbKF9dcDtGLGSUuhZgk3tb+jWrD8SLUJyr9BYOOrW
eEv3Af0gu4nDZyCrdLRfQbCVhy1Z92wJbazOsD6bc0Rw9YHFHl7lxhvw+rqH/LCL
4bpXXameIhCT33vldveYFkMOB9VFP3q8rusvgjDmRqwUBWTW8I7fK6WZlDU3Uf8B
251jXRU314gENcz0DqTjjFmY3QuKrSEE8F6BdY1yb2EUpmxy65zOwFOmjc4fXNww
k2JyYYG8GfAs5uSJ5HLchDklNPYvBlnO8cg5xfyzKjcVa06qKtFWNedKIAAOXecg
e+EArn59BfOWjP+pejx5L+/RpoKwSiKo+fl12FbZD4SnjHh68rH2i4PxWebZRBIT
kGUx+Lb4RQrgAJEZC+DhcIsrd5U9b887mRSW/5iYDgkk/noKLLzxDXNEsNSBh2g2
3WqqKxeqJhdoODpvQoa84vbRBNQYK59P0HKo5HiAh0NAGjZagP3uxDhXbVppdVAA
nfBaL0bVjqKcYsMWjXdKlpATO1Ustn61Sg7mNbm/2AwiW1VNK3TQYRdPVz9QNxOs
VFv8AcwgR3WGmQxIsXJHll7kRYVNBjGpgGhZ8H8XGRPCQwpQ2DYsQaSR8rjHAcyY
T5tK/Nsj1IwfM6ariXqt
=ouQm
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============3869715927488895303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3869715927488895303==--
