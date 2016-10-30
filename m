From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [ElementsProject/lightning] lightningd can crash if time
 moves backwards (#58)
Date: Mon, 31 Oct 2016 08:49:19 +1030
Message-ID: <8737jd32fs.fsf@rustcorp.com.au>
References: <ElementsProject/lightning/issues/58@github.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6X3m6GrDzDvPq
 for <ccan@lists.ozlabs.org>; Mon, 31 Oct 2016 09:19:48 +1100 (AEDT)
In-Reply-To: <ElementsProject/lightning/issues/58@github.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ElementsProject/lightning <reply+000bd6a4204707fe3cff5af6f0ab2717de4a0159d6b7127292cf00000001142959cb92a169ce0b0fb9db@reply.github.com>, ElementsProject/lightning <lightning@noreply.github.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

Z3dpbGxlbiA8bm90aWZpY2F0aW9uc0BnaXRodWIuY29tPiB3cml0ZXM6Cj4gSW4gdGhlIGNjYW4g
dGltZXIgbW9kdWxlLCB0aGVyZSdzIGFuIGFzc2VydGlvbiB0aGF0IGNhbiBjcmFzaCBpZiB0aW1l
IG1vdmVzIGJhY2t3YXJkcy4gSSBrbm93IHRoZXJlIGFyZSBkaWZmZXJlbnQgcGVyc3BlY3RpdmVz
IG9uIHRoaXMsIGJ1dCBpdCBzZWVtcyBsaWtlIGxpZ2h0bmluZ2QgY2FuIHByb2JhYmx5IHJlY292
ZXIgZnJvbSBzbGlnaHQgbm9uLW1vbm90b25pY2l0eSBvZiB0aW1lLCBzbyBpdCdzIHdvcnRoIHRo
aW5raW5nIGFib3V0IHdoZXRoZXIgY3Jhc2hpbmcgaXMgdGhlIGJlc3Qgb3V0Y29tZSBpbiB0aGlz
IGNhc2UuCgpPdWNoLCB0aGFua3MhCgpTbyB5b3Uga25vdyB3aGF0IGhhcHBlbmVkPyAgTlRQIGp1
bXAgb3IgbWFudWFsIHNldHRpbmc/Cgo+IGxpZ2h0bmluZ2Q6IGNjYW4vY2Nhbi90aW1lci90aW1l
ci5jOjMwNzogdGltZXJzX2V4cGlyZTogQXNzZXJ0aW9uIGBub3cgPj0gdGltZXJzLT5iYXNlJyBm
YWlsZWQuCj4gbGlnaHRuaW5nZCgyNDMyNSk6IEZBVEFMIFNJR05BTCA2IFJFQ0VJVkVECj4gRmF0
YWwgc2lnbmFsIDYuIExvZyBkdW1wZWQgaW4gY3Jhc2gubG9nCj4gQWJvcnRlZAoKWXVjay4gIFNh
eWluZyB0aGF0IHRpbWUgc2hvdWxkbid0IGdvIGJhY2t3YXJkcyBpcyBmYWlybHkgZnVuZGFtZW50
YWwsCmFuZCBhIHVzZWZ1bCBzYW5pdHkgY2hlY2suICBMb3RzIG9mIHRoaW5ncyBhc3N1bWUgdGlt
ZSBtYWtlcyBwcm9ncmVzcy4KQW5kIGEgbGlicmFyeSBjYW4ndCByZXBvcnQgc29mdCBlcnJvcnMu
CgpPVE9ILCByZWFsIGxpZmUgYWx3YXlzIHdpbnMgb3ZlciBteSBwZXJzb25hbCBwcmVmZXJlbmNl
cyA6KQoKT25lIG9wdGlvbiBpcyB0byBzd2l0Y2ggdG8gdGltZW1vbm8sIHdoaWNoIHJlYWxseSBj
YW4ndCBnbyBiYWNrd2FyZHMuCkJ1dCB0aW1lbW9ubyBpcyBjb21wbGV0ZWx5IGRldGFjaGVkIGZy
b20gYW55IHdhbGxjbG9jayB0aW1lLCBzbyBpdCdzCm9ubHkgdXNlZnVsIGZvciByZWxhdGl2ZSB0
aW1lcnMuCgpXaGljaCBpbXBsaWVzIGFuIEFQSSBjaGFuZ2UgdG8gYWx3YXlzIHVzZSByZWxhdGl2
ZSB0aW1lICh0aGlzIGFjdHVhbGx5Cm1hdGNoZXMgd2l0aCBhbGwgbm9uLXRlc3QgdXNhZ2UgSSBj
YW4gZmluZCkuCgpJJ2xsIGxvb2sgaGFyZGVyLgoKVGhhbmtzIQpSdXN0eS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2Nh
bkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2Fu
Cg==
