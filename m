From: Dan Good <dan@dancancode.com>
Subject: Re: git error on push
Date: Thu, 11 Feb 2016 01:56:54 +0000
Message-ID: <CACNkOJNFyO7GuB6PoEUJ_WQ3jR2Reb4vbCQDmSTWu=gP=ihjYw@mail.gmail.com>
References: <CACNkOJNXT0Dg_jkkvVE9V-Fs_5kHg0REwfUe9EFGP_Qb=XRcVQ@mail.gmail.com>
 <20160211004802.GJ29288@voom.bne.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8630521067910470940=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 947861A0026
 for <ccan@lists.ozlabs.org>; Thu, 11 Feb 2016 12:57:08 +1100 (AEDT)
Received: from mail-ob0-f169.google.com ([209.85.214.169]) by
 mrelay.perfora.net (mreueus003) with ESMTPSA (Nemesis) id
 0MNK2R-1aMosS0WAj-006snY for <ccan@lists.ozlabs.org>; Thu, 11 Feb 2016
 02:57:05 +0100
Received: by mail-ob0-f169.google.com with SMTP id is5so55339893obc.0
 for <ccan@lists.ozlabs.org>; Wed, 10 Feb 2016 17:57:04 -0800 (PST)
In-Reply-To: <20160211004802.GJ29288@voom.bne.redhat.com>
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
Cc: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

--===============8630521067910470940==
Content-Type: multipart/alternative; boundary=001a11c2e4aefe41ce052b74ddbb

--001a11c2e4aefe41ce052b74ddbb
Content-Type: text/plain; charset=UTF-8

Don't I feel silly.  Thank you.  All better now.

On Wed, Feb 10, 2016 at 8:16 PM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Wed, Feb 10, 2016 at 07:15:02PM +0000, Dan Good wrote:
> > Hi, I'm trying to push the stack alignment patch to the repo, but no joy:
> >
> > 0$ git push origin masterCounting objects: 8, done.
> > Compressing objects: 100% (7/7), done.
> > Writing objects: 100% (8/8), 1.42 KiB | 0 bytes/s, done.
> > Total 8 (delta 5), reused 0 (delta 0)
> > remote: W NAME/ccan/altstack/altstack.c ccan dancancode DENIED by
> fallthru
> > remote: error: hook declined to update refs/heads/master
> > To ccan@ozlabs.org:ccan
> > ! [remote rejected] master -> master (hook declined)
> > error: failed to push some refs to 'ccan@ozlabs.org:ccan'
> > 1$
> >
> > Is altstack on lockdown? Thanks. -Dan
>
> Well, it's certainly not supposed to be.  I had a look at the gitolite
> configuration and I'm not seeing anything obvious wrong:
>
>         RW NAME/ccan/altstack   = dancancode
>
> Have you double checked that you're using the same ssh key as the one
> you sent to us?
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--001a11c2e4aefe41ce052b74ddbb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Don&#39;t I feel silly.=C2=A0 Thank you.=C2=A0 All better =
now.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Feb 10, 201=
6 at 8:16 PM David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au=
">david@gibson.dropbear.id.au</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Wed, Feb 10, 2016 at 07:15:02PM +0000, Dan Good wrote:<br>
&gt; Hi, I&#39;m trying to push the stack alignment patch to the repo, but =
no joy:<br>
&gt;<br>
&gt; 0$ git push origin masterCounting objects: 8, done.<br>
&gt; Compressing objects: 100% (7/7), done.<br>
&gt; Writing objects: 100% (8/8), 1.42 KiB | 0 bytes/s, done.<br>
&gt; Total 8 (delta 5), reused 0 (delta 0)<br>
&gt; remote: W NAME/ccan/altstack/altstack.c ccan dancancode DENIED by fall=
thru<br>
&gt; remote: error: hook declined to update refs/heads/master<br>
&gt; To ccan@ozlabs.org:ccan<br>
&gt; ! [remote rejected] master -&gt; master (hook declined)<br>
&gt; error: failed to push some refs to &#39;ccan@ozlabs.org:ccan&#39;<br>
&gt; 1$<br>
&gt;<br>
&gt; Is altstack on lockdown? Thanks. -Dan<br>
<br>
Well, it&#39;s certainly not supposed to be.=C2=A0 I had a look at the gito=
lite<br>
configuration and I&#39;m not seeing anything obvious wrong:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 RW NAME/ccan/altstack=C2=A0 =C2=A0=3D dancancod=
e<br>
<br>
Have you double checked that you&#39;re using the same ssh key as the one<b=
r>
you sent to us?<br>
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

--001a11c2e4aefe41ce052b74ddbb--

--===============8630521067910470940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8630521067910470940==--
