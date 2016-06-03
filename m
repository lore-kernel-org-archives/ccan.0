From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 0/5] altstack: cleanups
Date: Fri, 03 Jun 2016 23:29:01 +0000
Message-ID: <CACNkOJOMW8GjfDTxSDhgdOqAd=4qYgKjg4s_95A7Fb6RL=oGFA@mail.gmail.com>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4056662083251140375=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM0mc6vtMzDq7n
 for <ccan@lists.ozlabs.org>; Sat,  4 Jun 2016 09:34:24 +1000 (AEST)
Received: from mail-yw0-f182.google.com ([209.85.161.182]) by
 mrelay.perfora.net (mreueus001) with ESMTPSA (Nemesis) id
 0MZmzA-1auCnO3n2c-00LZC4 for <ccan@lists.ozlabs.org>; Sat, 04 Jun 2016
 01:29:12 +0200
Received: by mail-yw0-f182.google.com with SMTP id h19so94593185ywc.0
 for <ccan@lists.ozlabs.org>; Fri, 03 Jun 2016 16:29:12 -0700 (PDT)
In-Reply-To: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
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

--===============4056662083251140375==
Content-Type: multipart/alternative; boundary=94eb2c0a9aba0bf91305346817da

--94eb2c0a9aba0bf91305346817da
Content-Type: text/plain; charset=UTF-8

David, thank you for improving the code. I'm traveling for the next week
with only an ipad. I'd like to ask your thoughts on a topic or two, but
typing on this is grueling. I hope to try for a longer reply later. Thanks
again. -Dan

On Fri, Jun 3, 2016 at 4:40 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> Dan,
>
> Here are a bunch of assorted cleanups to the altstack module.  If they
> seem reasonable to you, please apply.
>
> David Gibson (5):
>   altstack: Consolidate thread-local variables
>   altstack: Restore alternate signal stack state
>   altstack: Use ptrint instead of bare casts
>   altstack: Don't use 0 pointer literals
>   altstack: Don't log internal calls in test cases
>
>  ccan/altstack/_info      |  9 ++++--
>  ccan/altstack/altstack.c | 78
> +++++++++++++++++++++++++-----------------------
>  ccan/altstack/altstack.h |  6 ++--
>  ccan/altstack/test/run.c | 76
> ++++++++++++++--------------------------------
>  4 files changed, 74 insertions(+), 95 deletions(-)
>
> --
> 2.5.5
>
>

--94eb2c0a9aba0bf91305346817da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"white-space:pre-wrap">David, thank you for improving the code=
.  I&#39;m traveling for the next week with only an ipad.  I&#39;d like to =
ask your thoughts on a topic or two, but typing on this is grueling.  I hop=
e to try for a longer reply later.  Thanks again.  -Dan</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun 3, 2016 at 4:40 AM David Gibs=
on &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibson.dropbear=
.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dan,<br>
<br>
Here are a bunch of assorted cleanups to the altstack module.=C2=A0 If they=
<br>
seem reasonable to you, please apply.<br>
<br>
David Gibson (5):<br>
=C2=A0 altstack: Consolidate thread-local variables<br>
=C2=A0 altstack: Restore alternate signal stack state<br>
=C2=A0 altstack: Use ptrint instead of bare casts<br>
=C2=A0 altstack: Don&#39;t use 0 pointer literals<br>
=C2=A0 altstack: Don&#39;t log internal calls in test cases<br>
<br>
=C2=A0ccan/altstack/_info=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++--<br>
=C2=A0ccan/altstack/altstack.c | 78 +++++++++++++++++++++++++--------------=
---------<br>
=C2=A0ccan/altstack/altstack.h |=C2=A0 6 ++--<br>
=C2=A0ccan/altstack/test/run.c | 76 ++++++++++++++-------------------------=
-------<br>
=C2=A04 files changed, 74 insertions(+), 95 deletions(-)<br>
<br>
--<br>
2.5.5<br>
<br>
</blockquote></div>

--94eb2c0a9aba0bf91305346817da--

--===============4056662083251140375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4056662083251140375==--
