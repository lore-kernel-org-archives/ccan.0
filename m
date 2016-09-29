From: "Emilio G. Cota" <cota@braap.org>
Subject: [PATCH] list: trivial: fix typos in list_for_each_off's
 documentation
Date: Thu, 29 Sep 2016 17:54:13 -0400
Message-ID: <1475186053-6436-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slT940ZS2zDsjF
 for <ccan@lists.ozlabs.org>; Fri, 30 Sep 2016 08:03:19 +1000 (AEST)
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
List-Id: ccan@lists.ozlabs.org

U2lnbmVkLW9mZi1ieTogRW1pbGlvIEcuIENvdGEgPGNvdGFAYnJhYXAub3JnPgotLS0KIGNjYW4v
bGlzdC9saXN0LmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NjYW4vbGlzdC9saXN0LmggYi9jY2FuL2xp
c3QvbGlzdC5oCmluZGV4IGE0YzIxZjEuLmE2YjAwMzggMTAwNjQ0Ci0tLSBhL2NjYW4vbGlzdC9s
aXN0LmgKKysrIGIvY2Nhbi9saXN0L2xpc3QuaApAQCAtNzE2LDEyICs3MTYsMTIgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGxpc3RfcHJlcGVuZF9saXN0XyhzdHJ1Y3QgbGlzdF9oZWFkICp0bywKICAq
IHNvIHlvdSBjYW4gYnJlYWsgYW5kIGNvbnRpbnVlIGFzIG5vcm1hbC4KICAqCiAgKiBXQVJOSU5H
ISBCZWluZyB0aGUgbG93LWxldmVsIG1hY3JvIHRoYXQgaXQgaXMsIHRoaXMgd3JhcHBlciBkb2Vz
bid0IGtub3cKLSAqIG5vciBjYXJlIGFib3V0IHRoZSB0eXBlIG9mIEBpLiBUaGUgb25seSBhc3N1
bXRpb24gbWFkZSBpcyB0aGF0IEBpIHBvaW50cworICogbm9yIGNhcmUgYWJvdXQgdGhlIHR5cGUg
b2YgQGkuIFRoZSBvbmx5IGFzc3VtcHRpb24gbWFkZSBpcyB0aGF0IEBpIHBvaW50cwogICogdG8g
YSBjaHVuayBvZiBtZW1vcnkgdGhhdCBhdCBzb21lIEBvZmZzZXQsIHJlbGF0aXZlIHRvIEBpLCBj
b250YWlucyBhCi0gKiBwcm9wZXJseSBmaWxsZWQgYHN0cnVjdCBub2RlX2xpc3QnIHdoaWNoIGlu
IHR1cm4gY29udGFpbnMgcG9pbnRlcnMgdG8KLSAqIG1lbW9yeSBjaHVua3MgYW5kIGl0J3MgdHVy
dGxlcyBhbGwgdGhlIHdheSBkb3duLiBXaGl0aCBhbGwgdGhhdCBpbiBtaW5kCisgKiBwcm9wZXJs
eSBmaWxsZWQgYHN0cnVjdCBsaXN0X25vZGUnIHdoaWNoIGluIHR1cm4gY29udGFpbnMgcG9pbnRl
cnMgdG8KKyAqIG1lbW9yeSBjaHVua3MgYW5kIGl0J3MgdHVydGxlcyBhbGwgdGhlIHdheSBkb3du
LiBXaXRoIGFsbCB0aGF0IGluIG1pbmQKICAqIHJlbWVtYmVyIHRoYXQgZ2l2ZW4gdGhlIHdyb25n
IHBvaW50ZXIvb2Zmc2V0IGNvdXBsZSB0aGlzIG1hY3JvIHdpbGwKLSAqIGhhcHBpbGx5IGNodXJu
IGFsbCB5b3UgbWVtb3J5IHVudGlsbCBTRUdGQVVMVCBzdG9wcyBpdCwgaW4gb3RoZXIgd29yZHMK
KyAqIGhhcHBpbHkgY2h1cm4gYWxsIHlvdSBtZW1vcnkgdW50aWwgU0VHRkFVTFQgc3RvcHMgaXQs
IGluIG90aGVyIHdvcmRzCiAgKiBjYXZlYXQgZW1wdG9yLgogICoKICAqIEl0IGlzIHdvcnRoIG1l
bnRpb25pbmcgdGhhdCBvbmUgb2YgbGVnaXRpbWF0ZSB1c2UtY2FzZXMgZm9yIHRoYXQgd3JhcHBl
cgotLSAKMi41LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3Rz
Lm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
