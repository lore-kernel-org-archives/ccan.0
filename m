From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Tue, 9 Feb 2016 09:40:57 +1000
Message-ID: <20160208234057.GC29288@voom.bne.redhat.com>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <20160208021734.GE3702@voom> <56B818F5.7070204@longlandclan.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7247561299130084164=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E81F31A0340
 for <ccan@lists.ozlabs.org>; Tue,  9 Feb 2016 11:00:06 +1100 (AEDT)
In-Reply-To: <56B818F5.7070204@longlandclan.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Stuart Longland <stuartl@longlandclan.id.au>
Cc: ccan@lists.ozlabs.org, Stuart Longland <me@vk4msl.id.au>
List-Id: ccan@lists.ozlabs.org


--===============7247561299130084164==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2016 at 02:26:29PM +1000, Stuart Longland wrote:
> On 08/02/16 12:17, David Gibson wrote:
> >> +static void* default_malloc(const struct btree_allocator* alloc, size=
_t size);
> > Existing style in this function suggests "void *foo" rather than
> > "void* foo".
>=20
> Ahh, call it habit, I'm used to having the "pointer" bit with the type
> (as to me; "pointer to void" is a distinct type from "void").  Caught
> myself doing it elsewhere but missed it here, I'll fix it.

So, from a language design point of view, I agree with you.  However,
I dislike that style in C because it obscures the fact that C
importantly *does not* have that sensible handling of types.

More specifically this style:
    int*  a, b;

Suggests that a and b have the same type, but of course they don't.

> > [snip]
> >> > +/* Default allocator implementation */
> >> > +const struct btree_allocator BTREE_DEFAULT_ALLOCATOR =3D {
> > Use of all-caps for a non-macro is a bit unexpected.
> >=20
>=20
> Good point.  I guess I wanted to visually differentiate a constant from
> other member types.

I applaud the idea, but unfortunately I don't think that use of caps
is common enough to make it really clear.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWuSeJAAoJEGw4ysog2bOSF2oQAJ7upI6F4gwVCboYhFjPAC0v
MWCDKJESmaFDoZL4NASvDwf2LP96sCL4TW0jn8w4jSYoUcg3Zug9F9LvE7GlNYb1
GsvGGGOEGbRYellGu/utZ3QV/SAlKglFCzxlQReSGlSqy1zZ6Aa2m2DJOqBMCicD
2ASxH/lOnRJVcAFpAQ1vS9JungTDBTW3ox2ezyrW4XwwUEvtBCiGhyaXTLTsEpwh
hYNY9r4z7UhGGNz2aXc33MGVNAwUOfHVsAM1kfpSxAi3wj5d/+Q6SYZu1/P8Gu/v
U2uwXo5sH+BkERDP2wPOcCx5wze4QyBOC/XOPkCXwkPbVGgX6Ie+dDOLENlF1qkA
0Xs/h6F7Xshqnn9PC9FwZTZF5AP2OQTG5z8eRGT9SUzHDPC1n//Jq07wRZNQr+lo
cdE2zWDewO8LJ1BpqCYlGEbzJ0TBXtteqapg196unTnUIIt2YCYUZ3vWhXCAN4TG
v9qr7gt9/bzO0+CFK1UGXXPpOZkrj0W/RXlcuWy2xYqERMXD2SQpkXx8NCQR8yRJ
UUJOWH61KLRquH/lqOZVfHpgm+KEklHsgT9McRtO+7lyQ/4zT7Qx7aWo6sJ28sqk
rqryngtS6vSZN/Xvj7eDocoT7vETbHU6D4nJvV/PEWz1XO14rSxhlQK4nV2W3D77
L1pHKvQZZDpWIAQGaeh4
=vqW7
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--

--===============7247561299130084164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7247561299130084164==--
