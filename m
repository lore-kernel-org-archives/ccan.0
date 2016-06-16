From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 5/5] altstack: Don't log internal calls in test
 cases
Date: Thu, 16 Jun 2016 17:34:49 +1000
Message-ID: <20160616073449.GF1642@voom.fritz.box>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-6-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJPSMffBBHiS=ti6-TdQRrvvoTGqENX1hqgpJAxYxGYnQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6828363370642148150=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVghF2Fz2zDqkg
 for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016 21:12:13 +1000 (AEST)
In-Reply-To: <CACNkOJPSMffBBHiS=ti6-TdQRrvvoTGqENX1hqgpJAxYxGYnQQ@mail.gmail.com>
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


--===============6828363370642148150==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2016 at 02:10:18AM +0000, Dan Good wrote:
> Hairy macros?  From the author of the cppmagic module, I shall take that =
as
> a compliment.

Touch=E9.

That said, cppmagic is using hairy magic to do some things that are,
as far as I know, impossible by any other method.  I don't think
there's a similar justification here.

> The purpose of the setcall macro and related checks is ensure the
> correctness of the error path, i.e. if setrlimit ran before a failure, it
> must run again to undo the first; if mmap ran before a failure, munmap mu=
st
> run after.  I find it very reassuring to know these tests exist and pass.
> Do you see no value in that?

So, there's certainly value in checking the error paths, but doing it
by checking what calls the implementation makes is not a great way of
doing it.  It's pretty subject to both false positives and false
negatives.

What I'd suggest instead is actually checking the behaviour in
question.  For example, if you want to check that the rlimit is
restored properly I'd suggest:
        1. Call getrlimit()
	2. Call altstack() in a way rigged to fail
	3. Call getrlimit() again
	4. Compare results from (1) and (3)

> I don't really see a need to optimize for changing altstack's
> implementation.  It's less than a hundred lines of code, and only ten tes=
ts
> using setcall.  Can you tell me why you think it's important?

So, the checking of specific calls makes the tests very dependent on
altstack's implementation, and the framework of macros used to do it
makes it difficult to change one test without changing them all.

Together, that makes it almost impossible to change anything
significant about the altstack implementation without having to
significantly rewrite the tests.  And if the tests are significantly
rewritten, it's hard to be confident that they still check the things
they used to.

Which undermines the whole value of a testsuite in allowing you to
modify the implementation while being reasonably confident you haven't
changed the desired behaviour.

This is not theoretical; I have a couple of changes in mind for which
the primary obstacle is adjusting the testsuite to match (switching to
ccan/coroutine to avoid the x86_64 specific code, and using mprotect()
instead of MAP_GROWSDOWN+setrlimit()).

> On Fri, Jun 3, 2016 at 4:40 AM David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > altstack/test/run.c uses some hairy macros to intercept the standard
> > library functions that altstack uses.  This has two purposes: 1) to
> > conditionally cause those functions to fail, and thereby test altstack's
> > error paths, and 2) log which of the library functions was called in ea=
ch
> > testcase.
> >
> > The second function isn't actually useful - for the purposes of testing=
 the
