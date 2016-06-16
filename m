From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 4/5] altstack: Don't use 0 pointer literals
Date: Thu, 16 Jun 2016 20:38:02 +0000
Message-ID: <CACNkOJNPjSbD0prvgGCb54_F6jU57XZkPWAhj=zspzDBuH9CFw@mail.gmail.com>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-5-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJNPh_AUB5+0GhJ1W5GQSqN1efRpxPFajUKOPXdsVe4nng@mail.gmail.com>
 <87eg8076ep.fsf@rustcorp.com.au> <20160616064543.GE1642@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8128029472655315535=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVwFR2DMLzDqnf
 for <ccan@lists.ozlabs.org>; Fri, 17 Jun 2016 06:38:18 +1000 (AEST)
Received: from mail-yw0-f174.google.com ([209.85.161.174]) by
 mrelay.perfora.net (mreueus002) with ESMTPSA (Nemesis) id
 0MQPOs-1aqdY11me4-00ThxM for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016
 22:38:13 +0200
Received: by mail-yw0-f174.google.com with SMTP id g20so54176566ywb.0
 for <ccan@lists.ozlabs.org>; Thu, 16 Jun 2016 13:38:12 -0700 (PDT)
In-Reply-To: <20160616064543.GE1642@voom.fritz.box>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, Rusty Russell <rusty@rustcorp.com.au>
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

--===============8128029472655315535==
Content-Type: multipart/alternative; boundary=001a11473b4678187505356b377a

--001a11473b4678187505356b377a
Content-Type: text/plain; charset=UTF-8

Thank you, both.  I'll return to the fold and use NULL, as seems right and
proper.

On Thu, Jun 16, 2016 at 7:12 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Tue, Jun 14, 2016 at 01:45:10PM +0930, Paul 'Rusty' Russell wrote:
> > Dan Good <dan@dancancode.com> writes:
> > > Hi David,
> > >
> > > I'm back home in front of a real keyboard, and want to follow up with
> you
> > > about your patches.  I must admit that my usual practice is to use
> NULL,
> > > and not 0.  Around the time I wrote altstack I had recently read Jen
> > > Gustedt's book, Modern C.  In it, he makes the point that NULL hides
> more
> > > than it clarifies (see section 11.7).
> >
> > (I don't really care: your code, your style).  But...
> >
> > He is so horrifically wrong, it's amazing.
> >
> > Section 7.17 is loosened from ANSI C which said NULL was 0, presumably
> > to *allow* compilers to avoid the varargs issue.  A compiler *could* do
> > insane shit to make that problem even worse, but you would never use
> > such a compiler.  There are other legal-but-insane things a compiler can
> > do, too, and the answer is the same; real code won't work, nobody else
> > cares.
> >
> > OTOH, using 0 in place of NULL makes for much more potential type order
> > confusion.  Not to mention confusing every damn C programmer on the
> > planet.
>
> Yeah.  I can kind of see the hint of a good idea in those articles,
> but on balance they're really not convincing.  Basically, as Rusty
> says, matching the conventions of the huge bulk of existing C code
> outweighs the value of working with a compiler/library that has gone
> out of its way to implement this stupidly.
>
> > Note, I also assume NULL is all zero-bits,
>
> I try to avoid that one, although I can't be sure I always have - I'm
> not sure, but I think one of the s390 variants might break this.
>
> > that size_t can hold a
> > ptrdiff_t,
>
> Dunno if I've assumed that much.
>
> > and that a pointer to a function which takes a type *
> > argument can be cast and called as a function which takes a void *.
>
> Yeah, I've used that.
>
> > If someone ports CCAN to a platform where those are not true, I'd be
> > fascinated...
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--001a11473b4678187505356b377a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, both.=C2=A0 I&#39;ll return to the fold and use=
 NULL, as seems right and proper.<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Thu, Jun 16, 2016 at 7:12 AM David Gibson &lt;<a href=3D"mailt=
o:david@gibson.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Tue, Jun 14, 2016 at 01:45:10PM +=
0930, Paul &#39;Rusty&#39; Russell wrote:<br>
&gt; Dan Good &lt;<a href=3D"mailto:dan@dancancode.com" target=3D"_blank">d=
an@dancancode.com</a>&gt; writes:<br>
&gt; &gt; Hi David,<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m back home in front of a real keyboard, and want to follow=
 up with you<br>
&gt; &gt; about your patches.=C2=A0 I must admit that my usual practice is =
to use NULL,<br>
&gt; &gt; and not 0.=C2=A0 Around the time I wrote altstack I had recently =
read Jen<br>
&gt; &gt; Gustedt&#39;s book, Modern C.=C2=A0 In it, he makes the point tha=
t NULL hides more<br>
&gt; &gt; than it clarifies (see section 11.7).<br>
&gt;<br>
&gt; (I don&#39;t really care: your code, your style).=C2=A0 But...<br>
&gt;<br>
&gt; He is so horrifically wrong, it&#39;s amazing.<br>
&gt;<br>
&gt; Section 7.17 is loosened from ANSI C which said NULL was 0, presumably=
<br>
&gt; to *allow* compilers to avoid the varargs issue.=C2=A0 A compiler *cou=
ld* do<br>
&gt; insane shit to make that problem even worse, but you would never use<b=
r>
&gt; such a compiler.=C2=A0 There are other legal-but-insane things a compi=
ler can<br>
&gt; do, too, and the answer is the same; real code won&#39;t work, nobody =
else<br>
&gt; cares.<br>
&gt;<br>
&gt; OTOH, using 0 in place of NULL makes for much more potential type orde=
r<br>
&gt; confusion.=C2=A0 Not to mention confusing every damn C programmer on t=
he<br>
&gt; planet.<br>
<br>
Yeah.=C2=A0 I can kind of see the hint of a good idea in those articles,<br=
>
but on balance they&#39;re really not convincing.=C2=A0 Basically, as Rusty=
<br>
says, matching the conventions of the huge bulk of existing C code<br>
outweighs the value of working with a compiler/library that has gone<br>
out of its way to implement this stupidly.<br>
<br>
&gt; Note, I also assume NULL is all zero-bits,<br>
<br>
I try to avoid that one, although I can&#39;t be sure I always have - I&#39=
;m<br>
not sure, but I think one of the s390 variants might break this.<br>
<br>
&gt; that size_t can hold a<br>
&gt; ptrdiff_t,<br>
<br>
Dunno if I&#39;ve assumed that much.<br>
<br>
&gt; and that a pointer to a function which takes a type *<br>
&gt; argument can be cast and called as a function which takes a void *.<br=
>
<br>
Yeah, I&#39;ve used that.<br>
<br>
&gt; If someone ports CCAN to a platform where those are not true, I&#39;d =
be<br>
&gt; fascinated...<br>
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

--001a11473b4678187505356b377a--

--===============8128029472655315535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8128029472655315535==--
