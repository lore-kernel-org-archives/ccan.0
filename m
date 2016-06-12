From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/2] Bellman-Ford
Date: Sun, 12 Jun 2016 23:16:58 +1000
Message-ID: <1465737420-20183-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSGf62KWSzDqW9
 for <ccan@lists.ozlabs.org>; Sun, 12 Jun 2016 23:17:02 +1000 (AEST)
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

QSBCZWxsbWFuLUZvcmQgYWxnb3JpdGhtIGltcGxlbWVudGF0aW9uIGZvciBhZ2EuICBTZW5kaW5n
IHRoaXMgb3V0IGluCmNhc2UgYW55b25lIGNhcmVzIHRvIHJldmlldyBpdC4gIEknbGwgY29tbWl0
IGl0IHNob3J0bHkgaWYgdGhlcmUKYXJlbid0IHNjcmVhbXMuCgpEb2Vzbid0IHlldCBoYXZlIHNv
bWUgb2YgdGhlIGV4dGVuc2lvbnMgd2UgZGlzY3Vzc2VkLCBSdXN0eSwgYnV0IEkKaG9wZSB0byBh
ZGQgYXQgbGVhc3Qgc29tZSBvZiB0aGVtIGdyYWR1YWxseS4KCkRhdmlkIEdpYnNvbiAoMik6CiAg
YWdhLGFnYXI6IFJlbmFtZSBhZ2FfZGlqa3N0cmFfYWxsX3BhdGhzKCkKICBhZ2EsYWdhcjogVGhl
IEJlbGxtYW4tRm9yZCBhbGdvcml0aG0KCiBjY2FuL2FnYS9hZ2EuaCAgICAgICAgICAgICAgICAg
ICAgfCAgNzYgKysrKysrKysrKy0KIGNjYW4vYWdhL2JlbGxtYW5fZm9yZC5jICAgICAgICAgICB8
IDEyMSArKysrKysrKysrKysrKysrKwogY2Nhbi9hZ2EvZGlqa3N0cmEuYyAgICAgICAgICAgICAg
IHwgICAyICstCiBjY2FuL2FnYS90ZXN0L2FwaS1iZWxsbWFuX2ZvcmQuYyAgfCAyNjYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGNjYW4vYWdhL3Rlc3QvYXBpLWRpamtz
dHJhLmMgICAgICB8ICAgMiArLQogY2Nhbi9hZ2FyL2FnYXIuYyAgICAgICAgICAgICAgICAgIHwg
IDQ5ICsrKysrKy0KIGNjYW4vYWdhci9hZ2FyLmggICAgICAgICAgICAgICAgICB8ICAxNCArLQog
Y2Nhbi9hZ2FyL3Rlc3QvYXBpLWJlbGxtYW5fZm9yZC5jIHwgMjQ5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBjY2FuL2FnYXIvdGVzdC9hcGktZGlqa3N0cmEuYyAgICAgfCAg
IDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgNzcyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgY2Nhbi9hZ2EvYmVsbG1hbl9mb3JkLmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBjY2FuL2FnYS90ZXN0L2FwaS1iZWxsbWFuX2ZvcmQuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGNjYW4vYWdhci90ZXN0L2FwaS1iZWxsbWFuX2ZvcmQuYwoKLS0gCjIuNS41CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlz
dApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZv
L2NjYW4K
