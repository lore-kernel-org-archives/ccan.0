From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 5/7] crypto/ripemd160: Correct badly sized union
 member
Date: Mon,  3 Apr 2017 21:11:10 +1000
Message-ID: <20170403111112.27201-6-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTtt1h5lzDqHG
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

c3RydWN0IHJpcGVtZDE2MF9jdHggaGFzIGEgdW5pb24gZm9yIGNvbnZlcnRpbmcgYmV0d2VlbiB1
OFtdIGFuZCB1MzJbXQpkYXRhLiAgVW5mb3J0dW5hdGVseSB0aGUgdTMyIGFycmF5IGhhcyBhIG1p
c2NhbGN1bGF0ZWQgc2l6ZSwgaGFsZiB0aGUgc2l6ZQpvZiB0aGUgdTggYXJyYXkuICBUaGF0IG1l
YW5zIHNvbWUgYWNjZXNzZXMgd2hpY2ggYXJlIHdpdGhpbiB0aGUgdW5pb24gY2FuCnRlY2huaWNh
bGx5IG92ZXJydW4gdGhlIHUzMiBhcnJheS4KCkZvdW5kIGJ5IENvdmVyaXR5IHNjYW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT4KLS0t
CiBjY2FuL2NyeXB0by9yaXBlbWQxNjAvcmlwZW1kMTYwLmggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jY2FuL2NyeXB0
by9yaXBlbWQxNjAvcmlwZW1kMTYwLmggYi9jY2FuL2NyeXB0by9yaXBlbWQxNjAvcmlwZW1kMTYw
LmgKaW5kZXggMzc3YTA3ZC4uNTY4NTRjZiAxMDA2NDQKLS0tIGEvY2Nhbi9jcnlwdG8vcmlwZW1k
MTYwL3JpcGVtZDE2MC5oCisrKyBiL2NjYW4vY3J5cHRvL3JpcGVtZDE2MC9yaXBlbWQxNjAuaApA
QCAtNDksNyArNDksNyBAQCBzdHJ1Y3QgcmlwZW1kMTYwX2N0eCB7CiAJdWludDMyX3Qgc1s1XTsK
IAl1aW50NjRfdCBieXRlczsKIAl1bmlvbiB7Ci0JCXVpbnQzMl90IHUzMls4XTsKKwkJdWludDMy
X3QgdTMyWzE2XTsKIAkJdW5zaWduZWQgY2hhciB1OFs2NF07CiAJfSBidWY7CiAjZW5kaWYKLS0g
CjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpj
Y2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxh
YnMub3JnL2xpc3RpbmZvL2NjYW4K
