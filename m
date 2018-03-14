From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [PATCH] fix misuse of typesafe_cb_cast() in example
Date: Wed, 14 Mar 2018 11:16:42 +0800
Message-ID: <20180314031641.GB6951@HP>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 401H2F3LpRzF11V
 for <ccan@lists.ozlabs.org>; Wed, 14 Mar 2018 14:16:53 +1100 (AEDT)
Received: by mail-pl0-x244.google.com with SMTP id m22-v6so1006338pls.5
 for <ccan@lists.ozlabs.org>; Tue, 13 Mar 2018 20:16:52 -0700 (PDT)
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

RnJvbSAzMmY4NmM3MDFhYjBlMGFkMGFkNjk4MTMxNGE5YmZmMmRjNWViYjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZdWJpbiBSdWFuIDxhYmxhY2t0c2hpcnRAZ21haWwuY29tPgpE
YXRlOiBXZWQsIDE0IE1hciAyMDE4IDExOjE0OjU0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gZml4
IG1pc3VzZSBvZiB0eXBlc2FmZV9jYl9jYXN0KCkgaW4gZXhhbXBsZQoKU2lnbmVkLW9mZi1ieTog
WXViaW4gUnVhbiA8YWJsYWNrdHNoaXJ0QGdtYWlsLmNvbT4KLS0tCiBjY2FuL3R5cGVzYWZlX2Ni
L3R5cGVzYWZlX2NiLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jY2FuL3R5cGVzYWZlX2NiL3R5cGVzYWZlX2NiLmgg
Yi9jY2FuL3R5cGVzYWZlX2NiL3R5cGVzYWZlX2NiLmgKaW5kZXggOTQyZDVjMi4uMTI2ZDMyNSAx
MDA2NDQKLS0tIGEvY2Nhbi90eXBlc2FmZV9jYi90eXBlc2FmZV9jYi5oCisrKyBiL2NjYW4vdHlw
ZXNhZmVfY2IvdHlwZXNhZmVfY2IuaApAQCAtMjcsNyArMjcsNyBAQAogICoJLy8gV2UgY2FuIHRh
a2UgZWl0aGVyIGFuIHVuc2lnbmVkIGxvbmcgb3IgYSB2b2lkICouCiAgKgl2b2lkIF9zZXRfc29t
ZV92YWx1ZSh2b2lkICp2YWwpOwogICoJI2RlZmluZSBzZXRfc29tZV92YWx1ZShlKQkJCVwKLSAq
CQlfc2V0X3NvbWVfdmFsdWUodHlwZXNhZmVfY2JfY2FzdCh2b2lkICosIChlKSwgdW5zaWduZWQg
bG9uZykpCisgKgkJX3NldF9zb21lX3ZhbHVlKHR5cGVzYWZlX2NiX2Nhc3Qodm9pZCAqLCB1bnNp
Z25lZCBsb25nLCAoZSkpKQogICovCiAjZGVmaW5lIHR5cGVzYWZlX2NiX2Nhc3QoZGVzdHR5cGUs
IG9rdHlwZSwgZXhwcikJCQlcCiAJX19idWlsdGluX2Nob29zZV9leHByKAkJCQkJCVwKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2Fu
IG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL2xpc3RpbmZvL2NjYW4K
