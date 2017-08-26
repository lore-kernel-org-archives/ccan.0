From: Damien Grassart <damien@grassart.com>
Subject: [PATCH] darray: Add darray_insert() to insert a value at a
 specified index
Date: Sat, 26 Aug 2017 20:01:08 +0200
Message-ID: <20170826180108.20693-1-damien@grassart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-wr0-x22f.google.com (mail-wr0-x22f.google.com
 [IPv6:2a00:1450:400c:c0c::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xfm732n83zDrKC
 for <ccan@lists.ozlabs.org>; Sun, 27 Aug 2017 04:01:19 +1000 (AEST)
Received: by mail-wr0-x22f.google.com with SMTP id p14so7564529wrg.3
 for <ccan@lists.ozlabs.org>; Sat, 26 Aug 2017 11:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2f06:fb90:922b:34ff:fedb:604])
 by smtp.gmail.com with ESMTPSA id
 u1sm8745899wrd.16.2017.08.26.11.01.14 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Aug 2017 11:01:14 -0700 (PDT)
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

VGhpcyBtb2R1bGUgY3VycmVudGx5IHN1cHBvcnRzIHJlbW92aW5nIGJ1dCBub3QgaW5zZXJ0aW5n
IGF0IGEKc3BlY2lmaWVkIGluZGV4LCBzbyB0aGlzIGFkZHMgdGhhdC4gSW5zZXJ0aW5nIGEgdmFs
dWUgbW92ZXMgYWxsCmV4aXN0aW5nIGRhdGEgYmV5b25kIGluZGV4IG92ZXIgb25lIGVsZW1lbnQu
Ci0tLQogY2Nhbi9kYXJyYXkvZGFycmF5LmggfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jY2FuL2RhcnJheS9kYXJyYXkuaCBiL2NjYW4v
ZGFycmF5L2RhcnJheS5oCmluZGV4IDc1MTEyNDE5Li5mY2EyMGI4YSAxMDA2NDQKLS0tIGEvY2Nh
bi9kYXJyYXkvZGFycmF5LmgKKysrIGIvY2Nhbi9kYXJyYXkvZGFycmF5LmgKQEAgLTU2LDYgKzU2
LDcgQEAKICAqCiAgKiAgICAgdm9pZCAgIGRhcnJheV9hcHBlbmQoZGFycmF5KFQpIGFyciwgVCBp
dGVtKTsKICAqICAgICB2b2lkICAgZGFycmF5X3ByZXBlbmQoZGFycmF5KFQpIGFyciwgVCBpdGVt
KTsKKyAqICAgICB2b2lkICAgZGFycmF5X2luc2VydChkYXJyYXkoVCkgYXJyLCBzaXplX3QgaW5k
ZXgsIFQgaXRlbSk7CiAgKiAgICAgdm9pZCAgIGRhcnJheV9wdXNoKGRhcnJheShUKSBhcnIsIFQg
aXRlbSk7IC8vIHNhbWUgYXMgZGFycmF5X2FwcGVuZAogICoKICAqIEluc2VydGlvbiAobXVsdGlw
bGUgaXRlbXMpOgpAQCAtMTY5LDYgKzE3MCwxMiBAQCB0eXBlZGVmIGRhcnJheSh1bnNpZ25lZCBs
b25nKSAgZGFycmF5X3Vsb25nOwogCQltZW1tb3ZlKChhcnIpLml0ZW0rMSwgKGFycikuaXRlbSwg
KChhcnIpLnNpemUtMSkqc2l6ZW9mKCooYXJyKS5pdGVtKSk7IFwKIAkJKGFycikuaXRlbVswXSA9
IChfX1ZBX0FSR1NfXyk7IFwKIAl9IHdoaWxlKDApCisjZGVmaW5lIGRhcnJheV9pbnNlcnQoYXJy
LCBpbmRleCwgLi4uKSBkbyB7IFwKKwkJc2l6ZV90IF9faW5kZXggPSBpbmRleDsgXAorCQlkYXJy
YXlfcmVzaXplKGFyciwgKGFycikuc2l6ZSsxKTsgXAorCQltZW1tb3ZlKChhcnIpLml0ZW0rX19p
bmRleCsxLCAoYXJyKS5pdGVtK19faW5kZXgsICgoYXJyKS5zaXplLV9faW5kZXgtMSkqc2l6ZW9m
KCooYXJyKS5pdGVtKSk7IFwKKwkJKGFycikuaXRlbVtfX2luZGV4XSA9IChfX1ZBX0FSR1NfXyk7
IFwKKwl9IHdoaWxlKDApCiAjZGVmaW5lIGRhcnJheV9wdXNoKGFyciwgLi4uKSBkYXJyYXlfYXBw
ZW5kKGFyciwgX19WQV9BUkdTX18pCiAKIAotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3Rz
Lm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
