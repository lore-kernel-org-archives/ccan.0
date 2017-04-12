From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/7] crypto/hmac_sha256: Remove undefined memset()
Date: Wed, 12 Apr 2017 16:56:13 -0700
Message-ID: <87wpap5gf6.fsf@rustcorp.com.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-5-david@gibson.dropbear.id.au>
 <87wpb0di8g.fsf@rustcorp.com.au> <20170405122321.GA15755@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6WRh53ZZzDq5b
 for <ccan@lists.ozlabs.org>; Tue, 18 Apr 2017 13:52:32 +1000 (AEST)
In-Reply-To: <20170405122321.GA15755@umbus.fritz.box>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org, rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBbIFVu
a25vd24gc2lnbmF0dXJlIHN0YXR1cyBdCj4gT24gVHVlLCBBcHIgMDQsIDIwMTcgYXQgMTE6NTI6
MzlBTSArMDkzMCwgUGF1bCAnUnVzdHknIFJ1c3NlbGwgd3JvdGU6Cj4+IERhdmlkIEdpYnNvbiA8
ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PiB3cml0ZXM6Cj4+ID4gQSBtZW1zZXQoKSB3aXRo
IGEgemVybyBsZW5ndGggYXJndW1lbnQgaXNuJ3Qgd2VsbCBkZWZpbmVkLiAgSXQgKm1pZ2h0KiBi
ZQo+PiA+IGEgbm8tb3AsIGJ1dCB0aGVuIGl0IG1pZ2h0IG5vdC4gIFNvLCB0ZXN0IGZvciB0aGlz
IGNhc2UgaW4KPj4gPiBobWFjX3NoYTI1Nl9pbml0KCkuCj4+IAo+PiBIdWg/ICBUaGF0IHNlZW1z
IHJlYWxseSBvZGQuCj4KPiBXZWxsLi4gbW9yZSBwcmVjaXNlbHksIG15IHVuZGVyc3RhbmRpbmcg
aXMgdGhhdCBtZW1zZXQocCwgeCwgMCkgY2FuJ3QKPiBiZSBjb3VudGVkIG9uIG5vdCB0byBkZXJl
ZmVyZW5jZSBwLgoKVGhhdCBzZWVtcyBub25zZW5zaWNhbCwgdGhvdWdoLgoKPiBJbiB0aGlzIGNh
c2UsIGtfaXBhZCArIGtzaXplIGlzIHBhc3QgdGhlIGVuZCBvZiB0aGUgYXJyYXksIGFuZCBzbyBu
b3QKPiBhIHZhbGlkIHBvaW50ZXIgdG8gZGVyZWZlcmVuY2UuCgpUaGUgcG9pbnRlciBpcyB2YWxp
ZCAoQydzIGZhbW91cyBvbmUtcGFzdC1lbmQgZXhjZXB0aW9uKSwgZGVyZWZlcmVuY2luZwppdCBp
cyBub3QuCgpXaGF0J3MgdGhlIGFjdHVhbCBjb3Zlcml0eSBlcnJvcj8KClRoYW5rcywKUnVzdHku
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFp
bGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcv
bGlzdGluZm8vY2Nhbgo=