> > module, we want to check the actual behaviour, not what calls it made in
> > what order to accomplish it.  Explicitly checking the calls makes it mu=
ch
> > harder to change altstack's implementation without breaking the tests.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  ccan/altstack/test/run.c | 73
> > ++++++++++++++----------------------------------
> >  1 file changed, 21 insertions(+), 52 deletions(-)
> >
> > diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> > index e109ccb..091d1f5 100644
> > --- a/ccan/altstack/test/run.c
> > +++ b/ccan/altstack/test/run.c
> > @@ -20,18 +20,17 @@ enum {
> >         sigaction_      =3D 1<<4,
> >         munmap_         =3D 1<<5,
> >  };
> > -int fail, call1, call2;
> > +int fail;
> >  char *m_;
> >  rlim_t msz_;
> >  #define e(x) (900+(x))
> >  #define seterr(x) (errno =3D e(x))
> > -#define setcall(x) ((call1 |=3D !errno ? (x) : 0), (call2 |=3D errno ||
> > state.out ? (x) : 0))
> > -#define getrlimit(...)         (fail&getrlimit_        ?
> > (seterr(getrlimit_),          -1) : (setcall(getrlimit_),
> >  getrlimit(__VA_ARGS__)))
> > -#define mmap(...)              (fail&mmap_             ? (seterr(mmap_=
),
> >      (void *)-1) : (setcall(mmap_),          mmap(__VA_ARGS__)))
> > -#define munmap(a, b)           (fail&munmap_           ?
> > (seterr(munmap_),             -1) : (setcall(munmap_),
> > munmap(m_=3D(a), msz_=3D(b))))
> > -#define setrlimit(...)         (fail&setrlimit_        ?
> > (seterr(setrlimit_),          -1) : (setcall(setrlimit_),
> >  setrlimit(__VA_ARGS__)))
> > -#define sigaltstack(...)       (fail&sigaltstack_      ?
> > (seterr(sigaltstack_),        -1) : (setcall(sigaltstack_),
> >  sigaltstack(__VA_ARGS__)))
> > -#define sigaction(...)         (fail&sigaction_        ?
> > (seterr(sigaction_),          -1) : (setcall(sigaction_),
> >  sigaction(__VA_ARGS__)))
> > +#define getrlimit(...)         (fail&getrlimit_        ?
> > (seterr(getrlimit_),          -1) : getrlimit(__VA_ARGS__))
> > +#define mmap(...)              (fail&mmap_             ? (seterr(mmap_=
),
> >      (void *)-1) : mmap(__VA_ARGS__))
> > +#define munmap(a, b)           (fail&munmap_           ?
> > (seterr(munmap_),             -1) : munmap(m_=3D(a), msz_=3D(b)))
> > +#define setrlimit(...)         (fail&setrlimit_        ?
> > (seterr(setrlimit_),          -1) : setrlimit(__VA_ARGS__))
> > +#define sigaltstack(...)       (fail&sigaltstack_      ?
> > (seterr(sigaltstack_),        -1) : sigaltstack(__VA_ARGS__))
> > +#define sigaction(...)         (fail&sigaction_        ?
> > (seterr(sigaction_),          -1) : sigaction(__VA_ARGS__))
> >
> >  #define KiB (1024UL)
> >  #define MiB (KiB*KiB)
> > @@ -58,74 +57,48 @@ static void *wrap(void *i)
> >         return wrap;
> >  }
> >
> > -#define chkfail(x, y, z, c1, c2)                                      =
 \
> > +#define chkfail(x, y, z)                                              =
 \
> >         do {                                                           =
 \
> > -               call1 =3D 0;                                           =
   \
> > -               call2 =3D 0;                                           =
   \
> >                 errno =3D 0;                                           =
   \
> >                 ok1((fail =3D x) && (y));                              =
   \
> >                 ok1(errno =3D=3D (z));                                 =
     \
> > -               ok1(call1 =3D=3D (c1));                                =
     \
> > -               ok1(call2 =3D=3D (c2));                                =
     \
> >         } while (0);
> >
> > -#define chkok(y, z, c1, c2)                                           =
 \
> > +#define chkok(y, z)                                                   =
 \
> >         do {                                                           =
 \
> > -               call1 =3D 0;                                           =
   \
> > -               call2 =3D 0;                                           =
   \
> >                 errno =3D 0;                                           =
   \
> >                 fail =3D 0;                                            =
   \
> >                 ok1((y));                                              =
 \
> >                 ok1(errno =3D=3D (z));                                 =
     \
> > -               ok1(call1 =3D=3D (c1));                                =
     \
> > -               ok1(call2 =3D=3D (c2));                                =
     \
> >         } while (0)
> >
> >  int main(void)
> >  {
> >         long pgsz =3D sysconf(_SC_PAGESIZE);
> >
> > -       plan_tests(50);
> > +       plan_tests(28);
> >
> > -       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(getrlimit_),
> > -               0,
> > -               0);
> > +       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(getrlimit_));
> >
> > -       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(setrlimit_),
> > -               getrlimit_,
> > -               0);
> > +       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(setrlimit_));
> >
> > -       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(mmap_),
> > -               getrlimit_|setrlimit_,
> > -               setrlimit_);
> > +       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(mmap_));
> >
> > -       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(sigaltstack_),
> > -               getrlimit_|setrlimit_|mmap_,
> > -               setrlimit_|munmap_);
> > +       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(sigaltstack_));
> >
> > -       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(sigaction_),
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_,
> > -               setrlimit_|munmap_|sigaltstack_);
> > +       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), NULL)=
 =3D=3D
