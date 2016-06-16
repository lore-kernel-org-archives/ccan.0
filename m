From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 5/5] altstack: Don't log internal calls in test
 cases
Date: Thu, 16 Jun 2016 20:45:50 +0000
Message-ID: <CACNkOJPf9-HtrOMPsnkzjv59nOkeoH5WXC2e6b4n=asBNisbyw@mail.gmail.com>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-6-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJPSMffBBHiS=ti6-TdQRrvvoTGqENX1hqgpJAxYxGYnQQ@mail.gmail.com>
 <20160616073449.GF1642@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7656093794557713902=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVwQP3R2pzDqng
 for <ccan@lists.ozlabs.org>; Fri, 17 Jun 2016 06:46:05 +1000 (AEST)
Received: from mail-yw0-f171.google.com ([209.85.161.171]) by
 mrelay.perfora.net (mreueus003) with ESMTPSA (Nemesis) id
 0LxMyK-1bSjOV2cQc-016tC4 for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016
 22:46:01 +0200
Received: by mail-yw0-f171.google.com with SMTP id g20so54357353ywb.0
 for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016 13:46:00 -0700 (PDT)
In-Reply-To: <20160616073449.GF1642@voom.fritz.box>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

--===============7656093794557713902==
Content-Type: multipart/alternative; boundary=001a1148869659ab9305356b530a

--001a1148869659ab9305356b530a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Very well, I've applied your patches as provided (except I dropped the
trailing underscore from state.rsp_save).

On Thu, Jun 16, 2016 at 7:12 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Sun, Jun 12, 2016 at 02:10:18AM +0000, Dan Good wrote:
> > Hairy macros?  From the author of the cppmagic module, I shall take tha=
t
> as
> > a compliment.
>
> Touch=C3=A9.
>
> That said, cppmagic is using hairy magic to do some things that are,
> as far as I know, impossible by any other method.  I don't think
> there's a similar justification here.
>
> > The purpose of the setcall macro and related checks is ensure the
> > correctness of the error path, i.e. if setrlimit ran before a failure, =
it
> > must run again to undo the first; if mmap ran before a failure, munmap
> must
> > run after.  I find it very reassuring to know these tests exist and pas=
s.
> > Do you see no value in that?
>
> So, there's certainly value in checking the error paths, but doing it
> by checking what calls the implementation makes is not a great way of
> doing it.  It's pretty subject to both false positives and false
> negatives.
>
> What I'd suggest instead is actually checking the behaviour in
> question.  For example, if you want to check that the rlimit is
> restored properly I'd suggest:
>         1. Call getrlimit()
>         2. Call altstack() in a way rigged to fail
>         3. Call getrlimit() again
>         4. Compare results from (1) and (3)
>
> > I don't really see a need to optimize for changing altstack's
> > implementation.  It's less than a hundred lines of code, and only ten
> tests
> > using setcall.  Can you tell me why you think it's important?
>
> So, the checking of specific calls makes the tests very dependent on
> altstack's implementation, and the framework of macros used to do it
> makes it difficult to change one test without changing them all.
>
> Together, that makes it almost impossible to change anything
> significant about the altstack implementation without having to
> significantly rewrite the tests.  And if the tests are significantly
> rewritten, it's hard to be confident that they still check the things
> they used to.
>
> Which undermines the whole value of a testsuite in allowing you to
> modify the implementation while being reasonably confident you haven't
> changed the desired behaviour.
>
> This is not theoretical; I have a couple of changes in mind for which
> the primary obstacle is adjusting the testsuite to match (switching to
> ccan/coroutine to avoid the x86_64 specific code, and using mprotect()
> instead of MAP_GROWSDOWN+setrlimit()).
>
> > On Fri, Jun 3, 2016 at 4:40 AM David Gibson <david@gibson.dropbear.id.a=
u
> >
> > wrote:
> >
> > > altstack/test/run.c uses some hairy macros to intercept the standard
> > > library functions that altstack uses.  This has two purposes: 1) to
> > > conditionally cause those functions to fail, and thereby test
> altstack's
> > > error paths, and 2) log which of the library functions was called in
> each
> > > testcase.
> > >
> > > The second function isn't actually useful - for the purposes of
> testing the
> > > module, we want to check the actual behaviour, not what calls it made
> in
> > > what order to accomplish it.  Explicitly checking the calls makes it
> much
> > > harder to change altstack's implementation without breaking the tests=
.
> > >
> > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > ---
> > >  ccan/altstack/test/run.c | 73
> > > ++++++++++++++----------------------------------
> > >  1 file changed, 21 insertions(+), 52 deletions(-)
> > >
> > > diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> > > index e109ccb..091d1f5 100644
> > > --- a/ccan/altstack/test/run.c
> > > +++ b/ccan/altstack/test/run.c
> > > @@ -20,18 +20,17 @@ enum {
> > >         sigaction_      =3D 1<<4,
> > >         munmap_         =3D 1<<5,
> > >  };
> > > -int fail, call1, call2;
> > > +int fail;
> > >  char *m_;
> > >  rlim_t msz_;
> > >  #define e(x) (900+(x))
> > >  #define seterr(x) (errno =3D e(x))
> > > -#define setcall(x) ((call1 |=3D !errno ? (x) : 0), (call2 |=3D errno=
 ||
