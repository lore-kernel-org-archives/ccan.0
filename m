From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/7] failtest: Remove memory leak
Date: Mon,  3 Apr 2017 21:11:07 +1000
Message-ID: <20170403111112.27201-3-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTtt13HzzDqH6
 for <ccan@lists.ozlabs.org>; Mon,  3 Apr 2017 21:11:18 +1000 (AEST)
In-Reply-To: <20170403111112.27201-1-david@gibson.dropbear.id.au>
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
Cc: rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org

U29tZXdoYXQgaXJvbmljYWxseSwgYSBwYXRoIGluIGZhaWx0ZXN0IHJlbGF0ZWQgdG8gZGV0ZWN0
aW5nIGxlYWtzIGluIHRoZQp0ZXN0ZWQgcHJvZ3JhbSBpdHNlbGYgbGVha3MgbWVtb3J5LiAgVGhp
cyBjb3JyZWN0cyBpdC4KCkRldGVjdGVkIGJ5IENvdmVyaXR5LgoKU2lnbmVkLW9mZi1ieTogRGF2
aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLQogY2Nhbi9mYWlsdGVz
dC9mYWlsdGVzdC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY2Nhbi9mYWlsdGVzdC9mYWlsdGVzdC5jIGIvY2Nh
bi9mYWlsdGVzdC9mYWlsdGVzdC5jCmluZGV4IGFhYjI4ZGQuLmM2MWNlNDQgMTAwNjQ0Ci0tLSBh
L2NjYW4vZmFpbHRlc3QvZmFpbHRlc3QuYworKysgYi9jY2FuL2ZhaWx0ZXN0L2ZhaWx0ZXN0LmMK
QEAgLTYxMyw4ICs2MTMsMTAgQEAgc3RhdGljIE5PUkVUVVJOIHZvaWQgZmFpbHRlc3RfY2xlYW51
cChib29sIGZvcmNlZF9jbGVhbnVwLCBpbnQgc3RhdHVzKQogCiAJCS8qIEJ1dCB0aGVpciBwcm9n
cmFtIHNob3VsZG4ndCBsZWFrLCBldmVuIG9uIGZhaWx1cmUuICovCiAJCWlmICghZm9yY2VkX2Ns
ZWFudXAgJiYgaS0+Y2FuX2xlYWspIHsKKwkJCWNoYXIgKnAgPSBmYWlscGF0aF9zdHJpbmcoKTsK
IAkJCXByaW50ZigiTGVhayBhdCAlczoldTogLS1mYWlscGF0aD0lc1xuIiwKLQkJCSAgICAgICBp
LT5maWxlLCBpLT5saW5lLCBmYWlscGF0aF9zdHJpbmcoKSk7CisJCQkgICAgICAgaS0+ZmlsZSwg
aS0+bGluZSwgcCk7CisJCQlmcmVlKHApOwogCQkJc3RhdHVzID0gMTsKIAkJfQogCX0KLS0gCjIu
OS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2Fu
IG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL2xpc3RpbmZvL2NjYW4K
