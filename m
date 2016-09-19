From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH 1/9] configurator: Replace unlink with remove
Date: Sun, 18 Sep 2016 18:51:58 -0600
Message-ID: <6a7d5f373bf9451cbc1b8866047453d9fc78b165.1474239353.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scndm3S9kzDsck
 for <ccan@lists.ozlabs.org>; Mon, 19 Sep 2016 11:01:32 +1000 (AEST)
In-Reply-To: <cover.1474239353.git.kevin@kevinlocke.name>
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

QWx0aG91Z2ggV2luZG93cyBwcm92aWRlcyB1bmxpbmssIHVzaW5nIGl0IGFkZHMgY29tcGxpY2F0
aW9uIGR1ZSB0byB0aGUKbGFjayBvZiB1bmlzdGQuaCB3aGljaCBtdXN0IGJlIGluY2x1ZGVkIHRv
IGRlZmluZSB0aGUgZnVuY3Rpb24gb24gUE9TSVgKc3lzdGVtcy4gIEluc3RlYWQsIHVzZSByZW1v
dmUsIHdoaWNoIEM4OSByZXF1aXJlcyB0byBiZSBpbiBzdGRpby5oLgoKU2lnbmVkLW9mZi1ieTog
S2V2aW4gTG9ja2UgPGtldmluQGtldmlubG9ja2UubmFtZT4KLS0tCiB0b29scy9jb25maWd1cmF0
b3IvY29uZmlndXJhdG9yLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZp
Z3VyYXRvci5jIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCmluZGV4IDY3ZGFk
YzYuLmUzMjJjNzYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3Iu
YworKysgYi90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMKQEAgLTYzOSw4ICs2Mzks
OCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY29uc3QgY2hhciAqYXJndltdKQogCQlydW5fdGVzdChj
bWQsICZ0ZXN0c1tpXSk7CiAJZnJlZShjbWQpOwogCi0JdW5saW5rKE9VVFBVVF9GSUxFKTsKLQl1
bmxpbmsoSU5QVVRfRklMRSk7CisJcmVtb3ZlKE9VVFBVVF9GSUxFKTsKKwlyZW1vdmUoSU5QVVRf
RklMRSk7CiAKIAlwcmludGYoIi8qIEdlbmVyYXRlZCBieSBDQ0FOIGNvbmZpZ3VyYXRvciAqL1xu
IgogCSAgICAgICAiI2lmbmRlZiBDQ0FOX0NPTkZJR19IXG4iCi0tIAoyLjkuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QK
Y2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9j
Y2FuCg==
