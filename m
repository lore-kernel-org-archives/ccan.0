From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: dgraph, tlist,
 tcon: MSVC error due to array of flexible structs
Date: Tue, 1 Aug 2017 23:38:22 -0600
Message-ID: <20170802053822.jnwbadhcaztgborr@kevinolos>
References: <20160923043116.ytrxrm7dsgusdrif@kevinolos>
 <20170801052205.GO2652@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from vulcan.kevinlocke.name (vulcan.kevinlocke.name
 [IPv6:2001:19f0:5:727:1e84:17da:7c52:5ab4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMhzQ4L1LzDsWP
 for <ccan@lists.ozlabs.org>; Wed,  2 Aug 2017 15:47:30 +1000 (AEST)
Content-Disposition: inline
In-Reply-To: <20170801052205.GO2652@umbus.fritz.box>
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
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

T24gVHVlLCAyMDE3LTA4LTAxIGF0IDE1OjIyICsxMDAwLCBEYXZpZCBHaWJzb24gd3JvdGU6Cj4g
T24gVGh1LCBTZXAgMjIsIDIwMTYgYXQgMTA6MzE6MTZQTSAtMDYwMCwgS2V2aW4gTG9ja2Ugd3Jv
dGU6Cj4+IFsuLi5dCj4+IAo+PiBUaGUgaXNzdWUgaXMgdGhhdCBNU1ZDIHN1cHBvcnRzIGZsZXhp
YmxlIGFycmF5IG1lbWJlcnMsIGJ1dCBkb2VzIG5vdAo+PiBzdXBwb3J0IGFycmF5cyBvZiBzdHJ1
Y3RzIHdpdGggZmxleGlibGUgYXJyYXkgbWVtYmVycy4gIE15Cj4+IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCBzdWNoIHN1cHBvcnQgaXMgbm90IHJlcXVpcmVkIGJ5IEM5OSBvciBDMTEsIGJ1dAo+PiBJ
IGRvbid0IGtub3cgd2hldGhlciBzdWNoIHN1cHBvcnQgaXMgY29tbW9uIGJleW9uZCBDbGFuZy9H
Q0MuCj4+IAo+PiBJcyB0aGVyZSBhbnkgaW50ZXJlc3QgaW4gc3VwcG9ydGluZyBzdWNoIGNvbXBp
bGVycz8gIElmIHNvLCBJIGNhbiBzZWUKPj4gYSBmZXcgcG90ZW50aWFsIGZpeGVzOgo+PiAKPj4g
Wy4uLl0KPj4gCj4+IDMuIENoYW5nZSBUTElTVCB0byB1c2UgVENPTl9XUkFQPyAgSSBkb24ndCB1
bmRlcnN0YW5kIFRMSVNUL1RDT04gd2VsbAo+PiBlbm91Z2ggdG8ga25vdyBpZiB0aGlzIGlzIHJl
YWxseSBhbiBvcHRpb24uICBIb3BlZnVsbHkgYW4gZXhwZXJ0IGNhbgo+PiB3ZWlnaCBpbiBoZXJl
Lgo+IAo+IEkndmUgbm93IGRvbmUgdGhpcyBmb3IgdGxpc3QgYW5kIHNldmVyYWwgb3RoZXIgbW9k
dWxlcywgd2Ugc2hvdWxkIGhhdmUKPiBhIG11Y2ggYmV0dGVyIGNoYW5jZSBvZiBjb21waWxpbmcg
b24gd2luZG93cy4KCkdyZWF0IHN0dWZmISAgVGhhbmtzIGZvciBhbGwgb2YgeW91ciB3b3JrIHRv
IG1ha2UgdGhlIGNoYW5nZXMhCgpBcyBzb29uIGFzIEkgZ2V0IGEgY2hhbmNlIEknbGwgdGFrZSBh
bm90aGVyIGxvb2sgYXQgYnVpbGRpbmcgd2l0aCBNU1ZDCmFuZCBzZWUgd2hhdCBodXJkbGVzIGV4
aXN0IGFuZCBob3cgZmVhc2libGUgaXQgbWlnaHQgYmUgdG8gZ2V0IHRoZQpjY2FuIHRvb2xzIGNv
bXBpbGluZy4KCi0tIApDaGVlcnMsICAgICAgfCAga2V2aW5Aa2V2aW5sb2NrZS5uYW1lICAgIHwg
WE1QUDoga2V2aW5Aa2V2aW5sb2NrZS5uYW1lCktldmluICAgICAgICB8ICBodHRwczovL2tldmlu
bG9ja2UubmFtZSAgfCBJUkM6ICAga2V2aW5vaWQgb24gZnJlZW5vZGUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBs
aXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
