From: Damien Grassart <damien@grassart.com>
Subject: [PATCH 1/2] darray: Fix bug in the darray_remove() macro
Date: Sat, 26 Aug 2017 18:26:20 +0200
Message-ID: <20170826162620.15989-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-wr0-x244.google.com (mail-wr0-x244.google.com
 [IPv6:2a00:1450:400c:c0c::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xfk1f4XjyzDrFJ
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 02:26:29 +1000 (AEST)
Received: by mail-wr0-x244.google.com with SMTP id p8so1583101wrf.3
 for <ccan@lists.ozlabs.org>; Sat, 26 Aug 2017 09:26:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2f06:fb90:922b:34ff:fedb:604])
 by smtp.gmail.com with ESMTPSA id
 65sm3135790wmf.0.2017.08.26.09.26.24 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Aug 2017 09:26:24 -0700 (PDT)
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

VGhlIG1lbW1vdmUoKSBjYWxsIHNob3VsZCBiZSB1c2luZyB0aGUgaW5kZXggYXJndW1lbnQgdG8g
ZGV0ZXJtaW5lIHRoZQpudW1iZXIgb2YgYnl0ZXMgdG8gY29weS4KClNpZ25lZC1vZmYtYnk6IERh
bWllbiBHcmFzc2FydCA8ZGFtaWVuQGdyYXNzYXJ0LmNvbT4KLS0tCiBjY2FuL2RhcnJheS9kYXJy
YXkuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2NjYW4vZGFycmF5L2RhcnJheS5oIGIvY2Nhbi9kYXJyYXkvZGFycmF5
LmgKaW5kZXggNzUxMTI0MTkuLjhkNDc2NDViIDEwMDY0NAotLS0gYS9jY2FuL2RhcnJheS9kYXJy
YXkuaAorKysgYi9jY2FuL2RhcnJheS9kYXJyYXkuaApAQCAtMjI1LDcgKzIyNSw3IEBAIHR5cGVk
ZWYgZGFycmF5KHVuc2lnbmVkIGxvbmcpICBkYXJyYXlfdWxvbmc7CiAvKiBXYXJuaW5nLCBzbG93
OiBSZXF1aXJlcyBjb3B5aW5nIGFsbCBlbGVtZW50cyBhZnRlciByZW1vdmVkIGl0ZW0uICovCiAj
ZGVmaW5lIGRhcnJheV9yZW1vdmUoYXJyLCBpbmRleCkgZG8geyBcCiAJaWYgKGluZGV4IDwgYXJy
LnNpemUtMSkgICAgXAotCQltZW1tb3ZlKCYoYXJyKS5pdGVtW2luZGV4XSwgJihhcnIpLml0ZW1b
aW5kZXgrMV0sICgoYXJyKS5zaXplLTEtaSkqc2l6ZW9mKCooYXJyKS5pdGVtKSk7IFwKKwkJbWVt
bW92ZSgmKGFycikuaXRlbVtpbmRleF0sICYoYXJyKS5pdGVtW2luZGV4KzFdLCAoKGFycikuc2l6
ZS0xLWluZGV4KSpzaXplb2YoKihhcnIpLml0ZW0pKTsgXAogCShhcnIpLnNpemUtLTsgIFwKIAl9
IHdoaWxlKDApCiAKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0
dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
