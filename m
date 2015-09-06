From: Cody P Schafer <dev@codyps.com>
Subject: [PATCH v4 2/4] bytestring: use newly added mem helpers
Date: Sat,  5 Sep 2015 21:21:04 -0400
Message-ID: <1441502466-4754-3-git-send-email-dev@codyps.com>
References: <1441502466-4754-1-git-send-email-dev@codyps.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 588481A0075
 for <ccan@lists.ozlabs.org>; Sun,  6 Sep 2015 11:21:13 +1000 (AEST)
Received: by qkcf65 with SMTP id f65so22322097qkc.3
 for <ccan@lists.ozlabs.org>; Sat, 05 Sep 2015 18:21:11 -0700 (PDT)
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

UmV2aXdlZC1ieTogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+ClNp
Z25lZC1vZmYtYnk6IENvZHkgUCBTY2hhZmVyIDxkZXZAY29keXBzLmNvbT4KLS0tCiBjY2FuL2J5
dGVzdHJpbmcvYnl0ZXN0cmluZy5oIHwgOSArKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY2Nhbi9ieXRlc3RyaW5n
L2J5dGVzdHJpbmcuaCBiL2NjYW4vYnl0ZXN0cmluZy9ieXRlc3RyaW5nLmgKaW5kZXggZGQxZjkx
My4uYmM5OWU3OSAxMDA2NDQKLS0tIGEvY2Nhbi9ieXRlc3RyaW5nL2J5dGVzdHJpbmcuaAorKysg
Yi9jY2FuL2J5dGVzdHJpbmcvYnl0ZXN0cmluZy5oCkBAIC05NCw4ICs5NCw3IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGJ5dGVzdHJpbmcgYnl0ZXN0cmluZ19mcm9tX3N0cmluZyhjb25zdCBjaGFy
ICpzKQogICovCiBzdGF0aWMgaW5saW5lIGJvb2wgYnl0ZXN0cmluZ19lcShzdHJ1Y3QgYnl0ZXN0
cmluZyBhLCBzdHJ1Y3QgYnl0ZXN0cmluZyBiKQogewotCXJldHVybiAoYS5sZW4gPT0gYi5sZW4p
Ci0JCSYmIChtZW1jbXAoYS5wdHIsIGIucHRyLCBhLmxlbikgPT0gMCk7CisJcmV0dXJuIG1lbWVx
KGEucHRyLCBhLmxlbiwgYi5wdHIsIGIubGVuKTsKIH0KIAogLyoqCkBAIC0xNDksOCArMTQ4LDcg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgYnl0ZXN0cmluZyBieXRlc3RyaW5nX3NsaWNlKHN0cnVj
dCBieXRlc3RyaW5nIHMsCiBzdGF0aWMgaW5saW5lIGJvb2wgYnl0ZXN0cmluZ19zdGFydHMoc3Ry
dWN0IGJ5dGVzdHJpbmcgcywKIAkJCQkgICAgIHN0cnVjdCBieXRlc3RyaW5nIHByZWZpeCkKIHsK
LQlyZXR1cm4gKHMubGVuID49IHByZWZpeC5sZW4pICYmIChtZW1jbXAocy5wdHIsCi0JCQkJCQlw
cmVmaXgucHRyLCBwcmVmaXgubGVuKSA9PSAwKTsKKwlyZXR1cm4gbWVtc3RhcnRzKHMucHRyLCBz
LmxlbiwgcHJlZml4LnB0ciwgcHJlZml4Lmxlbik7CiB9CiAKIC8qKgpAQCAtMTYzLDggKzE2MSw3
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBieXRlc3RyaW5nX3N0YXJ0cyhzdHJ1Y3QgYnl0ZXN0cmlu
ZyBzLAogc3RhdGljIGlubGluZSBib29sIGJ5dGVzdHJpbmdfZW5kcyhzdHJ1Y3QgYnl0ZXN0cmlu
ZyBzLAogCQkJCSAgIHN0cnVjdCBieXRlc3RyaW5nIHN1ZmZpeCkKIHsKLQlyZXR1cm4gKHMubGVu
ID49IHN1ZmZpeC5sZW4pICYmIChtZW1jbXAocy5wdHIgKyBzLmxlbiAtIHN1ZmZpeC5sZW4sCi0J
CQkJCQlzdWZmaXgucHRyLCBzdWZmaXgubGVuKSA9PSAwKTsKKwlyZXR1cm4gbWVtZW5kcyhzLnB0
ciwgcy5sZW4sIHN1ZmZpeC5wdHIsIHN1ZmZpeC5sZW4pOwogfQogCiAvKioKLS0gCjIuNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxp
bmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xp
c3RpbmZvL2NjYW4K
