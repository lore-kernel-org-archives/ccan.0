From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/7] crypto/hmac_sha256: Remove undefined memset()
Date: Wed, 5 Apr 2017 22:23:21 +1000
Message-ID: <20170405122321.GA15755@umbus.fritz.box>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-5-david@gibson.dropbear.id.au>
 <87wpb0di8g.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0594668004042646258=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vylPD0NpMzDqGv
 for <ccan@lists.ozlabs.org>; Wed,  5 Apr 2017 22:23:28 +1000 (AEST)
In-Reply-To: <87wpb0di8g.fsf@rustcorp.com.au>
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
Cc: ccan@lists.ozlabs.org, rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org


--===============0594668004042646258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2017 at 11:52:39AM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > A memset() with a zero length argument isn't well defined.  It *might* =
be
> > a no-op, but then it might not.  So, test for this case in
> > hmac_sha256_init().
>=20
> Huh?  That seems really odd.

Well.. more precisely, my understanding is that memset(p, x, 0) can't
be counted on not to dereference p.

In this case, k_ipad + ksize is past the end of the array, and so not
a valid pointer to dereference.
>=20
> Rusty.
>=20
> > Found by Coverity.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  ccan/crypto/hmac_sha256/hmac_sha256.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/ccan/crypto/hmac_sha256/hmac_sha256.c b/ccan/crypto/hmac_s=
ha256/hmac_sha256.c
> > index 0392afe..70ca3b2 100644
> > --- a/ccan/crypto/hmac_sha256/hmac_sha256.c
> > +++ b/ccan/crypto/hmac_sha256/hmac_sha256.c
> > @@ -36,7 +36,9 @@ void hmac_sha256_init(struct hmac_sha256_ctx *ctx,
> >  	 *   appended with 44 zero bytes 0x00)
> >  	 */
> >  	memcpy(k_ipad, k, ksize);
> > -	memset((char *)k_ipad + ksize, 0, HMAC_SHA256_BLOCKSIZE - ksize);
> > +	if (ksize < HMAC_SHA256_BLOCKSIZE)
> > +		memset((char *)k_ipad + ksize, 0,
> > +		       HMAC_SHA256_BLOCKSIZE - ksize);
> > =20
> >  	/*
> >  	 * (2) XOR (bitwise exclusive-OR) the B byte string computed
> >
> > _______________________________________________
> > ccan mailing list
> > ccan@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/ccan
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5OG2AAoJEGw4ysog2bOS9DQQAMtjL4JZNTJ0q5Dz2D3Fs7Xt
lN0F4qYXskEqBzQE2UE9CE4IlxoZF0lBBeMnElH2qR177D3MLy3nWqw4zJxmtkuP
9uTpmNx0NeWQ5X7WcU64zCRkiKzofuxVar9FRmFQsg2tTiguw0Sw5Jf/MU+psPal
Iu2GWHsO+e59pht1/K9icQKsu6m2emwrChrxUSeH6/HlCBghw8Fg3EFYJnwBqKJO
ZP/t1CzEOnu+quU/Py3PDXPd4GdFXIvMh8iw4fyN+yvylseKyg3hKnV2zqHB6RQI
y4LM9hA3qOqwJrge4xltnydUyfrl5a/YSjVGjLXZ7h3+Pqyb9STTb6ul7oXKe0ey
o9HHI4i7qWmZn+ZCQsrjjQNFem8G4scIasFJaPZbj69nFGEBcpa+w7bKy4uQeKDL
NQvfx3L2EuUSjrUMU+83vBWv6nyMXKQkWRDDOFLWGARveNpQ4wPSnO4gmK4BsOS4
biu11nvAS1dYUiYmeQXgA2jY3udTKdZeT3y2sxHrL4X2zkj7AY0JZF30t8WFYzvN
qKmf5vw6ni1/mtgw+tcPH5E0srreMBl+JeZQUNtnl0IRHjSfhUyVjc0Wt7m30agk
sbxf3B3TcFp2W470GVl/O8kct+nepSfCO6xlWUrUmaYq0SBZZsOFjRdiM4HXpHVt
fNa0FVWq86oCxwE5svVI
=cbWf
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

--===============0594668004042646258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0594668004042646258==--
