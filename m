From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: altstack causing travis-ci failures
Date: Sun, 27 Mar 2016 15:39:28 +1100
Message-ID: <20160327043928.GA15156@voom.fritz.box>
References: <1458915273.537.36.camel@aj.id.au>
 <CACNkOJPk7O27tKdOxoF9BipEfN=hKHkgA-9=mztyVku_mbePsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4133245938891066045=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qXrpl0kj8zDvsD
 for <ccan@lists.ozlabs.org>; Sun, 27 Mar 2016 20:10:07 +1100 (AEDT)
In-Reply-To: <CACNkOJPk7O27tKdOxoF9BipEfN=hKHkgA-9=mztyVku_mbePsA@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@dancancode.com>
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============4133245938891066045==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2016 at 10:06:51PM +0000, Dan Good wrote:
> David did some remarkable investigation into it about a month ago.  The
> code has always worked on the Red Hat based distros I use, and David
> patched it to work for Ubuntu 12.04; so it seems unlikely to me that any
> real person would be affected.  I suppose I'll try to talk to the Travis
> people about the specifics of their environment.

Yeah, working out why it is failing under Travis is a real pain.  I'm
actually tempted to add altstack to MODS_EXCLUDE so it doesn't break
the travis builds any more.  It's kind of nasty, but then all the
things in MODS_EXCLUDE are a bit nasty.

> On Fri, Mar 25, 2016 at 10:14 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> > Hey Dan,
> >
> > I'm seeing a ccanlint failure for altstack on Travis-CI, e.g[1]:
> >
> >     ...
> >     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/aga
> >     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/agar
> >     agar: Total score: 36/38
> >     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/altstack
> >     altstack: Total score: 31/36 FAIL!
> >     make: *** [summary-check-altstack] Error 1
> >     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/antithread
> >     aga: Total score: 48/50
> >     ...
> >
> > FWIW I haven't had this happen when running `make check` on my machine.
> > I ended up pushing the changes I was testing as the failure wasn't
> > related and wasn't something I could trigger locally (the commit tested
> > above is currently at the tip of master), but thought it would be
> > useful to highlight that something strange appears to be happening with
> > the altstack module, at least on Travis-CI.
> >
> > Cheers,
> >
> > Andrew
> >
> > [1] https://travis-ci.org/amboar/ccan/jobs/118466416#L534

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW92P/AAoJEGw4ysog2bOSEDIP/jd2kLzHPLAzRupem3Q7r+WK
14atJfKdKfIV2a/tPus1NTmlU0RwsxMj6U9Vpu16aYo1yK5RJSeOytvJDJhPp4+E
9QOKx45DLSTVD2zoWE+Z654TnrXQ//1HNiNxGNWkDsKenEKjUMVIWXJcrl26jqbB
bM+gGms6ZF2f99dNX5KaRyNijzNBYv+Djrq3YyDWaUc/lZIEZ2HjLtpz41Wp3Os+
Fui0wJM4vebbuoHMu6iATfu5M0+MzxvxtDiejPn3+0Q1/fdlAgHoJDzXSM5FPcfB
sADnuSLY8NIvnMh7zFTs+3yXSh+OsvbaOglgNm+fb2Ew0mn57xmJapuubjGmJFys
QaF+ipR3XHDKPJS468j5jrlakYginn22bJh3jKquKDzbxeHsZxD4oaKUooZWr1ES
+AZ/iII5m2Gb0K4qEeEbyL9ZpJ8OiFvX08rgXIuBZsK+cynq+rLz01Up2KMCIThz
HcDrndp3A/7uEUIzPEWfeFs8qKZ1x5eUDaP8ZsDX7VHzEgiACcMqHjsG37/SDPIy
iiyUdfBU7th/mxbKPNG63ihmkpQiAaSbJNrZvLRcV10zzMls17AhLM4LOcdcdamD
J0EGwF+0ysLLtYkqqNIsn+jXoVpnZ9gpZ54GOERUMhkgYvC3xzgpWBphRKpGmoqH
VCyEgwwJNVf/wS5KrQ1u
=Kre6
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============4133245938891066045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4133245938891066045==--
