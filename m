From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: dgraph, tlist,
 tcon: MSVC error due to array of flexible structs
Date: Wed, 28 Sep 2016 13:12:40 +1000
Message-ID: <20160928031240.GG18880@umbus>
References: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
 <20160927044556.GH30322@umbus.fritz.box>
 <87fuokn598.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402593934757593722=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skNZx6QjHzDrZR
 for <ccan@lists.ozlabs.org>; Wed, 28 Sep 2016 13:33:29 +1000 (AEST)
In-Reply-To: <87fuokn598.fsf@rustcorp.com.au>
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


--===============1402593934757593722==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline


--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2016 at 11:40:43AM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > IIRC, Rusty didn't want to simply replace the tlist module in case
> > there could be subtle brekages in usage.
>=20
> BTW, I think this gives us good reason to simply mv tlist2 -> tlist and
> fix up the callers.

Hm.. perhaps.  As noted in another mail, converting dgraph at least to
tlist2 might be a bit ugly.  The two lists it keeps would now have
different types, so it couldn't just keep them as an array, which
might make things less natural in other places.

Maybe any extra switch/ifs will be cancelled out by removing (or
folding into) existing ones.

It would also be possible to make a more minimal conversion of tlist
to TCON_WRAP() which keeps the tlist interface unchanged.

I am thinking we should probably phase out TCON in favour of TCON_WRAP
everywhere - that flexible array member is causing repeated trouble.

Another thing we might want as an interim approach is to add a new
config test for zero-length array members (as opposed to flexible
array members).  TCON could then use those when available and fall
back to the space wasting 1-member array method otherwise.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6zUnAAoJEGw4ysog2bOSH7MQAI9GQXBAIIiWX/LQ73j5MtHX
HoH90Nifd5Cj0P81YmbEev7irxXB5/LUk1sVTowRF29L1J+0z4k7+4C1VjabF2E6
tBH9gCnwt+9F9W9F1cpKgovjMyDTOd29/xj4ND+UmmqjwjsjCsQisNtyocA1Cm5L
rmuFMPCtCgJu1m9Mz88GQMSTc5vB8id32JArNMDSc9/gEtBE3zhbT3HtRaRuZnGo
KE3ymszNScCwu1YjPx6OM8ZxpKi/lG+MDimT7zSH5esYlfnmfL/ruNDgVRyzB1Ny
1bmKYDAFaIjk20efQXiTZ+2EA/VkdzcJ/afUN05NH98opig+7cI0BK6ILdbpP9Re
sCrfYMhsrVgkbpXsGHG9231XejlYoERrjiYEYjUw9FHNRs9DanIy0r8xc8ozT9LD
WHr+HjPkMn6YmuXI+NxEDW58vRuArC3SyOcKFzkJ0vJ/iAonE77CcR5qUs/PN8A9
r1TvSqGvxaMqrR4SwWtAW5T6/YAbt+SvocCyFYd3YloWGOstKK7d9CCT97IGQio3
FW0n6ZTTiUIg4Z8hEvxKe6rQkFAwBfdszD/4I02cnZnmscvpz/Jo6XlLXO0wbBas
8ZBBrG9o3RI3bF/K9B6kyj1ljbqFIPOJJBRF87Yx9ZT80r8Yi9NGG7b2CIL5dLnJ
c39uN/JZvma7eiFDmP1Q
=XpnS
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--

--===============1402593934757593722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1402593934757593722==--
