From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: [PATCH] edit_distance: calculate edit distance between
 strings
Date: Wed, 23 Nov 2016 10:17:30 -0700
Message-ID: <20161123171730.73axe2ert6nwm3vj@kevinolos>
References: <f253995d1f82ebc3dbb69f9ad2dfbcff6605c71a.1479527608.git.kevin@kevinlocke.name>
 <20161123125836.GG17795@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP8D34fpLzDwCB
 for <ccan@lists.ozlabs.org>; Thu, 24 Nov 2016 04:17:39 +1100 (AEDT)
Content-Disposition: inline
In-Reply-To: <20161123125836.GG17795@umbus.fritz.box>
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

T24gV2VkLCAyMDE2LTExLTIzIGF0IDIzOjU4ICsxMTAwLCBEYXZpZCBHaWJzb24gd3JvdGU6Cj4g
T24gRnJpLCBOb3YgMTgsIDIwMTYgYXQgMDk6MTk6MjVQTSAtMDcwMCwgS2V2aW4gTG9ja2Ugd3Jv
dGU6Cj4+IFRoaXMgY29tbWl0IGNyZWF0ZXMgdGhlIGVkaXRfZGlzdGFuY2UgbW9kdWxlIGZvciBj
YWxjdWxhdGluZyB2YXJpb3VzCj4+IGVkaXQgZGlzdGFuY2UgbWVhc3VyZXMuCj4+IFsuLi5dCj4g
Cj4gSSd2ZSBtZXJnZWQgdGhpcyBtb2R1bGUgaW4sIGFsb25nIHdpdGggYSBmaXggdG8gbWFrZSB0
aGUgVHJhdmlzIGJ1aWxkCj4gaGFwcHkgd2l0aCBpdC4KClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5n
IGFuZCBtZXJnaW5nIGl0ISAgTXkgYXBvbG9naWVzIGZvciBtaXNzaW5nIHRoZQpUcmF2aXMgYnVp
bGQgZXJyb3JzLCBJJ20gbm90IHN1cmUgaG93IEkgbWlzc2VkIHRoYXQuICBJIGNvdWxkIG1ha2Ug
dGhlCm1vZHVsZSBjb21waWxlIHdpdGhvdXQgLXN0ZD1nbnU5OSBpZiB5b3UnZCByYXRoZXIgbm90
IG1ha2UgdGhhdCBjaGFuZ2UKcHJvamVjdC13aWRlIChvciBpZiB0aGVyZSBhcmUgbGlrZWx5IHRv
IGJlIG1hbnkgdXNlcnMgd2l0aG91dCBhCmNvbXBpbGVyIHRoYXQgc3VwcG9ydHMgdGhlIEM5OSBm
ZWF0dXJlcyB1c2VkKS4KCj4gQ2FuIHlvdSBwbGVhc2Ugc2VuZCBtZSBhbiBzc2ggcHVibGljIGtl
eSwgYW5kIEknbGwgYXV0aG9yaXplIHlvdSB0bwo+IHB1c2ggY2hhbmdlcyB0byB0aGlzIG1vZHVs
ZS4KCkdyZWF0LCB0aGFua3MuICBJJ2xsIHNlbmQgdGhhdCB0byB5b3Ugb2ZmLWxpc3QgbW9tZW50
YXJpbHkuCgotLSAKVGhhbmtzIGFnYWluLCB8ICBrZXZpbkBrZXZpbmxvY2tlLm5hbWUgICB8IFhN
UFA6IGtldmluQGtldmlubG9ja2UubmFtZQpLZXZpbiAgICAgICAgIHwgIGh0dHBzOi8va2V2aW5s
b2NrZS5uYW1lIHwgSVJDOiAgIGtldmlub2lkIG9uIGZyZWVub2RlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlz
dHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
