From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 8/9] configurator: Pass output cflag to
 configurator
Date: Tue, 20 Sep 2016 23:32:41 +1000
Message-ID: <20160920133241.GJ20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <39df3703e2b3c4be2524990f4a8ea10fa3a42b21.1474239353.git.kevin@kevinlocke.name>
 <20160920052359.GR20488@umbus>
 <5e147bac-4111-060b-1fbe-f652bbfd7dc0@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6307137469063739246=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdlL31vydzDsfn
 for <ccan@lists.ozlabs.org>; Wed, 21 Sep 2016 00:21:15 +1000 (AEST)
In-Reply-To: <5e147bac-4111-060b-1fbe-f652bbfd7dc0@kevinlocke.name>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Kevin Locke <kevin@kevinlocke.name>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============6307137469063739246==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2zkT5PsbWu6kxoCU"
Content-Disposition: inline


--2zkT5PsbWu6kxoCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 12:22:47AM -0600, Kevin Locke wrote:
> On 09/19/2016 11:23 PM, David Gibson wrote:
> > On Sun, Sep 18, 2016 at 06:52:05PM -0600, Kevin Locke wrote:
> > > Unfortunately, not all compilers support -o as a command-line option =
for
> > > specifying the output file.  Visual Studio cl.exe issues warning D9035
> > > when -o is given, which is detected as a compile warning by the
> > > configurator.
> > >=20
> > > To support such compilers, pass the output flag as the last flag to t=
he
> > > configurator.
> > >=20
> > > This is a breaking change.  Existing scripts which pass flags to the
> > > compiler must be modified to add "-o" as the last flag.  As noted in =
the
> > > cover letter for this patch series, I'm open to considering alternati=
ves
> > > if this is unacceptable.
> >=20
> > So, as it stands, this change completely breaks ccanlint on POSIX,
> > which is not ok.  Specifically it looks like the problem is that the
> > DEFAULT_FLAGS from the configurator make it into CCAN_CFLAGS in
> > config.h.  ccanlint then tries to add further options and its own -o
> > to the end of that, which isn't going to work.
> >=20
> > In short, I think the problem is that ccanlint needs fixes to work
> > with MSVC (and possibly anything much else apart from gcc).  I think
> > we need to look at how to fix that and the configurator together with
> > each other.
> >=20
> > Not having working ccanlint on Windows seems like a pretty big, since
> > its the main tool for testing ccan, amongst other things.
>=20
> Good catch.  I hadn't noticed the ccanlint breakage.  That was a big
> oversight on my part.
>=20
> The breakage likely extends to any other programs which use CCAN_CFLAGS,
> since none are expecting the output flag at the end.  Perhaps a better
> solution would be to emit the output flag as a separate macro. Something
> like CCAN_OUTPUT_CFLAG.  What do you think?

I think that's a better option, and maybe the way to go in the short
term.

Longer term, I'm wondering if we want some sort of mini-library for
shared use by the ccan tools - configurator, ccanlint, etc.  Amongst
other things that could have an "invoke compiler" function which
abstracts this sort of thing in a more general way.

Of course, this borders on the questions about use of err() etc. in
the configurator - within the tools themselves, what can we and can't
we assume about the system.

> The command line API for configurator could either expect the output flag=
 to
> be the last argument as currently in the patch (which is a breaking change
> for anything which call it).  Or a command line option such as
> --output-cflag could be added to specify the flag and preserve command-li=
ne
> syntax compatibility.
>=20
> Thoughts?

--output-cflag is kind of clunky, but again might be our best bet in
the short term.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2zkT5PsbWu6kxoCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4Tp4AAoJEGw4ysog2bOSl3oP/3rHT3JZEO50Cbzn/Bh7VuOZ
e2X2frh6I1pQnl3Xf3vpL55HI944LKTsvpXIT3vQlF/ohHQKeorH42G43uAgYI+S
9eJrpDs/9FywZrvCF1cXkWUKG0SEdpzuzmorwF8WaltAqCZ/YOsYG5rgTGnHSOTT
TllvUPiux0n56lnrgvvgX5Dm0s1P7W+a4qoQKYSUkiucf9phiRIkzFckw83a/Ozc
YdSmQFYX+Kj6uDjcY05qYR5YJE65nB0SYeRbc02WM63ucW91YHllaGkVjvtZLnNW
d235XdowYIA2G1s27YRB1hSBccrZ+qx+Rozn7vikXbH/jXg0Zsk4LT9ZIjNaL8Ah
1v6/pvmmyAtUx4sbcmuGdq7a2j5QNpN8SYW3p0otevw5BsGV+7zx0eMhVg+TMPnx
/btbsvmMfG7U1i0kVyjdfGFYhL6cNdov90y6r3AKoZVcHT13y51DMZa7zZPsWdkr
nl2UwcnxeDM6cjedt7Ukp9eCY/FzUxaqeKWBQfN4vyLprXu4mK0pHmA8x9QsEzvw
z9DYWdPlY3CWWYBOQqxAgcyeQ0tNyqyUHA1xt3sm54z9Wh61xZiZWR/JN17+VZxW
+zSZBPsV8grExpW8mks7MxViN7hYxbK1ruiEmRGhaxtdn+echNAlTqVQGwV6hDcs
cQtIGtOnvmew2sr/vulv
=6Wj2
-----END PGP SIGNATURE-----

--2zkT5PsbWu6kxoCU--

--===============6307137469063739246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6307137469063739246==--
