From: Damien Grassart <damien@grassart.com>
Subject: Re: [PATCH 2/2] darray: Evaluate the index parameter only
 once in darray_remove()
Date: Sun, 27 Aug 2017 22:11:14 +0200
Message-ID: <CADZuF1n3WzKPYSfcwJT7mYHLmwskHKFv78JU6K_qhsRE+sR1tQ@mail.gmail.com>
References: <20170826162652.16072-1-damien@grassart.com>
 <20170827025853.GO2772@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5354089590043869722=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgQyY3qPczDqgq
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 06:11:16 +1000 (AEST)
Received: by mail-it0-x241.google.com with SMTP id c196so3055109itc.3
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 13:11:16 -0700 (PDT)
In-Reply-To: <20170827025853.GO2772@umbus.fritz.box>
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

--===============5354089590043869722==
Content-Type: multipart/alternative; boundary="94eb2c04963aba52bf0557c1c775"

--94eb2c04963aba52bf0557c1c775
Content-Type: text/plain; charset="UTF-8"

Oops sorry I'll resend with the Signed-off-by.
For the underscores, I was trying to keep the same style as the rest of the
code, but I can resend a patch with all the "__identifiers" switched to
 "identifiers__"?

On Sun, Aug 27, 2017 at 4:58 AM, David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Sat, Aug 26, 2017 at 06:26:52PM +0200, Damien Grassart wrote:
> > To be consistent with the rest of the code, the index paramater should
> > not be evaluated multiple times. Calling this with rand() % arr.size
> > would otherwise generally segfault.
> > ---
> >  ccan/darray/darray.h | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> Looks like a definite improvement, but I need a Signed-off-by line in
> order to apply it.
>
> Also.. identifiers starting with _ are technically reserved for system
> use.  You'd probably get away with it, but it's best to avoid them.  I
> usually put _ after the name instead for this sort of thing.
>
> >
> > diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> > index 8d47645b..6dd34f08 100644
> > --- a/ccan/darray/darray.h
> > +++ b/ccan/darray/darray.h
> > @@ -224,8 +224,9 @@ typedef darray(unsigned long)  darray_ulong;
> >  #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NULL)
> >  /* Warning, slow: Requires copying all elements after removed item. */
> >  #define darray_remove(arr, index) do { \
> > -     if (index < arr.size-1)    \
> > -             memmove(&(arr).item[index], &(arr).item[index+1],
> ((arr).size-1-index)*sizeof(*(arr).item)); \
> > +     size_t __index = index; \
> > +     if (__index < arr.size-1)    \
> > +             memmove(&(arr).item[__index], &(arr).item[__index+1],
> ((arr).size-1-__index)*sizeof(*(arr).item)); \
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

--94eb2c04963aba52bf0557c1c775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oops sorry I&#39;ll resend with the Signed-off-by.<div>For=
 the underscores, I was trying to keep the same style as the rest of the co=
de, but I can resend a patch with all the &quot;__identifiers&quot; switche=
d to =C2=A0&quot;identifiers__&quot;?</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Sun, Aug 27, 2017 at 4:58 AM, David Gibs=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:david@gibson.dropbear.id.au" tar=
get=3D"_blank">david@gibson.dropbear.id.au</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><span class=3D"">On Sat, Aug 26, 2017 at 06:26:52PM=
 +0200, Damien Grassart wrote:<br>
&gt; To be consistent with the rest of the code, the index paramater should=
<br>
&gt; not be evaluated multiple times. Calling this with rand() % arr.size<b=
r>
&gt; would otherwise generally segfault.<br>
&gt; ---<br>
&gt;=C2=A0 ccan/darray/darray.h | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
</span>Looks like a definite improvement, but I need a Signed-off-by line i=
n<br>
order to apply it.<br>
<br>
Also.. identifiers starting with _ are technically reserved for system<br>
use.=C2=A0 You&#39;d probably get away with it, but it&#39;s best to avoid =
them.=C2=A0 I<br>
usually put _ after the name instead for this sort of thing.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h<br>
&gt; index 8d47645b..6dd34f08 100644<br>
&gt; --- a/ccan/darray/darray.h<br>
&gt; +++ b/ccan/darray/darray.h<br>
&gt; @@ -224,8 +224,9 @@ typedef darray(unsigned long)=C2=A0 darray_ulong;<=
br>
&gt;=C2=A0 #define darray_pop_check(arr) ((arr).size ? darray_pop(arr) : NU=
LL)<br>
&gt;=C2=A0 /* Warning, slow: Requires copying all elements after removed it=
em. */<br>
&gt;=C2=A0 #define darray_remove(arr, index) do { \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (index &lt; arr.size-1)=C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[index], &amp;(arr).item[index+1], ((arr).size-1-index)*sizeof(*(<wbr>arr=
).item)); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t __index =3D index; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (__index &lt; arr.size-1)=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[__index], &amp;(arr).item[__index+1], ((arr).size-1-__index)*sizeof(<wbr=
>*(arr).item)); \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(arr).size--;=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while(0)<br>
&gt;<br>
<br>
--<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">David Gibson=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | I&#39;=
ll have my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer" target=
=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank you.=C2=A0 =
NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.ozlabs.org/~dgibson</a><br>
</font></span></blockquote></div><br></div>

--94eb2c04963aba52bf0557c1c775--

--===============5354089590043869722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5354089590043869722==--
