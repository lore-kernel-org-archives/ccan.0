From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] ccanlint: enhance and streamline "output"
	testing lines.
Date: Tue, 29 Sep 2015 00:32:36 +1000
Message-ID: <20150928143236.GN11620@voom.redhat.com>
References: <878u7rp6z8.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4717510777922926589=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3C92C1A002B
 for <ccan@lists.ozlabs.org>; Tue, 29 Sep 2015 01:57:27 +1000 (AEST)
In-Reply-To: <878u7rp6z8.fsf@rustcorp.com.au>
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


--===============4717510777922926589==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DH4/xewco2zMcht6"
Content-Disposition: inline


--DH4/xewco2zMcht6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2015 at 12:48:03PM +0930, Paul 'Rusty' Russell wrote:
> 1) Require "" around input
> 2) Make them optional around output: if not there, loose match whitespace
> 3) Handle \n in output.
> 4) Document that "Given xxx" is optional.

Patch looks fine to me.

>=20
> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DH4/xewco2zMcht6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCU+EAAoJEGw4ysog2bOSiY8P/1SOnh56wQ1v0kdDwN6mthj4
eBvYR/iTDDK6qcTfjK2EJigzjVbx1mAiAbcLxFRK2GcjVDQu5GL38mPKNnx3OG0z
Df+SX1nrGve4QP+BcZpqwK86euBGeHNfl9I7z51h9PYNSos+gFzHs+GfFASyPNG9
lobV9qWcFsl1xXOYac8VdeZPL2SMauk6h5WnLnzIBoBf6LgCHdYcttT/nHpMSazV
NdK5Cy/WQqcmLKjq0NtjEw+uXTe0qqFaOR/WxLx2+GArjRT3fCWAR+yLHciMiIUU
X/xLgnzT3ePtIKldEApnDbUijCmpP+3yGoP8QcBlxafDy874l2NJUV51BZooDNpv
g9Or/P1en9j8ZlLNT8dLD95M0iY4kcWsF/es+8ciWfP35ZlsjTa179f2Uz6QduDg
H3MnpXtO66XrOn41ZWHO9IptldCguE7OVXwcUhqohuabWwcsk99c9gTLILyYVjII
+DHgV7yUmcYwNM+el+3iItXg/q66bUqDm4VQiCppbJ7nYRIxCgRa4am6T5SWJTkT
m27rtDURIUeKjxyzS3WnvHyqtSwYE7fc9mpkDFTBkskPrFUePpJ12J6rBHm3Uhxj
WcFvgCEV4NIrLX2sx0kjHoRFih738qRYMhkkaFtoIwTIpCKyTVtSehKRuHaGAI74
AY/dgdX60USNbxhC6ZwC
=JcZz
-----END PGP SIGNATURE-----

--DH4/xewco2zMcht6--

--===============4717510777922926589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4717510777922926589==--
