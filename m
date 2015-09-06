From: Cody P Schafer <dev@codyps.com>
Subject: [PATCH v4 4/4] mem: add memends_str() helper for symmetry
Date: Sat,  5 Sep 2015 21:21:06 -0400
Message-ID: <1441502466-4754-5-git-send-email-dev@codyps.com>
References: <1441502466-4754-1-git-send-email-dev@codyps.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A75011A1E5C
 for <ccan@lists.ozlabs.org>; Sun,  6 Sep 2015 11:21:15 +1000 (AEST)
Received: by qkfq186 with SMTP id q186so22428355qkf.1
 for <ccan@lists.ozlabs.org>; Sat, 05 Sep 2015 18:21:13 -0700 (PDT)
In-Reply-To: <1441502466-4754-1-git-send-email-dev@codyps.com>
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
Cc: Cody P Schafer <dev@codyps.com>
List-Id: ccan@lists.ozlabs.org

U2lnbmVkLW9mZi1ieTogQ29keSBQIFNjaGFmZXIgPGRldkBjb2R5cHMuY29tPgotLS0KIGNjYW4v
bWVtL21lbS5oICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwogY2Nhbi9tZW0vdGVzdC9hcGku
YyB8ICA2ICsrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY2Nhbi9tZW0vbWVtLmggYi9jY2FuL21lbS9tZW0uaAppbmRl
eCA4ZDZiYmE5Li4xYWZlNTA4IDEwMDY0NAotLS0gYS9jY2FuL21lbS9tZW0uaAorKysgYi9jY2Fu
L21lbS9tZW0uaApAQCAtMTgzLDQgKzE4MywyMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbWVtZW5k
cyhjb25zdCB2b2lkICpzLCBzaXplX3Qgc19sZW4sIGNvbnN0IHZvaWQgKnN1ZmZpeCwgc2l6ZQog
CQkJCQkJc3VmZml4LCBzdWZmaXhfbGVuKSA9PSAwKTsKIH0KIAorLyoqCisgKiBtZW1lbmRzX3N0
ciAtIERvZXMgdGhpcyBieXRlIGFycmF5IGVuZCB3aXRoIGEgc3RyaW5nIHN1ZmZpeD8KKyAqIEBh
OiBieXRlIGFycmF5CisgKiBAYWw6IGxlbmd0aCBpbiBieXRlcworICogQHM6IHN0cmluZyBzdWZm
aXgKKyAqCisgKiBFeGFtcGxlOgorICoJaWYgKG1lbWVuZHNfc3RyKHNvbWVieXRlcywgYnl0ZXNf
bGVuLCAiSXQiKSkgeworICoJCXByaW50Zigic29tZWJ5dGVzIGVuZHMgd2l0aCB3aXRoICdJdCdc
biIpOworICoJfQorICovCitQVVJFX0ZVTkNUSU9OCitzdGF0aWMgaW5saW5lIGJvb2wgbWVtZW5k
c19zdHIoY29uc3Qgdm9pZCAqYSwgc2l6ZV90IGFsLCBjb25zdCBjaGFyICpzKQoreworCXJldHVy
biBtZW1lbmRzKGEsIGFsLCBzLCBzdHJsZW4ocykpOworfQorCiAjZW5kaWYgLyogQ0NBTl9NRU1f
SCAqLwpkaWZmIC0tZ2l0IGEvY2Nhbi9tZW0vdGVzdC9hcGkuYyBiL2NjYW4vbWVtL3Rlc3QvYXBp
LmMKaW5kZXggODliNmFjYi4uOWVjMjI2ZCAxMDA2NDQKLS0tIGEvY2Nhbi9tZW0vdGVzdC9hcGku
YworKysgYi9jY2FuL21lbS90ZXN0L2FwaS5jCkBAIC0xMiw3ICsxMiw3IEBAIGludCBtYWluKHZv
aWQpCiAJY2hhciBzY2FuMltdID0gIlwwXDBcMGIiOwogCiAJLyogVGhpcyBpcyBob3cgbWFueSB0
ZXN0cyB5b3UgcGxhbiB0byBydW4gKi8KLQlwbGFuX3Rlc3RzKDQyKTsKKwlwbGFuX3Rlc3RzKDQ2
KTsKIAogCW9rMShtZW1tZW0oaGF5c3RhY2sxLCBzaXplb2YoaGF5c3RhY2sxKSwgbmVlZGxlMSwg
MikgPT0gaGF5c3RhY2sxKTsKIAlvazEobWVtbWVtKGhheXN0YWNrMSwgc2l6ZW9mKGhheXN0YWNr
MSksIG5lZWRsZTEsIDMpID09IE5VTEwpOwpAQCAtNzEsNiArNzEsMTAgQEAgaW50IG1haW4odm9p
ZCkKIAlvazEoIW1lbWVuZHMoUygiYVwwYmNkZWYiKSwgUygiYVwwYiIpKSk7CiAJb2sxKG1lbWVu
ZHMoUygiYVwwYmNkZWYiKSwgUygiZWYiKSkpOwogCisJb2sxKG1lbWVuZHNfc3RyKFMoImFiY2Rl
ZiIpLCAiYWJjZGVmIikpOworCW9rMSghbWVtZW5kc19zdHIoUygiYWJjZGVcMGYiKSwgImRcMGYi
KSk7CisJb2sxKCFtZW1lbmRzX3N0cihTKCJhXDBiY2RlZiIpLCAiYSIpKTsKKwlvazEobWVtZW5k
c19zdHIoUygiYVwwYmNkZWYiKSwgImVmIikpOwogCiAJLyogVGhpcyBleGl0cyBkZXBlbmRpbmcg
b24gd2hldGhlciBhbGwgdGVzdHMgcGFzc2VkICovCiAJcmV0dXJuIGV4aXRfc3RhdHVzKCk7Ci0t
IAoyLjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Y2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3ps
YWJzLm9yZy9saXN0aW5mby9jY2FuCg==
