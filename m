From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] mem: Add memswap() function
Date: Wed, 9 Sep 2015 17:37:59 +1000
Message-ID: <20150909073759.GE17641@voom.redhat.com>
References: <1441428261-6551-1-git-send-email-david@gibson.dropbear.id.au>
 <1441428261-6551-3-git-send-email-david@gibson.dropbear.id.au>
 <87k2s04uz5.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6617474150880053031=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D2371A2A7D
 for <ccan@lists.ozlabs.org>; Wed,  9 Sep 2015 17:37:43 +1000 (AEST)
In-Reply-To: <87k2s04uz5.fsf@rustcorp.com.au>
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


--===============6617474150880053031==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2015 at 04:08:38AM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > Add a memswap() function to the mem module, which exchanges two (equal
> > sized, non-overlapping) memory regions.
>=20
> Nice!
>=20
> I wonder about a #if CCAN_MEM_DEBUG'd test which assert() tests for
> no overlap.
>=20
> Though maybe it's cheap enough that a simple assert() is always OK?

Good idea.  And actually.. an exposed function to tell if memory
ranges overlap might be nice too, why not.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7+HXAAoJEGw4ysog2bOSg84QAJ7cl5Nstn47Djz86GpyE8G5
U2Ldui9uuOoO45lCvkn0u0C06U20HD6YejTG5S/xsWDav/mRpdJlntfbt472l3FQ
vRvKnOvjGAKVo0G+k6VRNe4BFomnYou+Lq/us5PY3dOCcbs+3ITOuqNvfrrVp1Ut
uSC+Zf0ujqKM+XK5kkdqwFoiHNwFEZsNtw/RSWgr/T0NIE0aptbmRnbMwjGDgQ0E
LlqgC4vO/sMTmACJ8jyrNt1qXy1IcMfENlPA0LHWbpjaeDBNDE2oP9f2qNIXpL2f
6mnCXUXo39tgMtlJ+xSLpOUSgj4WijYXNDCMssQ9KB7x8DsFvpRAk2+cimwRqb3R
gIcM12aqJaT3GeK7S+lWA2c0laIEJr40tFotYxUlMA7isA7KMgMLXN1PM6Ul+iK6
t4vgMnaKcy7AOaiSAyekt0akZqIzK875NlDjGrDgSc9zGHrlJLvG36muQZR4inL2
HALSrmFB5Ns4q7imnxSW0LTRKK6Jamt69TxzwBkWVfRAfaYnuE7MONNK1oT3qFzg
XNnEIYEQi/jrn7XeSBob+tWdWWCfJGG/zrHCFjAJy/V8S22QE2h5YbXMO3AFWKHE
Bh3qoAZ+tkQ1e8yTts0LccjnjGomJEEoyPzyK5rR1Ezr2hM8BRGd6ImW3ytMcyo1
Z9IvpDY0exUI3ITDeMbF
=thSk
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--

--===============6617474150880053031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6617474150880053031==--
