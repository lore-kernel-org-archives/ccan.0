From: Rhys Ulerich <rhys.ulerich@gmail.com>
Subject: Re: Annoying warning, a.k.a. how to add to CFLAGS
Date: Fri, 1 Sep 2017 07:46:08 -0400
Message-ID: <CAKDqugSq+BOaBs4BXUGX-6Ha-FG=PVgyFcFQ8ONO=95sphdqrg@mail.gmail.com>
References: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6796155056134203208=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkHWT4w4jzDqZf
 for <ccan@lists.ozlabs.org>; Fri,  1 Sep 2017 21:46:13 +1000 (AEST)
Received: by mail-qk0-x234.google.com with SMTP id p67so9195025qkd.2
 for <ccan@lists.ozlabs.org>; Fri, 01 Sep 2017 04:46:13 -0700 (PDT)
In-Reply-To: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

--===============6796155056134203208==
Content-Type: multipart/alternative; boundary="001a1141c63ea4a47d05581f4ef0"

--001a1141c63ea4a47d05581f4ef0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ccan/strgrp/strgrp.c: In function =E2=80=98grp_for=E2=80=99:
ccan/strgrp/strgrp.c:296:0: warning: ignoring #pragma omp parallel
[-Wunknown-pragmas]
     #pragma omp parallel for schedule(dynamic)


An ifdef might be added to the code:
https://stackoverflow.com/questions/1300180/ignore-openmp-on-machine-that-d=
oesnt-have-it

- Rhys

--001a1141c63ea4a47d05581f4ef0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">ccan/strgrp/strgrp.c: In function =E2=80=
=98grp_for=E2=80=99:<br>
ccan/strgrp/strgrp.c:296:0: warning: ignoring #pragma omp parallel [-Wunkno=
wn-pragmas]<br>
=C2=A0 =C2=A0 =C2=A0#pragma omp parallel for schedule(dynamic)<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">An ifdef migh=
t be added to the code:=C2=A0<a href=3D"https://stackoverflow.com/questions=
/1300180/ignore-openmp-on-machine-that-doesnt-have-it">https://stackoverflo=
w.com/questions/1300180/ignore-openmp-on-machine-that-doesnt-have-it</a></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">- Rhys=C2=A0</div><div dir=
=3D"auto"><br></div><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--001a1141c63ea4a47d05581f4ef0--

--===============6796155056134203208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6796155056134203208==--