> > > state.out ? (x) : 0))
> > > -#define getrlimit(...)         (fail&getrlimit_        ?
> > > (seterr(getrlimit_),          -1) : (setcall(getrlimit_),
> > >  getrlimit(__VA_ARGS__)))
> > > -#define mmap(...)              (fail&mmap_             ?
> (seterr(mmap_),
> > >      (void *)-1) : (setcall(mmap_),          mmap(__VA_ARGS__)))
> > > -#define munmap(a, b)           (fail&munmap_           ?
> > > (seterr(munmap_),             -1) : (setcall(munmap_),
> > > munmap(m_=3D(a), msz_=3D(b))))
> > > -#define setrlimit(...)         (fail&setrlimit_        ?
> > > (seterr(setrlimit_),          -1) : (setcall(setrlimit_),
> > >  setrlimit(__VA_ARGS__)))
> > > -#define sigaltstack(...)       (fail&sigaltstack_      ?
> > > (seterr(sigaltstack_),        -1) : (setcall(sigaltstack_),
> > >  sigaltstack(__VA_ARGS__)))
> > > -#define sigaction(...)         (fail&sigaction_        ?
> > > (seterr(sigaction_),          -1) : (setcall(sigaction_),
> > >  sigaction(__VA_ARGS__)))
> > > +#define getrlimit(...)         (fail&getrlimit_        ?
> > > (seterr(getrlimit_),          -1) : getrlimit(__VA_ARGS__))
> > > +#define mmap(...)              (fail&mmap_             ?
> (seterr(mmap_),
> > >      (void *)-1) : mmap(__VA_ARGS__))
> > > +#define munmap(a, b)           (fail&munmap_           ?
> > > (seterr(munmap_),             -1) : munmap(m_=3D(a), msz_=3D(b)))
> > > +#define setrlimit(...)         (fail&setrlimit_        ?
> > > (seterr(setrlimit_),          -1) : setrlimit(__VA_ARGS__))
> > > +#define sigaltstack(...)       (fail&sigaltstack_      ?
> > > (seterr(sigaltstack_),        -1) : sigaltstack(__VA_ARGS__))
> > > +#define sigaction(...)         (fail&sigaction_        ?
> > > (seterr(sigaction_),          -1) : sigaction(__VA_ARGS__))
> > >
> > >  #define KiB (1024UL)
> > >  #define MiB (KiB*KiB)
> > > @@ -58,74 +57,48 @@ static void *wrap(void *i)
> > >         return wrap;
> > >  }
> > >
> > > -#define chkfail(x, y, z, c1, c2)
>  \
> > > +#define chkfail(x, y, z)
>  \
> > >         do {
>   \
> > > -               call1 =3D 0;
>   \
> > > -               call2 =3D 0;
>   \
> > >                 errno =3D 0;
>   \
> > >                 ok1((fail =3D x) && (y));
>  \
> > >                 ok1(errno =3D=3D (z));
>   \
> > > -               ok1(call1 =3D=3D (c1));
>  \
> > > -               ok1(call2 =3D=3D (c2));
>  \
> > >         } while (0);
> > >
> > > -#define chkok(y, z, c1, c2)
>   \
> > > +#define chkok(y, z)
>   \
> > >         do {
>   \
> > > -               call1 =3D 0;
>   \
> > > -               call2 =3D 0;
>   \
> > >                 errno =3D 0;
>   \
> > >                 fail =3D 0;
>  \
> > >                 ok1((y));
>  \
> > >                 ok1(errno =3D=3D (z));
>   \
> > > -               ok1(call1 =3D=3D (c1));
>  \
> > > -               ok1(call2 =3D=3D (c2));
>  \
> > >         } while (0)
> > >
> > >  int main(void)
> > >  {
> > >         long pgsz =3D sysconf(_SC_PAGESIZE);
> > >
> > > -       plan_tests(50);
> > > +       plan_tests(28);
> > >
> > > -       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(getrlimit_),
> > > -               0,
> > > -               0);
> > > +       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(getrlimit_));
> > >
> > > -       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(setrlimit_),
> > > -               getrlimit_,
> > > -               0);
> > > +       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(setrlimit_));
> > >
> > > -       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(mmap_),
> > > -               getrlimit_|setrlimit_,
> > > -               setrlimit_);
> > > +       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(mmap_));
> > >
> > > -       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(sigaltstack_),
> > > -               getrlimit_|setrlimit_|mmap_,
> > > -               setrlimit_|munmap_);
> > > +       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(sigaltstack_));
> > >
> > > -       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(sigaction_),
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_,
> > > -               setrlimit_|munmap_|sigaltstack_);
> > > +       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0),
> NULL) =3D=3D
> > > -1, e(sigaction_));
> > >
> > > -       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NUL=
L)
> > > =3D=3D  1, e(munmap_),
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > -               setrlimit_|sigaltstack_|sigaction_);
> > > +       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NUL=
L)
> > > =3D=3D  1, e(munmap_));
> > >         if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> > >                 err(1, "munmap");
> > >
> > > -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW,
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW);
> > >
> > >         // be sure segv catch is repeatable (SA_NODEFER)
> > > -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW,
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW);
> > >
> > >         used =3D 1;
> > > -       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW,
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > -               setrlimit_|sigaltstack_|sigaction_);
> > > +       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW);
> > >         if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> > >                 err(1, "munmap");
> > >
> > > @@ -150,17 +123,13 @@ int main(void)
> > >         ok1(strcmp(buf, estr "\n") =3D=3D 0);
> > >
> > >         used =3D 1;
> > > -       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW,
> > > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > +       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000=
),
> > > NULL) =3D=3D -1, EOVERFLOW);
> > >
> > >         diag("used: %lu", used);
> > >         ok1(used >=3D 8*MiB - pgsz && used <=3D 8*MiB + pgsz);
> > >
> > >         used =3D 0;
> > > -       chkok(                  altstack(8*MiB, wrap, int2ptr(100000)=
,
> > > NULL) =3D=3D 0, 0,
> > > -
> > >  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_|munmap_,
> > > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > > +       chkok(                  altstack(8*MiB, wrap, int2ptr(100000)=
,
> > > NULL) =3D=3D 0, 0);
> > >
> > >         used =3D 1;
> > >         altstack_rsp_save();
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

--001a1148869659ab9305356b530a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Very well, I&#39;ve applied your patches as provided (exce=
pt I dropped the trailing underscore from state.rsp_save).<br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jun 16, 2016 at 7:12 AM David Gi=
bson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbe=
ar.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, Jun=
 12, 2016 at 02:10:18AM +0000, Dan Good wrote:<br>
