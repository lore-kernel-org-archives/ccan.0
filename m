From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v2 07/13] configurator: Fix compiler warning with
 compare
Date: Thu, 22 Sep 2016 21:33:10 -0600
Message-ID: <2b6fe8f4ad3a5cd16ef3fc8cc0280266380f0de4.1474600863.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgJqD1TJ4zDsm4
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

VmlzdWFsIFN0dWRpbyBwcmludHMgd2FybmluZyBDNDcwNiAiYXNzaWdubWVudCB3aXRoaW4gY29u
ZGl0aW9uYWwKZXhwcmVzc2lvbiIgd2hlbiB0aGVyZSBpcyBhbiBhc3NpZ25tZW50IHdpdGhvdXQg
YSBjb21wYXJpc29uIGluIGEKY29uZGl0aW9uYWwgZXhwcmVzc2lvbi4gIFRoZXJlZm9yZSwgdG8g
c2lsZW5jZSB0aGUgd2FybmluZywgYWRkIGFuCmV4cGxpY2l0IGNvbXBhcmlzb24uCgpTaWduZWQt
b2ZmLWJ5OiBLZXZpbiBMb2NrZSA8a2V2aW5Aa2V2aW5sb2NrZS5uYW1lPgpSZXZpZXdlZC1ieTog
RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLQogdG9vbHMvY29u
ZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJhdG9yL2Nv
bmZpZ3VyYXRvci5jIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCmluZGV4IDUx
ZDdhYzguLmFjZjZjYzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0
b3IuYworKysgYi90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMKQEAgLTU3Miw3ICs1
NzIsNyBAQCBzdGF0aWMgYm9vbCBydW5fdGVzdChjb25zdCBjaGFyICpjbWQsIHN0cnVjdCB0ZXN0
ICp0ZXN0KQogCQljaGFyICpkZXA7CiAKIAkJLyogU3BhY2Utc2VwYXJhdGVkIGRlcGVuZGVuY2ll
cywgY291bGQgYmUgISBmb3IgaW52ZXJzZS4gKi8KLQkJd2hpbGUgKChsZW4gPSBzdHJjc3BuKGRl
cHMsICIgIikpKSB7CisJCXdoaWxlICgobGVuID0gc3RyY3NwbihkZXBzLCAiICIpKSAhPSAwKSB7
CiAJCQlib29sIHBvc2l0aXZlID0gdHJ1ZTsKIAkJCWlmIChkZXBzW2xlbl0pIHsKIAkJCQlkZXAg
PSBzdHJkdXAoZGVwcyk7Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3Jn
Cmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
