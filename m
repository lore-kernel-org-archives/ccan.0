From: Damien Grassart <damien@grassart.com>
Subject: [PATCH 2/2] darray: Evaluate the index parameter only once
 in darray_remove()
Date: Sat, 26 Aug 2017 18:26:52 +0200
Message-ID: <20170826162652.16072-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xfk290q7xzDrJ5
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 02:26:57 +1000 (AEST)
Received: by mail-wr0-x242.google.com with SMTP id p8so1583558wrf.3
 for <ccan@lists.ozlabs.org>; Sat, 26 Aug 2017 09:26:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2f06:fb90:922b:34ff:fedb:604])
 by smtp.gmail.com with ESMTPSA id
 63sm9040919wra.30.2017.08.26.09.26.53 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Aug 2017 09:26:53 -0700 (PDT)
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

VG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlLCB0aGUgaW5kZXggcGFy
YW1hdGVyIHNob3VsZApub3QgYmUgZXZhbHVhdGVkIG11bHRpcGxlIHRpbWVzLiBDYWxsaW5nIHRo
aXMgd2l0aCByYW5kKCkgJSBhcnIuc2l6ZQp3b3VsZCBvdGhlcndpc2UgZ2VuZXJhbGx5IHNlZ2Zh
dWx0LgotLS0KIGNjYW4vZGFycmF5L2RhcnJheS5oIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jY2FuL2RhcnJh
eS9kYXJyYXkuaCBiL2NjYW4vZGFycmF5L2RhcnJheS5oCmluZGV4IDhkNDc2NDViLi42ZGQzNGYw
OCAxMDA2NDQKLS0tIGEvY2Nhbi9kYXJyYXkvZGFycmF5LmgKKysrIGIvY2Nhbi9kYXJyYXkvZGFy
cmF5LmgKQEAgLTIyNCw4ICsyMjQsOSBAQCB0eXBlZGVmIGRhcnJheSh1bnNpZ25lZCBsb25nKSAg
ZGFycmF5X3Vsb25nOwogI2RlZmluZSBkYXJyYXlfcG9wX2NoZWNrKGFycikgKChhcnIpLnNpemUg
PyBkYXJyYXlfcG9wKGFycikgOiBOVUxMKQogLyogV2FybmluZywgc2xvdzogUmVxdWlyZXMgY29w
eWluZyBhbGwgZWxlbWVudHMgYWZ0ZXIgcmVtb3ZlZCBpdGVtLiAqLwogI2RlZmluZSBkYXJyYXlf
cmVtb3ZlKGFyciwgaW5kZXgpIGRvIHsgXAotCWlmIChpbmRleCA8IGFyci5zaXplLTEpICAgIFwK
LQkJbWVtbW92ZSgmKGFycikuaXRlbVtpbmRleF0sICYoYXJyKS5pdGVtW2luZGV4KzFdLCAoKGFy
cikuc2l6ZS0xLWluZGV4KSpzaXplb2YoKihhcnIpLml0ZW0pKTsgXAorCXNpemVfdCBfX2luZGV4
ID0gaW5kZXg7IFwKKwlpZiAoX19pbmRleCA8IGFyci5zaXplLTEpICAgIFwKKwkJbWVtbW92ZSgm
KGFycikuaXRlbVtfX2luZGV4XSwgJihhcnIpLml0ZW1bX19pbmRleCsxXSwgKChhcnIpLnNpemUt
MS1fX2luZGV4KSpzaXplb2YoKihhcnIpLml0ZW0pKTsgXAogCShhcnIpLnNpemUtLTsgIFwKIAl9
IHdoaWxlKDApCiAKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0
dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
