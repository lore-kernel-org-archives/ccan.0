From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 4/4] Correctly include dependencies for nested modules
Date: Sat, 30 Apr 2016 18:01:49 +1000
Message-ID: <1462003309-22541-5-git-send-email-david@gibson.dropbear.id.au>
References: <1462003309-22541-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxjhQ2BGgzDqBF
 for <ccan@lists.ozlabs.org>; Sat, 30 Apr 2016 18:01:58 +1000 (AEST)
In-Reply-To: <1462003309-22541-1-git-send-email-david@gibson.dropbear.id.au>
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
Cc: rusty@rustcoorp.com.au
List-Id: ccan@lists.ozlabs.org

Q3VycmVudGx5IHdlIHB1bGwgYXV0by1nZW5lcmF0ZWQgZGVwZW5kZW5jaWVzIGludG8gdGhlIE1h
a2VmaWxlIHdpdGgKaW5jbHVkZSBjY2FuLyovKi5kLiAgVGhhdCB3aWxsIG9taXQgYW55IC5kIGZp
bGVzIGZyb20gbmVzdGVkIG1vZHVsZXMsCm1lYW5pbmcgdGhpbmdzIG1pZ2h0IG5vdCBiZSBjb3Jy
ZWN0bHkgcmVidWlsdCB0aGVyZS4KCkNvcnJlY3QgdGhpcyBieSB1c2luZyB0aGUgbGlzdCBvZiBt
b2R1bGVzIGluc3RlYWQgb2YgYSAxLWxldmVsIHdpbGRjYXJkLgoKU2lnbmVkLW9mZi1ieTogRGF2
aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLQogTWFrZWZpbGUtY2Nh
biB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL01ha2VmaWxlLWNjYW4gYi9NYWtlZmlsZS1jY2FuCmluZGV4IGY0ZTA5NmIu
LmJkNmFmNWMgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlLWNjYW4KKysrIGIvTWFrZWZpbGUtY2NhbgpA
QCAtMTM2LDcgKzEzNiw3IEBAIGRlZmF1bHQ6IGxpYmNjYW4uYQogCiAjIEF1dG9tYXRpYyBkZXBl
bmRlbmN5IGdlbmVyYXRpb246IG1ha2VzIGNjYW4vKi8qLmQgZmlsZXMuCiBERVBHRU49LU1NRAot
LWluY2x1ZGUgY2Nhbi8qLyouZAorLWluY2x1ZGUgJChmb3JlYWNoIG0sICQoTU9EUyksIGNjYW4v
JChtKS8qLmQpCiAKICMgQW55dGhpbmcgd2l0aCBDIGZpbGVzIG5lZWRzIGJ1aWxkaW5nOyBkaXIg
bGVhdmVzIC8gb24sIHNvcnQgdW5pcXVpZmllcwogRElSUz0kKHBhdHN1YnN0ICUvLCAlLCAkKHNv
cnQgJChmb3JlYWNoIG0sICQoZmlsdGVyLW91dCAkKE1PRFNfRVhDTFVERSksICQoTU9EU19XSVRI
X1NSQykpLCAkKGRpciAkKHdpbGRjYXJkIGNjYW4vJG0vKi5jKSkpKSkKLS0gCjIuNS41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcg
bGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3Rp
bmZvL2NjYW4K
