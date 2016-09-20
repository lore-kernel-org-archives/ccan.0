From: Daniel Burke <dan.p.burke@gmail.com>
Subject: Re: [PATCH 0/9] configurator: Support for Windows and MSVC
Date: Tue, 20 Sep 2016 23:46:23 +0930
Message-ID: <CAGqEwiYXyGJn0qTVpzXinzdEXdzrE7ngLzM8mTYcY21WmjWHBA@mail.gmail.com>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <20160920044822.GJ20488@umbus>
 <b317f282-f357-e3f8-deeb-048c5793492f@kevinlocke.name>
 <20160920122524.GE20488@umbus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2957580289054480666=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdlDV40HzzDsfj
 for <ccan@lists.ozlabs.org>; Wed, 21 Sep 2016 00:16:26 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id o3so98950485ita.1
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 07:16:26 -0700 (PDT)
In-Reply-To: <20160920122524.GE20488@umbus>
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

--===============2957580289054480666==
Content-Type: multipart/alternative; boundary=94eb2c05c364d2cc78053cf11297

--94eb2c05c364d2cc78053cf11297
Content-Type: text/plain; charset=UTF-8

I do have a bit of experience with windows/linux C code interop, and while
Visual C++ tends to be somewhat... unpredictable (It's getting much better
than it used to be), I can tell you that...

x86_64-w64-mingw32-gcc

will output binaries that will happily run on windows, so long as you're
using a version at least as new as is provided with Debian Jessie. (the
wheezy version produced broken binaries). Wine can then be used to test
them quite reliably. That compiler comes with enough windows libraries and
headers to do most reasonable jobs, and quite a few unix headers mangled to
work in windows environments.

sudo apt-get install mingw-w64

There's a 32bit version if you're that way inclined (which is also broken
on wheezy), although I haven't used it recently enough to recall it.

regards,

dan
--
"The world is full of magical things patiently waiting for our wits to grow
sharper." - Bertrand Russell

On 20 September 2016 at 21:55, David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Tue, Sep 20, 2016 at 12:21:25AM -0600, Kevin Locke wrote:
> > Hi David,
> >
> > Thank you for taking the time to review these patches, especially for a
> > platform that you don't have a strong stake in.  I really appreciate it.
> >
> > On 09/19/2016 10:48 PM, David Gibson wrote:
> > > On Sun, Sep 18, 2016 at 06:51:57PM -0600, Kevin Locke wrote:
> > > > This patch series adds support for building configurator with
> Microsoft
> > > > Visual C++ and running it on Windows.  The motivation is to add
> > > > sufficient support for Windows to allow using header-only modules
> > > > with minimal hassle.  For me, this patch series is sufficient, so I
> > > > don't have any further plans for changes to other files or the build
> > > > system at the moment.
> > >
> > > First, thanks for this.  ccan isn't supposed to be platform specific,
> > > but it kind of is at the moment, simply because most of the
> > > contributions have been from Linux developers.  I'm really happy to
> > > see some work to make it useful on different platforms.
> > >
> > > Second, because I'm not and have never been a Windows dev, my ability
> > > to review these is limited - so I'm inclined to apply anything that
> > > doesn't break builds on Linux / POSIX.
> > >
> > > Third, because most of the main ccan contributors are not Windows
> > > devs, I'm a bit worried about bitrot.  If you can think of any way of
> > > making some kind of automated smoke test form builds on Windows, that
> > > would be terrific.  Otherwise, I guess we'll just hope for the best.
> >
> > I think that's a very legitimate concern.  I'm not a frequent Windows
> > developer myself, but had a need for a current project.  I've tried to
> > minimize the amount of Windows-specific code, with good results I think,
> but
> > that's obviously not much of a guarantee that it won't rot or subtly
> break
> > on Windows going forward.
> >
> > I've seen appveyor.com used quite often for Windows CI, and it is free
> for
> > FOSS projects.  I'd be happy to work up some basic smoke tests if it
> seems
> > like that might be useful and not too much of a maintenance burden.  Let
> me
> > know what you think.
>
> Sounds good to me.
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>
> _______________________________________________
> ccan mailing list
> ccan@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/ccan
>
>

--94eb2c05c364d2cc78053cf11297
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do have a bit of experience with windows/linux C code in=
terop, and while Visual C++ tends to be somewhat... unpredictable (It&#39;s=
 getting much better than it used to be), I can tell you that...<div><br></=
div><div>x86_64-w64-mingw32-gcc<br><br>will output binaries that will happi=
ly run on windows, so long as you&#39;re using a version at least as new as=
 is provided with Debian Jessie. (the wheezy version produced broken binari=
es). Wine can then be used to test them quite reliably. That compiler comes=
 with enough windows libraries and headers to do most reasonable jobs, and =
