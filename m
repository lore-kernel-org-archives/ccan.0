From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/7] .travis.yml: Add support for Coverity Scan
Date: Mon,  3 Apr 2017 21:11:06 +1000
Message-ID: <20170403111112.27201-2-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTts6841zDq8M
 for <ccan@lists.ozlabs.org>; Mon,  3 Apr 2017 21:11:17 +1000 (AEST)
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

QWRkIHN1cHBvcnQgZm9yIFRyYXZpcyB0byB1cGxvYWQgYnVpbGRzIHRvIENvdmVyaXR5IFNjYW4u
CgpUcmF2aXMgZW5jcnlwdGVkIGtleXMgYXJlIHRoZXJlIHdoaWNoIHNob3VsZCBtYWtlIGl0IHdv
cmsgZm9yIGJ1aWxkcwphdCBlaXRoZXI6CiAgICBodHRwczovL3RyYXZpcy1jaS5vcmcvcnVzdHly
dXNzZWxsL2NjYW4Kb3IKICAgIGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9kZ2lic29uL2NjYW4KClNp
Z25lZC1vZmYtYnk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1Pgot
LS0KIC50cmF2aXMueW1sIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvLnRyYXZpcy55bWwgYi8udHJhdmlzLnltbApp
bmRleCA5ZjlkYmNiLi5mZTNkZmZjIDEwMDY0NAotLS0gYS8udHJhdmlzLnltbAorKysgYi8udHJh
dmlzLnltbApAQCAtMSw2ICsxLDIzIEBACiBsYW5ndWFnZTogYwogc3VkbzogZmFsc2UKIAorIyBD
b3Zlcml0eSBTY2FuIHVwbG9hZHMKK2VudjoKKyAgZ2xvYmFsOgorICAjIENPVkVSSVRZX1NDQU5f
VE9LRU4gKHJ1c3R5cnVzc2VsbC9jY2FuKQorICAtIHNlY3VyZTogIlJVK3I2Mk1ZcmhhVWNGT2lY
eWtGdDBscEZ6UVZMNmY1Z3lBS092MzlQcFlLMTByc0kvY002Tjh3T1JlSDFFbUk3a3RuN00rZzNG
czJqQStpK2JaVzRyWlNmbTM3OWh6ZHVXaXNFbzB2RVdOd3lXaUlybDFXamdHcHRGRHdPQ3pNUUh3
byt1NHpINkUrQ0FPV25qZTVadytlbG9rVlRmQzFvckxidVFIQUJHND0iCisgICMgQ09WRVJJVFlf
U0NBTl9UT0tFTiAoZGdpYnNvbi9jY2FuKQorICAtIHNlY3VyZTogIk9MN09xWWpRUEU2cnBId3Vq
WmJadDFnUjVUTlluNlowYjFKeEJhTDFBRytpSGxUYlJyRkdxZWMvVnBZaTJTQWxxY0RaSzN4MmxV
enNGK2h6eDRwTkJMRnU4d3ZNdERLRDRncmxNRTVNK0J1M0xUK1lubVdTa2FDdzEvMDFuL1NGeWVS
QWtORFVKaG5wMHdTNW9KOXNXeDZ0cktXZjlYdzlIcG9LbHdiRkVHTT0iCisKK2FkZG9uczoKKyAg
Y292ZXJpdHlfc2NhbjoKKyAgICBwcm9qZWN0OgorICAgICAgbmFtZTogQ0NBTgorICAgICAgI2Rl
c2NyaXB0aW9uOiBDQ0FOCisgICAgbm90aWZpY2F0aW9uX2VtYWlsOiBjY2FuQGxpc3RzLm96bGFi
cy5vcmcKKyAgICBidWlsZF9jb21tYW5kOiBtYWtlCisgICAgYnJhbmNoX3BhdHRlcm46IGNvdmVy
aXR5X3NjYW4KKwogbWF0cml4OgogICBpbmNsdWRlOgogICAtIGNvbXBpbGVyOiBnY2MKLS0gCjIu
OS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2Fu
IG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL2xpc3RpbmZvL2NjYW4K
