From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v2 12/13] Makefile: Define CFLAGS_FORCE_C_SOURCE
 macro
Date: Wed, 26 Oct 2016 13:19:03 +1030
Message-ID: <87y41b3jvk.fsf@rustcorp.com.au>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <a0934c257f9a1fb5c99b89fd6cf01e7b450d0f10.1474600863.git.kevin@kevinlocke.name>
 <20160927051850.GT30322@umbus.fritz.box> <8760ph3lxi.fsf@rustcorp.com.au>
 <20160928020127.GC18880@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3ZJq2qz7zDvJ0
 for <ccan@lists.ozlabs.org>; Wed, 26 Oct 2016 13:50:51 +1100 (AEDT)
In-Reply-To: <20160928020127.GC18880@umbus>
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

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBPbiBU
dWUsIFNlcCAyNywgMjAxNiBhdCAwMzo0ODozM1BNICswOTMwLCBQYXVsICdSdXN0eScgUnVzc2Vs
bCB3cm90ZToKPj4gRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdy
aXRlczoKPj4gPiBPbiBUaHUsIFNlcCAyMiwgMjAxNiBhdCAwOTozMzoxNVBNIC0wNjAwLCBLZXZp
biBMb2NrZSB3cm90ZToKPj4gPj4gVGhpcyBtYWNybyBob2xkcyB0aGUgQyBjb21waWxlciBmbGFn
KHMpIHRvIGZvcmNlIGlucHV0IGZpbGVzIHRvIGJlCj4+ID4+IHJlY29nbml6ZWQgYXMgQyBzb3Vy
Y2VzIHJlZ2FyZGxlc3Mgb2YgZXh0ZW5zaW9uLiAgSXQgaXMgZGVmaW5lZCB0byBhbGxvdwo+PiA+
PiBvdmVycmlkaW5nIG9uIHRoZSBtYWtlIGNvbW1hbmQgbGluZS4KPj4gPj4gCj4+ID4+IFNpZ25l
ZC1vZmYtYnk6IEtldmluIExvY2tlIDxrZXZpbkBrZXZpbmxvY2tlLm5hbWU+Cj4+ID4KPj4gPiBT
by4uIHRoaXMgYXBwcm9hY2ggd29ya3MuCj4+ID4KPj4gPiBCdXQgSSd2ZSBiZWVuIHdvbmRlcmlu
ZyBmb3IgYSB3aGlsZSBpZiB0aGUgd2VpcmQgdGhpbmcgd2UgZG8gb2YgaGF2aW5nCj4+ID4gdGhl
IF9pbmZvIGZpbGVzIG5vdCBoYXZlIGEgLmMgZXh0ZW5zaW9uIGlzIGEgZ29vZCBpZGVhLgo+PiA+
Cj4+ID4gSSB0aGluayB0aGUgdW5kZXJzY29yZSBlbm91Z2ggaXMgcHJvYmFibHkgZW5vdWdoIHRv
IG1hcmsgdGhvc2UKPj4gPiBzcGVjaWFsLCBzbyB0aGluZ3MgbWlnaHQgYmUgbGVzcyBtZXNzeSBp
ZiB3ZSBqdXN0IGNhbGxlZCB0aGVtIF9pbmZvLmMuCj4+ID4KPj4gPiBSdXN0eSwgdGhvdWdodHM/
Cj4+IAo+PiBfaW5mby5jIGJyZWFrcyB0aGUgImNvbXBpbGUgKi5jIHRvIGdldCB0aGUgbW9kdWxl
IiBydWxlLCB0aG91Z2guCj4KPiBXaGljaCBpcyBhbHJlYWR5IGJyb2tlbiBieSBtb2R1bGVzIHdo
aWNoIGhhdmUgYSBub24tdHJpdmlhbCBNYWtlZmlsZQo+IGZyYWdtZW50IChsaWtlIG50ZGIpLgoK
Tm90IGF0IGFsbCEgIG50ZGIncyBNYWtlZmlsZSBpcyBhIHJlbGljIGZyb20gd2hlbiBpdCB3YXMg
b3V0LW9mLXRyZWUuCkl0IGJ1aWxkcyBvdGhlciB0aGluZ3MsIGJ1dCB0aGUgbW9kdWxlIGJ1aWxk
cyBmaW5lLgoKQ2hlZXJzLApSdXN0eS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0
dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
