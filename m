From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/5] Assorted small fixes
Date: Thu, 28 Jan 2016 00:53:27 +1100
Message-ID: <1453902812-18621-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 997B81A0174
 for <ccan@lists.ozlabs.org>; Thu, 28 Jan 2016 00:52:37 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au, jim.houston@ccur.com
List-Id: ccan@lists.ozlabs.org

VGhpcyBzZXJpZXMgaGFzIGEgbnVtYmVyIG9mIHNtYWxsIGZpeGVzIHRvIG1vZHVsZXMgd2hpY2gg
YXJlbid0IG1pbmUuCk1vc3Qgb2YgdGhlc2Ugd2VyZSBzcG90dGVkIGJlY2F1c2UgdGhleSB0cmln
Z2VyIHdhcm5pbmdzIHdpdGggKGF0CmxlYXN0IG9uZSB2ZXJzaW9uIG9mKSBjbGFuZy4KCkRhdmlk
IEdpYnNvbiAoNSk6CiAgc3RybWFwOiBDb252ZXJ0IHRvIHVzaW5nIFRDT05fV1JBUCgpIGluc3Rl
YWQgb2YgcGxhaW4gVENPTigpCiAgaHRhYmxlOiBNYXJrIGZ1bmN0aW9ucyBjb25zdHJ1Y3RlZCBi
eSBIVEFCTEVfREVGSU5FX1RZUEUgYXMgVU5ORUVERUQKICBpZHRyZWU6IEZpeCBjb21wYXJpc29u
IGlzIGFsd2F5cyBmYWxzZSB3YXJuaW5nCiAgaWR0cmVlOiBGaXggbWlzaW5kZW50ZWQgc3RhdGVt
ZW50CiAgaWR0cmVlOiBGaXggdW5kZWZpbmVkIGJlaGF2aW91ciAobGVmdCBzaGlmdCBvZiBzaWdu
ZWQgdmFsdWUpCgogY2Nhbi9jZHVtcC9jZHVtcC5jICAgICAgICAgICAgICAgICAgIHwgMTAgKysr
Ky0tLS0tCiBjY2FuL2NkdW1wL2NkdW1wLmggICAgICAgICAgICAgICAgICAgfCAxMCArKysrLS0t
LS0KIGNjYW4vaHRhYmxlL2h0YWJsZV90eXBlLmggICAgICAgICAgICB8IDE5ICsrKysrKysrKy0t
LS0tLS0KIGNjYW4vaWR0cmVlL2lkdHJlZS5jICAgICAgICAgICAgICAgICB8ICA3ICsrKy0tLQog
Y2Nhbi9zdHJtYXAvX2luZm8gICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGNjYW4vc3RybWFw
L3N0cm1hcC5oICAgICAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLQogY2Nhbi9zdHJtYXAvdGVzdC9ydW4taXRlcmF0ZS1jb25zdC5jIHwgIDQgKy0t
LQogY2Nhbi9zdHJtYXAvdGVzdC9ydW4tb3JkZXIuYyAgICAgICAgIHwgIDQgKy0tLQogY2Nhbi9z
dHJtYXAvdGVzdC9ydW4tcHJlZml4LmMgICAgICAgIHwgMTIgKysrKystLS0tLQogY2Nhbi9zdHJt
YXAvdGVzdC9ydW4uYyAgICAgICAgICAgICAgIHwgIDQgKy0tLQogdG9vbHMvY2NhbmxpbnQvY2Nh
bmxpbnQuYyAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tCiAxMSBmaWxlcyBjaGFuZ2VkLCA1NiBp
bnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkKCi0tIAoyLjUuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBs
aXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
