From: Damien Grassart <damien@grassart.com>
Subject: Re: [PATCH 1/2] darray: Fix bug in the darray_remove() macro
Date: Sun, 27 Aug 2017 23:02:11 +0200
Message-ID: <CADZuF1mhrMb+t+RX1BWgAszYNZphn5u-9UjJehS-th5TuQeQtA@mail.gmail.com>
References: <20170826162620.15989-1-damien@grassart.com>
 <20170827025642.GN2772@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6962814746279848085=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgS5L5G5mzDqTt
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 07:02:14 +1000 (AEST)
Received: by mail-it0-x241.google.com with SMTP id w204so3112724ita.1
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 14:02:14 -0700 (PDT)
In-Reply-To: <20170827025642.GN2772@umbus.fritz.box>
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

--===============6962814746279848085==
Content-Type: multipart/alternative; boundary="94eb2c0a7728f884770557c27d32"

--94eb2c0a7728f884770557c27d32
Content-Type: text/plain; charset="UTF-8"

Good point about shadowing index(3), I'll send a patch renaming all the
uses of 'index'.

On Sun, Aug 27, 2017 at 4:56 AM, David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Sat, Aug 26, 2017 at 06:26:20PM +0200, Damien Grassart wrote:
> > The memmove() call should be using the index argument to determine the
> > number of bytes to copy.
> >
> > Signed-off-by: Damien Grassart <damien@grassart.com>
>
> No question that was a bug.  Fix applied.
>
> Note for a possible future cleanup: calling identifiers 'index' is
> usually a bad idea, because it shadows index(3) in the C library,
> which means you can get really confusing errors (or lack of errors) if
> you remove the declaration but not the users.
>
> > ---
> >  ccan/darray/darray.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h
> > index 75112419..8d47645b 100644
> > --- a/ccan/darray/darray.h
> > +++ b/ccan/darray/darray.h
> > @@ -225,7 +225,7 @@ typedef darray(unsigned long)  darray_ulong;
> >  /* Warning, slow: Requires copying all elements after removed item. */
> >  #define darray_remove(arr, index) do { \
> >       if (index < arr.size-1)    \
> > -             memmove(&(arr).item[index], &(arr).item[index+1],
> ((arr).size-1-i)*sizeof(*(arr).item)); \
> > +             memmove(&(arr).item[index], &(arr).item[index+1],
> ((arr).size-1-index)*sizeof(*(arr).item)); \
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

--94eb2c0a7728f884770557c27d32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good point about shadowing index(3), I&#39;ll send a patch=
 renaming all the uses of &#39;index&#39;.</div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On Sun, Aug 27, 2017 at 4:56 AM, David Gibso=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:david@gibson.dropbear.id.au" targ=
et=3D"_blank">david@gibson.dropbear.id.au</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D"">On Sat, Aug 26, 2017 at 06:26:20PM =
+0200, Damien Grassart wrote:<br>
&gt; The memmove() call should be using the index argument to determine the=
<br>
&gt; number of bytes to copy.<br>
&gt;<br>
&gt; Signed-off-by: Damien Grassart &lt;<a href=3D"mailto:damien@grassart.c=
om">damien@grassart.com</a>&gt;<br>
<br>
</span>No question that was a bug.=C2=A0 Fix applied.<br>
<br>
Note for a possible future cleanup: calling identifiers &#39;index&#39; is<=
br>
usually a bad idea, because it shadows index(3) in the C library,<br>
which means you can get really confusing errors (or lack of errors) if<br>
you remove the declaration but not the users.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 ccan/darray/darray.h | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/ccan/darray/darray.h b/ccan/darray/darray.h<br>
&gt; index 75112419..8d47645b 100644<br>
&gt; --- a/ccan/darray/darray.h<br>
&gt; +++ b/ccan/darray/darray.h<br>
&gt; @@ -225,7 +225,7 @@ typedef darray(unsigned long)=C2=A0 darray_ulong;<=
br>
&gt;=C2=A0 /* Warning, slow: Requires copying all elements after removed it=
em. */<br>
&gt;=C2=A0 #define darray_remove(arr, index) do { \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (index &lt; arr.size-1)=C2=A0 =C2=A0 \<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[index], &amp;(arr).item[index+1], ((arr).size-1-i)*sizeof(*(arr)<wbr>.it=
em)); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmove(&amp;(arr).it=
em[index], &amp;(arr).item[index+1], ((arr).size-1-index)*sizeof(*(<wbr>arr=
).item)); \<br>
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

--94eb2c0a7728f884770557c27d32--

--===============6962814746279848085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6962814746279848085==--
