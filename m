From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH 7/9] configurator: Fix compiler warning with compare
Date: Sun, 18 Sep 2016 18:52:04 -0600
Message-ID: <22c2065f30c4f305aad816625ddc6535bb2ddda2.1474239353.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scndm3Xt2zDscl
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

VmlzdWFsIFN0dWRpbyBwcmludHMgd2FybmluZyBDNDcwNiAiYXNzaWdubWVudCB3aXRoaW4gY29u
ZGl0aW9uYWwKZXhwcmVzc2lvbiIgd2hlbiB0aGVyZSBpcyBhbiBhc3NpZ25tZW50IHdpdGhvdXQg
YSBjb21wYXJpc29uIGluIGEKY29uZGl0aW9uYWwgZXhwcmVzc2lvbi4gIFRoZXJlZm9yZSwgdG8g
c2lsZW5jZSB0aGUgd2FybmluZywgYWRkIGFuCmV4cGxpY2l0IGNvbXBhcmlzb24uCgpTaWduZWQt
b2ZmLWJ5OiBLZXZpbiBMb2NrZSA8a2V2aW5Aa2V2aW5sb2NrZS5uYW1lPgotLS0KIHRvb2xzL2Nv
bmZpZ3VyYXRvci9jb25maWd1cmF0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyYXRvci9j
b25maWd1cmF0b3IuYyBiL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3IuYwppbmRleCAw
Mzg2OTMwLi4wYzMwYWZmIDEwMDY0NAotLS0gYS90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJh
dG9yLmMKKysrIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCkBAIC01MzUsNyAr
NTM1LDcgQEAgc3RhdGljIGJvb2wgcnVuX3Rlc3QoY29uc3QgY2hhciAqY21kLCBzdHJ1Y3QgdGVz
dCAqdGVzdCkKIAkJY2hhciAqZGVwOwogCiAJCS8qIFNwYWNlLXNlcGFyYXRlZCBkZXBlbmRlbmNp
ZXMsIGNvdWxkIGJlICEgZm9yIGludmVyc2UuICovCi0JCXdoaWxlICgobGVuID0gc3RyY3Nwbihk
ZXBzLCAiICIpKSkgeworCQl3aGlsZSAoKGxlbiA9IHN0cmNzcG4oZGVwcywgIiAiKSkgIT0gMCkg
ewogCQkJYm9vbCBwb3NpdGl2ZSA9IHRydWU7CiAJCQlpZiAoZGVwc1tsZW5dKSB7CiAJCQkJZGVw
ID0gc3RyZHVwKGRlcHMpOwotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9y
ZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
