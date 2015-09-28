From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] ccanlint: enhance and streamline "output"
	testing lines.
Date: Tue, 29 Sep 2015 00:58:32 +1000
Message-ID: <20150928145832.GO11620@voom.redhat.com>
References: <878u7rp6z8.fsf@rustcorp.com.au>
 <20150928143236.GN11620@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6662910022846350501=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 513EA1A01D2
 for <ccan@lists.ozlabs.org>; Tue, 29 Sep 2015 01:57:27 +1000 (AEST)
In-Reply-To: <20150928143236.GN11620@voom.redhat.com>
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
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============6662910022846350501==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rZHzn+A9B7nBTGyj"
Content-Disposition: inline


--rZHzn+A9B7nBTGyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2015 at 12:32:36AM +1000, David Gibson wrote:
> On Mon, Sep 28, 2015 at 12:48:03PM +0930, Paul 'Rusty' Russell wrote:
> > 1) Require "" around input
> > 2) Make them optional around output: if not there, loose match whitespa=
ce
> > 3) Handle \n in output.
> > 4) Document that "Given xxx" is optional.
>=20
> Patch looks fine to me.

I take that back.  With a bit more playing, noticed that if you
*don't* put" around the input, it will silently skip the example
expected output test.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rZHzn+A9B7nBTGyj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCVWXAAoJEGw4ysog2bOSimYQAInZBPHlxV6Mf14IBqOh6TCe
ejYl0elDcrYOjDmol/EL8rpyF+Xhr8/gADg765skxJXVa+2bsi2pDR353lPlXubT
vqTUlRZ9joPEoUNHaCW/p0dS4h48CsGg5rp2EoQ9aW5q+ObrTzkbm2ikJVDCvKLh
ySq1mPwDRZSpYvkxBlcwITYlZyoXfcqCvLdaDc2xdFLj7zaj8QUik+bAr04rvRZb
S0bX3cb0K7g0d4iPtIHiYBoIAgfvdN3QRP80FuQS+SK87ABiWL2o4nLvHajxQ7hB
UwFJ2RPEK1rFGM5JCOB0KX52YecmAPLYzyqEbzFTccO3GcTHIvMfBMjcwymN7Kic
kqUWBJzsO07VpWA4LT5SQehqYL7jh3R7SwHLdtH5MZajwADx7FeAcq1KfXxjhOqD
pcdJpu0WCAHVjhYVt0cTjPCh5oo6H5hhONQkeWFq31PahwAo413PtaTCm54stb1g
nH4Pa2VMRzJ7RfxNkXJOO5k2CkYEvRWJGYfTb/XebJaHn2FDCYTNZxQGU8+TdoYM
k2s2DNCwDki+8BRPAxndmr7bIlNKxvJbL0uKuxFra/e3gcisM5cnF8MktIr1yUvU
DXNvE4cYVB5+MOKT55vmHOTHXfATnPb2lSH9tuCVGhi/CeBgTe/nTPhRsaG6T8HF
zBqDxY/O/bu42S6v+o4g
=jh4V
-----END PGP SIGNATURE-----

--rZHzn+A9B7nBTGyj--

--===============6662910022846350501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6662910022846350501==--
