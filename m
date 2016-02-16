From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 3/4] altstack: Declare memory clobbers
Date: Tue, 16 Feb 2016 17:29:39 +0000
Message-ID: <CACNkOJN+AH9oYc5XfwKVgYYhu3-3d7_rr6wCZkSSAhxG4vjWKw@mail.gmail.com>
References: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
 <1455602965-3201-4-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2013960883606329978=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AC8D41A007F
 for <ccan@lists.ozlabs.org>; Wed, 17 Feb 2016 04:30:11 +1100 (AEDT)
Received: from mail-ob0-f182.google.com ([209.85.214.182]) by
 mrelay.perfora.net (mreueus001) with ESMTPSA (Nemesis) id
 0LaE7U-1a8FCi0Cti-00m1NW for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016
 18:30:06 +0100
Received: by mail-ob0-f182.google.com with SMTP id wb13so269918251obb.1
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 09:30:05 -0800 (PST)
In-Reply-To: <1455602965-3201-4-git-send-email-david@gibson.dropbear.id.au>
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

--===============2013960883606329978==
Content-Type: multipart/alternative; boundary=047d7b2e41daf09aff052be67a34

--047d7b2e41daf09aff052be67a34
Content-Type: text/plain; charset=UTF-8

Thank you for the fixes and improvements.  The clobber change is the only
that gives me pause.  I think the volatile keyword on both is sufficient to
prevent re-ordering.  Are you sure we need the memory clobber?  Thanks.
 -Dan

On Tue, Feb 16, 2016 at 5:04 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> altstack includes a couple of inline asm blocks with x86 push and pop
> instructions.  These instructions will access memory (the stack), but
> that's not declared in inline asm statement.  We seem to be getting away
> with it, but in theory that could allow the compiler to re-order accesses
> to local variables across the asm block.  Since those blocks change the
> location of the stack, that could be very bad.
>
> Adding a "memory" clobber should prevent this (effectively making the asm
> blocks a compiler memory barrier).
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  ccan/altstack/altstack.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> index 640344d..6351293 100644
> --- a/ccan/altstack/altstack.c
> +++ b/ccan/altstack/altstack.c
> @@ -108,9 +108,10 @@ int altstack(rlim_t max, void *(*fn)(void *), void
> *arg, void **out)
>                         "mov %1, %%rsp\n\t"
>                         "sub $8, %%rsp\n\t"
>                         "push %%r10"
> -                       : "=r" (rsp_save_[0]) : "0" (m + max) : "r10");
> +                       : "=r" (rsp_save_[0]) : "0" (m + max) : "r10",
> "memory");
>                 out_ = fn_(arg_);
> -               asm volatile ("pop %rsp");
> +               asm volatile ("pop %%rsp"
> +                             : : : "memory");
>                 ret = 0;
>                 if (out) *out = out_;
>         }
> --
> 2.5.0
>
>

--047d7b2e41daf09aff052be67a34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the fixes and improvements.=C2=A0 The clobbe=
r change is the only that gives me pause.=C2=A0 I think the volatile keywor=
d on both is sufficient to prevent re-ordering.=C2=A0 Are you sure we need =
the memory clobber?=C2=A0 Thanks. =C2=A0-Dan<br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Tue, Feb 16, 2016 at 5:04 AM David Gibson &lt;<a hr=
ef=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">altstack includes a coupl=
e of inline asm blocks with x86 push and pop<br>
instructions.=C2=A0 These instructions will access memory (the stack), but<=
br>
that&#39;s not declared in inline asm statement.=C2=A0 We seem to be gettin=
g away<br>
with it, but in theory that could allow the compiler to re-order accesses<b=
r>
to local variables across the asm block.=C2=A0 Since those blocks change th=
e<br>
location of the stack, that could be very bad.<br>
<br>
Adding a &quot;memory&quot; clobber should prevent this (effectively making=
 the asm<br>
blocks a compiler memory barrier).<br>
<br>
Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.=
au" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
---<br>
=C2=A0ccan/altstack/altstack.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c<br>
index 640344d..6351293 100644<br>
--- a/ccan/altstack/altstack.c<br>
+++ b/ccan/altstack/altstack.c<br>
@@ -108,9 +108,10 @@ int altstack(rlim_t max, void *(*fn)(void *), void *ar=
g, void **out)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;mov %1, %%rsp\n\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;sub $8, %%rsp\n\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;push %%r10&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: &quot;=3Dr&quot; (rsp_save_[0]) : &quot;0&quot; (m + max) : &qu=
ot;r10&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: &quot;=3Dr&quot; (rsp_save_[0]) : &quot;0&quot; (m + max) : &qu=
ot;r10&quot;, &quot;memory&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_ =3D fn_(arg_);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile (&quot=
;pop %rsp&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile (&quot=
;pop %%rsp&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: : : &quot;memory&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (out) *out =3D o=
ut_;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
2.5.0<br>
<br>
</blockquote></div></div>

--047d7b2e41daf09aff052be67a34--

--===============2013960883606329978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2013960883606329978==--
