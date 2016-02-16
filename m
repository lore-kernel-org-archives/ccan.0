From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH] altstack: stack alignment and accounting tweaks
Date: Tue, 16 Feb 2016 17:41:43 +0000
Message-ID: <CACNkOJNvEVVDvW32ABqS42AyoTeMA0GUzAaQKok1huWRCU3jTw@mail.gmail.com>
References: <20160201024316.GA3210@ip-172-31-61-248.ec2.internal>
 <20160203061648.GR15080@voom.fritz.box>
 <CACNkOJOjgaHTBaPGjK+xbzL+WCpgbzOiy8WGDvAgz2vUpXca_g@mail.gmail.com>
 <20160215105444.GX2732@voom.fritz.box>
 <CACNkOJPFBrYcA9AxmqCnkgSD+f-dQFM2WOUUQZrz08Jn5MJqVA@mail.gmail.com>
 <20160216060358.GN2269@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4536832434137581144=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7979A1A007F
 for <ccan@lists.ozlabs.org>; Wed, 17 Feb 2016 04:41:58 +1100 (AEDT)
Received: from mail-ob0-f177.google.com ([209.85.214.177]) by
 mrelay.perfora.net (mreueus003) with ESMTPSA (Nemesis) id
 0Ldnkr-1a4gGv3hCd-00j0pv for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016
 18:41:55 +0100
Received: by mail-ob0-f177.google.com with SMTP id jq7so85771917obb.0
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 09:41:53 -0800 (PST)
In-Reply-To: <20160216060358.GN2269@voom.redhat.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, Dan Good <dan@gooddan.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

--===============4536832434137581144==
Content-Type: multipart/alternative; boundary=001a11c3145a23ab0d052be6a6fd

--001a11c3145a23ab0d052be6a6fd
Content-Type: text/plain; charset=UTF-8

I see.  Thank you.

