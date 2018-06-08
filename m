From: Eric Wong <normalperson@yhbt.net>
Subject: [PATCH] timer: remove unnecessary dependency on likely
Date: Fri, 8 Jun 2018 02:45:42 +0000
Message-ID: <20180608024542.dm4s6s4flmsi3jqm@dcvr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from dcvr.yhbt.net (dcvr.yhbt.net
 [IPv6:2600:3c01::f03c:91ff:fe96:f5d6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4126Ps0bqjzDqsx
 for <ccan@lists.ozlabs.org>; Fri,  8 Jun 2018 12:52:00 +1000 (AEST)
Content-Disposition: inline
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

SSBkb24ndCBzZWUgbGlrZWx5L3VubGlrZWx5IGJlaW5nIHVzZWQgYnkgY2Nhbi90aW1lciBvciBh
bnkgb2YgaXRzCmRlcGVuZGVuY2llcyByaWdodCBub3cuCgpSdW5uaW5nIGB0b29scy9jY2FubGlu
dC9jY2FubGludCBjY2FuL3RpbWVyJyByZXZlYWxzIG5vIHJlZ3Jlc3Npb25zCgpTaWduZWQtb2Zm
LWJ5OiBFcmljIFdvbmcgPG5vcm1hbHBlcnNvbkB5aGJ0Lm5ldD4KLS0tCiBjY2FuL3RpbWVyL19p
bmZvICAgfCAxIC0KIGNjYW4vdGltZXIvdGltZXIuYyB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NjYW4vdGltZXIvX2luZm8gYi9jY2FuL3RpbWVy
L19pbmZvCmluZGV4IDlmNWVjN2EyLi5kNzZhN2U2NyAxMDA2NDQKLS0tIGEvY2Nhbi90aW1lci9f
aW5mbworKysgYi9jY2FuL3RpbWVyL19pbmZvCkBAIC03MCw3ICs3MCw2IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCiAJaWYgKHN0cmNtcChhcmd2WzFdLCAiZGVwZW5kcyIpID09
IDApIHsKIAkJcHJpbnRmKCJjY2FuL2FycmF5X3NpemVcbiIpOwogCQlwcmludGYoImNjYW4vaWxv
Z1xuIik7Ci0JCXByaW50ZigiY2Nhbi9saWtlbHlcbiIpOwogCQlwcmludGYoImNjYW4vbGlzdFxu
Iik7CiAJCXByaW50ZigiY2Nhbi90aW1lXG4iKTsKIAkJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9j
Y2FuL3RpbWVyL3RpbWVyLmMgYi9jY2FuL3RpbWVyL3RpbWVyLmMKaW5kZXggOTFmNDYzOTMuLjg0
ZDdhYTE0IDEwMDY0NAotLS0gYS9jY2FuL3RpbWVyL3RpbWVyLmMKKysrIGIvY2Nhbi90aW1lci90
aW1lci5jCkBAIC0yLDcgKzIsNiBAQAogI2luY2x1ZGUgPGNjYW4vdGltZXIvdGltZXIuaD4KICNp
bmNsdWRlIDxjY2FuL2FycmF5X3NpemUvYXJyYXlfc2l6ZS5oPgogI2luY2x1ZGUgPGNjYW4vaWxv
Zy9pbG9nLmg+Ci0jaW5jbHVkZSA8Y2Nhbi9saWtlbHkvbGlrZWx5Lmg+CiAjaW5jbHVkZSA8c3Rk
bGliLmg+CiAjaW5jbHVkZSA8c3RkaW8uaD4KIAotLSAKRVcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5v
emxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
