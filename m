From: Damien Grassart <damien@grassart.com>
Subject: Re: [PATCH 2/2] darray: Fix bug in the darray_remove() macro
Date: Mon, 28 Aug 2017 07:03:33 +0200
Message-ID: <CADZuF1m+9yykfWVCecjHzfDT8L9mqhOjtcytCPqCPxTQ_aJvag@mail.gmail.com>
References: <20170827025642.GN2772@umbus.fritz.box>
 <20170827212624.14673-1-damien@grassart.com>
 <20170827212624.14673-2-damien@grassart.com>
 <20170828024841.GC2578@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3496825900126161796=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgfmn2YWNzDqBb
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 15:03:36 +1000 (AEST)
Received: by mail-it0-x236.google.com with SMTP id n5so21953557itb.1
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 22:03:36 -0700 (PDT)
In-Reply-To: <20170828024841.GC2578@umbus.fritz.box>
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

--===============3496825900126161796==
Content-Type: multipart/alternative; boundary="94eb2c19dcac7b5c9d0557c93734"

--94eb2c19dcac7b5c9d0557c93734
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ugh, sorry about that, I forgot to run the tests after the last patch
fixing darray_remove(). I missed a backslash in that patch (darray: Fix bug
in the darray_remove() macro). I'll resend it with the missing parentheses
around the macro params. Thanks.

On Mon, Aug 28, 2017 at 4:48 AM, David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Sun, Aug 27, 2017 at 11:26:24PM +0200, Damien Grassart wrote:
> > The memmove() call should be using the index argument to determine the
> > number of bytes to copy. To be consistent with the rest of the code,
> > we should also not evaluate the index parameter multiple
> > times. Calling this with rand() % arr.size would otherwise generally
> > segfault.
> >
> > Finally, we want to avoid using "index" as an identifier so as to not
> > shadow index(3) in the C library.
> >
> > Signed-off-by: Damien Grassart <damien@grassart.com>
>
> This breaks compile for me, though I can't quickly see why.
>
> $ make
> cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef
> -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strin=
gs
> -DCCAN_STR_DEBUG=3D1 -I.  -MMD -MP -MFccan/strgrp/strgrp.o.d
> -MTccan/strgrp/strgrp.o -c ccan/strgrp/strgrp.c -o ccan/strgrp/strgrp.o
> In file included from ccan/strgrp/strgrp.c:26:0:
> ./ccan/darray/darray.h:235:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98if=E2=80=99
>   if (index_ < arr.size-1)    \
>   ^~
> ./ccan/darray/darray.h:237:7: error: expected =E2=80=98=3D=E2=80=99, =E2=
=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or
> =E2=80=98__attribute__=E2=80=99 before =E2=80=98.=E2=80=99 token
>   (arr).size--;  \
>        ^
> ./ccan/darray/darray.h:238:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98}=E2=80=99
> token
>   } while(0)
>   ^
> ./ccan/darray/darray.h:238:4: error: expected identifier or =E2=80=98(=E2=
=80=99 before
> =E2=80=98while=E2=80=99
>   } while(0)
>     ^~~~~
>
> I also noticed that both this and the earlier patches use:
>         size_t index_ =3D i;
> in the macro, without parentheses around the 'i' macro paramater.
> That's not the cause of the error above, but it's not good practice as
> a rule.
>
> So, I've backed out these darray patches for now.  Can you debug the
> compile problem above and resend the whole lot as a single series.
>
> > ---
> >  ccan/darray/darray.h | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> > index 82726c05..6787f14c 100644
> > --- a/ccan/darray/darray.h
> > +++ b/ccan/darray/darray.h
> > @@ -170,8 +170,8 @@ typedef darray(unsigned long)  darray_ulong;
> >               memmove((arr).item+1, (arr).item,
> ((arr).size-1)*sizeof(*(arr).item)); \
> >               (arr).item[0] =3D (__VA_ARGS__); \
> >       } while(0)
> > -#define darray_insert(arr, index, ...) do { \
> > -             size_t index_ =3D index; \
> > +#define darray_insert(arr, i, ...) do { \
> > +             size_t index_ =3D i; \
> >               darray_resize(arr, (arr).size+1); \
> >               memmove((arr).item+index_+1, (arr).item+index_,
> ((arr).size-index_-1)*sizeof(*(arr).item)); \
> >               (arr).item[index_] =3D (__VA_ARGS__); \
> > @@ -230,9 +230,10 @@ typedef darray(unsigned long)  darray_ulong;
> >  #define darray_pop(arr) ((arr).item[--(arr).size])
> >  #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NULL)
> >  /* Warning, slow: Requires copying all elements after removed item. */
> > -#define darray_remove(arr, index) do { \
> > -     if (index < arr.size-1)    \
> > -             memmove(&(arr).item[index], &(arr).item[index+1],
> ((arr).size-1-i)*sizeof(*(arr).item)); \
> > +#define darray_remove(arr, i) do { \
> > +     size_t index_ =3D i;
> > +     if (index_ < arr.size-1)    \
> > +             memmove(&(arr).item[index_], &(arr).item[index_+1],
> ((arr).size-1-index_)*sizeof(*(arr).item)); \
> >       (arr).size--;  \
> >       } while(0)
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--94eb2c19dcac7b5c9d0557c93734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ugh, sorry about that, I forgot to run the tests after the=
 last patch fixing darray_remove(). I missed a backslash in that patch (dar=
ray: Fix bug in the darray_remove() macro). I&#39;ll resend it with the mis=
sing parentheses around the macro params. Thanks.</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Mon, Aug 28, 2017 at 4:48 AM, Davi=
d Gibson <span dir=3D"ltr">&lt;<a href=3D"mailto:david@gibson.dropbear.id.a=
u" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D"">On Sun, Aug 27, 2017 at 11:2=
6:24PM +0200, Damien Grassart wrote:<br>
&gt; The memmove() call should be using the index argument to determine the=
<br>
&gt; number of bytes to copy. To be consistent with the rest of the code,<b=
r>
&gt; we should also not evaluate the index parameter multiple<br>
&gt; times. Calling this with rand() % arr.size would otherwise generally<b=
r>
&gt; segfault.<br>
&gt;<br>
&gt; Finally, we want to avoid using &quot;index&quot; as an identifier so =
as to not<br>
&gt; shadow index(3) in the C library.<br>
&gt;<br>
&gt; Signed-off-by: Damien Grassart &lt;<a href=3D"mailto:damien@grassart.c=
om">damien@grassart.com</a>&gt;<br>
<br>
</span>This breaks compile for me, though I can&#39;t quickly see why.<br>
<br>
$ make<br>
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmis=
sing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCC=
AN_STR_DEBUG=3D1 -I.=C2=A0 -MMD -MP -MFccan/strgrp/strgrp.o.d -MTccan/strgr=
p/strgrp.o -c ccan/strgrp/strgrp.c -o ccan/strgrp/strgrp.o<br>
In file included from ccan/strgrp/strgrp.c:26:0:<br>
./ccan/darray/darray.h:235:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98if=E2=80=99<br>
=C2=A0 if (index_ &lt; arr.size-1)=C2=A0 =C2=A0 \<br>
=C2=A0 ^~<br>
./ccan/darray/darray.h:237:7: error: expected =E2=80=98=3D=E2=80=99, =E2=80=
=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__att=
ribute__=E2=80=99 before =E2=80=98.=E2=80=99 token<br>
=C2=A0 (arr).size--;=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
./ccan/darray/darray.h:238:2: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98}=E2=80=99 token<br>
=C2=A0 } while(0)<br>
=C2=A0 ^<br>
./ccan/darray/darray.h:238:4: error: expected identifier or =E2=80=98(=E2=
=80=99 before =E2=80=98while=E2=80=99<br>
=C2=A0 } while(0)<br>
=C2=A0 =C2=A0 ^~~~~<br>
<br>
I also noticed that both this and the earlier patches use:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t index_ =3D i;<br>
in the macro, without parentheses around the &#39;i&#39; macro paramater.<b=
r>
That&#39;s not the cause of the error above, but it&#39;s not good practice=
 as<br>
