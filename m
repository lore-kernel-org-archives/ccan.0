From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/4] altstack: Small bugfixes
Date: Tue, 16 Feb 2016 17:09:21 +1100
Message-ID: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 58F6A1A001B
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 21:04:16 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: dan@dancancode.com
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

U28sIGJ5IGJ1aWxkaW5nIG15c2VsZiBhIGRvY2tlciBjb250YWluZXIgd2l0aCBVYnVudHUgMTIu
MDQgKHRoZQpkZWZhdWx0IGRpc3RybyB1c2VkIGJ5IFRyYXZpcyBidWlsZHMpLCBJIHRob3VnaHQg
SSdkIGZpZ3VyZWQgb3V0IHdoeQphbHRzdGFjayBoYXMgYmVlbiBicmVha2luZyBUcmF2aXMgYnVp
bGRzIGZvciBhZ2VzLgoKVW5mb3J0dW5hdGVseSwgSSB3YXMgd3JvbmcgLSAxLzQgY2VydGFpbmx5
IGZpeGVzICphKiBidWcgb24gVWJ1bnR1CjEyLjA0LCBidXQgdGhlcmUncyBhdCBsZWFzdCBvbmUg
bW9yZSAtIEknbSBnZXR0aW5nIGEgU0lHQlVTIGluIGRuKCkKZm9yIHJlYXNvbnMgSSBoYXZlbid0
IGZpZ3VyZWQgb3V0LiAgSSB0aGluayBpdCBtdXN0IGJlIGEgZGlmZmVyZW50CmJlaGF2aW91ciBp
biB3aGF0ZXZlciBrZXJuZWwgdGhlIFRyYXZpcyBidWlsZGVycyBhcmUgdXNpbmcgKHNvIGl0CmRv
ZXNuJ3QgYWZmZWN0IG15IGxvY2FsIGNvbnRhaW5lciBidWlsZCksIGJ1dCBJIGRvbid0IGtub3cg
Zm9yIHN1cmUuCgpTdGlsbCBtaWdodCBhcyB3ZWxsIGZpeCB0aGUgYnVnIEkgZGlkIHRyYWNrIGRv
d24uICBXaGlsZSBJIHdhcyBhdCBpdCBJCmZvdW5kIGEgY291cGxlIG1vcmUgYnVncyB3aGljaCBJ
IGhhdmVuJ3Qgc2VlbiBiaXRlIGluIHByYWN0aWNlLCBidXQKSSdtIHByZXR0eSBzdXJlIGNvdWxk
IGNhdXNlIHByb2JsZW1zIGF0IGxlYXN0IHRoZW9yZXRpY2FsbHksIGhlbmNlCnBhdGNoZXMgMi4u
My80LgoKRmluYWxseSA0LzQgaXNuJ3QgYSBidWdmaXgsIGJ1dCByZXdvcmtzIHNvbWUgb2YgdGhl
IHRlc3QgY29kZSB0byBtYWtlCmZhaWx1cmVzIGEgYml0IGVhc2llciB0byBkaWFnbm9zZS4KCkRh
dmlkIEdpYnNvbiAoNCk6CiAgYWx0c3RhY2s6IEluY3JlYXNlIHNpZ25hbCBzdGFjayBzaXplCiAg
YWx0c3RhY2s6IEluY2x1ZGUgY29uZmlnLmggaW4gcnVuLmMKICBhbHRzdGFjazogRGVjbGFyZSBt
ZW1vcnkgY2xvYmJlcnMKICBhbHRzdGFjazogQ2xhcmlmeSBjaGVja2luZyBtYWNyb3MKCiBjY2Fu
L2FsdHN0YWNrL2FsdHN0YWNrLmMgfCAgNyArKysrLS0tCiBjY2FuL2FsdHN0YWNrL3Rlc3QvcnVu
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIAoyLjUuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2Nh
bkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2Fu
Cg==