On Tue, Feb 16, 2016 at 5:04 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Mon, Feb 15, 2016 at 06:29:10PM +0000, Dan Good wrote:
> > I thought I understood from our emails at the end of last year that a
> > single "polished" commit was desirable.  Is that not the same thing as
> > taking several very small commits and bundling them into one?
>
> Often not, in practice.  The ultimate goal is reviewability (both
> before merging and when looking back at the commit history).  But
> that's often accomplished different ways depending on the situation.
> In particular it tends to be different for initial commits of new code
> from changes to existing code.
>
> For initial commits, it's generally best to elide patches which
> correct false steps made during development, or really anything which
> doesn't increase the total code size or complexity significantly.
> That gives less commits to review, and cleaner code in them to
> understand.
>
> For changes to existing code, however, the important thing is
> understanding why the change is desirable and then that the changes
> actually accomplish that goal.  That tends towards small, single
> purpose commits, so it's easy to see what changes belong to what goal
> (explained in the commit message).
>
> Of course, that's a very broad rule of tumb, with plenty of exceptions
> and wiggle room.
>
> > On Mon, Feb 15, 2016 at 5:53 AM David Gibson <
> david@gibson.dropbear.id.au>
> > wrote:
> >
> > > On Wed, Feb 03, 2016 at 11:42:11PM +0000, Dan Good wrote:
> > > > "messy bitser" - what does that mean?  That's bad, isn't it?
> > >
> > > It's... mildly bad.
> > >
> > > By "bitser" I mean that it contains a number of changes that aren't
> > > closely related to each other.  In general that makes a patch more
> > > difficult to review.  How important that is depends on the complexity
> > > of the changes and how mature the code being altered is, so it's not
> > > really a big deal.
> > >
> > > The fact that altstack has been breaking Travis builds for a while
> > > probably predisposed me to be uncharitable.
> > >
> > > > Can I help fix the builds?
> > >
> > > So, I've figured out what the problem is, patch coming shortly.
> > >
> > > >
> > > > On Wed, Feb 3, 2016 at 4:28 PM David Gibson <
> david@gibson.dropbear.id.au
> > > >
> > > > wrote:
> > > >
> > > > > On Mon, Feb 01, 2016 at 02:43:16AM +0000, Dan Good wrote:
> > > > > >
> > > > > > * add altstack_remn, returns amount of stack remaining
> > > > > > * increase mapping by 1 page to handle abutment case
> > > > > > * capture rsp earlier
> > > > > > * align stack to 16 bytes
> > > > > >
> > > > > > Signed-off-by: Dan Good <dan@dancancode.com>
> > > > >
> > > > > Bit of a messy bitser, but doesn't look it will make anything
> > > > > worse. so go ahead and push.
> > > > >
> > > > > Unfortunately, altstack is breaking travis builds at the moment
> (see,
> > > > > e.g. https://travis-ci.org/dgibson/ccan/jobs/106661592) - but not
> > > > > local builds for me which is making it difficult to debug.
> > > > >
> > > > > Some investigation showed that the test prog was getting a SIGBUS,
> but
> > > > > I didn't get further than that.
> > > > >
> > > > > altstack also breaks "make all" on any non-x86_64 platform
> (including
> > > > > 32-bit x86) which is pretty horrid.  For that I think we need to
> > > > > adjust the makefiles to look at rusty's new "ported" stuff from
> _info.
> > > > >
> > > > >
> > > > > > ---
> > > > > >  ccan/altstack/altstack.c | 17 ++++++++++++++---
> > > > > >  ccan/altstack/altstack.h | 14 ++++++++++++++
> > > > > >  ccan/altstack/test/run.c | 20 +++++++++++++-------
> > > > > >  3 files changed, 41 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> > > > > > index 6faf38f..b71c64f 100644
> > > > > > --- a/ccan/altstack/altstack.c
> > > > > > +++ b/ccan/altstack/altstack.c
> > > > > > @@ -8,6 +8,7 @@
> > > > > >  #include <signal.h>
> > > > > >  #include <stdio.h>
> > > > > >  #include <string.h>
> > > > > > +#include <unistd.h>
> > > > > >  #include <sys/mman.h>
> > > > > >
> > > > > >  static __thread char ebuf[ALTSTACK_ERR_MAXLEN];
> > > > > > @@ -37,6 +38,11 @@ static void segvjmp(int signum)
> > > > > >  }
> > > > > >
> > > > > >  static __thread void *rsp_save_[2];
> > > > > > +static __thread rlim_t max_;
> > > > > > +
> > > > > > +rlim_t altstack_max(void) {
> > > > > > +     return max_;
> > > > > > +}
> > > > > >
> > > > > >  static ptrdiff_t rsp_save(unsigned i) {
> > > > > >       assert(i < 2);
> > > > > > @@ -57,6 +63,7 @@ static __thread void *arg_, *out_;
> > > > > >
> > > > > >  int altstack(rlim_t max, void *(*fn)(void *), void *arg, void
> **out)
> > > > > >  {
> > > > > > +     long pgsz = sysconf(_SC_PAGESIZE);
> > > > > >       int ret = -1, undo = 0;
> > > > > >       char *m;
> > > > > >       struct rlimit rl_save;
> > > > > > @@ -69,11 +76,16 @@ int altstack(rlim_t max, void *(*fn)(void *),
> > > void
> > > > > *arg, void **out)
> > > > > >       fn_  = fn;
> > > > > >       arg_ = arg;
> > > > > >       out_ = 0;
> > > > > > +     max_ = max;
> > > > > >       ebuf[elen = 0] = '\0';
> > > > > >       if (out) *out = 0;
> > > > > >
> > > > > > +     // if the first page below the mapping is in use, we get
> > > max-pgsz
> > > > > usable bytes
> > > > > > +     // add pgsz to max to guarantee at least max usable bytes
> > > > > > +     max += pgsz;
> > > > > > +
> > > > > >       ok(getrlimit(RLIMIT_STACK, &rl_save), 1);
> > > > > > -     ok(setrlimit(RLIMIT_STACK, &(struct rlimit) { max,
> > > > > rl_save.rlim_max }), 1);
> > > > > > +     ok(setrlimit(RLIMIT_STACK, &(struct rlimit) { max_,
> > > > > rl_save.rlim_max }), 1);
> > > > > >       undo++;
> > > > > >
> > > > > >       ok(m = mmap(0, max, PROT_READ|PROT_WRITE,
> > > > > MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);
> > > > > > @@ -91,8 +103,7 @@ int altstack(rlim_t max, void *(*fn)(void *),
> void
> > > > > *arg, void **out)
> > > > > >               ok(sigaction(SIGSEGV, &sa, &sa_save), 1);
> > > > > >               undo++;
> > > > > >
> > > > > > -             asm volatile ("movq %%rsp, %%r10\nmov %0,
> %%rsp\npush
> > > > > %%r10" : : "g" (m + max) : "r10");
> > > > > > -             rsp_save(0);
> > > > > > +             asm volatile ("movq %%rsp, %%r10\nmov %1,
> %%rsp\nmov
> > > > > %%rsp, %0\nsub $8, %%rsp\npush %%r10" : "=g" (rsp_save_[0]) : "g"
> (m +
> > > max)
> > > > > : "r10");
> > > > > >               out_ = fn_(arg_);
> > > > > >               asm volatile ("pop %rsp");
> > > > > >               ret = 0;
> > > > > > diff --git a/ccan/altstack/altstack.h b/ccan/altstack/altstack.h
> > > > > > index 5570e7b..4445a2a 100644
> > > > > > --- a/ccan/altstack/altstack.h
> > > > > > +++ b/ccan/altstack/altstack.h
> > > > > > @@ -104,6 +104,20 @@ char *altstack_geterr(void);
> > > > > >  ptrdiff_t altstack_used(void);
> > > > > >
> > > > > >  /**
> > > > > > + * altstack_max - return usable stack size
> > > > > > + *
> > > > > > + * Returns: max value from altstack() call
> > > > > > + */
> > > > > > +rlim_t altstack_max(void);
> > > > > > +
> > > > > > +/**
> > > > > > + * altstack_remn - return amount of stack remaining
> > > > > > + *
> > > > > > + * Returns: altstack_max() minus altstack_used()
> > > > > > + */
> > > > > > +#define altstack_remn() (altstack_max() - altstack_used())
> > > > > > +
> > > > > > +/**
> > > > > >   * altstack_rsp_save - set initial rsp value
> > > > > >   *
> > > > > >   * Capture the current value of rsp for future altstack_used()
> > > > > > diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> > > > > > index adc1020..d0b8d28 100644
> > > > > > --- a/ccan/altstack/test/run.c
> > > > > > +++ b/ccan/altstack/test/run.c
> > > > > > @@ -4,6 +4,7 @@
> > > > > >  #include <setjmp.h>
> > > > > >  #include <signal.h>
> > > > > >  #include <string.h>
> > > > > > +#include <unistd.h>
> > > > > >  #include <sys/mman.h>
> > > > > >  #include <ccan/tap/tap.h>
> > > > > >  #include <ccan/altstack/altstack.h>
> > > > > > @@ -20,13 +21,13 @@ enum {
> > > > > >  };
> > > > > >  int fail, call1, call2;
> > > > > >  char *m_;
> > > > > > -rlim_t max_;
> > > > > > +rlim_t msz_;
> > > > > >  #define e(x) (900+(x))
> > > > > >  #define seterr(x) (errno = e(x))
> > > > > >  #define setcall(x) ((call1 |= !errno ? (x) : 0), (call2 |=
> errno ||
> > > > > out_ ? (x) : 0))
> > > > > >  #define getrlimit(...)               (fail&getrlimit_        ?
> > > > > (seterr(getrlimit_),          -1) : (setcall(getrlimit_),
> > > > >  getrlimit(__VA_ARGS__)))
> > > > > >  #define mmap(...)            (fail&mmap_             ?
> > > (seterr(mmap_),
> > > > >      (void *)-1) : (setcall(mmap_),          mmap(__VA_ARGS__)))
> > > > > > -#define munmap(a, b)         (fail&munmap_           ?
> > > > > (seterr(munmap_),             -1) : (setcall(munmap_),
> > > > > munmap(m_=(a), max_=(b))))
> > > > > > +#define munmap(a, b)         (fail&munmap_           ?
> > > > > (seterr(munmap_),             -1) : (setcall(munmap_),
> > > > > munmap(m_=(a), msz_=(b))))
> > > > > >  #define setrlimit(...)               (fail&setrlimit_        ?
> > > > > (seterr(setrlimit_),          -1) : (setcall(setrlimit_),
> > > > >  setrlimit(__VA_ARGS__)))
> > > > > >  #define sigaltstack(...)     (fail&sigaltstack_      ?
> > > > > (seterr(sigaltstack_),        -1) : (setcall(sigaltstack_),
> > > > >  sigaltstack(__VA_ARGS__)))
> > > > > >  #define sigaction(...)               (fail&sigaction_        ?
> > > > > (seterr(sigaction_),          -1) : (setcall(sigaction_),
> > > > >  sigaction(__VA_ARGS__)))
> > > > > > @@ -58,7 +59,9 @@ static void *wrap(void *i)
> > > > > >
> > > > > >  int main(void)
> > > > > >  {
> > > > > > -     plan_tests(16);
> > > > > > +     long pgsz = sysconf(_SC_PAGESIZE);
> > > > > > +
> > > > > > +     plan_tests(17);
> > > > > >
> > > > > >  #define chkfail(x, y, z, c1, c2) (call1 = 0, call2 = 0, errno =
> 0,
> > > > > ok1((fail = x) && (y) && errno == (z) && call1 == (c1) && call2 ==
> > > (c2)));
> > > > > >  #define   chkok(   y, z, c1, c2) (call1 = 0, call2 = 0, errno =
> 0,
> > > fail
> > > > > = 0,     ok1((y) && errno == (z) && call1 == (c1) && call2 ==
> (c2)));
> > > > > > @@ -86,7 +89,7 @@ int main(void)
> > > > > >       chkfail(munmap_,        altstack(8*MiB, wrap, 0, 0) ==  1,
> > > > > e(munmap_),
> > > > > >
>  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > > >               setrlimit_|sigaltstack_|sigaction_);
> > > > > > -     if (fail = 0, munmap(m_, max_) == -1)
> > > > > > +     if (fail = 0, munmap(m_, msz_) == -1)
> > > > > >               err(1, "munmap");
> > > > > >
> > > > > >       chkok(                  altstack(1*MiB, wrap, (void *)
> > > 1000000, 0)
> > > > > == -1, EOVERFLOW,
> > > > > > @@ -102,10 +105,12 @@ int main(void)
> > > > > >       chkfail(munmap_,        altstack(1*MiB, wrap, (void *)
> > > 1000000, 0)
> > > > > == -1, EOVERFLOW,
> > > > > >
>  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > > >               setrlimit_|sigaltstack_|sigaction_);
> > > > > > -     if (fail = 0, munmap(m_, max_) == -1)
> > > > > > +     if (fail = 0, munmap(m_, msz_) == -1)
> > > > > >               err(1, "munmap");
> > > > > >
> > > > > > -     ok1(used > 1*MiB-1*KiB && used < 1*MiB);
> > > > > > +     ok1(altstack_max() == 1*MiB);
> > > > > > +     diag("used: %lu", used);
> > > > > > +     ok1(used >= 1*MiB && used <= 1*MiB + pgsz);
> > > > > >
> > > > > >       char *p;
> > > > > >       for(p = altstack_geterr(); *p; p++)
> > > > > > @@ -128,7 +133,8 @@ int main(void)
> > > > > >
>  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > > > >               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > > > >
> > > > > > -     ok1(used > 8*MiB-8*KiB && used < 8*MiB);
> > > > > > +     diag("used: %lu", used);
> > > > > > +     ok1(used >= 8*MiB && used <= 8*MiB + pgsz);
> > > > > >
> > > > > >       used = 0;
> > > > > >       chkok(                  altstack(8*MiB, wrap, (void *)
> 100000,
> > > 0)
> > > > > == 0, 0,
> > > > >
> > > > >
> > >
> > >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--001a11c3145a23ab0d052be6a6fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see.=C2=A0 Thank you.<br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Tue, Feb 16, 2016 at 5:04 AM David Gibson &lt;<a href=
=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Feb 15, 2016 at 06:=
29:10PM +0000, Dan Good wrote:<br>
&gt; I thought I understood from our emails at the end of last year that a<=
br>
&gt; single &quot;polished&quot; commit was desirable.=C2=A0 Is that not th=
e same thing as<br>
&gt; taking several very small commits and bundling them into one?<br>
<br>
Often not, in practice.=C2=A0 The ultimate goal is reviewability (both<br>
before merging and when looking back at the commit history).=C2=A0 But<br>
that&#39;s often accomplished different ways depending on the situation.<br=
>
In particular it tends to be different for initial commits of new code<br>
from changes to existing code.<br>
<br>
For initial commits, it&#39;s generally best to elide patches which<br>
correct false steps made during development, or really anything which<br>
doesn&#39;t increase the total code size or complexity significantly.<br>
That gives less commits to review, and cleaner code in them to<br>
understand.<br>
<br>
For changes to existing code, however, the important thing is<br>
understanding why the change is desirable and then that the changes<br>
actually accomplish that goal.=C2=A0 That tends towards small, single<br>
purpose commits, so it&#39;s easy to see what changes belong to what goal<b=
r>
(explained in the commit message).<br>
<br>
Of course, that&#39;s a very broad rule of tumb, with plenty of exceptions<=
br>
and wiggle room.<br>
<br>
&gt; On Mon, Feb 15, 2016 at 5:53 AM David Gibson &lt;<a href=3D"mailto:dav=
id@gibson.dropbear.id.au" target=3D"_blank">david@gibson.dropbear.id.au</a>=
&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Wed, Feb 03, 2016 at 11:42:11PM +0000, Dan Good wrote:<br>
&gt; &gt; &gt; &quot;messy bitser&quot; - what does that mean?=C2=A0 That&#=
39;s bad, isn&#39;t it?<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s... mildly bad.<br>
&gt; &gt;<br>
&gt; &gt; By &quot;bitser&quot; I mean that it contains a number of changes=
 that aren&#39;t<br>
&gt; &gt; closely related to each other.=C2=A0 In general that makes a patc=
h more<br>
&gt; &gt; difficult to review.=C2=A0 How important that is depends on the c=
omplexity<br>
&gt; &gt; of the changes and how mature the code being altered is, so it&#3=
9;s not<br>
&gt; &gt; really a big deal.<br>
&gt; &gt;<br>
&gt; &gt; The fact that altstack has been breaking Travis builds for a whil=
e<br>
&gt; &gt; probably predisposed me to be uncharitable.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Can I help fix the builds?<br>
&gt; &gt;<br>
&gt; &gt; So, I&#39;ve figured out what the problem is, patch coming shortl=
y.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Feb 3, 2016 at 4:28 PM David Gibson &lt;<a href=3D"m=
ailto:david@gibson.dropbear.id.au" target=3D"_blank">david@gibson.dropbear.=
id.au</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Feb 01, 2016 at 02:43:16AM +0000, Dan Good wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; * add altstack_remn, returns amount of stack remai=
ning<br>
&gt; &gt; &gt; &gt; &gt; * increase mapping by 1 page to handle abutment ca=
se<br>
&gt; &gt; &gt; &gt; &gt; * capture rsp earlier<br>
&gt; &gt; &gt; &gt; &gt; * align stack to 16 bytes<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Dan Good &lt;<a href=3D"mailto:dan@=
dancancode.com" target=3D"_blank">dan@dancancode.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Bit of a messy bitser, but doesn&#39;t look it will mak=
e anything<br>
&gt; &gt; &gt; &gt; worse. so go ahead and push.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Unfortunately, altstack is breaking travis builds at th=
e moment (see,<br>
&gt; &gt; &gt; &gt; e.g. <a href=3D"https://travis-ci.org/dgibson/ccan/jobs=
/106661592" rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/dgib=
son/ccan/jobs/106661592</a>) - but not<br>
&gt; &gt; &gt; &gt; local builds for me which is making it difficult to deb=
ug.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Some investigation showed that the test prog was gettin=
g a SIGBUS, but<br>
&gt; &gt; &gt; &gt; I didn&#39;t get further than that.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; altstack also breaks &quot;make all&quot; on any non-x8=
6_64 platform (including<br>
&gt; &gt; &gt; &gt; 32-bit x86) which is pretty horrid.=C2=A0 For that I th=
ink we need to<br>
&gt; &gt; &gt; &gt; adjust the makefiles to look at rusty&#39;s new &quot;p=
orted&quot; stuff from _info.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 ccan/altstack/altstack.c | 17 ++++++++++++++=
---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 ccan/altstack/altstack.h | 14 ++++++++++++++=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 ccan/altstack/test/run.c | 20 +++++++++++++-=
------<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 41 insertions(+), 10 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/ccan/altstack/altstack.c b/ccan/altst=
ack/altstack.c<br>
&gt; &gt; &gt; &gt; &gt; index 6faf38f..b71c64f 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/ccan/altstack/altstack.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/ccan/altstack/altstack.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -8,6 +8,7 @@<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;signal.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;string.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;unistd.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;sys/mman.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 static __thread char ebuf[ALTSTACK_ERR_MAXLE=
N];<br>
&gt; &gt; &gt; &gt; &gt; @@ -37,6 +38,11 @@ static void segvjmp(int signum)=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 static __thread void *rsp_save_[2];<br>
&gt; &gt; &gt; &gt; &gt; +static __thread rlim_t max_;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +rlim_t altstack_max(void) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return max_;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 static ptrdiff_t rsp_save(unsigned i) {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(i &lt; 2);<br>
&gt; &gt; &gt; &gt; &gt; @@ -57,6 +63,7 @@ static __thread void *arg_, *out=
_;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 int altstack(rlim_t max, void *(*fn)(void *)=
, void *arg, void **out)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0long pgsz =3D sysconf(_SC_PAG=
ESIZE);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -1, undo =3D=
 0;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *m;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rlimit rl_save;<b=
r>
&gt; &gt; &gt; &gt; &gt; @@ -69,11 +76,16 @@ int altstack(rlim_t max, void =
*(*fn)(void *),<br>
&gt; &gt; void<br>
&gt; &gt; &gt; &gt; *arg, void **out)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fn_=C2=A0 =3D fn;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arg_ =3D arg;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0out_ =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0max_ =3D max;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ebuf[elen =3D 0] =3D &#3=
9;\0&#39;;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (out) *out =3D 0;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0// if the first page below th=
e mapping is in use, we get<br>
&gt; &gt; max-pgsz<br>
&gt; &gt; &gt; &gt; usable bytes<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0// add pgsz to max to guarant=
ee at least max usable bytes<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0max +=3D pgsz;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ok(getrlimit(RLIMIT_STAC=
K, &amp;rl_save), 1);<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ok(setrlimit(RLIMIT_STACK, &a=
mp;(struct rlimit) { max,<br>
&gt; &gt; &gt; &gt; rl_save.rlim_max }), 1);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ok(setrlimit(RLIMIT_STACK, &a=
mp;(struct rlimit) { max_,<br>
&gt; &gt; &gt; &gt; rl_save.rlim_max }), 1);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0undo++;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ok(m =3D mmap(0, max, PR=
OT_READ|PROT_WRITE,<br>
&gt; &gt; &gt; &gt; MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, =
-1, 0), 1);<br>
&gt; &gt; &gt; &gt; &gt; @@ -91,8 +103,7 @@ int altstack(rlim_t max, void *=
(*fn)(void *), void<br>
&gt; &gt; &gt; &gt; *arg, void **out)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ok(sigaction(SIGSEGV, &amp;sa, &amp;sa_save), 1);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0undo++;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
sm volatile (&quot;movq %%rsp, %%r10\nmov %0, %%rsp\npush<br>
&gt; &gt; &gt; &gt; %%r10&quot; : : &quot;g&quot; (m + max) : &quot;r10&quo=
t;);<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
sp_save(0);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
sm volatile (&quot;movq %%rsp, %%r10\nmov %1, %%rsp\nmov<br>
&gt; &gt; &gt; &gt; %%rsp, %0\nsub $8, %%rsp\npush %%r10&quot; : &quot;=3Dg=
&quot; (rsp_save_[0]) : &quot;g&quot; (m +<br>
&gt; &gt; max)<br>
&gt; &gt; &gt; &gt; : &quot;r10&quot;);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0out_ =3D fn_(arg_);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0asm volatile (&quot;pop %rsp&quot;);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ret =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/ccan/altstack/altstack.h b/ccan/altst=
ack/altstack.h<br>
&gt; &gt; &gt; &gt; &gt; index 5570e7b..4445a2a 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/ccan/altstack/altstack.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/ccan/altstack/altstack.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -104,6 +104,20 @@ char *altstack_geterr(void);<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 ptrdiff_t altstack_used(void);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 /**<br>
&gt; &gt; &gt; &gt; &gt; + * altstack_max - return usable stack size<br>
&gt; &gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; &gt; + * Returns: max value from altstack() call<br>
&gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; &gt; +rlim_t altstack_max(void);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; &gt; &gt; + * altstack_remn - return amount of stack remaini=
ng<br>
&gt; &gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; &gt; + * Returns: altstack_max() minus altstack_used()<=
br>
&gt; &gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; &gt; +#define altstack_remn() (altstack_max() - altstac=
k_used())<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0* altstack_rsp_save - set initial rsp =
value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0*<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0* Capture the current value of rsp for=
 future altstack_used()<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/ccan/altstack/test/run.c b/ccan/altst=
ack/test/run.c<br>
&gt; &gt; &gt; &gt; &gt; index adc1020..d0b8d28 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/ccan/altstack/test/run.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/ccan/altstack/test/run.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -4,6 +4,7 @@<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;setjmp.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;signal.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;string.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;unistd.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;sys/mman.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;ccan/tap/tap.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;ccan/altstack/altstack.h&gt;<br=
>
&gt; &gt; &gt; &gt; &gt; @@ -20,13 +21,13 @@ enum {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 int fail, call1, call2;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 char *m_;<br>
&gt; &gt; &gt; &gt; &gt; -rlim_t max_;<br>
&gt; &gt; &gt; &gt; &gt; +rlim_t msz_;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define e(x) (900+(x))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define seterr(x) (errno =3D e(x))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define setcall(x) ((call1 |=3D !errno ? (x)=
 : 0), (call2 |=3D errno ||<br>
&gt; &gt; &gt; &gt; out_ ? (x) : 0))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define getrlimit(...)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&amp;getrlimit_=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?<br>
&gt; &gt; &gt; &gt; (seterr(getrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-1) : (setcall(getrlimit_),<br>
&gt; &gt; &gt; &gt;=C2=A0 getrlimit(__VA_ARGS__)))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define mmap(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (fail&amp;mmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0?<br>
&gt; &gt; (seterr(mmap_),<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 (void *)-1) : (setcall(mmap_),=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap(__VA_ARGS__)))<br>
&gt; &gt; &gt; &gt; &gt; -#define munmap(a, b)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(fail&amp;munmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?<br>
&gt; &gt; &gt; &gt; (seterr(munmap_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-1) : (setcall(munmap_),<br>
&gt; &gt; &gt; &gt; munmap(m_=3D(a), max_=3D(b))))<br>
&gt; &gt; &gt; &gt; &gt; +#define munmap(a, b)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(fail&amp;munmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?<br>
&gt; &gt; &gt; &gt; (seterr(munmap_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-1) : (setcall(munmap_),<br>
&gt; &gt; &gt; &gt; munmap(m_=3D(a), msz_=3D(b))))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define setrlimit(...)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&amp;setrlimit_=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?<br>
&gt; &gt; &gt; &gt; (seterr(setrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-1) : (setcall(setrlimit_),<br>
&gt; &gt; &gt; &gt;=C2=A0 setrlimit(__VA_ARGS__)))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define sigaltstack(...)=C2=A0 =C2=A0 =C2=A0=
(fail&amp;sigaltstack_=C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; &gt; &gt; (seterr(sigaltstack_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) :=
 (setcall(sigaltstack_),<br>
&gt; &gt; &gt; &gt;=C2=A0 sigaltstack(__VA_ARGS__)))<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define sigaction(...)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&amp;sigaction_=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?<br>
&gt; &gt; &gt; &gt; (seterr(sigaction_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-1) : (setcall(sigaction_),<br>
&gt; &gt; &gt; &gt;=C2=A0 sigaction(__VA_ARGS__)))<br>
&gt; &gt; &gt; &gt; &gt; @@ -58,7 +59,9 @@ static void *wrap(void *i)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 int main(void)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0plan_tests(16);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0long pgsz =3D sysconf(_SC_PAG=
ESIZE);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0plan_tests(17);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define chkfail(x, y, z, c1, c2) (call1 =3D =
0, call2 =3D 0, errno =3D 0,<br>
&gt; &gt; &gt; &gt; ok1((fail =3D x) &amp;&amp; (y) &amp;&amp; errno =3D=3D=
 (z) &amp;&amp; call1 =3D=3D (c1) &amp;&amp; call2 =3D=3D<br>
&gt; &gt; (c2)));<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define=C2=A0 =C2=A0chkok(=C2=A0 =C2=A0y, z,=
 c1, c2) (call1 =3D 0, call2 =3D 0, errno =3D 0,<br>
&gt; &gt; fail<br>
&gt; &gt; &gt; &gt; =3D 0,=C2=A0 =C2=A0 =C2=A0ok1((y) &amp;&amp; errno =3D=
=3D (z) &amp;&amp; call1 =3D=3D (c1) &amp;&amp; call2 =3D=3D (c2)));<br>
&gt; &gt; &gt; &gt; &gt; @@ -86,7 +89,7 @@ int main(void)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, 0, 0) =3D=3D=C2=A0 1,<br>
&gt; &gt; &gt; &gt; e(munmap_),<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0setrlimit_|sigaltstack_|sigaction_);<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, ma=
x_) =3D=3D -1)<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, ms=
z_) =3D=3D -1)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0err(1, &quot;munmap&quot;);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, (void *=
)<br>
&gt; &gt; 1000000, 0)<br>
&gt; &gt; &gt; &gt; =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; &gt; &gt; &gt; @@ -102,10 +105,12 @@ int main(void)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, (void *)<br>
&gt; &gt; 1000000, 0)<br>
&gt; &gt; &gt; &gt; =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0setrlimit_|sigaltstack_|sigaction_);<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, ma=
x_) =3D=3D -1)<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, ms=
z_) =3D=3D -1)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0err(1, &quot;munmap&quot;);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ok1(used &gt; 1*MiB-1*KiB &am=
p;&amp; used &lt; 1*MiB);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ok1(altstack_max() =3D=3D 1*M=
iB);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0diag(&quot;used: %lu&quot;, u=
sed);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ok1(used &gt;=3D 1*MiB &amp;&=
amp; used &lt;=3D 1*MiB + pgsz);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *p;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for(p =3D altstack_geter=
r(); *p; p++)<br>
&gt; &gt; &gt; &gt; &gt; @@ -128,7 +133,8 @@ int main(void)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0setrlimit_|munmap_|sigaltstack_|sigaction_);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ok1(used &gt; 8*MiB-8*KiB &am=
p;&amp; used &lt; 8*MiB);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0diag(&quot;used: %lu&quot;, u=
sed);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ok1(used &gt;=3D 8*MiB &amp;&=
amp; used &lt;=3D 8*MiB + pgsz);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0used =3D 0;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, (void *=
) 100000,<br>
&gt; &gt; 0)<br>
&gt; &gt; &gt; &gt; =3D=3D 0, 0,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
--<br>
David Gibson=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | I&#39;ll have my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer" target=
=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank you.=C2=A0 =
NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.ozlabs.org/~dgibson</a><br>
</blockquote></div></div>

--001a11c3145a23ab0d052be6a6fd--

--===============4536832434137581144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4536832434137581144==--