&gt; Hairy macros?=C2=A0 From the author of the cppmagic module, I shall ta=
ke that as<br>
&gt; a compliment.<br>
<br>
Touch=C3=A9.<br>
<br>
That said, cppmagic is using hairy magic to do some things that are,<br>
as far as I know, impossible by any other method.=C2=A0 I don&#39;t think<b=
r>
there&#39;s a similar justification here.<br>
<br>
&gt; The purpose of the setcall macro and related checks is ensure the<br>
&gt; correctness of the error path, i.e. if setrlimit ran before a failure,=
 it<br>
&gt; must run again to undo the first; if mmap ran before a failure, munmap=
 must<br>
&gt; run after.=C2=A0 I find it very reassuring to know these tests exist a=
nd pass.<br>
&gt; Do you see no value in that?<br>
<br>
So, there&#39;s certainly value in checking the error paths, but doing it<b=
r>
by checking what calls the implementation makes is not a great way of<br>
doing it.=C2=A0 It&#39;s pretty subject to both false positives and false<b=
r>
negatives.<br>
<br>
What I&#39;d suggest instead is actually checking the behaviour in<br>
question.=C2=A0 For example, if you want to check that the rlimit is<br>
restored properly I&#39;d suggest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Call getrlimit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Call altstack() in a way rigged to fail<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. Call getrlimit() again<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4. Compare results from (1) and (3)<br>
<br>
&gt; I don&#39;t really see a need to optimize for changing altstack&#39;s<=
br>
&gt; implementation.=C2=A0 It&#39;s less than a hundred lines of code, and =
only ten tests<br>
&gt; using setcall.=C2=A0 Can you tell me why you think it&#39;s important?=
<br>
<br>
So, the checking of specific calls makes the tests very dependent on<br>
altstack&#39;s implementation, and the framework of macros used to do it<br=
>
makes it difficult to change one test without changing them all.<br>
<br>
Together, that makes it almost impossible to change anything<br>
significant about the altstack implementation without having to<br>
significantly rewrite the tests.=C2=A0 And if the tests are significantly<b=
r>
rewritten, it&#39;s hard to be confident that they still check the things<b=
r>
they used to.<br>
<br>
Which undermines the whole value of a testsuite in allowing you to<br>
modify the implementation while being reasonably confident you haven&#39;t<=
br>
changed the desired behaviour.<br>
<br>
This is not theoretical; I have a couple of changes in mind for which<br>
the primary obstacle is adjusting the testsuite to match (switching to<br>
ccan/coroutine to avoid the x86_64 specific code, and using mprotect()<br>
instead of MAP_GROWSDOWN+setrlimit()).<br>
<br>
&gt; On Fri, Jun 3, 2016 at 4:40 AM David Gibson &lt;<a href=3D"mailto:davi=
d@gibson.dropbear.id.au" target=3D"_blank">david@gibson.dropbear.id.au</a>&=
gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; altstack/test/run.c uses some hairy macros to intercept the stand=
ard<br>
&gt; &gt; library functions that altstack uses.=C2=A0 This has two purposes=
: 1) to<br>
&gt; &gt; conditionally cause those functions to fail, and thereby test alt=
stack&#39;s<br>
&gt; &gt; error paths, and 2) log which of the library functions was called=
 in each<br>
