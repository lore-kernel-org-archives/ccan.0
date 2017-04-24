From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/7] crypto/hmac_sha256: Remove undefined memset()
Date: Mon, 24 Apr 2017 12:00:15 +0930
Message-ID: <87tw5efsg8.fsf@rustcorp.com.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-5-david@gibson.dropbear.id.au>
 <87wpb0di8g.fsf@rustcorp.com.au> <20170405122321.GA15755@umbus.fritz.box>
 <87wpap5gf6.fsf@rustcorp.com.au> <58F59470.4070507@xiph.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wB9PL68V0zDq5W
 for <ccan@lists.ozlabs.org>; Mon, 24 Apr 2017 12:33:10 +1000 (AEST)
In-Reply-To: <58F59470.4070507@xiph.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "Timothy B. Terriberry" <tterribe@xiph.org>, David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

IlRpbW90aHkgQi4gVGVycmliZXJyeSIgPHR0ZXJyaWJlQHhpcGgub3JnPiB3cml0ZXM6Cj4gUnVz
dHkgUnVzc2VsbCB3cm90ZToKPj4+IFdlbGwuLiBtb3JlIHByZWNpc2VseSwgbXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IG1lbXNldChwLCB4LCAwKSBjYW4ndAo+Pj4gYmUgY291bnRlZCBvbiBub3Qg
dG8gZGVyZWZlcmVuY2UgcC4KPj4KPj4gVGhhdCBzZWVtcyBub25zZW5zaWNhbCwgdGhvdWdoLgo+
Cj4gSXQgaXMgbm9uc2Vuc2ljYWwsIGJ1dCB3ZWxjb21lIHRvIHN0YW5kYXJkcy4KPgo+IEM5OSBT
ZWN0aW9uIDcuMjEuMSAiU3RyaW5nIGZ1bmN0aW9uIGNvbnZlbnRpb25zIiAod2hpY2ggaW5jbHVk
ZXMgbWVtc2V0LCAKPiBhcyBpdCBpcyBpbiBzdHJpbmcuaCk6Cj4KPiAiV2hlcmUgYW4gYXJndW1l
bnQgZGVjbGFyZWQgYXMgc2l6ZV90IG4gc3BlY2lmaWVzIHRoZSBsZW5ndGggb2YgdGhlIAo+IGFy
cmF5IGZvciBhIGZ1bmN0aW9uLCBuIGNhbiBoYXZlIHRoZSB2YWx1ZSB6ZXJvIG9uIGEgY2FsbCB0
byB0aGF0IAo+IGZ1bmN0aW9uLiBVbmxlc3MgZXhwbGljaXRseSBzdGF0ZWQgb3RoZXJ3aXNlIGlu
IHRoZSBkZXNjcmlwdGlvbiBvZiBhIAo+IHBhcnRpY3VsYXIgZnVuY3Rpb24gaW4gdGhpcyBzdWJj
bGF1c2UsIHBvaW50ZXIgYXJndW1lbnRzIG9uIHN1Y2ggYSBjYWxsIAo+IHNoYWxsIHN0aWxsIGhh
dmUgdmFsaWQgdmFsdWVzLCBhcyBkZXNjcmliZWQgaW4gNy4xLjQiCgpJIHRoaW5rIHlvdSdyZSBj
b25mdXNpbmcgInZhbGlkIHBvaW50ZXIiIHdpdGggImRlcmVmZXJlbmNhYmxlIHBvaW50ZXIiLgoK
QSBwb2ludGVyIG9uZSBwYXN0IHRoZSBlbmQgaXMgc3RpbGwgYSB2YWxpZCBwb2ludGVyLCBqdXN0
IG5vdApkZXJlZmVyZW5jYWJsZS4gIEluIHRoaXMgY2FzZSwgdGhhdCdzIHdoYXQgd2UgaGF2ZSB3
aGVuIGtzaXplID09CkhNQUNfU0hBMjU2X0JMT0NLU0laRToKCiAJbWVtc2V0KChjaGFyICopa19p
cGFkICsga3NpemUsIDAsIEhNQUNfU0hBMjU2X0JMT0NLU0laRSAtIGtzaXplKTsKCmllLiB3ZSBh
cmUgdHJ5aW5nIHRvIHNldCB0aGUgdW51c2VkIHRyYWlsaW5nIGJ5dGVzIG9mIHRoZSByZWdpb24g
dG8KemVyby4KCkV2ZW4gaWYgeW91IHdlcmUgY29ycmVjdCwgYW5kIGNvZGUgc2hvdWxkIGJlIHRl
c3RpbmcgZm9yIHplcm8gc2l6ZXMgaW4Kc3VjaCBjYXNlcywgYW5kIGRvbid0IGNhcmUgdGhhdCBL
ZXJuaWdoYW4gYW5kIFBsYXVnZXIgd291bGQgYmUgcm9sbGluZwppbiB0aGVpciBncmF2ZXMgKGFu
ZCBuZWl0aGVyIGlzIGV2ZW4gZGVhZCB5ZXQhKSwgeW91IHdvdWxkIGp1c3QgY2F1c2UgbWUKdG8g
d3JpdGUgYSB0ZXN0IGNhc2UuCgpCZWNhdXNlIHlvdSBzaG91bGQgKm5ldmVyKiBnaXZlIGluIHRv
IGluc2FuaXR5IGV4Y2VwdCB1bmRlciBkdXJlc3MsIGFuZAp0aGVuIHdpdGggbG91ZCBwcm90ZXN0
ISAgT3RoZXJ3aXNlIGV2ZXJ5b25lIGxvc2VzLgoKQ2hlZXJzLApSdXN0eS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2Nh
bkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2Fu
Cg==
