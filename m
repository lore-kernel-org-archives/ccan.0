From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/4] altstack: Include config.h in run.c
Date: Tue, 16 Feb 2016 17:09:23 +1100
Message-ID: <1455602965-3201-3-git-send-email-david@gibson.dropbear.id.au>
References: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A47501A004B
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 21:04:16 +1100 (AEDT)
In-Reply-To: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: dan@dancancode.com
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

Y2NhbiBwcm9ncmFtcyBzaG91bGQgYWx3YXlzIGluY2x1ZGUgY29uZmlnLmggYmVmb3JlIGFueXRo
aW5nIGVsc2UgdG8gbWFrZQpzdXJlIGV2ZXJ5dGhpbmcgaXMgc2V0IHVwIGNvcnJlY3RseS4gIERv
aW5nIHNvIGluIGFsdHN0YWNrJ3MgcnVuLmMgbWVhbnMKaXQgbm8gbG9uZ2VyIG5lZWRzIGFuIGV4
cGxpY2l0IF9YT1BFTl9TT1VSQ0UgNzAwLCBzaW5jZSBfR05VX1NPVVJDRSBpcyBzZXQKaW4gY29u
ZmlnLmggKGZvciBHTlUgbGliYywgYW55d2F5KS4KClNpZ25lZC1vZmYtYnk6IERhdmlkIEdpYnNv
biA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PgotLS0KIGNjYW4vYWx0c3RhY2svdGVzdC9y
dW4uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2NjYW4vYWx0c3RhY2svdGVzdC9ydW4uYyBiL2NjYW4vYWx0c3RhY2sv
dGVzdC9ydW4uYwppbmRleCBkZTk0ODg3Li4zODllY2I5IDEwMDY0NAotLS0gYS9jY2FuL2FsdHN0
YWNrL3Rlc3QvcnVuLmMKKysrIGIvY2Nhbi9hbHRzdGFjay90ZXN0L3J1bi5jCkBAIC0xLDMgKzEs
NCBAQAorI2luY2x1ZGUgImNvbmZpZy5oIgogI2luY2x1ZGUgPGFzc2VydC5oPgogI2luY2x1ZGUg
PGVyci5oPgogI2luY2x1ZGUgPGVycm5vLmg+CkBAIC04LDcgKzksNiBAQAogI2luY2x1ZGUgPHN5
cy9tbWFuLmg+CiAjaW5jbHVkZSA8Y2Nhbi90YXAvdGFwLmg+CiAjaW5jbHVkZSA8Y2Nhbi9hbHRz
dGFjay9hbHRzdGFjay5oPgotI2RlZmluZSBfWE9QRU5fU09VUkNFIDcwMAogI2luY2x1ZGUgPHN0
ZGlvLmg+CiAKIGVudW0gewotLSAKMi41LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9y
ZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