&gt; &gt; testcase.<br>
&gt; &gt;<br>
&gt; &gt; The second function isn&#39;t actually useful - for the purposes =
of testing the<br>
&gt; &gt; module, we want to check the actual behaviour, not what calls it =
made in<br>
&gt; &gt; what order to accomplish it.=C2=A0 Explicitly checking the calls =
makes it much<br>
&gt; &gt; harder to change altstack&#39;s implementation without breaking t=
he tests.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dr=
opbear.id.au" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ccan/altstack/test/run.c | 73<br>
&gt; &gt; ++++++++++++++----------------------------------<br>
&gt; &gt;=C2=A0 1 file changed, 21 insertions(+), 52 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c<=
br>
&gt; &gt; index e109ccb..091d1f5 100644<br>
&gt; &gt; --- a/ccan/altstack/test/run.c<br>
&gt; &gt; +++ b/ccan/altstack/test/run.c<br>
&gt; &gt; @@ -20,18 +20,17 @@ enum {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigaction_=C2=A0 =C2=A0 =C2=A0 =
=3D 1&lt;&lt;4,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap_=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 1&lt;&lt;5,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt; -int fail, call1, call2;<br>
&gt; &gt; +int fail;<br>
&gt; &gt;=C2=A0 char *m_;<br>
&gt; &gt;=C2=A0 rlim_t msz_;<br>
&gt; &gt;=C2=A0 #define e(x) (900+(x))<br>
&gt; &gt;=C2=A0 #define seterr(x) (errno =3D e(x))<br>
&gt; &gt; -#define setcall(x) ((call1 |=3D !errno ? (x) : 0), (call2 |=3D e=
rrno ||<br>
&gt; &gt; state.out ? (x) : 0))<br>
&gt; &gt; -#define getrlimit(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;getrlimit_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(getrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : (set=
call(getrlimit_),<br>
&gt; &gt;=C2=A0 getrlimit(__VA_ARGS__)))<br>
&gt; &gt; -#define mmap(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (fail&amp;mmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? (seter=
r(mmap_),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (void *)-1) : (setcall(mmap_),=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mmap(__VA_ARGS__)))<br>
&gt; &gt; -#define munmap(a, b)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fa=
il&amp;munmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?<br>
&gt; &gt; (seterr(munmap_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
-1) : (setcall(munmap_),<br>
&gt; &gt; munmap(m_=3D(a), msz_=3D(b))))<br>
&gt; &gt; -#define setrlimit(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;setrlimit_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(setrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : (set=
call(setrlimit_),<br>
&gt; &gt;=C2=A0 setrlimit(__VA_ARGS__)))<br>
&gt; &gt; -#define sigaltstack(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&amp;sig=
altstack_=C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(sigaltstack_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : (setcall(=
sigaltstack_),<br>
&gt; &gt;=C2=A0 sigaltstack(__VA_ARGS__)))<br>
&gt; &gt; -#define sigaction(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;sigaction_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(sigaction_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : (set=
call(sigaction_),<br>
&gt; &gt;=C2=A0 sigaction(__VA_ARGS__)))<br>
&gt; &gt; +#define getrlimit(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;getrlimit_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(getrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : getr=
limit(__VA_ARGS__))<br>
&gt; &gt; +#define mmap(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (fail&amp;mmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? (seter=
r(mmap_),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (void *)-1) : mmap(__VA_ARGS__))<br>
&gt; &gt; +#define munmap(a, b)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fa=
il&amp;munmap_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?<br>
&gt; &gt; (seterr(munmap_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
-1) : munmap(m_=3D(a), msz_=3D(b)))<br>
&gt; &gt; +#define setrlimit(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;setrlimit_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(setrlimit_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : setr=
limit(__VA_ARGS__))<br>
&gt; &gt; +#define sigaltstack(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&amp;sig=
altstack_=C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(sigaltstack_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : sigaltsta=
ck(__VA_ARGS__))<br>
&gt; &gt; +#define sigaction(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fail&am=
p;sigaction_=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?<br>
&gt; &gt; (seterr(sigaction_),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1) : siga=
ction(__VA_ARGS__))<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define KiB (1024UL)<br>
&gt; &gt;=C2=A0 #define MiB (KiB*KiB)<br>
&gt; &gt; @@ -58,74 +57,48 @@ static void *wrap(void *i)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return wrap;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -#define chkfail(x, y, z, c1, c2)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; +#define chkfail(x, y, z)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call1 =3D=
 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call2 =3D=
 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errn=
