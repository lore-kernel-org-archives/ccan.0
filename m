From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/2] Makefile: Make module checks depend on info file
Date: Sun, 25 Dec 2016 15:49:14 +1100
Message-ID: <20161225044915.24219-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tmV620kGTzDvxS
 for <ccan@lists.ozlabs.org>; Sun, 25 Dec 2016 15:49:30 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au
List-Id: ccan@lists.ozlabs.org

Q2hhbmdpbmcgdGhlIF9pbmZvIGZpbGUgY2FuIGNoYW5nZSBob3cgY2NhbmxpbnQgYXNzZXNzZXMg
dGhlIG1vZHVsZS4KVGhlcmVmb3JlLCBpZiB0aGUgX2luZm8gZmlsZSBjaGFuZ2VzLCB3ZSBzaG91
bGQgcmUtcnVuIGNjYW5saW50IG1vZHVsZQp0ZXN0cyB3aXRoIG1ha2UgY2hlY2suICBXZSBkaWRu
J3QgcHJldmlvdXNseSBoYXZlIGEgZGVwZW5kZW5jeSBmb3IgdGhhdCwKdGhvdWdoLCBzbyB0aGlz
IGFkZHMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9w
YmVhci5pZC5hdT4KLS0tCiBNYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUK
aW5kZXggYTlkZmVkMS4uZDFlMDhhMyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZp
bGUKQEAgLTcxLDcgKzcxLDcgQEAgJChMSU5UKTogJChMSU5UKS5jICQoTElOVF9PQkpTKQogVEVT
VF9ERVBTIDo9ICQoTU9EVUxFUzolPSUvLmQpCiAKICMgV2UgcHJvZHVjZSAub2sgZmlsZXMgd2hl
biB0aGUgdGVzdHMgc3VjY2VlZAotJS5vazogJChMSU5UKQorJS5vazogJChMSU5UKSAlaW5mbwog
CSQoUFJFKSQoTElOVCkgJChMSU5UX09QVFMkKG5vdGRpciAkQCkpIC0tZGVwcy1mYWlsLWlnbm9y
ZSAkKExJTlRGTEFHUykgJChkaXIgJCopICYmIHRvdWNoICRACiAKIGNoZWNrOiAkKE1PRFVMRVM6
JT0lLy5vaykKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6
Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
