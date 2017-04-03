From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 6/7] ccanlint: Fix leak in do_reduce_features()
Date: Mon,  3 Apr 2017 21:11:11 +1000
Message-ID: <20170403111112.27201-7-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTtt3kxBzDqHJ
 for <ccan@lists.ozlabs.org>; Mon,  3 Apr 2017 21:11:18 +1000 (AEST)
In-Reply-To: <20170403111112.27201-1-david@gibson.dropbear.id.au>
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
Cc: rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org

b3B0aW9uc19hdmFpbCBhbmQgb3B0aW9uc191c2VkIGdldCBmcmVlZCwgYnV0IG9wdGlvbnMgZG9l
cyBub3QuCgpGb3VuZCBieSBDb3Zlcml0eSBzY2FuLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgR2li
c29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLQogdG9vbHMvY2NhbmxpbnQvdGVz
dHMvcmVkdWNlX2ZlYXR1cmVzLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NjYW5saW50L3Rlc3RzL3JlZHVjZV9mZWF0dXJlcy5jIGIv
dG9vbHMvY2NhbmxpbnQvdGVzdHMvcmVkdWNlX2ZlYXR1cmVzLmMKaW5kZXggYjQ5OTIyYi4uMzRh
ODk3MCAxMDA2NDQKLS0tIGEvdG9vbHMvY2NhbmxpbnQvdGVzdHMvcmVkdWNlX2ZlYXR1cmVzLmMK
KysrIGIvdG9vbHMvY2NhbmxpbnQvdGVzdHMvcmVkdWNlX2ZlYXR1cmVzLmMKQEAgLTE4MSw2ICsx
ODEsNyBAQCBzdGF0aWMgdm9pZCBkb19yZWR1Y2VfZmVhdHVyZXMoc3RydWN0IG1hbmlmZXN0ICpt
LAogCQllcnIoMSwgIkNyZWF0aW5nIHJlZHVjZWQtZmVhdHVyZXMvY29uZmlnLmgiKTsKIAlpZiAo
IXdyaXRlX2FsbChmZCwgaGRyLCBzdHJsZW4oaGRyKSkpCiAJCWVycigxLCAiV3JpdGluZyByZWR1
Y2VkLWZlYXR1cmVzL2NvbmZpZy5oIik7CisJaHRhYmxlX29wdGlvbl9mcmVlKG9wdGlvbnMpOwog
CWNsb3NlKGZkKTsKIAlmZWF0dXJlc193ZXJlX3JlZHVjZWQgPSB0cnVlOwogfQotLSAKMi45LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFp
bGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcv
bGlzdGluZm8vY2Nhbgo=
