From: Rusty Russell <rusty@rustcorp.com.au>
Subject: CCAN update for 2015-09
Date: Thu, 01 Oct 2015 14:38:47 +0930
Message-ID: <87twqbnpk0.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C3B991A00C5
 for <ccan@lists.ozlabs.org>; Thu,  1 Oct 2015 15:45:53 +1000 (AEST)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan <ccan@lists.ozlabs.org>
Cc: Cody P Schafer <dev@codyps.com>, Lana Brindley <mail@lanabrindley.com>
List-Id: ccan@lists.ozlabs.org

SGkgZmVsbG93IENDQU5uaWJhbHMhCgogICAgICAgIFNvbWUgdG9vbHMgd29yayB0aGlzIG1vbnRo
OyBtYWtlcyBtZSB3b25kZXIgaG93IG1hbnkgcGVvcGxlIGhhdmUKZXZlciByZWFkIHRoZSBjY2Fu
bGludCBtYW4gcGFnZT8gIEkgdGhpbmsgaXQgd2FzIExhbmEgQnJpbmRsZXkgd2hvCnByb21pc2Vk
IG1lIHRoYXQgd3JpdGluZyBiYWQgZG9jdW1lbnRhdGlvbiB3YXMgYSBncmVhdCB3YXkgdG8gZ2V0
IG90aGVycwp0byBmaXggaXQuICAibWFuIC1sIGRvYy9jY2FubGludC4xIiBpbiB0aGUgY2NhbiBy
ZXBvLCBvciByZWFkIHRoZSBzb3VyY2U6Cmh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0eXJ1c3NlbGwv
Y2Nhbi9ibG9iL21hc3Rlci9kb2MvY2NhbmxpbnQuMS50eHQKCk1vZHVsZSBvZiB0aGUgTW9udGg6
IG1lbSAoQ0MwKQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCkFsbCBraW5kcyBvZiBy
b3V0aW5lcyB3aGljaCBkaWRuJ3QgbWFrZSBzdGRsaWIsIHN1Y2ggYXMgc2ltcGxlIGNsYXJpdHkK
aW5jcmVhc2VycyBsaWtlIG1lbWVxKGEsYWxlbixiLGJsZW4pLCBtZW1lcXN0cihhLGFsZW4sc3Ry
KSBhbmQKbWVtb3ZlcmxhcHMoYSxhbGVuLGIsYmxlbikuICBUaGVyZSdzIGFsc28gbWVtc3dhcChh
LGIsbGVuKSBhbmQKbWVtcGJya20oYSxhbGVuLGIsYmxlbikgd2hpY2ggbG9va3MgZm9yIGFueSBv
ZiAiYiIgY2hhcnMgaW4gImEiLgpUaGVyZSdzIGFsc28gdGhlIHBhc3MtdGhyb3VnaCBtZW1jaGVj
ayhhLGFsZW4pIHdoaWNoIGNoZWNrcyB0aGUgbWVtb3J5CmlzIGRlZmluZWQgaWYgcnVubmluZyB1
bmRlciB2YWxncmluZC4KCk5ldyBtb2R1bGVzOgo9PT09PT09PT09PT0KCXN0cmdycCAtIGdyb3Vw
L2NsdXN0ZXIgc2ltaWxhciBzdHJpbmdzLiAodGhhbmtzIEFuZHJldyBKZWZmZXJ5KQogICAgICAg
IHBlcm11dGF0aW9uIC0gR2VuZXJhdGUgcGVybXV0YXRpb25zIG9mIGFycmF5cyAodGhhbmtzIERh
dmlkIEdpYnNvbikKCk1pbm9yIHVwZGF0ZXMgJiBidWdmaXhlczoKPT09PT09PT09PT09PT09PT09
PT09PT09CgltZW06IG1hbnkgbmV3IHJvdXRpbmVzICh0aGFua3MgQ29keSBTY2hhZmVyLCBEYXZp
ZCBHaWJzb24pCgoKVG9vbHMgdXBkYXRlczoKPT09PT09PT09PT09PQoJY29uZmlndXJhdG9yOiBl
bmhhbmNlbWVudHMgdG8gZGV0ZWN0IE9wZW5NUCAodGhhbmtzIEFuZHJldyBKZWZmZXJ5KQogICAg
ICAgIF9pbmZvOiBjYW4gbm93IHNwZWNpZnkgYWRkaXRpb25hbCBjZmxhZ3MgKHRoYW5rcyBBbmRy
ZXcgSmVmZmVyeSkKICAgICAgICBjY2FubGludDogYmV0dGVyIGhhbmRsaW5nIG9mICIvLyBnaXZl
biIgZXhhbXBsZSB0ZXN0cy4KCkNoZWVycywKUnVzdHkuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3ps
YWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
