From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/4] Exclude system headers from .d files
Date: Sat, 30 Apr 2016 18:01:48 +1000
Message-ID: <1462003309-22541-4-git-send-email-david@gibson.dropbear.id.au>
References: <1462003309-22541-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxjhQ3H1wzDqBG
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

V2UgY3VycmVudGx5IGdlbmVyYXRlZCAuZCBkZXBlbmRlbmN5IGZpbGVzIHdpdGggdGhlIC1NRCBv
cHRpb24gdG8gY2MuICBUaGF0CmluY2x1ZGVzIHN5c3RlbSBoZWFkZXIgZmlsZXMgaW4gdGhlIGRl
cGVuZGVuY2llcywgd2hpY2ggaXNuJ3Qgb2Z0ZW4gdXNlZnVsCmFuZCBtYWtlcyB0aGUgLmQgbW9y
ZSBjb21wbGljYXRlZCB0aGFuIG5lY2Vzc2FyeS4KClRoaXMgY2hhbmdlcyB0byAtTU1EIHdoaWNo
IGV4Y2x1ZGVzIHN5c3RlbSBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgR2lic29uIDxk
YXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLQogTWFrZWZpbGUtY2NhbiB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L01ha2VmaWxlLWNjYW4gYi9NYWtlZmlsZS1jY2FuCmluZGV4IDA2MTNmYzguLmY0ZTA5NmIgMTAw
NjQ0Ci0tLSBhL01ha2VmaWxlLWNjYW4KKysrIGIvTWFrZWZpbGUtY2NhbgpAQCAtMTM1LDcgKzEz
NSw3IEBAIE1PRFM6PSQoTU9EU19XSVRIX1NSQykgJChNT0RTX05PX1NSQykKIGRlZmF1bHQ6IGxp
YmNjYW4uYQogCiAjIEF1dG9tYXRpYyBkZXBlbmRlbmN5IGdlbmVyYXRpb246IG1ha2VzIGNjYW4v
Ki8qLmQgZmlsZXMuCi1ERVBHRU49LU1ECitERVBHRU49LU1NRAogLWluY2x1ZGUgY2Nhbi8qLyou
ZAogCiAjIEFueXRoaW5nIHdpdGggQyBmaWxlcyBuZWVkcyBidWlsZGluZzsgZGlyIGxlYXZlcyAv
IG9uLCBzb3J0IHVuaXF1aWZpZXMKLS0gCjIuNS41CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFi
cy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
