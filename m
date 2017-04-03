From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 4/7] crypto/hmac_sha256: Remove undefined memset()
Date: Mon,  3 Apr 2017 21:11:09 +1000
Message-ID: <20170403111112.27201-5-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTtt3m6RzDqHV
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

QSBtZW1zZXQoKSB3aXRoIGEgemVybyBsZW5ndGggYXJndW1lbnQgaXNuJ3Qgd2VsbCBkZWZpbmVk
LiAgSXQgKm1pZ2h0KiBiZQphIG5vLW9wLCBidXQgdGhlbiBpdCBtaWdodCBub3QuICBTbywgdGVz
dCBmb3IgdGhpcyBjYXNlIGluCmhtYWNfc2hhMjU2X2luaXQoKS4KCkZvdW5kIGJ5IENvdmVyaXR5
LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQu
YXU+Ci0tLQogY2Nhbi9jcnlwdG8vaG1hY19zaGEyNTYvaG1hY19zaGEyNTYuYyB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2NjYW4vY3J5cHRvL2htYWNfc2hhMjU2L2htYWNfc2hhMjU2LmMgYi9jY2FuL2NyeXB0by9o
bWFjX3NoYTI1Ni9obWFjX3NoYTI1Ni5jCmluZGV4IDAzOTJhZmUuLjcwY2EzYjIgMTAwNjQ0Ci0t
LSBhL2NjYW4vY3J5cHRvL2htYWNfc2hhMjU2L2htYWNfc2hhMjU2LmMKKysrIGIvY2Nhbi9jcnlw
dG8vaG1hY19zaGEyNTYvaG1hY19zaGEyNTYuYwpAQCAtMzYsNyArMzYsOSBAQCB2b2lkIGhtYWNf
c2hhMjU2X2luaXQoc3RydWN0IGhtYWNfc2hhMjU2X2N0eCAqY3R4LAogCSAqICAgYXBwZW5kZWQg
d2l0aCA0NCB6ZXJvIGJ5dGVzIDB4MDApCiAJICovCiAJbWVtY3B5KGtfaXBhZCwgaywga3NpemUp
OwotCW1lbXNldCgoY2hhciAqKWtfaXBhZCArIGtzaXplLCAwLCBITUFDX1NIQTI1Nl9CTE9DS1NJ
WkUgLSBrc2l6ZSk7CisJaWYgKGtzaXplIDwgSE1BQ19TSEEyNTZfQkxPQ0tTSVpFKQorCQltZW1z
ZXQoKGNoYXIgKilrX2lwYWQgKyBrc2l6ZSwgMCwKKwkJICAgICAgIEhNQUNfU0hBMjU2X0JMT0NL
U0laRSAtIGtzaXplKTsKIAogCS8qCiAJICogKDIpIFhPUiAoYml0d2lzZSBleGNsdXNpdmUtT1Ip
IHRoZSBCIGJ5dGUgc3RyaW5nIGNvbXB1dGVkCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0
cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
