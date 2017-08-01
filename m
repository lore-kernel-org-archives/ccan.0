From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: dgraph, tlist,
 tcon: MSVC error due to array of flexible structs
Date: Tue, 1 Aug 2017 15:22:05 +1000
Message-ID: <20170801052205.GO2652@umbus.fritz.box>
References: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1298710873665286055=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM4Sn11ghzDrnS
 for <ccan@lists.ozlabs.org>; Tue,  1 Aug 2017 15:22:17 +1000 (AEST)
In-Reply-To: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
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


--===============1298710873665286055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qYrsQHciA3Wqs7Iv"
Content-Disposition: inline


--qYrsQHciA3Wqs7Iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 10:31:16PM -0600, Kevin Locke wrote:
1;4803;0c> Hi all,
>=20
> Building dgraph using Microsoft Visual C++ produces the following
> error:
>=20
> dgraph.h(25): error C2233: 'edge': arrays of objects containing
> zero-size arrays are illegal
>=20
> The issue is that MSVC supports flexible array members, but does not
> support arrays of structs with flexible array members.  My
> understanding is that such support is not required by C99 or C11, but
> I don't know whether such support is common beyond Clang/GCC.
>=20
> Is there any interest in supporting such compilers?  If so, I can see
> a few potential fixes:
>=20
> 1. Change TCON to use flexible array members only when the compiler
> supports arrays of structs with flexible array members.  This is an
> easy fix, but wastes space for every TCON/TLIST usage on such
> compilers.
>=20
> 2. Have TCON (and TLIST) provide an alternative macro which uses
> flexible array members only when supported in arrays, and use that in
> dgraph.  It would increase the API and duplicate a bit of code, but
> would only waste space when TCON/TLIST are placed in arrays.
>=20
> 2. Replace the 2-element edge array in struct dgraph_node with
> separate fields edge_from and edge_to.  This complicates the logic a
> bit, since it is no longer symmetric with dgraph_edge.  It would also
> be an incompatible API change.
>=20
> 3. Change TLIST to use TCON_WRAP?  I don't understand TLIST/TCON well
> enough to know if this is really an option.  Hopefully an expert can
> weigh in here.

I've now done this for tlist and several other modules, we should have
a much better chance of compiling on windows.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qYrsQHciA3Wqs7Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmAD/0ACgkQbDjKyiDZ
s5LFPA/+OmB5nzFvPYMsyAXOXYaj8QqxhtO8CPsH6J2xA5kKO/0PpFf1gt5AmsbS
Z31dqA5+K+FapxKDZu1F/eWSMmQAeccuYKmmAtkg0zUww+4fxbF1RhARyJ7aZtNV
et1f2siptLMmfeP7wRanrH5Zed65XZXwsD3BA0d6OTpvPBr/fJ0jKy3T/i7LmH+k
QuUaS+YvZe4mpuawEDDF9TJtsQ+4b+v/MT0GisCtDM/lcSUy8ra7SDo4OPSVvNid
pJh2LSLAgYqr1XK6aW8v6pQqkZfHbwPuQ8/WWOM0o3AbPH5exkcRWFB2sgT2wxrw
hrsWJtuiVXnshEAJPVTis+h61flFJdF1QuVSbXzKZTODeHvsXrvkcali08E05M7+
caTUh9vsNgwEYonFt4EkWmRBnZInPOkqdkLa5daZALy5/Ig/vgc96uUbAj1opBsx
9NTkNuvLY6elfPRPaeSMneCWyJjJNmfGz6vA6U255gldoXuQj4XXIqC+tZpghLGc
xDScgWVW7prmiaPnFco43qrltXq1Ta5DBYzNfO3UWgd73hVVFNewbWXnc2YxWkhQ
YWIrhtYhHkZGFkexsFda0m8Z0O+jWFnJr+z9VYdQ8AeVmxwdjQK2AFOroI86jFPB
NYCjecVpKSenGynRbwn5rkvSlbbn8FD/uYVlS9ETvTYjllaI74M=
=J7ha
-----END PGP SIGNATURE-----

--qYrsQHciA3Wqs7Iv--

--===============1298710873665286055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1298710873665286055==--
