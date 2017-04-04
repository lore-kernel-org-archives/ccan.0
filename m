From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 7/7] net: Add check for failure of setsockopt()
Date: Tue, 04 Apr 2017 11:53:49 +0930
Message-ID: <87tw64di6i.fsf@rustcorp.com.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-8-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyVC0681GzDqGv
 for <ccan@lists.ozlabs.org>; Wed,  5 Apr 2017 12:28:44 +1000 (AEST)
In-Reply-To: <20170403111112.27201-8-david@gibson.dropbear.id.au>
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

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBtYWtl
X2xpc3Rlbl9mZCgpIGRpZG4ndCBjaGVjayBmb3IgZmFpbHVyZSBvZiBzZXRzb2Nrb3B0KCkuICBU
aGVyZSdzIG5vCj4gcmVhbCByZWFzb24gbm90IHRvLCBzaW5jZSB3ZSBoYXZlIGFuIG9idmlvdXMg
d2F5IHRvIHJlcG9ydCBhbiBlcnJvciB0byB0aGUKPiBjYWxsZXIuCj4KPiBGb3VuZCB3aXRoIENv
dmVyaXR5IFNjYW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNv
bi5kcm9wYmVhci5pZC5hdT4KCkdyZWF0LCBhbGwgYnV0IHRoZSBvbmUgSSBjb21tZW50ZWQgb24g
bG9vayBmaW5lLiAgUGxlYXNlIGFwcGx5Li4uCgpBY2tlZC1ieTogUnVzdHkgUnVzc2VsbCA8cnVz
dHlAcnVzdGNvcnAuY29tLmF1PgoKVGhhbmtzLApSdXN0eS4KCj4gLS0tCj4gIGNjYW4vbmV0L25l
dC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9jY2FuL25ldC9uZXQuYyBiL2NjYW4vbmV0L25ldC5jCj4g
aW5kZXggZTkxOTk4My4uMTFjNmI2NyAxMDA2NDQKPiAtLS0gYS9jY2FuL25ldC9uZXQuYwo+ICsr
KyBiL2NjYW4vbmV0L25ldC5jCj4gQEAgLTIzOCw3ICsyMzgsOSBAQCBzdGF0aWMgaW50IG1ha2Vf
bGlzdGVuX2ZkKGNvbnN0IHN0cnVjdCBhZGRyaW5mbyAqYWRkcmluZm8pCj4gIAlpZiAoZmQgPCAw
KQo+ICAJCXJldHVybiAtMTsKPiAgCj4gLQlzZXRzb2Nrb3B0KGZkLCBTT0xfU09DS0VULCBTT19S
RVVTRUFERFIsICZvbiwgc2l6ZW9mKG9uKSk7Cj4gKwlpZiAoc2V0c29ja29wdChmZCwgU09MX1NP
Q0tFVCwgU09fUkVVU0VBRERSLCAmb24sIHNpemVvZihvbikpICE9IDApCj4gKwkJZ290byBmYWls
Owo+ICsKPiAgCWlmIChiaW5kKGZkLCBhZGRyaW5mby0+YWlfYWRkciwgYWRkcmluZm8tPmFpX2Fk
ZHJsZW4pICE9IDApCj4gIAkJZ290byBmYWlsOwo+ICAKPiAtLSAKPiAyLjkuMwo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBjY2FuIG1haWxpbmcg
bGlzdAo+IGNjYW5AbGlzdHMub3psYWJzLm9yZwo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3Rz
Lm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
