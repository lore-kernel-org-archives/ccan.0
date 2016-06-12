From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 4/5] altstack: Don't use 0 pointer literals
Date: Sun, 12 Jun 2016 01:27:12 +0000
Message-ID: <CACNkOJNPh_AUB5+0GhJ1W5GQSqN1efRpxPFajUKOPXdsVe4nng@mail.gmail.com>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-5-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110299434811079174=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRyvQ07G6zDqGs
 for <ccan@lists.ozlabs.org>; Sun, 12 Jun 2016 11:27:28 +1000 (AEST)
Received: from mail-yw0-f173.google.com ([209.85.161.173]) by
 mrelay.perfora.net (mreueus003) with ESMTPSA (Nemesis) id
 0MdtW7-1amvhu3y6H-00Pbi2 for <ccan@lists.ozlabs.org>; Sun, 12 Jun 2016
 03:27:24 +0200
Received: by mail-yw0-f173.google.com with SMTP id x189so99197076ywe.3
 for <ccan@lists.ozlabs.org>; Sat, 11 Jun 2016 18:27:23 -0700 (PDT)
In-Reply-To: <1464943323-8225-5-git-send-email-david@gibson.dropbear.id.au>
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
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

--===============2110299434811079174==
Content-Type: multipart/alternative; boundary=001a11c14bee6cc11a05350aacf1

--001a11c14bee6cc11a05350aacf1
Content-Type: text/plain; charset=UTF-8

Hi David,

I'm back home in front of a real keyboard, and want to follow up with you
about your patches.  I must admit that my usual practice is to use NULL,
and not 0.  Around the time I wrote altstack I had recently read Jen
Gustedt's book, Modern C.  In it, he makes the point that NULL hides more
than it clarifies (see section 11.7).  While I find his argument a little
weak when considering a gcc environment where I know that NULL is defined
as ((void *)0), it seems sound when the target tool chain isn't known in
advance, as with a CCAN module.  Here's a link to the book and also a blog
article from Jens about NULL.  I'm very curious to know if you (or any
other CCAN contributors) find his arguments at all compelling.  Thanks.
 -Dan

http://icube-icps.unistra.fr/img_auth.php/d/db/ModernC.pdf
https://gustedt.wordpress.com/2010/11/07/dont-use-null/

