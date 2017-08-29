From: Damien Grassart <damien@grassart.com>
Subject: Re: [PATCH] darray: Fix bug in the darray_remove() macro
Date: Tue, 29 Aug 2017 12:08:35 +0200
Message-ID: <CADZuF1mLkhZxr+p8PhyMHjhznUTgwH=nkLA5vmRp+DaaodUz_g@mail.gmail.com>
References: <20170828024841.GC2578@umbus.fritz.box>
 <20170828050935.16047-1-damien@grassart.com>
 <20170829045455.GF2578@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5180679098904258740=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhPVJ1kFWzDqZ6
 for <ccan@lists.ozlabs.org>; Tue, 29 Aug 2017 20:08:40 +1000 (AEST)
Received: by mail-io0-x244.google.com with SMTP id c18so3096087ioj.2
 for <ccan@lists.ozlabs.org>; Tue, 29 Aug 2017 03:08:39 -0700 (PDT)
In-Reply-To: <20170829045455.GF2578@umbus.fritz.box>
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

--===============5180679098904258740==
Content-Type: multipart/alternative; boundary="001a11c14d7230a5820557e19844"

--001a11c14d7230a5820557e19844
Content-Type: text/plain; charset="UTF-8"

Sorry about the confusion, I'll resend the whole set.

On Tue, Aug 29, 2017 at 6:54 AM, David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Mon, Aug 28, 2017 at 07:09:35AM +0200, Damien Grassart wrote:
> > The memmove() call should be using the index argument to determine the
> > number of bytes to copy. To be consistent with the rest of the code,
> > we should also not evaluate the index parameter multiple
> > times. Calling this with rand() % arr.size would otherwise generally
> > segfault.
> >
> > Finally, we want to avoid using "index" as an identifier so as to not
> > shadow index(3) in the C library.
>
> Uh.. sorry, I think we're in a state of confusion because applied some
> of the patches then removed them again due to problems discovered
> later.
>
> Can you please rebase on the latest ccan tree and send me the whole
> set of patches as a batch.
>
> >
> > Signed-off-by: Damien Grassart <damien@grassart.com>
> > ---
> >  ccan/darray/darray.h | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> > index 82726c05..58470fde 100644
> > --- a/ccan/darray/darray.h
> > +++ b/ccan/darray/darray.h
> > @@ -170,8 +170,8 @@ typedef darray(unsigned long)  darray_ulong;
> >               memmove((arr).item+1, (arr).item,
> ((arr).size-1)*sizeof(*(arr).item)); \
> >               (arr).item[0] = (__VA_ARGS__); \
> >       } while(0)
> > -#define darray_insert(arr, index, ...) do { \
> > -             size_t index_ = index; \
> > +#define darray_insert(arr, i, ...) do { \
> > +             size_t index_ = (i); \
> >               darray_resize(arr, (arr).size+1); \
> >               memmove((arr).item+index_+1, (arr).item+index_,
> ((arr).size-index_-1)*sizeof(*(arr).item)); \
> >               (arr).item[index_] = (__VA_ARGS__); \
> > @@ -230,9 +230,10 @@ typedef darray(unsigned long)  darray_ulong;
> >  #define darray_pop(arr) ((arr).item[--(arr).size])
> >  #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NULL)
> >  /* Warning, slow: Requires copying all elements after removed item. */
> > -#define darray_remove(arr, index) do { \
> > -     if (index < arr.size-1)    \
> > -             memmove(&(arr).item[index], &(arr).item[index+1],
> ((arr).size-1-i)*sizeof(*(arr).item)); \
> > +#define darray_remove(arr, i) do { \
> > +     size_t index_ = (i); \
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

--001a11c14d7230a5820557e19844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry about the confusion, I&#39;ll resend the whole set.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug =
29, 2017 at 6:54 AM, David Gibson <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
avid@gibson.dropbear.id.au" target=3D"_blank">david@gibson.dropbear.id.au</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Mon, Aug 28, 2017 at 07:09:35AM +0200, Damien Grassart wrote:<br>
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
<br>
</span>Uh.. sorry, I think we&#39;re in a state of confusion because applie=
d some<br>
of the patches then removed them again due to problems discovered<br>
later.<br>
<br>
Can you please rebase on the latest ccan tree and send me the whole<br>
set of patches as a batch.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Damien Grassart &lt;<a href=3D"mailto:damien@grassart.c=
om">damien@grassart.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ccan/darray/darray.h | 11 ++++++-----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h<br>
&gt; index 82726c05..58470fde 100644<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t index_ =3D (i)=
; \<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0size_t index_ =3D (i); \<br>
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

--001a11c14d7230a5820557e19844--

--===============5180679098904258740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5180679098904258740==--
