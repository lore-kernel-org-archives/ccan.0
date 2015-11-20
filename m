From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/5] aga,agar: Dijkstra's algorithm
Date: Fri, 20 Nov 2015 17:21:36 +1100
Message-ID: <20151120062136.GE18707@voom.fritz.box>
References: <1447328568-14917-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7496601767453966670=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BC0AC1A0018
 for <ccan@lists.ozlabs.org>; Fri, 20 Nov 2015 17:28:56 +1100 (AEDT)
In-Reply-To: <1447328568-14917-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============7496601767453966670==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 10:42:43PM +1100, David Gibson wrote:
> After many diversions, I'm finally ready to paint this bikeshed, with
> a brush of finest yak hair.
>=20
> This series implements Dijkstra's algorithm for single-source
> shortest-path in the aga and agar modules.

I'm going to take silence as assent, and have commited this series.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTrvwAAoJEGw4ysog2bOSarwP/RnNnUs1gvbeOR5JlxH87J+R
OwCFGoj+JsGAlAgRPu7s7PKxS/ODRZk5SAhubHra2707s5OpVlzXu6NhUuzOiA5C
VVf4XmhTfOGcvv4KXlzCBjs4QJa9EjH17seQyvncr/IDYnZTCsGIa2DgcABW+Gg4
ngn0KoACqDhErbjBrZ04mNZdFdZhWCBs8QSKebZzLhh1Jzy08Z+Ay4Q6vppfdTav
hYRWiIHk552dMPUM8GUqWDiGUKuJMd9PMkNPCSMNHNQhCgATXIHxZ+qRWdb7nowE
lxmPuvKUTT9txon/g8onHfARwzOnw94Sp0jJTISLnFykl+1Jn1AN6+PDZhvkw7GY
AkyuWsmPJH1JnWlNAEPBfZTFRQlxhpvVxZClxP75hDa1rrhJg/2nLQTynwuSkmBY
8kHG9Sj22h5I8soLNRTlCPiPsGQrBiMpZ1b3VvVmvlWgn34aww8Kn4qorBrCH+1j
MINyn8GvzFWxu4oKNBOnW+cfiPWjqN2qiLZ0VpM+KBDOJYz9gtyN3jyetlc6S6ul
fdr/90u6DYlWSTt6Bb6BzdLPuCmF89kZ9Ubh3RobdIyVLmSzQCndO9RxxzUIOR8t
ELDsMdndFQ6HG11a1bW4b+5JolGOYXRxCJ2tonFDgVX87tDwKaIfADXrEluaf1r5
EOGvPoLr/8lHyPqVjc8X
=GwA/
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--

--===============7496601767453966670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7496601767453966670==--
