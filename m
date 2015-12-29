From: Dan Good <dan@dancancode.com>
Subject: Re: deque: New module
Date: Tue, 29 Dec 2015 06:00:50 +0000
Message-ID: <CACNkOJNGhRC57PdOifUau7F+Rn_URYjOkKym1XVanXxptoeJYQ@mail.gmail.com>
References: <20151223121144.GB27038@ip-172-31-61-248.ec2.internal>
 <20151228034337.GA15174@voom>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4850653017439177268=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C3C8A1A0156
 for <ccan@lists.ozlabs.org>; Tue, 29 Dec 2015 17:01:05 +1100 (AEDT)
Received: from mail-oi0-f45.google.com ([209.85.218.45]) by mrelay.perfora.net
 (mreueus001) with ESMTPSA (Nemesis) id 0Lj3o8-1ZhUzT2YP8-00d4JA for
 <ccan@lists.ozlabs.org>; Tue, 29 Dec 2015 07:01:01 +0100
Received: by mail-oi0-f45.google.com with SMTP id y66so183978973oig.0
 for <ccan@lists.ozlabs.org>; Mon, 28 Dec 2015 22:01:00 -0800 (PST)
In-Reply-To: <20151228034337.GA15174@voom>
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

--===============4850653017439177268==
Content-Type: multipart/alternative; boundary=001a113df3da5bd9e0052803251e

--001a113df3da5bd9e0052803251e
Content-Type: text/plain; charset=UTF-8

Thank you for the feedback.  I have a practical question - what is the
workflow for making changes to this module, now that it's been merged?  Do
I clone, then branch, edit, commit, push, merge, and finally mail a patch
to the list?  I'm still learning git.  I've been on the rcs/cvs/svn
bandwagon for a long time.

I'd like some clarification on the need for portability.  Once I read your
comments, I came up with an ad-hoc list of platforms I felt I could
reasonably support: major Linux distros, FreeBSD, OS X, and OmniOS.  I
tried the module on each successfully, though ccanlint needed changes to
build on everything but Linux, and the failtest based test went rogue on
two of the platforms.

Compound literals are a feature of C99 (nice article:
http://www.drdobbs.com/the-new-c-compound-literals/184401404).
Intermingled declarations and code are also from C99.  Half of the
platforms above use gcc and half use clang.  Both gcc and clang support
statement expressions.  The _XOPEN_SOURCE define in _info is there for
getline(3) on Linux which is used solely in the demo code in _info.

Is there a set of platforms CCAN targets for support?  Is there some way I
should document that the code is C99?  Would the lines below be the right
way to handle the statement expression dependance?

#if !HAVE_STATEMENT_EXPR
#error Sorry, deque requires statement expressions
#endif

Thanks.  -Dan

On Sun, Dec 27, 2015 at 10:45 PM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Wed, Dec 23, 2015 at 12:11:44PM +0000, Dan Good wrote:
> > deque - type-preserving resizing circular deque
>
> Concept looks good.  There are some fairly minor nits in the
> implementation that I've noted below.  However, none are serious
> enough to hold up merging, so I've applied this.  I did modify
> trivially to remove some trailing whitespace.
>
> It would be nice to address some of the comments in follow up
> commits, particularly some of the portability issues.
>
 [...]

> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--001a113df3da5bd9e0052803251e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the feedback.=C2=A0 I have a practical quest=
ion - what is the workflow for making changes to this module, now that it&#=
39;s been merged?=C2=A0 Do I clone, then branch, edit, commit, push, merge,=
 and finally mail a patch to the list?=C2=A0 I&#39;m still learning git.=C2=
=A0 I&#39;ve been on the rcs/cvs/svn bandwagon for a long time.<br><br>I&#3=
9;d like some clarification on the need for portability.=C2=A0 Once I read =
your comments, I came up with an ad-hoc list of platforms I felt I could re=
asonably support: major Linux distros, FreeBSD, OS X, and OmniOS.=C2=A0 I t=
ried the module on each successfully, though ccanlint needed changes to bui=
ld on everything but Linux, and the failtest based test went rogue on two o=
f the platforms.<div><br></div><div>Compound literals are a feature of C99 =
(nice article:=C2=A0<a href=3D"http://www.drdobbs.com/the-new-c-compound-li=
terals/184401404">http://www.drdobbs.com/the-new-c-compound-literals/184401=
404</a>).=C2=A0 Intermingled declarations and code are also from C99.=C2=A0=
 Half of the platforms above use gcc and half use clang.=C2=A0 Both gcc and=
 clang support statement expressions.=C2=A0 The _XOPEN_SOURCE define in _in=
fo is there for getline(3) on Linux which is used solely in the demo code i=
n _info.</div><div><br></div><div>Is there a set of platforms CCAN targets =
for support?=C2=A0 Is there some way I should document that the code is C99=
?=C2=A0 Would the lines below be the right way to handle the statement expr=
ession dependance?</div><br>#if !HAVE_STATEMENT_EXPR <br>#error Sorry, dequ=
e requires statement expressions <br>#endif<div><br></div><div>Thanks. =C2=
=A0-Dan</div><div><br><div><div class=3D"gmail_quote"><div dir=3D"ltr">On S=
un, Dec 27, 2015 at 10:45 PM David Gibson &lt;<a href=3D"mailto:david@gibso=
n.dropbear.id.au">david@gibson.dropbear.id.au</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Wed, Dec 23, 2015 at 12:11:44PM +0000, Dan Goo=
d wrote:<br>
&gt; deque - type-preserving resizing circular deque<br>
<br>
Concept looks good.=C2=A0 There are some fairly minor nits in the<br>
implementation that I&#39;ve noted below.=C2=A0 However, none are serious<b=
r>
enough to hold up merging, so I&#39;ve applied this.=C2=A0 I did modify<br>
trivially to remove some trailing whitespace.<br>
<br>
It would be nice to address some of the comments in follow up<br>
commits, particularly some of the portability issues.<br></blockquote><div>=
=C2=A0[...]</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
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
</blockquote></div></div></div></div>

--001a113df3da5bd9e0052803251e--

--===============4850653017439177268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4850653017439177268==--