quite a few unix headers mangled to work in windows environments.<br><br>su=
do apt-get install mingw-w64</div><div><br></div><div>There&#39;s a 32bit v=
ersion if you&#39;re that way inclined (which is also broken on wheezy), al=
though I haven&#39;t used it recently enough to recall it.</div></div><div =
class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">regards,<div><br></div=
><div>dan</div><div>--</div><div>&quot;The world is full of magical things =
patiently waiting for our wits to grow sharper.&quot; - Bertrand Russell<br=
></div></div></div></div>
<br><div class=3D"gmail_quote">On 20 September 2016 at 21:55, David Gibson =
<span dir=3D"ltr">&lt;<a href=3D"mailto:david@gibson.dropbear.id.au" target=
=3D"_blank">david@gibson.dropbear.id.au</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, Sep 20=
, 2016 at 12:21:25AM -0600, Kevin Locke wrote:<br>
&gt; Hi David,<br>
&gt;<br>
&gt; Thank you for taking the time to review these patches, especially for =
a<br>
&gt; platform that you don&#39;t have a strong stake in.=C2=A0 I really app=
reciate it.<br>
&gt;<br>
&gt; On 09/19/2016 10:48 PM, David Gibson wrote:<br>
&gt; &gt; On Sun, Sep 18, 2016 at 06:51:57PM -0600, Kevin Locke wrote:<br>
&gt; &gt; &gt; This patch series adds support for building configurator wit=
h Microsoft<br>
&gt; &gt; &gt; Visual C++ and running it on Windows.=C2=A0 The motivation i=
s to add<br>
&gt; &gt; &gt; sufficient support for Windows to allow using header-only mo=
dules<br>
&gt; &gt; &gt; with minimal hassle.=C2=A0 For me, this patch series is suff=
icient, so I<br>
&gt; &gt; &gt; don&#39;t have any further plans for changes to other files =
or the build<br>
&gt; &gt; &gt; system at the moment.<br>
&gt; &gt;<br>
&gt; &gt; First, thanks for this.=C2=A0 ccan isn&#39;t supposed to be platf=
orm specific,<br>
&gt; &gt; but it kind of is at the moment, simply because most of the<br>
&gt; &gt; contributions have been from Linux developers.=C2=A0 I&#39;m real=
ly happy to<br>
&gt; &gt; see some work to make it useful on different platforms.<br>
&gt; &gt;<br>
&gt; &gt; Second, because I&#39;m not and have never been a Windows dev, my=
 ability<br>
&gt; &gt; to review these is limited - so I&#39;m inclined to apply anythin=
g that<br>
&gt; &gt; doesn&#39;t break builds on Linux / POSIX.<br>
&gt; &gt;<br>
&gt; &gt; Third, because most of the main ccan contributors are not Windows=
<br>
&gt; &gt; devs, I&#39;m a bit worried about bitrot.=C2=A0 If you can think =
of any way of<br>
&gt; &gt; making some kind of automated smoke test form builds on Windows, =
that<br>
&gt; &gt; would be terrific.=C2=A0 Otherwise, I guess we&#39;ll just hope f=
or the best.<br>
&gt;<br>
&gt; I think that&#39;s a very legitimate concern.=C2=A0 I&#39;m not a freq=
uent Windows<br>
&gt; developer myself, but had a need for a current project.=C2=A0 I&#39;ve=
 tried to<br>
&gt; minimize the amount of Windows-specific code, with good results I thin=
k, but<br>
&gt; that&#39;s obviously not much of a guarantee that it won&#39;t rot or =
subtly break<br>
&gt; on Windows going forward.<br>
&gt;<br>
&gt; I&#39;ve seen <a href=3D"http://appveyor.com" rel=3D"noreferrer" targe=
t=3D"_blank">appveyor.com</a> used quite often for Windows CI, and it is fr=
ee for<br>
&gt; FOSS projects.=C2=A0 I&#39;d be happy to work up some basic smoke test=
s if it seems<br>
&gt; like that might be useful and not too much of a maintenance burden.=C2=
=A0 Let me<br>
&gt; know what you think.<br>
<br>
</div></div>Sounds good to me.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
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
</div></div><br>______________________________<wbr>_________________<br>
ccan mailing list<br>
<a href=3D"mailto:ccan@lists.ozlabs.org">ccan@lists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/ccan" rel=3D"noreferrer" targe=
t=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/ccan</a><br>
<br></blockquote></div><br></div>

--94eb2c05c364d2cc78053cf11297--

--===============2957580289054480666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2957580289054480666==--
