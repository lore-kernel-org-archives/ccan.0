From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v2 11/13] configurator: Return pointer difference as
 ptrdiff_t
Date: Thu, 22 Sep 2016 21:33:14 -0600
Message-ID: <054fcecdae96c41af557f6e7e2981074a69317a9.1474600863.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name
 [IPv6:2605:6400:2:fed5:22:0:f2f6:c0f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgJqD5DbDzDslc
 for <ccan@lists.ozlabs.org>; Fri, 23 Sep 2016 13:33:27 +1000 (AEST)
In-Reply-To: <cover.1474600863.git.kevin@kevinlocke.name>
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

T24gTExQNjQgc3lzdGVtcyAobGlrZSA2NC1iaXQgV2luZG93cykgbG9uZyBpcyAzMiBiaXRzIHdo
aWxlIHBvaW50ZXJzCmFyZSA2NCBiaXRzLCB3aGljaCByZXN1bHRzIGluIGEgd2FybmluZyBzaW1p
bGFyIHRvIHRoZSBmb2xsb3dpbmc6Cgp3YXJuaW5nIEM0MjQ0OiAncmV0dXJuJzogY29udmVyc2lv
biBmcm9tICdfX2ludDY0JyB0byAnbG9uZycsIHBvc3NpYmxlIGxvc3Mgb2YgZGF0YQoKZm9yIEhB
VkVfU1RBQ0tfR1JPV1NfVVBXQVJEUy4gIEZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBwdHJkaWZmX3Qg
dHlwZQppbnRyb2R1Y2VkIGJ5IEM5OSBmb3IgdGhpcyBwdXJwb3NlLgoKU2lnbmVkLW9mZi1ieTog
S2V2aW4gTG9ja2UgPGtldmluQGtldmlubG9ja2UubmFtZT4KLS0tCiB0b29scy9jb25maWd1cmF0
b3IvY29uZmlndXJhdG9yLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1
cmF0b3IuYyBiL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3IuYwppbmRleCBhNDMwNjFi
Li4yYWNiMGIyIDEwMDY0NAotLS0gYS90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMK
KysrIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCkBAIC0yOTgsNyArMjk4LDgg
QEAgc3RhdGljIHN0cnVjdCB0ZXN0IHRlc3RzW10gPSB7CiAJICAiCXJldHVybiBfX3N0b3BfbXlz
ZWMgLSBfX3N0YXJ0X215c2VjO1xuIgogCSAgIn1cbiIgfSwKIAl7ICJIQVZFX1NUQUNLX0dST1dT
X1VQV0FSRFMiLCBERUZJTkVTX0VWRVJZVEhJTkd8RVhFQ1VURSwgTlVMTCwgTlVMTCwKLQkgICJz
dGF0aWMgbG9uZyBuZXN0KGNvbnN0IHZvaWQgKmJhc2UsIHVuc2lnbmVkIGludCBpKVxuIgorCSAg
IiNpbmNsdWRlIDxzdGRkZWYuaD5cbiIKKwkgICJzdGF0aWMgcHRyZGlmZl90IG5lc3QoY29uc3Qg
dm9pZCAqYmFzZSwgdW5zaWduZWQgaW50IGkpXG4iCiAJICAie1xuIgogCSAgIglpZiAoaSA9PSAw
KVxuIgogCSAgIgkJcmV0dXJuIChjb25zdCBjaGFyICopJmkgLSAoY29uc3QgY2hhciAqKWJhc2U7
XG4iCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlz
dHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
