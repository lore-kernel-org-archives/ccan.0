From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] altstack: stack alignment and accounting tweaks
Date: Tue, 16 Feb 2016 17:03:58 +1100
Message-ID: <20160216060358.GN2269@voom.redhat.com>
References: <20160201024316.GA3210@ip-172-31-61-248.ec2.internal>
 <20160203061648.GR15080@voom.fritz.box>
 <CACNkOJOjgaHTBaPGjK+xbzL+WCpgbzOiy8WGDvAgz2vUpXca_g@mail.gmail.com>
 <20160215105444.GX2732@voom.fritz.box>
 <CACNkOJPFBrYcA9AxmqCnkgSD+f-dQFM2WOUUQZrz08Jn5MJqVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8872775952797079917=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 711101A002B
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 21:04:16 +1100 (AEDT)
In-Reply-To: <CACNkOJPFBrYcA9AxmqCnkgSD+f-dQFM2WOUUQZrz08Jn5MJqVA@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@gooddan.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============8872775952797079917==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1R6ZDISWaA1muLP0"
Content-Disposition: inline


--1R6ZDISWaA1muLP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 06:29:10PM +0000, Dan Good wrote:
> I thought I understood from our emails at the end of last year that a
> single "polished" commit was desirable.  Is that not the same thing as
> taking several very small commits and bundling them into one?

Often not, in practice.  The ultimate goal is reviewability (both
before merging and when looking back at the commit history).  But
that's often accomplished different ways depending on the situation.
In particular it tends to be different for initial commits of new code
=66rom changes to existing code.

For initial commits, it's generally best to elide patches which
correct false steps made during development, or really anything which
doesn't increase the total code size or complexity significantly.
That gives less commits to review, and cleaner code in them to
understand.

For changes to existing code, however, the important thing is
understanding why the change is desirable and then that the changes
actually accomplish that goal.  That tends towards small, single
purpose commits, so it's easy to see what changes belong to what goal
(explained in the commit message).

Of course, that's a very broad rule of tumb, with plenty of exceptions
and wiggle room.

