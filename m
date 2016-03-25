From: Dan Good <dan@dancancode.com>
Subject: Re: altstack causing travis-ci failures
Date: Fri, 25 Mar 2016 22:06:51 +0000
Message-ID: <CACNkOJPk7O27tKdOxoF9BipEfN=hKHkgA-9=mztyVku_mbePsA@mail.gmail.com>
References: <1458915273.537.36.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5767855738777921556=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWyG53WbrzDq6X
 for <ccan@lists.ozlabs.org>; Sat, 26 Mar 2016 09:12:13 +1100 (AEDT)
Received: from mail-qk0-f171.google.com ([209.85.220.171]) by
 mrelay.perfora.net (mreueus001) with ESMTPSA (Nemesis) id
 0LtoXL-1ZiV512Uth-011Dmw for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016
 23:07:02 +0100
Received: by mail-qk0-f171.google.com with SMTP id s5so42165657qkd.0
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 15:07:02 -0700 (PDT)
In-Reply-To: <1458915273.537.36.camel@aj.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: andrew@aj.id.au
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

--===============5767855738777921556==
Content-Type: multipart/alternative; boundary=001a114278904d6d43052ee6c84a

--001a114278904d6d43052ee6c84a
Content-Type: text/plain; charset=UTF-8

David did some remarkable investigation into it about a month ago.  The
code has always worked on the Red Hat based distros I use, and David
patched it to work for Ubuntu 12.04; so it seems unlikely to me that any
real person would be affected.  I suppose I'll try to talk to the Travis
people about the specifics of their environment.

On Fri, Mar 25, 2016 at 10:14 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Hey Dan,
>
> I'm seeing a ccanlint failure for altstack on Travis-CI, e.g[1]:
>
>     ...
>     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/aga
>     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/agar
>     agar: Total score: 36/38
>     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/altstack
>     altstack: Total score: 31/36 FAIL!
>     make: *** [summary-check-altstack] Error 1
>     tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/antithread
>     aga: Total score: 48/50
>     ...
>
> FWIW I haven't had this happen when running `make check` on my machine.
> I ended up pushing the changes I was testing as the failure wasn't
> related and wasn't something I could trigger locally (the commit tested
> above is currently at the tip of master), but thought it would be
> useful to highlight that something strange appears to be happening with
> the altstack module, at least on Travis-CI.
>
> Cheers,
>
> Andrew
>
> [1] https://travis-ci.org/amboar/ccan/jobs/118466416#L534

--001a114278904d6d43052ee6c84a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">David did some remarkable investigation into it about a mo=
nth ago.=C2=A0 The code has always worked on the Red Hat based distros I us=
e, and David patched it to work for Ubuntu 12.04; so it seems unlikely to m=
e that any real person would be affected.=C2=A0 I suppose I&#39;ll try to t=
alk to the Travis people about the specifics of their environment.=C2=A0<di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Mar 25, 2016 at 1=
0:14 AM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_bl=
ank">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hey Dan,<br>
<br>
I&#39;m seeing a ccanlint failure for altstack on Travis-CI, e.g[1]:<br>
<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/aga<br>
=C2=A0 =C2=A0 tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/agar<br>
=C2=A0 =C2=A0 agar: Total score: 36/38<br>
=C2=A0 =C2=A0 tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/altstack<b=
r>
=C2=A0 =C2=A0 altstack: Total score: 31/36 FAIL!<br>
=C2=A0 =C2=A0 make: *** [summary-check-altstack] Error 1<br>
=C2=A0 =C2=A0 tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/antithread=
<br>
=C2=A0 =C2=A0 aga: Total score: 48/50<br>
=C2=A0 =C2=A0 ...<br>
<br>
FWIW I haven&#39;t had this happen when running `make check` on my machine.=
<br>
I ended up pushing the changes I was testing as the failure wasn&#39;t<br>
related and wasn&#39;t something I could trigger locally (the commit tested=
<br>
above is currently at the tip of master), but thought it would be<br>
useful to highlight that something strange appears to be happening with<br>
the altstack module, at least on Travis-CI.<br>
<br>
Cheers,<br>
<br>
Andrew<br>
<br>
[1]=C2=A0<a href=3D"https://travis-ci.org/amboar/ccan/jobs/118466416#L534" =
rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/amboar/ccan/jobs=
/118466416#L534</a></blockquote></div></div></div>

--001a114278904d6d43052ee6c84a--

--===============5767855738777921556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5767855738777921556==--
