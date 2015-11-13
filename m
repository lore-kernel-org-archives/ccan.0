From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/5] aga,agar: Dijkstra's algorithm
Date: Fri, 13 Nov 2015 13:02:35 +1100
Message-ID: <20151113020235.GL4886@voom.redhat.com>
References: <1447328568-14917-1-git-send-email-david@gibson.dropbear.id.au>
 <1447328568-14917-3-git-send-email-david@gibson.dropbear.id.au>
 <20151112215951.GA16207@flamenco>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5382495523778386184=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8D3531A08FC
 for <ccan@lists.ozlabs.org>; Fri, 13 Nov 2015 15:04:09 +1100 (AEDT)
In-Reply-To: <20151112215951.GA16207@flamenco>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============5382495523778386184==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ms5iOKSBOB9YS8zC"
Content-Disposition: inline


--Ms5iOKSBOB9YS8zC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 04:59:51PM -0500, Emilio G. Cota wrote:
> On Thu, Nov 12, 2015 at 22:42:45 +1100, David Gibson wrote:
> > This uses the lpq module as the implementation of the priority queue.  =
That
> > means this implementation is some way behind the theoretical efficiency=
 of
> > Dijkstra's algorithm.  It should be reasonably straightforward to swap =
out
> > the priority queue for a better one in the future, though.
>=20
> Have you considered using the heap module?

The aga module (unlike agar) isn't supposed to allocate memory,
instead using the structures that the caller embeds in their own data
structures.

Unfortunately, that means it's not possible to use a binary heap - at
least not the usual array based implementation.  You could make a link
only based implementation, but it gets so horrible that you might as
well use a better data structure (e.g. a pairing heap) at that point.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ms5iOKSBOB9YS8zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWRUS7AAoJEGw4ysog2bOSAEkP/jO+W6HTHFruJP5YH5tCQi/i
L1Z/OHqytvFVGLM8yg2mQKyqFb09EiDqk61WFSWpfwFG8B5yyAk3iwnpR8Puh4FO
p3MosrbQNIeGgCtmPzmi6EPGn+KK/+tqOMgS67w/ssBugB6JhT7QX/aBfxWF4uAk
sReAXlU5ub0WWE+D0/K6EUTgujukKBr0im4uTCckIie81kW8dsLl1PPimjRFnfBZ
bEBj08dGn/rPk70iuk3oDVDGdYwy2BLQNvRsA1Vwoc3btMSHo6SiQamgpTF/gSso
j0iX4x2mF7Z6IcEydK1NJcoIzZsy9SVTUECwWkoZHjl6sO//wVIJH9aV2EzOjRS0
WJAX5P9LjoBtObCLzqyx6dCyb5ZIjXA78+WzRXwWeEaE7rHNJ75An5gOqrypG7Jv
vkJptqoWQu+x2u9cLnj6LISLEq8SI6Ogr4SQR+7DMwJ3PiwzL0jNVJmtnRXEOtIN
zEB0G9qQ79ySq5MFgfagrnpiox9PFm/s9RaEC5QGsRIugq5LyQ/7QnjY+bKZbv6R
dYr/DsGLZv2BjnJK1/TMf/Oql2emrdTsHdTwaY7Dc9bQIX/Ob2F3lxgsh/fMkVs1
7Q92XtOwkBoHaNnuGrM4x4yWt56THkGS5Ddafsz3FJ42KEodbaE7OAiSM4D3f3er
hesUAefG4M8QiBWSMQJn
=PDVf
-----END PGP SIGNATURE-----

--Ms5iOKSBOB9YS8zC--

--===============5382495523778386184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5382495523778386184==--
