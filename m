From: Damien Grassart <damien@grassart.com>
Subject: [PATCH 2/2] darray: Fix bug in the darray_remove() macro
Date: Sun, 27 Aug 2017 23:26:24 +0200
Message-ID: <20170827212624.14673-2-damien@grassart.com>
References: <20170827025642.GN2772@umbus.fritz.box>
 <20170827212624.14673-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgSdL5W05zDqYw
 for <ccan@lists.ozlabs.org>; Mon, 28 Aug 2017 07:26:30 +1000 (AEST)
Received: by mail-wm0-x243.google.com with SMTP id e67so5236734wmd.0
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 14:26:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2f06:fb90:922b:34ff:fedb:604])
 by smtp.gmail.com with ESMTPSA id
 n184sm6847335wme.33.2017.08.27.14.26.26 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Aug 2017 14:26:27 -0700 (PDT)
In-Reply-To: <20170827212624.14673-1-damien@grassart.com>
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
YXJyYXkvZGFycmF5LmgKaW5kZXggODI3MjZjMDUuLjY3ODdmMTRjIDEwMDY0NAotLS0gYS9jY2Fu
L2RhcnJheS9kYXJyYXkuaAorKysgYi9jY2FuL2RhcnJheS9kYXJyYXkuaApAQCAtMTcwLDggKzE3
MCw4IEBAIHR5cGVkZWYgZGFycmF5KHVuc2lnbmVkIGxvbmcpICBkYXJyYXlfdWxvbmc7CiAJCW1l
bW1vdmUoKGFycikuaXRlbSsxLCAoYXJyKS5pdGVtLCAoKGFycikuc2l6ZS0xKSpzaXplb2YoKihh
cnIpLml0ZW0pKTsgXAogCQkoYXJyKS5pdGVtWzBdID0gKF9fVkFfQVJHU19fKTsgXAogCX0gd2hp
bGUoMCkKLSNkZWZpbmUgZGFycmF5X2luc2VydChhcnIsIGluZGV4LCAuLi4pIGRvIHsgXAotCQlz
aXplX3QgaW5kZXhfID0gaW5kZXg7IFwKKyNkZWZpbmUgZGFycmF5X2luc2VydChhcnIsIGksIC4u
LikgZG8geyBcCisJCXNpemVfdCBpbmRleF8gPSBpOyBcCiAJCWRhcnJheV9yZXNpemUoYXJyLCAo
YXJyKS5zaXplKzEpOyBcCiAJCW1lbW1vdmUoKGFycikuaXRlbStpbmRleF8rMSwgKGFycikuaXRl
bStpbmRleF8sICgoYXJyKS5zaXplLWluZGV4Xy0xKSpzaXplb2YoKihhcnIpLml0ZW0pKTsgXAog
CQkoYXJyKS5pdGVtW2luZGV4X10gPSAoX19WQV9BUkdTX18pOyBcCkBAIC0yMzAsOSArMjMwLDEw
IEBAIHR5cGVkZWYgZGFycmF5KHVuc2lnbmVkIGxvbmcpICBkYXJyYXlfdWxvbmc7CiAjZGVmaW5l
IGRhcnJheV9wb3AoYXJyKSAoKGFycikuaXRlbVstLShhcnIpLnNpemVdKQogI2RlZmluZSBkYXJy
YXlfcG9wX2NoZWNrKGFycikgKChhcnIpLnNpemUgPyBkYXJyYXlfcG9wKGFycikgOiBOVUxMKQog
LyogV2FybmluZywgc2xvdzogUmVxdWlyZXMgY29weWluZyBhbGwgZWxlbWVudHMgYWZ0ZXIgcmVt
b3ZlZCBpdGVtLiAqLwotI2RlZmluZSBkYXJyYXlfcmVtb3ZlKGFyciwgaW5kZXgpIGRvIHsgXAot
CWlmIChpbmRleCA8IGFyci5zaXplLTEpICAgIFwKLQkJbWVtbW92ZSgmKGFycikuaXRlbVtpbmRl
eF0sICYoYXJyKS5pdGVtW2luZGV4KzFdLCAoKGFycikuc2l6ZS0xLWkpKnNpemVvZigqKGFyciku
aXRlbSkpOyBcCisjZGVmaW5lIGRhcnJheV9yZW1vdmUoYXJyLCBpKSBkbyB7IFwKKwlzaXplX3Qg
aW5kZXhfID0gaTsKKwlpZiAoaW5kZXhfIDwgYXJyLnNpemUtMSkgICAgXAorCQltZW1tb3ZlKCYo
YXJyKS5pdGVtW2luZGV4X10sICYoYXJyKS5pdGVtW2luZGV4XysxXSwgKChhcnIpLnNpemUtMS1p
bmRleF8pKnNpemVvZigqKGFycikuaXRlbSkpOyBcCiAJKGFycikuc2l6ZS0tOyAgXAogCX0gd2hp
bGUoMCkKIAotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6
Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
