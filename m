From: Dan Good <dan@dancancode.com>
Subject: git error on push
Date: Wed, 10 Feb 2016 19:15:02 +0000
Message-ID: <CACNkOJNXT0Dg_jkkvVE9V-Fs_5kHg0REwfUe9EFGP_Qb=XRcVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6518231911525822306=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 01A641A03B0
 for <ccan@lists.ozlabs.org>; Thu, 11 Feb 2016 06:15:18 +1100 (AEDT)
Received: from mail-ob0-f182.google.com ([209.85.214.182]) by
 mrelay.perfora.net (mreueus003) with ESMTPSA (Nemesis) id
 0LiVdy-1Zt8UI0TXQ-00cfIX for <ccan@lists.ozlabs.org>; Wed, 10 Feb 2016
 20:15:14 +0100
Received: by mail-ob0-f182.google.com with SMTP id wb13so42429431obb.1
 for <ccan@lists.ozlabs.org>; Wed, 10 Feb 2016 11:15:12 -0800 (PST)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

--===============6518231911525822306==
Content-Type: multipart/alternative; boundary=089e0149d2bac9edde052b6f4061

--089e0149d2bac9edde052b6f4061
Content-Type: text/plain; charset=UTF-8

Hi, I'm trying to push the stack alignment patch to the repo, but no joy:

0$ git push origin masterCounting objects: 8, done.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1.42 KiB | 0 bytes/s, done.
Total 8 (delta 5), reused 0 (delta 0)
remote: W NAME/ccan/altstack/altstack.c ccan dancancode DENIED by fallthru
remote: error: hook declined to update refs/heads/master
To ccan@ozlabs.org:ccan
! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'ccan@ozlabs.org:ccan'
1$

Is altstack on lockdown? Thanks. -Dan

--089e0149d2bac9edde052b6f4061
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I&#39;m trying to push the stack alignment patch to th=
e repo, but no joy: <br><br>0$ git push origin masterCounting objects: 8, d=
one.<br>Compressing objects: 100% (7/7), done. <br>Writing objects: 100% (8=
/8), 1.42 KiB | 0 bytes/s, done. <br>Total 8 (delta 5), reused 0 (delta 0) =
<br>remote: W NAME/ccan/altstack/altstack.c ccan dancancode DENIED by fallt=
hru <br>remote: error: hook declined to update refs/heads/master <br>To cca=
n@ozlabs.org:ccan <br>! [remote rejected] master -&gt; master (hook decline=
d) <br>error: failed to push some refs to &#39;ccan@ozlabs.org:ccan&#39; <b=
r>1$ <br><br><div>Is altstack on lockdown?  Thanks.  -Dan</div></div>

--089e0149d2bac9edde052b6f4061--

--===============6518231911525822306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6518231911525822306==--