> > -1, e(sigaction_));
> >
> > -       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NULL)
> > =3D=3D  1, e(munmap_),
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > -               setrlimit_|sigaltstack_|sigaction_);
> > +       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NULL)
> > =3D=3D  1, e(munmap_));
> >         if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> >                 err(1, "munmap");
> >
> > -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW,
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW);
> >
> >         // be sure segv catch is repeatable (SA_NODEFER)
> > -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW,
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW);
> >
> >         used =3D 1;
> > -       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW,
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > -               setrlimit_|sigaltstack_|sigaction_);
> > +       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW);
> >         if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)
> >                 err(1, "munmap");
> >
> > @@ -150,17 +123,13 @@ int main(void)
> >         ok1(strcmp(buf, estr "\n") =3D=3D 0);
> >
> >         used =3D 1;
> > -       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW,
> > -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > +       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000),
> > NULL) =3D=3D -1, EOVERFLOW);
> >
> >         diag("used: %lu", used);
> >         ok1(used >=3D 8*MiB - pgsz && used <=3D 8*MiB + pgsz);
> >
> >         used =3D 0;
> > -       chkok(                  altstack(8*MiB, wrap, int2ptr(100000),
> > NULL) =3D=3D 0, 0,
> > -
> >  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_|munmap_,
> > -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> > +       chkok(                  altstack(8*MiB, wrap, int2ptr(100000),
> > NULL) =3D=3D 0, 0);
> >
> >         used =3D 1;
> >         altstack_rsp_save();
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYlaZAAoJEGw4ysog2bOSs2UQAIfZTv/PflWVcH1iQt/hmeUM
QUHv1i/+VN9MA+qKx4ZpSNxO+VYnDGmeoxGrJpVpmvlU6iYU8Gchp0iQpHxE6h9/
fBMT48V0r5JQE8H+JWKQ3EQCUWOXRg0W5e7HcmVWQYrTrMGmzf0fqveMRNsHGv1Y
oHyBKJW7tcOgWeWmJi/M0BXwrmMYg+cwnYl5gN2tBcqb5+XJek8tMXMhjskqvqJ4
qBu/pr4c29KB0+rokaDuuhFSe9lhVKVcbDgvpzSOIMgOtTap0zJn+hLCNk9EP9XF
CHMpzBZHIjEHpN9/cYnL181n0oUg5vnzrjhVon0thNAM1iPWWfX9/UgoCrzCZqCD
CPGuUaPXzfSUzkY5XBjsKOH5GxEKk183cIkhIy1o5JfnOWkb0Z7emZXyJ+XyA4DJ
VW/Elta1tQUA6FVnGdHe+vV0am192xxDycoLaV6rgfb+Oapp0kUeEDpEFNG8Cx+Z
lT/7bd0iSFs0XqPtcfyZdI64tY5rxN80aepL6IoTIabVMFeYP0mh0LdK3malB835
xiXoupwnH6AZuGkCCcLNpvmLemkYA2DIEVQ+ljivt4wEEG5h+S4Sws+i3cDVIm3e
9pQF5ipPC92O9k3LVaEwwvJiO9VFHHms8b+2XBzvDu+j9/nSkCABqAs6m4BwVugh
SYYkKBWedM+tT11baLnP
=TgKR
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--

--===============6828363370642148150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6828363370642148150==--
