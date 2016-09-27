From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: dgraph, tlist,
 tcon: MSVC error due to array of flexible structs
Date: Tue, 27 Sep 2016 14:45:56 +1000
Message-ID: <20160927044556.GH30322@umbus.fritz.box>
References: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5567869320403155731=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0t70SpzDrSr
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:30 +1000 (AEST)
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


--===============5567869320403155731==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MP5ln1Rcf9Bvi+ZW"
Content-Disposition: inline


--MP5ln1Rcf9Bvi+ZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 10:31:16PM -0600, Kevin Locke wrote:
> Hi all,
>=20
> Building dgraph using Microsoft Visual C++ produces the following
> error:
>=20
> dgraph.h(25): error C2233: 'edge': arrays of objects containing
> zero-size arrays are illegal
>=20
> The issue is that MSVC supports flexible array members, but does not
> support arrays of structs with flexible array members.

Right, which actually makes sense - how can you have an array when you
have no way of knowing how much space to allocate for the flexible
members.

In fact what TCON really wants here is a true 0-element array, rather
than a flexible array member, which is not something supported by the
C standard, or many compilers, although gcc has it (predating standard
flexible members).

> My
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

C11 only allows flexible array members as the last element of a
structure for obvious reasons.  For the same reason, a structure
containing a flexible array member is only allowed as the last element
of any containing structure.

I doubt the result would work even on gcc (it was exactly this case
that caused me to write TCON_WRAP()).  It's almost certain not to work
on a compiler that doesn't support flexible array members in arrays.

> 3. Change TLIST to use TCON_WRAP?  I don't understand TLIST/TCON well
> enough to know if this is really an option.  Hopefully an expert can
> weigh in here.

So.. in a way this has already been done.  The tlist2 module is
basically exactly like the tlist module, but using TCON_WRAP instead
of TCON.

IIRC, Rusty didn't want to simply replace the tlist module in case
there could be subtle brekages in usage.

So converting dgraph to use tlist2 instead of tlist should do the
trick.

=2E..

I had a quick look at this.  It is a little fiddly.  In addition to
using TCON_WRAP(), tlist2 also uses the tcon_container_of() stuff so
that less arguments are needed when using the lists.

This means that the from and to edge lists would need slightly
different types, so we'd have to implement them as separate fields in
addition to the other changes.  That in turn means there are some
places in draph where we'd have to have an actual if / switch instead
of just looking up the right edge list by the DGRAPH_{FROM,TO} enum.

I don't think there's any showstopper there, just some fiddliness.


So that leaves the question of which is the easier approach:

  * Change dgraph to use tlist2, including separate from and to lists

or

  * Change tlist in place to use TCON_WRAP more minimally (avoid the
    flexible array member, but don't use the TCON_CONTAINER() stuff)

> Thoughts?



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MP5ln1Rcf9Bvi+ZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6fmCAAoJEGw4ysog2bOSl2kQAKFyQug8mmSFEvyC7ylD+K/i
Draqen3/IwzrqjOfUWbvLcKMUGaXli3kSh9SXdbsO7gleR9exi+oC6u0vMlHBqOf
uePEGcqkTUEu1/SGHVGd7v0RzsmLhU8kujsMo0SaWrtdp0ncp6cll+G7SBzJ3uGu
o/MYTNitvyFZqfxaTElrfqJC95UxZ9DFxly4bhp/ldeAZWpzQEGUrCdU5dn97X+R
1EvYcvvmc5XwCcQJgkVh0TIxmtQyB5k4nEqL6LOiaT7NReGEd61P9apADYQ0/KUW
hVgDYRA98kEI4q5DDycQ7EGELf1lZBSgk061akHhl70hiIcsD2XsRvlq0dC0Rego
Q+1iJXGqPEjCvv7Ff6mOXATJNwe3XQCj2VCWPUudBn1xUkLR0NesaaWeWRQVX39O
X6dEI6e77rZ5o05vc1AzFfowf2983fopyW97kl6UbbdQPO3u4IEEkBm2EVQRjUUE
lc4P3t2sNDMUf5y+9Wi6PxKQ8CdYkbncQWD1ZSiTu2Q/mvQKJfWAiAsggl9vJted
C0Ek8n9Z368Ac2crJdU0+TAn0mHgCd4ujcWlezgbsd+Z1WpoUYem1wrcYHJKlh8s
ZMnou2WBw9/HS4IY1FZPAWLPQtINsoWDE6cFDWNqztyabfldU8BHKkqJFDW2kut6
qIDhxlYML8dMO99JbExq
=Qaqt
-----END PGP SIGNATURE-----

--MP5ln1Rcf9Bvi+ZW--

--===============5567869320403155731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5567869320403155731==--