o =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(=
(fail =3D x) &amp;&amp; (y));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(=
errno =3D=3D (z));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(call1=
 =3D=3D (c1));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(call2=
 =3D=3D (c2));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (0);<br>
&gt; &gt;<br>
&gt; &gt; -#define chkok(y, z, c1, c2)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; +#define chkok(y, z)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call1 =3D=
 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call2 =3D=
 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errn=
o =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail=
 =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(=
(y));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(=
errno =3D=3D (z));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(call1=
 =3D=3D (c1));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(call2=
 =3D=3D (c2));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 int main(void)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long pgsz =3D sysconf(_SC_PAGESI=
ZE);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0plan_tests(50);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0plan_tests(28);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(getrlimit_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(getrlimit_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(getrlimit_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(getrlimit_));<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(setrlimit_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(setrlimit_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(setrlimit_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(setrlimit_));<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(mmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(mmap_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(mmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(mmap_));<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaltstack_,=C2=A0 =C2=A0alt=
stack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(sigaltstack_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaltstack_,=C2=A0 =C2=A0alt=
stack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(sigaltstack_));<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaction_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(sigaction_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_|sigaltstack_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaction_,=C2=A0 =C2=A0 =C2=
=A0altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D<br>
&gt; &gt; -1, e(sigaction_));<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 altstack(8*MiB, wrap, int2ptr(0), NULL)<br>
&gt; &gt; =3D=3D=C2=A0 1, e(munmap_),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 altstack(8*MiB, wrap, int2ptr(0), NULL)<br>
&gt; &gt; =3D=3D=C2=A0 1, e(munmap_));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, msz_)=
 =3D=3D -1)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err(=
1, &quot;munmap&quot;);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// be sure segv catch is repeata=
ble (SA_NODEFER)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 altstack(1*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fail =3D 0, munmap(m_, msz_)=
 =3D=3D -1)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err(=
1, &quot;munmap&quot;);<br>
&gt; &gt;<br>
&gt; &gt; @@ -150,17 +123,13 @@ int main(void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(strcmp(buf, estr &quot;\n&qu=
ot;) =3D=3D 0);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used =3D 1;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrlimit=
_|setrlimit_|mmap_|sigaltstack_|sigaction_,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(1000000),<br>
&gt; &gt; NULL) =3D=3D -1, EOVERFLOW);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diag(&quot;used: %lu&quot;, used=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok1(used &gt;=3D 8*MiB - pgsz &a=
mp;&amp; used &lt;=3D 8*MiB + pgsz);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(100000),<br>
&gt; &gt; NULL) =3D=3D 0, 0,<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_|munmap_=
,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setrlimit=
_|munmap_|sigaltstack_|sigaction_);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(100000),<br>
&gt; &gt; NULL) =3D=3D 0, 0);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used =3D 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0altstack_rsp_save();<br>
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

--001a1148869659ab9305356b530a--

--===============7656093794557713902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7656093794557713902==--
