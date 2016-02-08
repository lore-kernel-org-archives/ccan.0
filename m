From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] btree: Add custom allocator interface.
Date: Mon, 08 Feb 2016 14:11:32 +1030
Message-ID: <87egcnhnrn.fsf@rustcorp.com.au>
References: <1454803839-632-1-git-send-email-stuartl@longlandclan.id.au>
 <87wpqgm3mb.fsf@rustcorp.com.au> <56B7FF57.1010704@longlandclan.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5BB5F1A0018
 for <ccan@lists.ozlabs.org>; Mon,  8 Feb 2016 14:43:15 +1100 (AEDT)
In-Reply-To: <56B7FF57.1010704@longlandclan.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Stuart Longland <stuartl@longlandclan.id.au>, ccan@lists.ozlabs.org
Cc: Stuart Longland <me@vk4msl.id.au>
List-Id: ccan@lists.ozlabs.org

U3R1YXJ0IExvbmdsYW5kIDxzdHVhcnRsQGxvbmdsYW5kY2xhbi5pZC5hdT4gd3JpdGVzOgo+IE9u
IDA4LzAyLzE2IDEwOjQ1LCBSdXN0eSBSdXNzZWxsIHdyb3RlOgo+PiBzdHVhcnRsQGxvbmdsYW5k
Y2xhbi5pZC5hdSB3cml0ZXM6Cj4+PiBGcm9tOiBTdHVhcnQgTG9uZ2xhbmQgPG1lQHZrNG1zbC5p
ZC5hdT4KPj4+Cj4+PiBUaGlzIHByb3ZpZGVzIGEgd2F5IGZvciBidHJlZSB0byBiZSB1c2VkIHdp
dGggZXh0ZXJuYWwgYWxsb2NhdG9yCj4+PiBsaWJyYXJpZXMgc3VjaCBhcyB0aGUgdGFsIG9yIHRh
bGxvYyBtb2R1bGVzLgo+PiAKPj4gU3VyZS4gIEluIG15IGxpYnJhcmllcyBJIGdlbmVyYWxseSB1
c2UgYSBnbG9iYWwgYWxsb2NhdG9yIG92ZXJyaWRlOwo+PiBpdCdzIG5vdCB0aHJlYWQtc2FmZSwg
YnV0IG11Y2ggZWFzaWVyIHRvIHVzZSBpbiBwcmFjdGljZS4KPj4gCj4+IFNpbmNlIEkgZG9uJ3Qg
dXNlIGJ0cmVlLCBJJ20gYWdub3N0aWMgYWJvdXQgaXQgdGhvdWdoIQo+Cj4gSW5kZWVkLCBhY3R1
YWxseSBJJ20gaGFsZiBjb25zaWRlcmluZyB3aGV0aGVyIHdlIG1ha2UgaXQgYSBzZXBhcmF0ZQo+
IG1vZHVsZSB0aGF0IGBidHJlZWAgKGFuZCBvdGhlcnMpIGNhbiBwdWxsIGludG8gdGhlaXIgY29k
ZS4gIFRoZXJlIGFyZQo+IGxvdHMgb2YgY2FzZXMgd2hlcmUgYHRhbGAgb3IgYHRhbGxvY2AgaXMg
ZGVzaXJhYmxlIG92ZXIgdGhlIHN0YW5kYXJkIEMKPiBtYWxsb2MvZnJlZS4KClllcywgSSd2ZSBi
ZWVuIGFsbCBvdmVyIHRoZSBwbGFjZSBvbiB0aGlzLiAgT3B0IGhhcyBvcHRfc2V0X2FsbG9jKCks
CihhIGdsb2JhbCksIHJidWYgdGFrZXMgYW4gZXhwbGljaXQgcmVhbGxvYyBmdW5jdGlvbiwgaW8g
anVzdCBhc3N1bWVzCnRhbCwgdGFsL2dyYWJfZmlsZSBpcyBhY3R1YWxseSBhIHRhbCBzdWJtb2R1
bGUgKHRoZSBvbGQgb25lIGlzCmRlcHJlY2F0ZWQsIHdpbGwgYmUgcmVtb3ZlZCBSU04pLgoKVGhl
cmUncyBhIGJhbGFuY2Ugb2YgImJpZyBlbm91Z2ggdGhhdCBuZWVkaW5nIHRhbCBpcyBub3QgYW4g
aXNzdWUiLAoic3RhbmRhbG9uZSBlbm91Z2ggdGhhdCBJIHdhbnQgdG8gYXZvaWQgYSBkZXBlbmRl
bmN5IiBhbmQgIkFQSQpzaW1wbGljaXR5Ii4KCj4+PiArc3RydWN0IGJ0cmVlICpidHJlZV9uZXdf
d2l0aF9hbGxvYyhidHJlZV9zZWFyY2hfdCBzZWFyY2gsCj4+PiArCQljb25zdCBzdHJ1Y3QgYnRy
ZWVfYWxsb2NhdG9yICphbGxvYykKPj4+ICt7Cj4+PiArCXN0cnVjdCBidHJlZSAqYnRyZWUgPSAo
KihhbGxvYy0+bWFsbG9jKSkoYWxsb2MsIHNpemVvZihzdHJ1Y3QgYnRyZWUpKTsKPj4gCj4+IFlv
dSBjYW4gY2FsbCBhIGZ1bmN0aW9uIHBvaW50ZXIsIHNvIGFsbG9jLT5tYWxsb2MoYWxsb2MsIHNp
emVvZihzdHJ1Y3QgYnRyZWUpKTsKPj4gc2hvdWxkIHdvcmsuICAKPgo+IEFoaCwgZGlkbid0IGtu
b3cgYWJvdXQgdGhhdC4gIEkgcHJlc3VtZSBhIG1vcmUgcmVjZW50IEMgc3RhbmRhcmQ/ICBJJ2xs
Cj4gYWRtaXQgSSBoYWQgdG8gbG9vayB1cCB0aGUgc3ludGF4IGZvciBmdW5jdGlvbiBwb2ludGVy
cyBvZmYgV2lraXBlZGlhIGFzCj4gSSBkb24ndCBkbyBpdCBvZnRlbiBlbm91Z2guCgpJdCdzIG9u
ZSBvZiB0aG9zZSB3ZWlyZG5lc3NlcyB0aGF0IGhhcyBiZWVuIGFyb3VuZCBmb3JldmVyOyBwcmV0
dHkgc3VyZQppdCB3YXMgaW4gSyZSIGJ1dCBJIGRvbid0IGhhdmUgdGhhdCBvbiBoYW5kLgoKQ2hl
ZXJzLApSdXN0eS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMu
b3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
