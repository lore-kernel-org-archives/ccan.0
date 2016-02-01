From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/5] cppmagic: Preprocessor tricks
Date: Mon, 1 Feb 2016 14:59:49 +1100
Message-ID: <20160201035949.GH23043@voom.redhat.com>
References: <1453894801-22652-1-git-send-email-david@gibson.dropbear.id.au>
 <20160130125109.GS23043@voom.redhat.com>
 <87fuxduriy.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5450364610181809842=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 104A91A01E6
 for <ccan@lists.ozlabs.org>; Mon,  1 Feb 2016 14:58:53 +1100 (AEDT)
In-Reply-To: <87fuxduriy.fsf@rustcorp.com.au>
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


--===============5450364610181809842==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XyBMaHrM0hrbbr/O"
Content-Disposition: inline


--XyBMaHrM0hrbbr/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 12:21:33PM +1030, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > On Wed, Jan 27, 2016 at 10:39:56PM +1100, David Gibson wrote:
> >> ccan already has cpp macros used in some interesting ways.  This
> >> module is far more interesting.. or possibly horrifying.
> >>=20
> >> It includes some very fancy preprocessor techniques described in the
> >> article at:
> >>     http://jhnet.co.uk/articles/cpp_magic
> >>=20
> >> This includes preprocessing time evaluated conditionals, (sort of)
> >> recursion and iteration across the parameters of varargs macros.
> >
> > No comments so far.  Unless there's an objection in the next couple of
> > days, I'll commit this myself.
>=20
> We're still reeling, I think!

Heh heh heh.

> Commit away!

Done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XyBMaHrM0hrbbr/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrtg0AAoJEGw4ysog2bOSPGAP/jBvJTTcHM1mReRrHX+dUZF4
fp8S/VBqeG04VNZwmf9n7We4OraXD69WLw2rTkv9n7n34szNoynBwFvddVqNEf9n
nB42mm+XiqMybN9hu46bNednnjV3piS3mOE2egL8vvQbKvt468GltH5UuOWhDGMl
OaOnYNleux6EWEWxFxd+SelgUhlJ8RIuYc2w283TI/S7Iydiev6AKvFHT9K2esdg
VEvd6/8HoKahS1sTMJA7FGAJTsdE6Zn87wohrU4uGDgiP/OWNJ6DMhNply7v5Bxr
5UyKSF/IX4fHHp2nyMN5edpdzx5edz7BK/lbkqB16MiZaj8Em48ScC0+5TZWWtz6
Zp04BkX7wzmWBIjDqNmTFt3LYkLCaYRm07QYD0DrvDV+1mBArPYQaiJh2FT/0aaJ
q8Wn55A6ZUT95Ytw5ROhX45/WTKFc/t5lKrxdhCBDpsrEZICWsCpceuZyXXaQkFt
Mzuhm2JLVVP7nCTnX6owo6ViF8WBQe2r40t5+JYitVx4g1TcQpskZwfoLoWZB7Bi
v01SdvqasDxbTkzZipiYIjWPw3gGGJC6A0AWA0wFZCcaC0eRJfM9EuBeSV0VZoQ1
PpZtuCA3xhhDXqtE7kAjVgn5djkJjBEkh3ZXHRpkqJmAsT6d+o2a+VO8hitD0J9O
j6b+3S5X/QqNXhf39Rj3
=elNS
-----END PGP SIGNATURE-----

--XyBMaHrM0hrbbr/O--

--===============5450364610181809842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5450364610181809842==--
