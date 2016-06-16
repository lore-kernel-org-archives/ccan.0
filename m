From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/5] altstack: Don't use 0 pointer literals
Date: Thu, 16 Jun 2016 16:45:43 +1000
Message-ID: <20160616064543.GE1642@voom.fritz.box>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-5-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJNPh_AUB5+0GhJ1W5GQSqN1efRpxPFajUKOPXdsVe4nng@mail.gmail.com>
 <87eg8076ep.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4253176059529976903=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVghF0GWgzDqkX
 for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016 21:12:13 +1000 (AEST)
In-Reply-To: <87eg8076ep.fsf@rustcorp.com.au>
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


--===============4253176059529976903==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 01:45:10PM +0930, Paul 'Rusty' Russell wrote:
> Dan Good <dan@dancancode.com> writes:
> > Hi David,
> >
> > I'm back home in front of a real keyboard, and want to follow up with y=
ou
> > about your patches.  I must admit that my usual practice is to use NULL,
> > and not 0.  Around the time I wrote altstack I had recently read Jen
> > Gustedt's book, Modern C.  In it, he makes the point that NULL hides mo=
re
> > than it clarifies (see section 11.7).
>=20
> (I don't really care: your code, your style).  But...
>=20
> He is so horrifically wrong, it's amazing.
>=20
> Section 7.17 is loosened from ANSI C which said NULL was 0, presumably
> to *allow* compilers to avoid the varargs issue.  A compiler *could* do
> insane shit to make that problem even worse, but you would never use
> such a compiler.  There are other legal-but-insane things a compiler can
> do, too, and the answer is the same; real code won't work, nobody else
> cares.
>=20
> OTOH, using 0 in place of NULL makes for much more potential type order
> confusion.  Not to mention confusing every damn C programmer on the
> planet.

Yeah.  I can kind of see the hint of a good idea in those articles,
but on balance they're really not convincing.  Basically, as Rusty
says, matching the conventions of the huge bulk of existing C code
outweighs the value of working with a compiler/library that has gone
out of its way to implement this stupidly.

> Note, I also assume NULL is all zero-bits,

I try to avoid that one, although I can't be sure I always have - I'm
not sure, but I think one of the s390 variants might break this.

> that size_t can hold a
> ptrdiff_t,

Dunno if I've assumed that much.

> and that a pointer to a function which takes a type *
> argument can be cast and called as a function which takes a void *.

Yeah, I've used that.

> If someone ports CCAN to a platform where those are not true, I'd be
> fascinated...

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYksXAAoJEGw4ysog2bOSb64QAJqIcE16dzBrnmt2A3vLcink
QQ8MyVDS3xV4GhWE5pQFdNDT0lFQjLZxJVwyW9ixGahFSzBUEEBPn/EN7feton7S
DdC1nuXO6IO0yohXp2xkLcc4yb+6em9G5+Fm8fNhCZ6Hith8LkNegUDVmQlPYQmz
ayL3MMmmps0TrJel3ajMORlMsrxLHMzjy6Gxi1avOIMFNuEkYhZagYMCeBHdwJJn
R43psmajmqSpx+vSiND3Ai+CDBU+dtep6vmz6NxhcXIZVc+UwxqA8Hbx4ahzKh0T
JHEXIXE0rQfX5/b6AbHt3fHuD8S1rijoMFk1uhRq/PJjB0bPQl9XDTNtwDmQa5TH
7cMRZghnZX1cDksV3GY8H5LhA+cRzVzMH6Urpy7nhAYa4Qg4SKFS5UO03s1oYyri
Ii3bTjZystBmhwWORRlGwGg4Ot1YdMx8Y0bpzBDHSb7OfMk2kybEmwcr017gy2JD
OLV24O8+MhRnRknJI3KFm+RcW95LIP3hbS/iP5HIoZINcjefthkr9CiU/NvG7Cp0
O3LrpZAKoaLJg7fdxqa5PZLdY78nOb5sxUyk5VelFZHB23af/Ips0FW0eFzRjRUQ
ioD95IlQzn+jsM8xeN/WOLYcYB5kuWu3D/JGNT6eBsQNSYAo93KKkgk+qbjsaxBl
f5zOp2NG9uifjAm05VMz
=yQfR
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--

--===============4253176059529976903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4253176059529976903==--
