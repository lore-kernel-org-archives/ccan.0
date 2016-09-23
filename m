From: Kevin Locke <kevin@kevinlocke.name>
Subject: dgraph, tlist,
 tcon: MSVC error due to array of flexible structs
Date: Thu, 22 Sep 2016 22:31:16 -0600
Message-ID: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name
 [IPv6:2605:6400:2:fed5:22:0:f2f6:c0f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgL60181NzDsmK
 for <ccan@lists.ozlabs.org>; Fri, 23 Sep 2016 14:31:20 +1000 (AEST)
Received: from kevinolos (unknown [IPv6:2001:470:b:5c3:e135:746f:fb74:c725])
 (Authenticated sender: kevin@kevinlocke.name)
 by praxis.kevinlocke.name (Postfix) with ESMTPSA id 287C93120442
 for <ccan@lists.ozlabs.org>; Thu, 22 Sep 2016 22:31:17 -0600 (MDT)
Content-Disposition: inline
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

SGkgYWxsLAoKQnVpbGRpbmcgZGdyYXBoIHVzaW5nIE1pY3Jvc29mdCBWaXN1YWwgQysrIHByb2R1
Y2VzIHRoZSBmb2xsb3dpbmcKZXJyb3I6CgpkZ3JhcGguaCgyNSk6IGVycm9yIEMyMjMzOiAnZWRn
ZSc6IGFycmF5cyBvZiBvYmplY3RzIGNvbnRhaW5pbmcKemVyby1zaXplIGFycmF5cyBhcmUgaWxs
ZWdhbAoKVGhlIGlzc3VlIGlzIHRoYXQgTVNWQyBzdXBwb3J0cyBmbGV4aWJsZSBhcnJheSBtZW1i
ZXJzLCBidXQgZG9lcyBub3QKc3VwcG9ydCBhcnJheXMgb2Ygc3RydWN0cyB3aXRoIGZsZXhpYmxl
IGFycmF5IG1lbWJlcnMuICBNeQp1bmRlcnN0YW5kaW5nIGlzIHRoYXQgc3VjaCBzdXBwb3J0IGlz
IG5vdCByZXF1aXJlZCBieSBDOTkgb3IgQzExLCBidXQKSSBkb24ndCBrbm93IHdoZXRoZXIgc3Vj
aCBzdXBwb3J0IGlzIGNvbW1vbiBiZXlvbmQgQ2xhbmcvR0NDLgoKSXMgdGhlcmUgYW55IGludGVy
ZXN0IGluIHN1cHBvcnRpbmcgc3VjaCBjb21waWxlcnM/ICBJZiBzbywgSSBjYW4gc2VlCmEgZmV3
IHBvdGVudGlhbCBmaXhlczoKCjEuIENoYW5nZSBUQ09OIHRvIHVzZSBmbGV4aWJsZSBhcnJheSBt
ZW1iZXJzIG9ubHkgd2hlbiB0aGUgY29tcGlsZXIKc3VwcG9ydHMgYXJyYXlzIG9mIHN0cnVjdHMg
d2l0aCBmbGV4aWJsZSBhcnJheSBtZW1iZXJzLiAgVGhpcyBpcyBhbgplYXN5IGZpeCwgYnV0IHdh
c3RlcyBzcGFjZSBmb3IgZXZlcnkgVENPTi9UTElTVCB1c2FnZSBvbiBzdWNoCmNvbXBpbGVycy4K
CjIuIEhhdmUgVENPTiAoYW5kIFRMSVNUKSBwcm92aWRlIGFuIGFsdGVybmF0aXZlIG1hY3JvIHdo
aWNoIHVzZXMKZmxleGlibGUgYXJyYXkgbWVtYmVycyBvbmx5IHdoZW4gc3VwcG9ydGVkIGluIGFy
cmF5cywgYW5kIHVzZSB0aGF0IGluCmRncmFwaC4gIEl0IHdvdWxkIGluY3JlYXNlIHRoZSBBUEkg
YW5kIGR1cGxpY2F0ZSBhIGJpdCBvZiBjb2RlLCBidXQKd291bGQgb25seSB3YXN0ZSBzcGFjZSB3
aGVuIFRDT04vVExJU1QgYXJlIHBsYWNlZCBpbiBhcnJheXMuCgoyLiBSZXBsYWNlIHRoZSAyLWVs
ZW1lbnQgZWRnZSBhcnJheSBpbiBzdHJ1Y3QgZGdyYXBoX25vZGUgd2l0aApzZXBhcmF0ZSBmaWVs
ZHMgZWRnZV9mcm9tIGFuZCBlZGdlX3RvLiAgVGhpcyBjb21wbGljYXRlcyB0aGUgbG9naWMgYQpi
aXQsIHNpbmNlIGl0IGlzIG5vIGxvbmdlciBzeW1tZXRyaWMgd2l0aCBkZ3JhcGhfZWRnZS4gIEl0
IHdvdWxkIGFsc28KYmUgYW4gaW5jb21wYXRpYmxlIEFQSSBjaGFuZ2UuCgozLiBDaGFuZ2UgVExJ
U1QgdG8gdXNlIFRDT05fV1JBUD8gIEkgZG9uJ3QgdW5kZXJzdGFuZCBUTElTVC9UQ09OIHdlbGwK
ZW5vdWdoIHRvIGtub3cgaWYgdGhpcyBpcyByZWFsbHkgYW4gb3B0aW9uLiAgSG9wZWZ1bGx5IGFu
IGV4cGVydCBjYW4Kd2VpZ2ggaW4gaGVyZS4KClRob3VnaHRzPwoKLS0gCkNoZWVycywgICAgICB8
ICBrZXZpbkBrZXZpbmxvY2tlLm5hbWUgICAgfCBYTVBQOiBrZXZpbkBrZXZpbmxvY2tlLm5hbWUK
S2V2aW4gICAgICAgIHwgIGh0dHBzOi8va2V2aW5sb2NrZS5uYW1lICB8IElSQzogICBrZXZpbm9p
ZCBvbiBmcmVlbm9kZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0
cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
