From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/3] mem: Remove array_size dependency
Date: Thu, 10 Sep 2015 07:54:53 +1000
Message-ID: <1441835695-4341-2-git-send-email-david@gibson.dropbear.id.au>
References: <1441835695-4341-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449F81A2758
 for <ccan@lists.ozlabs.org>; Thu, 10 Sep 2015 07:54:35 +1000 (AEST)
In-Reply-To: <1441835695-4341-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au
List-Id: ccan@lists.ozlabs.org

VGhlIG1lbSBtb2R1bGUgZGVjbGFyZXMgYXJyYXlfc2l6ZSBhcyBhIHRlc3QgZGVwZW5kZW5jeSwg
YW5kIGluY2x1ZGVzIGl0IGluCnRlc3QvYXBpLmMsIGJ1dCBkb2Vzbid0IGFjdHVhbGx5IHVzZSBp
dC4gIFRoaXMgcmVtb3ZlcyB0aGUgdW5uZWVkZWQKZGVwZW5kZW5jeS4KClNpZ25lZC1vZmYtYnk6
IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PgotLS0KIGNjYW4vbWVt
L19pbmZvICAgICAgfCAxIC0KIGNjYW4vbWVtL3Rlc3QvYXBpLmMgfCAxIC0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jY2FuL21lbS9faW5mbyBiL2NjYW4v
bWVtL19pbmZvCmluZGV4IDYzODllMzUuLmI5NWE1NzUgMTAwNjQ0Ci0tLSBhL2NjYW4vbWVtL19p
bmZvCisrKyBiL2NjYW4vbWVtL19pbmZvCkBAIC0yMyw3ICsyMyw2IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiAJfQogCiAJaWYgKHN0cmNtcChhcmd2WzFdLCAidGVzdGRlcGVu
ZHMiKSA9PSAwKSB7Ci0JCXByaW50ZigiY2Nhbi9hcnJheV9zaXplIik7CiAJCXJldHVybiAwOwog
CX0KIApkaWZmIC0tZ2l0IGEvY2Nhbi9tZW0vdGVzdC9hcGkuYyBiL2NjYW4vbWVtL3Rlc3QvYXBp
LmMKaW5kZXggOWVjMjI2ZC4uZDAxNzhjMyAxMDA2NDQKLS0tIGEvY2Nhbi9tZW0vdGVzdC9hcGku
YworKysgYi9jY2FuL21lbS90ZXN0L2FwaS5jCkBAIC0xLDQgKzEsMyBAQAotI2luY2x1ZGUgPGNj
YW4vYXJyYXlfc2l6ZS9hcnJheV9zaXplLmg+CiAjaW5jbHVkZSA8Y2Nhbi9tZW0vbWVtLmg+CiAj
aW5jbHVkZSA8Y2Nhbi90YXAvdGFwLmg+CiAKLS0gCjIuNC4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3Rz
Lm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
