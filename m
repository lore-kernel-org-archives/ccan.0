From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: deque: New module
Date: Thu, 31 Dec 2015 23:38:40 +1100
Message-ID: <20151231123840.GB9329@voom.BigPond>
References: <20151223121144.GB27038@ip-172-31-61-248.ec2.internal>
 <20151228034337.GA15174@voom>
 <CACNkOJNGhRC57PdOifUau7F+Rn_URYjOkKym1XVanXxptoeJYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6476732836208925081=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 80F531A00EE
 for <ccan@lists.ozlabs.org>; Thu, 31 Dec 2015 23:38:05 +1100 (AEDT)
In-Reply-To: <CACNkOJNGhRC57PdOifUau7F+Rn_URYjOkKym1XVanXxptoeJYQ@mail.gmail.com>
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
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============6476732836208925081==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2015 at 06:00:50AM +0000, Dan Good wrote:
> Thank you for the feedback.  I have a practical question - what is the
> workflow for making changes to this module, now that it's been merged?  Do
> I clone, then branch, edit, commit, push, merge, and finally mail a patch
> to the list?

That's one option.  You can certainly continue to send patches to the
mailing list for your own module as you could for any other module, or
patches adding a new module.  That's a good idea if you want some
review on the patches, are looking for a second opinion or whatever.

However, having been added to gitolite you're now also able to push
commits directly to the master ccan repo - as long as they only touch
files within "your" modules.  To do this you need to add
'ccan@ozlabs.org:ccan' as a remote to your git repository.

If you do push commits directly, please do remain disciplined in
making logically consistent commits with good commit messages (and
Signed-off-by lines).  The usual workflow for many contributors to
many projects, including ccan, is to work in your own git tree for a
while, but before pushing to the master, "polish" the commits.  git
rebase -i is very useful for this and allows you to adjust the history
so you have a logical series of changes, with good commit messages.
The idea is to have a "logical" history that would be suitable to send
out as patches for review, even if you don't actually do so.

> I'm still learning git.  I've been on the rcs/cvs/svn
> bandwagon for a long time.

Yes, distributed version control and the different workflows it
allows can take a while to get used to.

In particular people only used to traditional vcs sometimes react in
horror to "changing history" which git allows very easily and is very
common in many free software projects.

In practice, when it comes to the master tree of a significant
project, the cleaned up "logical history" is generally more useful
than incorporating all the details of experiments and since-corrected
mistakes that usually happen during real development.

> I'd like some clarification on the need for portability.  Once I read your
> comments, I came up with an ad-hoc list of platforms I felt I could
> reasonably support: major Linux distros, FreeBSD, OS X, and OmniOS.  I
> tried the module on each successfully, though ccanlint needed changes to
> build on everything but Linux, and the failtest based test went rogue on
> two of the platforms.

Right.  So generally it's better to think in terms of specific
required features, rather than supported platforms.  Many of those
already have #defines tested by the ccan configurator, and others can
be added if necessary.

I think the point here is not so much that we really expect use of
common-but-not-standard features to break things in practice, but more
that it's good to have reliance on these features documented in the
code, to make life easier for anyone who does try to use this on some
obscure compiler in the future.

And yes, I'm quite sure there are many existing portability bugs in
ccanlint and other parts of the existing infrastructure which would
mask portability problems in your module.  But that's not a great
reason to increase the amount of non-portable code.

> Compound literals are a feature of C99 (nice article:
> http://www.drdobbs.com/the-new-c-compound-literals/184401404).

Ah, yes, I'd forgotten that.  I think we are generally assuming at
least C99 availability in ccan, so that one's probably ok.

> Intermingled declarations and code are also from C99.  Half of the
> platforms above use gcc and half use clang.  Both gcc and clang support
> statement expressions.  The _XOPEN_SOURCE define in _info is there for
> getline(3) on Linux which is used solely in the demo code in _info.
>=20
> Is there a set of platforms CCAN targets for support?  Is there some way I
> should document that the code is C99?  Would the lines below be the right
> way to handle the statement expression dependance?
>=20
> #if !HAVE_STATEMENT_EXPR
> #error Sorry, deque requires statement expressions
> #endif

That's certainly the simplest way of handling this - see the 'minmax'
module for an existing example which requires certain features (in
particular note the Ccanlint: directive in ccan/minmax/_info).

Better still would be having some fallback to avoid statement
expressions, but that is often messy and occaisonally impossible.
Using #error for now and adding a fallback in future if you can (or
letting someone who needs it do so) is entirely reasonable.
>=20
> Thanks.  -Dan
>=20
> On Sun, Dec 27, 2015 at 10:45 PM David Gibson <david@gibson.dropbear.id.a=
u>
> wrote:
>=20
> > On Wed, Dec 23, 2015 at 12:11:44PM +0000, Dan Good wrote:
> > > deque - type-preserving resizing circular deque
> >
> > Concept looks good.  There are some fairly minor nits in the
> > implementation that I've noted below.  However, none are serious
> > enough to hold up merging, so I've applied this.  I did modify
> > trivially to remove some trailing whitespace.
> >
> > It would be nice to address some of the comments in follow up
> > commits, particularly some of the portability issues.
> >
>  [...]
>=20
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWhSHQAAoJEGw4ysog2bOSgz4QAKBZ2ALfXI/VYGzvFlWfSlnZ
OGBT1o28bcO5kEnukGnf/+1h/Lel1jMq4jheb2H49zRFGahK9gG7GYs3g/TrihPq
obi14yxcu4rNQujctVdfXGcvcXsf88n3PxHqnjRW6Key9/1nmkWn/eN+Ki70HMvZ
WTSybJPDNe47jCAB087aJEI3+FuzQ5fZqyqozUn0hZo+p0CDk2JlCHQD1AIaywK1
y+z66cLd6dAWUgHACfWtq0PTOCYJ/4e64FukGjkM8xcC0OtjE+G/zRn6F4z3U+fn
XeSzqMVWA9fwF68qVVyLeMQ2ujKMGAGyUAEGx/6C0X2ajROfvCh99VSu16dCXaCE
4pHoUvU9GBE1K+Q7KSRzKhikzTI3f4592hYz2HazGLy9ee6C7TPEqcuUX2YSV5oD
ZTLV8QXnRywmPrFznxfknQt6lDHSIiVsbpdx3SJq3tErKmbFtI7uVwrEPKj5T7CR
WjvxwaKWdjuA8Td4ZZZFsjzvGFMZwIccO40DjbB48meUhnTPA9sA70/PW9BGmJPd
17awoxT2kyCc5dr+jtLzcvgssYRoQ7TXtuinuHjoVBAUlfW1O0DeIY48ufDhWdkn
k13eTuvzVREidMo07okiL2u/aJ1sDLyZ3yn+cNhbHlZUTsbNfMqPqg1wFTRQLGiO
SWn/7N64U4JKgio+6zHL
=TUPc
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

--===============6476732836208925081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6476732836208925081==--