> On Mon, Feb 15, 2016 at 5:53 AM David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > On Wed, Feb 03, 2016 at 11:42:11PM +0000, Dan Good wrote:
> > > "messy bitser" - what does that mean?  That's bad, isn't it?
> >
> > It's... mildly bad.
> >
> > By "bitser" I mean that it contains a number of changes that aren't
> > closely related to each other.  In general that makes a patch more
> > difficult to review.  How important that is depends on the complexity
> > of the changes and how mature the code being altered is, so it's not
> > really a big deal.
> >
> > The fact that altstack has been breaking Travis builds for a while
> > probably predisposed me to be uncharitable.
> >
> > > Can I help fix the builds?
> >
> > So, I've figured out what the problem is, patch coming shortly.
> >
> > >
> > > On Wed, Feb 3, 2016 at 4:28 PM David Gibson <david@gibson.dropbear.id=
=2Eau
> > >
> > > wrote:
> > >
> > > > On Mon, Feb 01, 2016 at 02:43:16AM +0000, Dan Good wrote:
> > > > >
> > > > > * add altstack_remn, returns amount of stack remaining
> > > > > * increase mapping by 1 page to handle abutment case
> > > > > * capture rsp earlier
> > > > > * align stack to 16 bytes
> > > > >
> > > > > Signed-off-by: Dan Good <dan@dancancode.com>
> > > >
> > > > Bit of a messy bitser, but doesn't look it will make anything
> > > > worse. so go ahead and push.
> > > >
> > > > Unfortunately, altstack is breaking travis builds at the moment (se=
e,
> > > > e.g. https://travis-ci.org/dgibson/ccan/jobs/106661592) - but not
> > > > local builds for me which is making it difficult to debug.
> > > >
> > > > Some investigation showed that the test prog was getting a SIGBUS, =
but
> > > > I didn't get further than that.
> > > >
> > > > altstack also breaks "make all" on any non-x86_64 platform (includi=
ng
> > > > 32-bit x86) which is pretty horrid.  For that I think we need to
> > > > adjust the makefiles to look at rusty's new "ported" stuff from _in=
fo.
> > > >
> > > >
> > > > > ---
> > > > >  ccan/altstack/altstack.c | 17 ++++++++++++++---
> > > > >  ccan/altstack/altstack.h | 14 ++++++++++++++
> > > > >  ccan/altstack/test/run.c | 20 +++++++++++++-------
> > > > >  3 files changed, 41 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> > > > > index 6faf38f..b71c64f 100644
> > > > > --- a/ccan/altstack/altstack.c
> > > > > +++ b/ccan/altstack/altstack.c
> > > > > @@ -8,6 +8,7 @@
> > > > >  #include <signal.h>
> > > > >  #include <stdio.h>
> > > > >  #include <string.h>
> > > > > +#include <unistd.h>
> > > > >  #include <sys/mman.h>
> > > > >
> > > > >  static __thread char ebuf[ALTSTACK_ERR_MAXLEN];
> > > > > @@ -37,6 +38,11 @@ static void segvjmp(int signum)
> > > > >  }
> > > > >
> > > > >  static __thread void *rsp_save_[2];
> > > > > +static __thread rlim_t max_;
> > > > > +
> > > > > +rlim_t altstack_max(void) {
> > > > > +     return max_;
> > > > > +}
> > > > >
> > > > >  static ptrdiff_t rsp_save(unsigned i) {
> > > > >       assert(i < 2);
> > > > > @@ -57,6 +63,7 @@ static __thread void *arg_, *out_;
> > > > >
> > > > >  int altstack(rlim_t max, void *(*fn)(void *), void *arg, void **=
out)
> > > > >  {
> > > > > +     long pgsz =3D sysconf(_SC_PAGESIZE);
> > > > >       int ret =3D -1, undo =3D 0;
> > > > >       char *m;
> > > > >       struct rlimit rl_save;
> > > > > @@ -69,11 +76,16 @@ int altstack(rlim_t max, void *(*fn)(void *),
> > void
> > > > *arg, void **out)
> > > > >       fn_  =3D fn;
> > > > >       arg_ =3D arg;
> > > > >       out_ =3D 0;
> > > > > +     max_ =3D max;
> > > > >       ebuf[elen =3D 0] =3D '\0';
> > > > >       if (out) *out =3D 0;
> > > > >
> > > > > +     // if the first page below the mapping is in use, we get
> > max-pgsz
> > > > usable bytes
> > > > > +     // add pgsz to max to guarantee at least max usable bytes
> > > > > +     max +=3D pgsz;
> > > > > +
> > > > >       ok(getrlimit(RLIMIT_STACK, &rl_save), 1);
> > > > > -     ok(setrlimit(RLIMIT_STACK, &(struct rlimit) { max,
> > > > rl_save.rlim_max }), 1);
> > > > > +     ok(setrlimit(RLIMIT_STACK, &(struct rlimit) { max_,
> > > > rl_save.rlim_max }), 1);
> > > > >       undo++;
> > > > >
> > > > >       ok(m =3D mmap(0, max, PROT_READ|PROT_WRITE,
> > > > MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);
> > > > > @@ -91,8 +103,7 @@ int altstack(rlim_t max, void *(*fn)(void *), =
void
> > > > *arg, void **out)
> > > > >               ok(sigaction(SIGSEGV, &sa, &sa_save), 1);
> > > > >               undo++;
> > > > >
> > > > > -             asm volatile ("movq %%rsp, %%r10\nmov %0, %%rsp\npu=
sh
> > > > %%r10" : : "g" (m + max) : "r10");
> > > > > -             rsp_save(0);
> > > > > +             asm volatile ("movq %%rsp, %%r10\nmov %1, %%rsp\nmov
> > > > %%rsp, %0\nsub $8, %%rsp\npush %%r10" : "=3Dg" (rsp_save_[0]) : "g"=
 (m +
> > max)
> > > > : "r10");
> > > > >               out_ =3D fn_(arg_);
> > > > >               asm volatile ("pop %rsp");
> > > > >               ret =3D 0;
> > > > > diff --git a/ccan/altstack/altstack.h b/ccan/altstack/altstack.h
> > > > > index 5570e7b..4445a2a 100644
> > > > > --- a/ccan/altstack/altstack.h
> > > > > +++ b/ccan/altstack/altstack.h
> > > > > @@ -104,6 +104,20 @@ char *altstack_geterr(void);
> > > > >  ptrdiff_t altstack_used(void);
> > > > >
> > > > >  /**
> > > > > + * altstack_max - return usable stack size
> > > > > + *
> > > > > + * Returns: max value from altstack() call
> > > > > + */
> > > > > +rlim_t altstack_max(void);
> > > > > +
> > > > > +/**
> > > > > + * altstack_remn - return amount of stack remaining
> > > > > + *
> > > > > + * Returns: altstack_max() minus altstack_used()
> > > > > + */
> > > > > +#define altstack_remn() (altstack_max() - altstack_used())
> > > > > +
> > > > > +/**
> > > > >   * altstack_rsp_save - set initial rsp value
> > > > >   *
> > > > >   * Capture the current value of rsp for future altstack_used()
> > > > > diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> > > > > index adc1020..d0b8d28 100644
> > > > > --- a/ccan/altstack/test/run.c
> > > > > +++ b/ccan/altstack/test/run.c
> > > > > @@ -4,6 +4,7 @@
> > > > >  #include <setjmp.h>
> > > > >  #include <signal.h>
> > > > >  #include <string.h>
> > > > > +#include <unistd.h>
> > > > >  #include <sys/mman.h>
> > > > >  #include <ccan/tap/tap.h>
> > > > >  #include <ccan/altstack/altstack.h>
> > > > > @@ -20,13 +21,13 @@ enum {
> > > > >  };
> > > > >  int fail, call1, call2;
> > > > >  char *m_;
> > > > > -rlim_t max_;
> > > > > +rlim_t msz_;
> > > > >  #define e(x) (900+(x))
> > > > >  #define seterr(x) (errno =3D e(x))
> > > > >  #define setcall(x) ((call1 |=3D !errno ? (x) : 0), (call2 |=3D e=
rrno ||
> > > > out_ ? (x) : 0))
> > > > >  #define getrlimit(...)               (fail&getrlimit_        ?
> > > > (seterr(getrlimit_),          -1) : (setcall(getrlimit_),
> > > >  getrlimit(__VA_ARGS__)))
> > > > >  #define mmap(...)            (fail&mmap_             ?
> > (seterr(mmap_),
> > > >      (void *)-1) : (setcall(mmap_),          mmap(__VA_ARGS__)))
> > > > > -#define munmap(a, b)         (fail&munmap_           ?
> > > > (seterr(munmap_),             -1) : (setcall(munmap_),
> > > > munmap(m_=3D(a), max_=3D(b))))
> > > > > +#define munmap(a, b)         (fail&munmap_           ?
> > > > (seterr(munmap_),             -1) : (setcall(munmap_),
> > > > munmap(m_=3D(a), msz_=3D(b))))
> > > > >  #define setrlimit(...)               (fail&setrlimit_        ?
> > > > (seterr(setrlimit_),          -1) : (setcall(setrlimit_),
> > > >  setrlimit(__VA_ARGS__)))
> > > > >  #define sigaltstack(...)     (fail&sigaltstack_      ?
> > > > (seterr(sigaltstack_),        -1) : (setcall(sigaltstack_),
> > > >  sigaltstack(__VA_ARGS__)))
> > > > >  #define sigaction(...)               (fail&sigaction_        ?
> > > > (seterr(sigaction_),          -1) : (setcall(sigaction_),
> > > >  sigaction(__VA_ARGS__)))
> > > > > @@ -58,7 +59,9 @@ static void *wrap(void *i)
> > > > >
> > > > >  int main(void)
> > > > >  {
> > > > > -     plan_tests(16);
> > > > > +     long pgsz =3D sysconf(_SC_PAGESIZE);
> > > > > +
> > > > > +     plan_tests(17);
> > > > >
> > > > >  #define chkfail(x, y, z, c1, c2) (call1 =3D 0, call2 =3D 0, errn=
o =3D 0,
> > > > ok1((fail =3D x) && (y) && errno =3D=3D (z) && call1 =3D=3D (c1) &&=
 call2 =3D=3D
> > (c2)));
> > > > >  #define   chkok(   y, z, c1, c2) (call1 =3D 0, call2 =3D 0, errn=
o =3D 0,
> > fail
> > > > =3D 0,     ok1((y) && errno =3D=3D (z) && call1 =3D=3D (c1) && call=
2 =3D=3D (c2)));
> > > > > @@ -86,7 +89,7 @@ int main(void)
> > > > >       chkfail(munmap_,        altstack(8*MiB, wrap, 0, 0) =3D=3D =
 1,
> > > > e(munmap_),
> > > > >               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > >               setrlimit_|sigaltstack_|sigaction_);
> > > > > -     if (fail =3D 0, munmap(m_, max_) =3D=3D -1)
> > > > > +     if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> > > > >               err(1, "munmap");
> > > > >
> > > > >       chkok(                  altstack(1*MiB, wrap, (void *)
> > 1000000, 0)
> > > > =3D=3D -1, EOVERFLOW,
> > > > > @@ -102,10 +105,12 @@ int main(void)
> > > > >       chkfail(munmap_,        altstack(1*MiB, wrap, (void *)
> > 1000000, 0)
> > > > =3D=3D -1, EOVERFLOW,
> > > > >               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > >               setrlimit_|sigaltstack_|sigaction_);
> > > > > -     if (fail =3D 0, munmap(m_, max_) =3D=3D -1)
> > > > > +     if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> > > > >               err(1, "munmap");
> > > > >
> > > > > -     ok1(used > 1*MiB-1*KiB && used < 1*MiB);
> > > > > +     ok1(altstack_max() =3D=3D 1*MiB);
> > > > > +     diag("used: %lu", used);
> > > > > +     ok1(used >=3D 1*MiB && used <=3D 1*MiB + pgsz);
> > > > >
> > > > >       char *p;
> > > > >       for(p =3D altstack_geterr(); *p; p++)
> > > > > @@ -128,7 +133,8 @@ int main(void)
> > > > >               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > >               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > > >
> > > > > -     ok1(used > 8*MiB-8*KiB && used < 8*MiB);
> > > > > +     diag("used: %lu", used);
> > > > > +     ok1(used >=3D 8*MiB && used <=3D 8*MiB + pgsz);
> > > > >
> > > > >       used =3D 0;
> > > > >       chkok(                  altstack(8*MiB, wrap, (void *) 1000=
00,
> > 0)
> > > > =3D=3D 0, 0,
> > > >
> > > >
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1R6ZDISWaA1muLP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwrvOAAoJEGw4ysog2bOS9skQAI8beCdIV9iwBWYeKYMuhmHP
JGZZq/lEOebaZ+IgrCbQsDN4eBckwy+drrWIsLoQesXOUTztTqRPCL5aBtzN47rI
vEXEg90H76L9CnZIyw3UWgpXJh2fD2ZuOEjB9ErpfaDws/fBZCoEyhlzx8obMhSS
ZnENbcpmFH01r5w1XuAXMj1djqC+mxF2ZifrapVVkU6z5CZYZDC/nzVrLG6dS7am
z/Ymf87TLtCt3omcgnlvOCl94qkRLGZiJ1bCul2FunfG5UIHiOY1Xh6rzonNuepT
/On10TPPNReoC7ORlTtNbmsoryt1DhM9Bi+tPtH+qaCpKz0lggrC/19CX1qYWHiG
kikXcEgfA6HtTZGCES43YqfF816/SGkHExI0tnQPKN/Yvr6Bjw8OeJnnRCPS4zsj
uuHHuXfdMN8imEBY4xE1Cq1oUGzZ6S6AN/jQWNEJ4a6GPzbV3P1uT/f8E1m5f5gq
svbCZHY7k9PYWRr46bYUtlzXU5MQJS/eHe1enavHRXfK5MymQrBy3oC09BkAK5fb
jhfQHvSZ9Mq6pURirDAV+w8uiPqaaQ8sn2c9G986M6N6fknGXS1a/3wyCLmVkIs2
LCGQet/+c6vtUJqnZYVjzuJh+8Ow0KU4PucF0c5KQ/Q8NvoEF1zHGkA8g2WQEOVY
VQTgqs0VRG3q2Sh4NhRe
=s2Ty
-----END PGP SIGNATURE-----

--1R6ZDISWaA1muLP0--

--===============8872775952797079917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8872775952797079917==--
