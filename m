From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 3/9] configurator: Inline err.h functions from
 musl libc
Date: Tue, 27 Sep 2016 15:41:12 +0930
Message-ID: <878tud3m9r.fsf@rustcorp.com.au>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <d7b109044f3d73a3f91c56136ad487fe07b518a7.1474239353.git.kevin@kevinlocke.name>
 <20160920050309.GM20488@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skC5q3ff9zDrWP
 for <ccan@lists.ozlabs.org>; Wed, 28 Sep 2016 06:26:07 +1000 (AEST)
In-Reply-To: <20160920050309.GM20488@umbus>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, Kevin Locke <kevin@kevinlocke.name>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBPbiBT
dW4sIFNlcCAxOCwgMjAxNiBhdCAwNjo1MjowMFBNIC0wNjAwLCBLZXZpbiBMb2NrZSB3cm90ZToK
Pj4gU2luY2Ugd2UgY2FuJ3QgdXNlIEhBVkVfRVJSX0ggaW4gY29uZmlndXJhdG9yLCBwcm92aWRl
IGEgZGVmaW5pdGlvbiBmb3IKPj4gdGhlIGVyci5oIGZ1bmN0aW9ucyB1c2VkLiAgVGhlIHZlcnNp
b24gcHJvdmlkZWQgaXMgdGhlIG9uZSBmcm9tIG11c2wKPj4gbGliYywgc2luY2UgaXQgaXMgY29u
Y2lzZSBhbmQgc2hhcmVzIHRoZSBNSVQgTGljZW5zZSB3aXRoIGNvbmZpZ3VyYXRvci4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IEtldmluIExvY2tlIDxrZXZpbkBrZXZpbmxvY2tlLm5hbWU+Cj4KPiBS
aWdodCwgc28gdGhpcyBpcyBhIGdlbmVyYWwgcHJvYmxlbSBvZiBob3cgZG8gd2UgbWFrZSB0aGUg
Y29uZmlndXJhdG9yCj4gaXRzZWxmIHN1ZmZpY2llbnRseSBwb3J0YWJsZSwgc2luY2UgaXQgaGFz
bid0IHlldCB3b3JrZWQgb3V0IHRoZQo+IHBvcnRiaWxpdHkgbWFjcm9zLgo+Cj4gUGVyc29uYWxs
eSwgSSB0aGluayBkdXBsaWNhdGluZyB0aGVzZSBoZXJlIGlzIGFuIGFjY2VwdGFibGUKPiB3b3Jr
YXJvdW5kLiAgUnVzdHksIGFueSBvcGluaW9uPwoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSB3YXMg
YXdheSBmb3IgYSB3ZWVrLCB0aGVuIGxhcHRvcCBkZWF0aC4uLgoKWWVzLCB0aGlzIGlzIHRoZSBy
aWdodCBhcHByb2FjaC4gIGNvbmZpZ3VyYXRvciBoYXMgdG8gc3RhbmQgYWxvbmUuCgpUaGFua3Mh
ClJ1c3R5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpj
Y2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxh
YnMub3JnL2xpc3RpbmZvL2NjYW4K