On Fri, Jun 3, 2016 at 4:40 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> In a number of places the altstack module uses a literal '0' for pointer
> values.  That's correct C, but doesn't make it obvious on a quick read
> whether values are integers or pointers.  This patch changes those cases
> to use the NULL define instead.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  ccan/altstack/_info      |  4 ++--
>  ccan/altstack/altstack.c | 10 +++++-----
>  ccan/altstack/altstack.h |  6 +++---
>  ccan/altstack/test/run.c | 22 +++++++++++-----------
>  4 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/ccan/altstack/_info b/ccan/altstack/_info
> index 7accf86..b8cf6a8 100644
> --- a/ccan/altstack/_info
> +++ b/ccan/altstack/_info
> @@ -63,8 +63,8 @@
>   *             void *out;
>   *
>   *             assert(argc == 3);
> - *             stk_max = strtol(argv[1], 0, 0) * 1024 * 1024;
> - *             vla_sz  = strtol(argv[2], 0, 0) * 1024 * 1024;
> + *             stk_max = strtol(argv[1], NULL, 0) * 1024 * 1024;
> + *             vla_sz  = strtol(argv[2], NULL, 0) * 1024 * 1024;
>   *             assert(stk_max > 0 && vla_sz > 0);
>   *
>   *             snprintf(maps, sizeof(maps), "egrep '\\[stack'
> /proc/%d/maps", getpid());
> diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> index 6dfb9fa..2115740 100644
> --- a/ccan/altstack/altstack.c
> +++ b/ccan/altstack/altstack.c
> @@ -78,10 +78,10 @@ int altstack(rlim_t max, void *(*fn)(void *), void
> *arg, void **out)
>
>         state.fn  = fn;
>         state.arg = arg;
> -       state.out = 0;
> +       state.out = NULL;
>         state.max = max;
>         state.ebuf[state.elen = 0] = '\0';
> -       if (out) *out = 0;
> +       if (out) *out = NULL;
>
>         // if the first page below the mapping is in use, we get max-pgsz
> usable bytes
>         // add pgsz to max to guarantee at least max usable bytes
> @@ -91,7 +91,7 @@ int altstack(rlim_t max, void *(*fn)(void *), void *arg,
> void **out)
>         ok(setrlimit(RLIMIT_STACK, &(struct rlimit) { state.max,
> rl_save.rlim_max }), 1);
>         undo++;
>
> -       ok(m = mmap(0, max, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);
> +       ok(m = mmap(NULL, max, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);
>         undo++;
>
>         if (setjmp(state.jmp) == 0) {
> @@ -130,9 +130,9 @@ out:
>
>         switch (undo) {
>         case 4:
> -               ok(sigaction(SIGSEGV, &sa_save, 0), 0);
> +               ok(sigaction(SIGSEGV, &sa_save, NULL), 0);
>         case 3:
> -               ok(sigaltstack(&ss_save, 0), 0);
> +               ok(sigaltstack(&ss_save, NULL), 0);
>         case 2:
>                 ok(munmap(m, max), 0);
>         case 1:
> diff --git a/ccan/altstack/altstack.h b/ccan/altstack/altstack.h
> index 4445a2a..09ffe0b 100644
> --- a/ccan/altstack/altstack.h
> +++ b/ccan/altstack/altstack.h
> @@ -52,7 +52,7 @@
>   *     static void *wrap(void *i)
>   *     {
>   *             dn((unsigned long) i);
> - *             return 0;
> + *             return NULL;
>   *     }
>   *
>   *     #define MiB (1024UL*1024UL)
> @@ -60,9 +60,9 @@
>   *     {
>   *             unsigned long n;
>   *             assert(argc == 2);
> - *             n = strtoul(argv[1], 0, 0);
> + *             n = strtoul(argv[1], NULL, 0);
>   *
> - *             if (altstack(32*MiB, wrap, (void *) n, 0) != 0)
> + *             if (altstack(32*MiB, wrap, (void *) n, NULL) != 0)
>   *                     altstack_perror();
>   *
>   *             printf("%d\n", depth);
> diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> index 61710fd..e109ccb 100644
> --- a/ccan/altstack/test/run.c
> +++ b/ccan/altstack/test/run.c
> @@ -87,43 +87,43 @@ int main(void)
>
>         plan_tests(50);
>
> -       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), 0) ==
> -1, e(getrlimit_),
> +       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(getrlimit_),
>                 0,
>                 0);
>
> -       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), 0) ==
> -1, e(setrlimit_),
> +       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(setrlimit_),
>                 getrlimit_,
>                 0);
>
> -       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), 0) ==
> -1, e(mmap_),
> +       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(mmap_),
>                 getrlimit_|setrlimit_,
>                 setrlimit_);
>
> -       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), 0) ==
> -1, e(sigaltstack_),
> +       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaltstack_),
>                 getrlimit_|setrlimit_|mmap_,
>                 setrlimit_|munmap_);
>
> -       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), 0) ==
> -1, e(sigaction_),
> +       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaction_),
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_,
>                 setrlimit_|munmap_|sigaltstack_);
>
> -       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), 0) ==
> 1, e(munmap_),
> +       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NULL)
> ==  1, e(munmap_),
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
>                 setrlimit_|sigaltstack_|sigaction_);
>         if (fail = 0, munmap(m_, msz_) == -1)
>                 err(1, "munmap");
>
> -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000), 0)
> == -1, EOVERFLOW,
> +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
>                 setrlimit_|munmap_|sigaltstack_|sigaction_);
>
>         // be sure segv catch is repeatable (SA_NODEFER)
> -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000), 0)
> == -1, EOVERFLOW,
> +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
>                 setrlimit_|munmap_|sigaltstack_|sigaction_);
>
>         used = 1;
> -       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000), 0)
> == -1, EOVERFLOW,
> +       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
>                 setrlimit_|sigaltstack_|sigaction_);
>         if (fail = 0, munmap(m_, msz_) == -1)
> @@ -150,7 +150,7 @@ int main(void)
>         ok1(strcmp(buf, estr "\n") == 0);
>
>         used = 1;
> -       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000), 0)
> == -1, EOVERFLOW,
> +       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
>                 getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
>                 setrlimit_|munmap_|sigaltstack_|sigaction_);
>
> @@ -158,7 +158,7 @@ int main(void)
>         ok1(used >= 8*MiB - pgsz && used <= 8*MiB + pgsz);
>
>         used = 0;
> -       chkok(                  altstack(8*MiB, wrap, int2ptr(100000), 0)
> == 0, 0,
> +       chkok(                  altstack(8*MiB, wrap, int2ptr(100000),
> NULL) == 0, 0,
>
> getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_|munmap_,
>                 setrlimit_|munmap_|sigaltstack_|sigaction_);
>
> --
> 2.5.5
>
>

--001a11c14bee6cc11a05350aacf1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi David,<div><br></div><div>I&#39;m back home in front of=
 a real keyboard, and want to follow up with you about your patches.=C2=A0 =
I must admit that my usual practice is to use NULL, and not 0.=C2=A0 Around=
 the time I wrote altstack I had recently read Jen Gustedt&#39;s book, Mode=
rn C.=C2=A0 In it, he makes the point that NULL hides more than it clarifie=
s (see section 11.7).=C2=A0 While I find his argument a little weak when co=
nsidering a gcc environment where I know that NULL is defined as ((void *)0=
), it seems sound when the target tool chain isn&#39;t known in advance, as=
 with a CCAN module.=C2=A0 Here&#39;s a link to the book and also a blog ar=
ticle from Jens about NULL.=C2=A0 I&#39;m very curious to know if you (or a=
ny other CCAN contributors) find his arguments at all compelling.=C2=A0 Tha=
nks. =C2=A0-Dan</div><div><br></div><div><a href=3D"http://icube-icps.unist=
ra.fr/img_auth.php/d/db/ModernC.pdf">http://icube-icps.unistra.fr/img_auth.=
php/d/db/ModernC.pdf</a><br></div><div><a href=3D"https://gustedt.wordpress=
.com/2010/11/07/dont-use-null/">https://gustedt.wordpress.com/2010/11/07/do=
nt-use-null/</a><br></div><div><br></div><div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Fri, Jun 3, 2016 at 4:40 AM David Gibson &lt;<a href=3D"m=
ailto:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">In a number of places the altsta=
ck module uses a literal &#39;0&#39; for pointer<br>
values.=C2=A0 That&#39;s correct C, but doesn&#39;t make it obvious on a qu=
ick read<br>
whether values are integers or pointers.=C2=A0 This patch changes those cas=
es<br>
to use the NULL define instead.<br>
<br>
Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.=
au" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
---<br>
=C2=A0ccan/altstack/_info=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0ccan/altstack/altstack.c | 10 +++++-----<br>
=C2=A0ccan/altstack/altstack.h |=C2=A0 6 +++---<br>
=C2=A0ccan/altstack/test/run.c | 22 +++++++++++-----------<br>
=C2=A04 files changed, 21 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/ccan/altstack/_info b/ccan/altstack/_info<br>
index 7accf86..b8cf6a8 100644<br>
--- a/ccan/altstack/_info<br>
+++ b/ccan/altstack/_info<br>
@@ -63,8 +63,8 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *out;<br>
=C2=A0 *<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(argc =3D=3D =
3);<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stk_max =3D strtol(argv[=
1], 0, 0) * 1024 * 1024;<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vla_sz=C2=A0 =3D strtol(=
argv[2], 0, 0) * 1024 * 1024;<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stk_max =3D strtol(argv[=
1], NULL, 0) * 1024 * 1024;<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vla_sz=C2=A0 =3D strtol(=
argv[2], NULL, 0) * 1024 * 1024;<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(stk_max &gt;=
 0 &amp;&amp; vla_sz &gt; 0);<br>