a rule.<br>
<br>
So, I&#39;ve backed out these darray patches for now.=C2=A0 Can you debug t=
he<br>
compile problem above and resend the whole lot as a single series.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 ccan/darray/darray.h | 11 ++++++-----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h<br>
&gt; index 82726c05..6787f14c 100644<br>
&gt; --- a/ccan/darray/darray.h<br>
&gt; +++ b/ccan/darray/darray.h<br>
&gt; @@ -170,8 +170,8 @@ typedef darray(unsigned long)=C2=A0 darray_ulong;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove((arr).it=
em+1, (arr).item, ((arr).size-1)*sizeof(*(arr).<wbr>item)); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(arr).item[0] =
=3D (__VA_ARGS__); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while(0)<br>
&gt; -#define darray_insert(arr, index, ...) do { \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t index_ =3D ind=
ex; \<br>
&gt; +#define darray_insert(arr, i, ...) do { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t index_ =3D i; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0darray_resize(ar=
r, (arr).size+1); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove((arr).it=
em+index_+1, (arr).item+index_, ((arr).size-index_-1)*sizeof(*<wbr>(arr).it=
em)); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(arr).item[index=
_] =3D (__VA_ARGS__); \<br>
&gt; @@ -230,9 +230,10 @@ typedef darray(unsigned long)=C2=A0 darray_ulong;=
<br>
&gt;=C2=A0 #define darray_pop(arr) ((arr).item[--(arr).size])<br>
&gt;=C2=A0 #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NU=
LL)<br>
&gt;=C2=A0 /* Warning, slow: Requires copying all elements after removed it=
em. */<br>
&gt; -#define darray_remove(arr, index) do { \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (index &lt; arr.size-1)=C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[index], &amp;(arr).item[index+1], ((arr).size-1-i)*sizeof(*(arr)<wbr>.it=
em)); \<br>
&gt; +#define darray_remove(arr, i) do { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t index_ =3D i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (index_ &lt; arr.size-1)=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[index_], &amp;(arr).item[index_+1], ((arr).size-1-index_)*sizeof(*<wbr>(=
arr).item)); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(arr).size--;=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while(0)<br>
&gt;<br>
<br>
--<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">David Gibson=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | I&#39;ll have=
 my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer" target=
=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank you.=C2=A0 =
NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.ozlabs.org/~dgibson</a><br>
</div></div></blockquote></div><br></div>

--94eb2c19dcac7b5c9d0557c93734--

--===============3496825900126161796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3496825900126161796==--
