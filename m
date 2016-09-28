From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 12/13] Makefile: Define CFLAGS_FORCE_C_SOURCE
 macro
Date: Wed, 28 Sep 2016 12:01:27 +1000
Message-ID: <20160928020127.GC18880@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <a0934c257f9a1fb5c99b89fd6cf01e7b450d0f10.1474600863.git.kevin@kevinlocke.name>
 <20160927051850.GT30322@umbus.fritz.box>
 <8760ph3lxi.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0311574913358183328=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skMD82HrCzDrWh
 for <ccan@lists.ozlabs.org>; Wed, 28 Sep 2016 12:32:08 +1000 (AEST)
In-Reply-To: <8760ph3lxi.fsf@rustcorp.com.au>
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


--===============0311574913358183328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2016 at 03:48:33PM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > On Thu, Sep 22, 2016 at 09:33:15PM -0600, Kevin Locke wrote:
> >> This macro holds the C compiler flag(s) to force input files to be
> >> recognized as C sources regardless of extension.  It is defined to all=
ow
> >> overriding on the make command line.
> >>=20
> >> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> >
> > So.. this approach works.
> >
> > But I've been wondering for a while if the weird thing we do of having
> > the _info files not have a .c extension is a good idea.
> >
> > I think the underscore enough is probably enough to mark those
> > special, so things might be less messy if we just called them _info.c.
> >
> > Rusty, thoughts?
>=20
> _info.c breaks the "compile *.c to get the module" rule, though.

Which is already broken by modules which have a non-trivial Makefile
fragment (like ntdb).

> _info is for both machines and humans, so it's a border case, but I
> think it comes down on "make the machine work harder".

Ok, let's keep this patch as is for the time being then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6yR2AAoJEGw4ysog2bOSSFQP/2zV+XXWNu98TqFOmoahhbah
hyUo+ofRJDE+Vuh2HiUWWUx6sLC87Ee6ti6WnPPPZea87JDZG8TG1XQXn1TOm5Xl
XNw5Z/fCcn5UB0lfmkui7TP3+HkUOrYaNLLni3Gz0PtzkvTHeaOBFJTyMlzPehEP
2QM9VsJwceBQe3xFb3tGGHI5sgmWeYab1AhEOYULDTWDhysMT2tKY6pK0uChaM9s
aSLeiaC8vQIFY8PMguKAfnPuyw5h1YwWDPeRJnFR/NQ2dVto/tX0RcOIs4zwVXh8
RUeEFgOyuMiTC6vlnKgzGL6Isw5Zhqkxz7+aV2aHhXfq8EvfddjOSriPjmhEtbCw
S2BJ6fS0l9YATPOZ1rYXC329TQ6HbmbhAjP14LvGmNh7cZgtxvOCdQ4yL1DJR/6X
af3/Oh30a4PE4L9NbuXPjpRFOwXalzPAEKB0FE787lP+o3D8JjRefkgd9XThnhjK
AUV+VNp7ZDptflTwczLVtaqgfPU830wWPiqfrEAA3GWdOefQnYIBdXzx0CJRqd0S
rnofTd0Ts5OM4R8GhedByLnkAJOi3z8EigB3nFLFJIZ0fD2RPMz90HxWBY00qtAA
T+VTpivMicQlN9mcmCnrMsErOAyF0YO0XUu2GIYHChTTk2f0Fk8sxN5miOKQUrxL
849L9JTO1VLgeVApGqYc
=x2Vd
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--

--===============0311574913358183328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0311574913358183328==--