=C2=A0 *<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(maps, size=
of(maps), &quot;egrep &#39;\\[stack&#39; /proc/%d/maps&quot;, getpid());<br=
>
diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c<br>
index 6dfb9fa..2115740 100644<br>
--- a/ccan/altstack/altstack.c<br>
+++ b/ccan/altstack/altstack.c<br>
@@ -78,10 +78,10 @@ int altstack(rlim_t max, void *(*fn)(void *), void *arg=
, void **out)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state.fn=C2=A0 =3D fn;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state.arg =3D arg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0state.out =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state.out =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state.max =3D max;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state.ebuf[state.elen =3D 0] =3D &#39;\0&#39;;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (out) *out =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (out) *out =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // if the first page below the mapping is in us=
e, we get max-pgsz usable bytes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // add pgsz to max to guarantee at least max us=
able bytes<br>
@@ -91,7 +91,7 @@ int altstack(rlim_t max, void *(*fn)(void *), void *arg, =
void **out)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok(setrlimit(RLIMIT_STACK, &amp;(struct rlimit)=
 { state.max, rl_save.rlim_max }), 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 undo++;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ok(m =3D mmap(0, max, PROT_READ|PROT_WRITE, MAP=
_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ok(m =3D mmap(NULL, max, PROT_READ|PROT_WRITE, =
MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN|MAP_NORESERVE, -1, 0), 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 undo++;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setjmp(state.jmp) =3D=3D 0) {<br>
@@ -130,9 +130,9 @@ out:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (undo) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok(sigaction(SIGSEG=
V, &amp;sa_save, 0), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok(sigaction(SIGSEG=
V, &amp;sa_save, NULL), 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok(sigaltstack(&amp=
;ss_save, 0), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok(sigaltstack(&amp=
;ss_save, NULL), 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok(munmap(m, max), =
0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
diff --git a/ccan/altstack/altstack.h b/ccan/altstack/altstack.h<br>
index 4445a2a..09ffe0b 100644<br>
--- a/ccan/altstack/altstack.h<br>
+++ b/ccan/altstack/altstack.h<br>
@@ -52,7 +52,7 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0static void *wrap(void *i)<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dn((unsigned long) =
i);<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 *<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0#define MiB (1024UL*1024UL)<br>
@@ -60,9 +60,9 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long n;<br=
>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(argc =3D=3D =
2);<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D strtoul(argv[1], 0=
, 0);<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D strtoul(argv[1], N=
ULL, 0);<br>
=C2=A0 *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (altstack(32*MiB, wra=
p, (void *) n, 0) !=3D 0)<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (altstack(32*MiB, wra=
p, (void *) n, NULL) !=3D 0)<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0altstack_perror();<br>
=C2=A0 *<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%d\n&q=
uot;, depth);<br>
diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c<br>
index 61710fd..e109ccb 100644<br>
--- a/ccan/altstack/test/run.c<br>
+++ b/ccan/altstack/test/run.c<br>
@@ -87,43 +87,43 @@ int main(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 plan_tests(50);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(getrlimit_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), 0) =3D=3D -1, e(getrlimit_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(getrlimit_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), NULL) =3D=3D -1, e(getrlimit_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(setrlimit_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), 0) =3D=3D -1, e(setrlimit_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(setrlimit_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), NULL) =3D=3D -1, e(setrlimit_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(mmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 altstack(8*MiB, wrap, int2ptr(0), 0) =3D=3D -1, e(mmap_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(mmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 altstack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D -1, e(mmap_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaltstack_,=C2=A0 =C2=A0altstack(8*Mi=
B, wrap, int2ptr(0), 0) =3D=3D -1, e(sigaltstack_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaltstack_,=C2=A0 =C2=A0altstack(8*Mi=
B, wrap, int2ptr(0), NULL) =3D=3D -1, e(sigaltstack_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_)=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaction_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), 0) =3D=3D -1, e(sigaction_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(sigaction_,=C2=A0 =C2=A0 =C2=A0altstack=
(8*MiB, wrap, int2ptr(0), NULL) =3D=3D -1, e(sigaction_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_|=
sigaltstack_);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 alt=
stack(8*MiB, wrap, int2ptr(0), 0) =3D=3D=C2=A0 1, e(munmap_),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 alt=
stack(8*MiB, wrap, int2ptr(0), NULL) =3D=3D=C2=A0 1, e(munmap_),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|sigaltst=
ack_|sigaction_);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err(1, &quot;munmap=
&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000), 0) =3D=3D -1,=
 EOVERFLOW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000), NULL) =3D=3D =
-1, EOVERFLOW,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_|=
sigaltstack_|sigaction_);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // be sure segv catch is repeatable (SA_NODEFER=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000), 0) =3D=3D -1,=
 EOVERFLOW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(1*MiB, wrap, int2ptr(1000000), NULL) =3D=3D =
-1, EOVERFLOW,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_|=
sigaltstack_|sigaction_);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 alt=
stack(1*MiB, wrap, int2ptr(1000000), 0) =3D=3D -1, EOVERFLOW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkfail(munmap_,=C2=A0 =C2=A0 =C2=A0 =C2=A0 alt=
stack(1*MiB, wrap, int2ptr(1000000), NULL) =3D=3D -1, EOVERFLOW,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|sigaltst=
ack_|sigaction_);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fail =3D 0, munmap(m_, msz_) =3D=3D -1)<br>
@@ -150,7 +150,7 @@ int main(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok1(strcmp(buf, estr &quot;\n&quot;) =3D=3D 0);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(1000000), 0) =3D=3D -1,=
 EOVERFLOW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(1000000), NULL) =3D=3D =
-1, EOVERFLOW,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_|=
sigaltstack_|sigaction_);<br>
<br>
@@ -158,7 +158,7 @@ int main(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok1(used &gt;=3D 8*MiB - pgsz &amp;&amp; used &=
lt;=3D 8*MiB + pgsz);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(100000), 0) =3D=3D 0, 0=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chkok(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 altstack(8*MiB, wrap, int2ptr(100000), NULL) =3D=3D 0=
, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit_|setrlimi=
t_|mmap_|sigaltstack_|sigaction_|munmap_,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setrlimit_|munmap_|=
sigaltstack_|sigaction_);<br>
<br>
--<br>
2.5.5<br>
<br>
</blockquote></div></div></div>

--001a11c14bee6cc11a05350aacf1--

--===============2110299434811079174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2110299434811079174==--
