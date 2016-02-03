From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: Test failure in rszshm
Date: Wed, 03 Feb 2016 16:22:09 +1030
Message-ID: <87fuxabat2.fsf@rustcorp.com.au>
References: <20160201110809.GK23043@voom.redhat.com>
 <CACNkOJNJS=8MOqHQA-kGwJV6odXzYY3Tz2HjmWuaj_0tPg_yYQ@mail.gmail.com>
 <20160202133632.GE15080@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C4C171A0220
 for <ccan@lists.ozlabs.org>; Wed,  3 Feb 2016 16:52:30 +1100 (AEDT)
In-Reply-To: <20160202133632.GE15080@voom.fritz.box>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, Dan Good <dan@gooddan.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBPbiBN
b24sIEZlYiAwMSwgMjAxNiBhdCAwNDoxNTowNlBNICswMDAwLCBEYW4gR29vZCB3cm90ZToKPj4g
VGhhdCBwYXJ0aWN1bGFyIHRlc3QgaXMgYXNraW5nIG1tYXAgdG8gY3JlYXRlIGEgbWFwcGluZyBv
ZiBzaXplIFVJTlQ2NF9NQVgKPj4gYW5kIGV4cGVjdGluZyBpdCB0byBmYWlsIHdpdGggRU5PTUVN
LiAgQXJlIHlvdSBnZXR0aW5nIGEgZGlmZmVyZW50Cj4+IGVycm5vPwo+Cj4gWWVzLCBpdCBzZWVt
cyBJJ20gZ2V0dGluZyBFSU5WQUwuICBCdXQgdGhlIEVJTlZBTCBpcyBjb21pbmcgZnJvbSB0aGUK
PiBtbWFwKCkgY2FsbCwgKm5vdCogdGhlIGluaXRpYWwgdGVzdHMgaW4gcnN6c2htX21rKCkgd2hp
Y2ggZXhwbGljaXRseQo+IHNldCBFSU5WQUwuCj4KPiBCdXQgd2hhdCdzICpyZWFsbHkqIHdlaXJk
LCBpcyBJIGdldCBpdCB3aGVuIEkgcnVuIGNjYW5saW50IGRpcmVjdGx5LAo+IGJ1dCBub3Qgd2hl
biBpdCB0aGVuIHJlLXJ1bnMgdGhlIHRlc3RzIHVuZGVyIGdkYi4gIEFuZCBhcyBmYXIgYXMgSSBj
YW4KPiB0ZWxsIG1tYXAoKSBpcyBnZXR0aW5nIGV4YWN0bHkgdGhlIHNhbWUgYXJndW1lbnRzIDov
LgoKSSBnZXQgbm8gZXJyb3Igd2hlbiBJIHJ1biBpdCBkaXJlY3RseSwgYW5kIGVycm9yIHVuZGVy
IGNjYW5saW50LAphbmQgc3VjY2VzcyB1bmRlciBHREIuCgpBaCwgdmFsZ3JpbmQhICBJbiBwYXJ0
aWN1bGFyLCBpdCByZXR1cm5zIEVJTlZBTCBpbnN0ZWFkIG9mIEVOT01FTSB3aGVuCnlvdSBhc2sg
aXQgdG8gbW1hcCAxODQ0Njc0NDA3MzcwOTU0NzUyMCBieXRlcyBhZGRyZXNzLgoKQW5kIHRoZW4g
aXQgZmFpbHMgZHVlIHRvOgoKPT0yOTM2OD09IEludmFsaWQgcmVhZCBvZiBzaXplIDQKPT0yOTM2
OD09ICAgIGF0IDB4NDAzM0JDOiBtYWluIChydW4uYzoxMzgpCj09MjkzNjg9PSAgQWRkcmVzcyAw
eDQwMDAwMDAwMDAxOCBpcyBub3Qgc3RhY2snZCwgbWFsbG9jJ2Qgb3IgKHJlY2VudGx5KSBmcmVl
J2QKClNvLCB0aGlzIG5lZWRzIHZhbGdyaW5kIGRpc2FibGVkIGFzIHdlbGwuCgpBc3N1bWluZyB0
aGF0J3MgT0ssIEkndmUgcHVzaGVkIHRoYXQgZm9yIG5vdy4KCkNoZWVycywKUnVzdHkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBs
aXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGlu
Zm8vY2Nhbgo=
