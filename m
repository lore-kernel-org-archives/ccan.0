From: "Emilio G. Cota" <cota@braap.org>
Subject: [PATCH] aga: trivial: fix description of aga_bfs
Date: Mon, 26 Sep 2016 17:27:00 -0400
Message-ID: <1474925220-1172-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjcVb3748zDrRs
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 07:27:02 +1000 (AEST)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

U2lnbmVkLW9mZi1ieTogRW1pbGlvIEcuIENvdGEgPGNvdGFAYnJhYXAub3JnPgotLS0KIGNjYW4v
YWdhL2FnYS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY2Nhbi9hZ2EvYWdhLmggYi9jY2FuL2FnYS9hZ2EuaAppbmRl
eCBkMDlkNGM3Li5lOWJkMWRiIDEwMDY0NAotLS0gYS9jY2FuL2FnYS9hZ2EuaAorKysgYi9jY2Fu
L2FnYS9hZ2EuaApAQCAtMzQ3LDcgKzM0Nyw3IEBAIHN0cnVjdCBhZ2Ffbm9kZSAqYWdhX2Jmc19l
eHBsb3JlKHN0cnVjdCBhZ2FfZ3JhcGggKmcsIHN0cnVjdCBhZ2Ffbm9kZSAqbik7CiAgKgogICog
UGVyZm9ybXMgYSBicmVhZHRoIGZpcnN0IHNlYXJjaC4gIFRoZSBibG9jayBmb2xsb3dpbmcgdGhp
cyBtYWNybyBpcwogICogZXhlY3V0ZWQgd2l0aCBAX24gc2V0IGZpcnN0IHRvIEBfc3RhcnQsIHRo
ZW4gdG8gZWFjaCBub2RlIHJlYWNoYWJsZQotICogZnJvbSBAX3N0YXJ0IGluIGRlcHRoIGZpcnN0
IHNlYXJjaCBvcmRlci4KKyAqIGZyb20gQF9zdGFydCBpbiBicmVhZHRoLWZpcnN0IHNlYXJjaCBv
cmRlci4KICAqCiAgKiBhZ2FfYmZzX3N0YXJ0KCkgbXVzdCBiZSBjYWxsZWQgYmVmb3JlIHRoaXMg
bWFjcm8gaXMgdXNlZC4KICAqLwotLSAKMi41LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJz
Lm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
