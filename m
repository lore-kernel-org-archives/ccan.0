From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/7] crypto/hmac_sha256: Remove undefined memset()
Date: Tue, 04 Apr 2017 11:52:39 +0930
Message-ID: <87wpb0di8g.fsf@rustcorp.com.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-5-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyVC10cq6zDqHG
 for <ccan@lists.ozlabs.org>; Wed,  5 Apr 2017 12:28:45 +1000 (AEST)
In-Reply-To: <20170403111112.27201-5-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, ccan@lists.ozlabs.org
Cc: rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBBIG1l
bXNldCgpIHdpdGggYSB6ZXJvIGxlbmd0aCBhcmd1bWVudCBpc24ndCB3ZWxsIGRlZmluZWQuICBJ
dCAqbWlnaHQqIGJlCj4gYSBuby1vcCwgYnV0IHRoZW4gaXQgbWlnaHQgbm90LiAgU28sIHRlc3Qg
Zm9yIHRoaXMgY2FzZSBpbgo+IGhtYWNfc2hhMjU2X2luaXQoKS4KCkh1aD8gIFRoYXQgc2VlbXMg
cmVhbGx5IG9kZC4KClJ1c3R5LgoKPiBGb3VuZCBieSBDb3Zlcml0eS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1Pgo+IC0tLQo+ICBj
Y2FuL2NyeXB0by9obWFjX3NoYTI1Ni9obWFjX3NoYTI1Ni5jIHwgNCArKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9j
Y2FuL2NyeXB0by9obWFjX3NoYTI1Ni9obWFjX3NoYTI1Ni5jIGIvY2Nhbi9jcnlwdG8vaG1hY19z
aGEyNTYvaG1hY19zaGEyNTYuYwo+IGluZGV4IDAzOTJhZmUuLjcwY2EzYjIgMTAwNjQ0Cj4gLS0t
IGEvY2Nhbi9jcnlwdG8vaG1hY19zaGEyNTYvaG1hY19zaGEyNTYuYwo+ICsrKyBiL2NjYW4vY3J5
cHRvL2htYWNfc2hhMjU2L2htYWNfc2hhMjU2LmMKPiBAQCAtMzYsNyArMzYsOSBAQCB2b2lkIGht
YWNfc2hhMjU2X2luaXQoc3RydWN0IGhtYWNfc2hhMjU2X2N0eCAqY3R4LAo+ICAJICogICBhcHBl
bmRlZCB3aXRoIDQ0IHplcm8gYnl0ZXMgMHgwMCkKPiAgCSAqLwo+ICAJbWVtY3B5KGtfaXBhZCwg
aywga3NpemUpOwo+IC0JbWVtc2V0KChjaGFyICopa19pcGFkICsga3NpemUsIDAsIEhNQUNfU0hB
MjU2X0JMT0NLU0laRSAtIGtzaXplKTsKPiArCWlmIChrc2l6ZSA8IEhNQUNfU0hBMjU2X0JMT0NL
U0laRSkKPiArCQltZW1zZXQoKGNoYXIgKilrX2lwYWQgKyBrc2l6ZSwgMCwKPiArCQkgICAgICAg
SE1BQ19TSEEyNTZfQkxPQ0tTSVpFIC0ga3NpemUpOwo+ICAKPiAgCS8qCj4gIAkgKiAoMikgWE9S
IChiaXR3aXNlIGV4Y2x1c2l2ZS1PUikgdGhlIEIgYnl0ZSBzdHJpbmcgY29tcHV0ZWQKPiAtLSAK
PiAyLjkuMwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBjY2FuIG1haWxpbmcgbGlzdAo+IGNjYW5AbGlzdHMub3psYWJzLm9yZwo+IGh0dHBzOi8v
bGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJz
Lm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
