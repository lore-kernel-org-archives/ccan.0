From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] ccanlint: enhance and streamline "output"
	testing lines.
Date: Tue, 29 Sep 2015 07:18:41 +0930
Message-ID: <8737xyp64m.fsf@rustcorp.com.au>
References: <878u7rp6z8.fsf@rustcorp.com.au>
 <20150928143236.GN11620@voom.redhat.com>
 <20150928145832.GO11620@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B2711A0014
 for <ccan@lists.ozlabs.org>; Tue, 29 Sep 2015 09:31:25 +1000 (AEST)
In-Reply-To: <20150928145832.GO11620@voom.redhat.com>
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
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBPbiBU
dWUsIFNlcCAyOSwgMjAxNSBhdCAxMjozMjozNkFNICsxMDAwLCBEYXZpZCBHaWJzb24gd3JvdGU6
Cj4+IE9uIE1vbiwgU2VwIDI4LCAyMDE1IGF0IDEyOjQ4OjAzUE0gKzA5MzAsIFBhdWwgJ1J1c3R5
JyBSdXNzZWxsIHdyb3RlOgo+PiA+IDEpIFJlcXVpcmUgIiIgYXJvdW5kIGlucHV0Cj4+ID4gMikg
TWFrZSB0aGVtIG9wdGlvbmFsIGFyb3VuZCBvdXRwdXQ6IGlmIG5vdCB0aGVyZSwgbG9vc2UgbWF0
Y2ggd2hpdGVzcGFjZQo+PiA+IDMpIEhhbmRsZSBcbiBpbiBvdXRwdXQuCj4+ID4gNCkgRG9jdW1l
bnQgdGhhdCAiR2l2ZW4geHh4IiBpcyBvcHRpb25hbC4KPj4gCj4+IFBhdGNoIGxvb2tzIGZpbmUg
dG8gbWUuCj4KPiBJIHRha2UgdGhhdCBiYWNrLiAgV2l0aCBhIGJpdCBtb3JlIHBsYXlpbmcsIG5v
dGljZWQgdGhhdCBpZiB5b3UKPiAqZG9uJ3QqIHB1dCIgYXJvdW5kIHRoZSBpbnB1dCwgaXQgd2ls
bCBzaWxlbnRseSBza2lwIHRoZSBleGFtcGxlCj4gZXhwZWN0ZWQgb3V0cHV0IHRlc3QuCgpJdCBz
aG91bGQgZGV0ZWN0IHNvbWUgbWFsZm9ybWVkIHVzZXMuICBMZXQncyBiZWVmIGl0IHVwLCBzbyBp
dCBlcnJvcnMKb24gYW55IGNvbW1lbnQgbm90IG90aGVyd2lzZSByZWNvZ25pemVkIHdoaWNoIHN0
YXJ0cyB3aXRoICIvLyBnaXZlbiIgb3IKIi8vIG91dHB1dHMiLiAgKEl0IGFscmVhZHkgY2F1Z2h0
IHRoZSAiZ2l2ZW4iIGNhc2UpLgoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NjYW5saW50L3Rlc3RzL2V4
YW1wbGVzX3J1bi5jIGIvdG9vbHMvY2NhbmxpbnQvdGVzdHMvZXhhbXBsZXNfcnVuLmMKaW5kZXgg
YzdkMDRjMi4uMjU4ZTI5MCAxMDA2NDQKLS0tIGEvdG9vbHMvY2NhbmxpbnQvdGVzdHMvZXhhbXBs
ZXNfcnVuLmMKKysrIGIvdG9vbHMvY2NhbmxpbnQvdGVzdHMvZXhhbXBsZXNfcnVuLmMKQEAgLTEy
NSw4ICsxMjUsOCBAQCBzdGF0aWMgY2hhciAqZmluZF9leHBlY3Qoc3RydWN0IGNjYW5fZmlsZSAq
ZmlsZSwKIAkJCXJldHVybiBleHBlY3Q7CiAJCX0KIAotCQkvKiAiR2l2ZW4iIHdpdGhvdXQgIm91
dHB1dCI/ICovCi0JCWlmICgqaW5wdXQpIHsKKwkJLyogT3RoZXIgbWFsZm9ybWVkIGxpbmU/ICov
CisJCWlmICghc3RybmNhc2VjbXAocCwgImdpdmVuIikgfHwgIXN0cm5jYXNlY21wKHAsICJvdXRw
dXRzIikpIHsKIAkJCSplcnJvciA9IHRydWU7CiAJCQlyZXR1cm4gcDsKIAkJfQoKQ2hlZXJzLApS
dXN0eS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2Nh
biBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9jY2FuCg==
