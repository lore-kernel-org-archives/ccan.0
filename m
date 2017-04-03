From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 7/7] net: Add check for failure of setsockopt()
Date: Mon,  3 Apr 2017 21:11:12 +1000
Message-ID: <20170403111112.27201-8-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTtt3lczzDqHK
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

bWFrZV9saXN0ZW5fZmQoKSBkaWRuJ3QgY2hlY2sgZm9yIGZhaWx1cmUgb2Ygc2V0c29ja29wdCgp
LiAgVGhlcmUncyBubwpyZWFsIHJlYXNvbiBub3QgdG8sIHNpbmNlIHdlIGhhdmUgYW4gb2J2aW91
cyB3YXkgdG8gcmVwb3J0IGFuIGVycm9yIHRvIHRoZQpjYWxsZXIuCgpGb3VuZCB3aXRoIENvdmVy
aXR5IFNjYW4uCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9w
YmVhci5pZC5hdT4KLS0tCiBjY2FuL25ldC9uZXQuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NjYW4vbmV0L25l
dC5jIGIvY2Nhbi9uZXQvbmV0LmMKaW5kZXggZTkxOTk4My4uMTFjNmI2NyAxMDA2NDQKLS0tIGEv
Y2Nhbi9uZXQvbmV0LmMKKysrIGIvY2Nhbi9uZXQvbmV0LmMKQEAgLTIzOCw3ICsyMzgsOSBAQCBz
dGF0aWMgaW50IG1ha2VfbGlzdGVuX2ZkKGNvbnN0IHN0cnVjdCBhZGRyaW5mbyAqYWRkcmluZm8p
CiAJaWYgKGZkIDwgMCkKIAkJcmV0dXJuIC0xOwogCi0Jc2V0c29ja29wdChmZCwgU09MX1NPQ0tF
VCwgU09fUkVVU0VBRERSLCAmb24sIHNpemVvZihvbikpOworCWlmIChzZXRzb2Nrb3B0KGZkLCBT
T0xfU09DS0VULCBTT19SRVVTRUFERFIsICZvbiwgc2l6ZW9mKG9uKSkgIT0gMCkKKwkJZ290byBm
YWlsOworCiAJaWYgKGJpbmQoZmQsIGFkZHJpbmZvLT5haV9hZGRyLCBhZGRyaW5mby0+YWlfYWRk
cmxlbikgIT0gMCkKIAkJZ290byBmYWlsOwogCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0
cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
