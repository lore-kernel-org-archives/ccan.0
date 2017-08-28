From: Damien Grassart <damien@grassart.com>
Subject: [PATCH] darray: Fix bug in the darray_remove() macro
Date: Mon, 28 Aug 2017 07:09:35 +0200
Message-ID: <20170828050935.16047-1-damien@grassart.com>
References: <20170828024841.GC2578@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgfvq25cwzDqGh
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 15:09:42 +1000 (AEST)
Received: by mail-wr0-x243.google.com with SMTP id a47so3474806wra.2
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 22:09:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2f06:fb90:922b:34ff:fedb:604])
 by smtp.gmail.com with ESMTPSA id
 p33sm6275796wrb.61.2017.08.27.22.09.37 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Aug 2017 22:09:37 -0700 (PDT)
In-Reply-To: <20170828024841.GC2578@umbus.fritz.box>
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
ZGV0ZXJtaW5lIHRoZQpudW1iZXIgb2YgYnl0ZXMgdG8gY29weS4gVG8gYmUgY29uc2lzdGVudCB3
aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlLAp3ZSBzaG91bGQgYWxzbyBub3QgZXZhbHVhdGUgdGhl
IGluZGV4IHBhcmFtZXRlciBtdWx0aXBsZQp0aW1lcy4gQ2FsbGluZyB0aGlzIHdpdGggcmFuZCgp
ICUgYXJyLnNpemUgd291bGQgb3RoZXJ3aXNlIGdlbmVyYWxseQpzZWdmYXVsdC4KCkZpbmFsbHks
IHdlIHdhbnQgdG8gYXZvaWQgdXNpbmcgImluZGV4IiBhcyBhbiBpZGVudGlmaWVyIHNvIGFzIHRv
IG5vdApzaGFkb3cgaW5kZXgoMykgaW4gdGhlIEMgbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IERh
bWllbiBHcmFzc2FydCA8ZGFtaWVuQGdyYXNzYXJ0LmNvbT4KLS0tCiBjY2FuL2RhcnJheS9kYXJy
YXkuaCB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NjYW4vZGFycmF5L2RhcnJheS5oIGIvY2Nhbi9k
YXJyYXkvZGFycmF5LmgKaW5kZXggODI3MjZjMDUuLjU4NDcwZmRlIDEwMDY0NAotLS0gYS9jY2Fu
L2RhcnJheS9kYXJyYXkuaAorKysgYi9jY2FuL2RhcnJheS9kYXJyYXkuaApAQCAtMTcwLDggKzE3
MCw4IEBAIHR5cGVkZWYgZGFycmF5KHVuc2lnbmVkIGxvbmcpICBkYXJyYXlfdWxvbmc7CiAJCW1l
bW1vdmUoKGFycikuaXRlbSsxLCAoYXJyKS5pdGVtLCAoKGFycikuc2l6ZS0xKSpzaXplb2YoKihh
cnIpLml0ZW0pKTsgXAogCQkoYXJyKS5pdGVtWzBdID0gKF9fVkFfQVJHU19fKTsgXAogCX0gd2hp
bGUoMCkKLSNkZWZpbmUgZGFycmF5X2luc2VydChhcnIsIGluZGV4LCAuLi4pIGRvIHsgXAotCQlz
aXplX3QgaW5kZXhfID0gaW5kZXg7IFwKKyNkZWZpbmUgZGFycmF5X2luc2VydChhcnIsIGksIC4u
LikgZG8geyBcCisJCXNpemVfdCBpbmRleF8gPSAoaSk7IFwKIAkJZGFycmF5X3Jlc2l6ZShhcnIs
IChhcnIpLnNpemUrMSk7IFwKIAkJbWVtbW92ZSgoYXJyKS5pdGVtK2luZGV4XysxLCAoYXJyKS5p
dGVtK2luZGV4XywgKChhcnIpLnNpemUtaW5kZXhfLTEpKnNpemVvZigqKGFycikuaXRlbSkpOyBc
CiAJCShhcnIpLml0ZW1baW5kZXhfXSA9IChfX1ZBX0FSR1NfXyk7IFwKQEAgLTIzMCw5ICsyMzAs
MTAgQEAgdHlwZWRlZiBkYXJyYXkodW5zaWduZWQgbG9uZykgIGRhcnJheV91bG9uZzsKICNkZWZp
bmUgZGFycmF5X3BvcChhcnIpICgoYXJyKS5pdGVtWy0tKGFycikuc2l6ZV0pCiAjZGVmaW5lIGRh
cnJheV9wb3BfY2hlY2soYXJyKSAoKGFycikuc2l6ZSA/IGRhcnJheV9wb3AoYXJyKSA6IE5VTEwp
CiAvKiBXYXJuaW5nLCBzbG93OiBSZXF1aXJlcyBjb3B5aW5nIGFsbCBlbGVtZW50cyBhZnRlciBy
ZW1vdmVkIGl0ZW0uICovCi0jZGVmaW5lIGRhcnJheV9yZW1vdmUoYXJyLCBpbmRleCkgZG8geyBc
Ci0JaWYgKGluZGV4IDwgYXJyLnNpemUtMSkgICAgXAotCQltZW1tb3ZlKCYoYXJyKS5pdGVtW2lu
ZGV4XSwgJihhcnIpLml0ZW1baW5kZXgrMV0sICgoYXJyKS5zaXplLTEtaSkqc2l6ZW9mKCooYXJy
KS5pdGVtKSk7IFwKKyNkZWZpbmUgZGFycmF5X3JlbW92ZShhcnIsIGkpIGRvIHsgXAorCXNpemVf
dCBpbmRleF8gPSAoaSk7IFwKKwlpZiAoaW5kZXhfIDwgYXJyLnNpemUtMSkgICAgXAorCQltZW1t
b3ZlKCYoYXJyKS5pdGVtW2luZGV4X10sICYoYXJyKS5pdGVtW2luZGV4XysxXSwgKChhcnIpLnNp
emUtMS1pbmRleF8pKnNpemVvZigqKGFycikuaXRlbSkpOyBcCiAJKGFycikuc2l6ZS0tOyAgXAog
CX0gd2hpbGUoMCkKIAotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcK
aHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
