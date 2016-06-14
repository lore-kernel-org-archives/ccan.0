From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/5] altstack: Don't use 0 pointer literals
Date: Tue, 14 Jun 2016 13:45:10 +0930
Message-ID: <87eg8076ep.fsf@rustcorp.com.au>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-5-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJNPh_AUB5+0GhJ1W5GQSqN1efRpxPFajUKOPXdsVe4nng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTGXP3nmYzDqgH
 for <ccan@lists.ozlabs.org>; Tue, 14 Jun 2016 14:15:33 +1000 (AEST)
In-Reply-To: <CACNkOJNPh_AUB5+0GhJ1W5GQSqN1efRpxPFajUKOPXdsVe4nng@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@dancancode.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

RGFuIEdvb2QgPGRhbkBkYW5jYW5jb2RlLmNvbT4gd3JpdGVzOgo+IEhpIERhdmlkLAo+Cj4gSSdt
IGJhY2sgaG9tZSBpbiBmcm9udCBvZiBhIHJlYWwga2V5Ym9hcmQsIGFuZCB3YW50IHRvIGZvbGxv
dyB1cCB3aXRoIHlvdQo+IGFib3V0IHlvdXIgcGF0Y2hlcy4gIEkgbXVzdCBhZG1pdCB0aGF0IG15
IHVzdWFsIHByYWN0aWNlIGlzIHRvIHVzZSBOVUxMLAo+IGFuZCBub3QgMC4gIEFyb3VuZCB0aGUg
dGltZSBJIHdyb3RlIGFsdHN0YWNrIEkgaGFkIHJlY2VudGx5IHJlYWQgSmVuCj4gR3VzdGVkdCdz
IGJvb2ssIE1vZGVybiBDLiAgSW4gaXQsIGhlIG1ha2VzIHRoZSBwb2ludCB0aGF0IE5VTEwgaGlk
ZXMgbW9yZQo+IHRoYW4gaXQgY2xhcmlmaWVzIChzZWUgc2VjdGlvbiAxMS43KS4KCihJIGRvbid0
IHJlYWxseSBjYXJlOiB5b3VyIGNvZGUsIHlvdXIgc3R5bGUpLiAgQnV0Li4uCgpIZSBpcyBzbyBo
b3JyaWZpY2FsbHkgd3JvbmcsIGl0J3MgYW1hemluZy4KClNlY3Rpb24gNy4xNyBpcyBsb29zZW5l
ZCBmcm9tIEFOU0kgQyB3aGljaCBzYWlkIE5VTEwgd2FzIDAsIHByZXN1bWFibHkKdG8gKmFsbG93
KiBjb21waWxlcnMgdG8gYXZvaWQgdGhlIHZhcmFyZ3MgaXNzdWUuICBBIGNvbXBpbGVyICpjb3Vs
ZCogZG8KaW5zYW5lIHNoaXQgdG8gbWFrZSB0aGF0IHByb2JsZW0gZXZlbiB3b3JzZSwgYnV0IHlv
dSB3b3VsZCBuZXZlciB1c2UKc3VjaCBhIGNvbXBpbGVyLiAgVGhlcmUgYXJlIG90aGVyIGxlZ2Fs
LWJ1dC1pbnNhbmUgdGhpbmdzIGEgY29tcGlsZXIgY2FuCmRvLCB0b28sIGFuZCB0aGUgYW5zd2Vy
IGlzIHRoZSBzYW1lOyByZWFsIGNvZGUgd29uJ3Qgd29yaywgbm9ib2R5IGVsc2UKY2FyZXMuCgpP
VE9ILCB1c2luZyAwIGluIHBsYWNlIG9mIE5VTEwgbWFrZXMgZm9yIG11Y2ggbW9yZSBwb3RlbnRp
YWwgdHlwZSBvcmRlcgpjb25mdXNpb24uICBOb3QgdG8gbWVudGlvbiBjb25mdXNpbmcgZXZlcnkg
ZGFtbiBDIHByb2dyYW1tZXIgb24gdGhlCnBsYW5ldC4KCk5vdGUsIEkgYWxzbyBhc3N1bWUgTlVM
TCBpcyBhbGwgemVyby1iaXRzLCB0aGF0IHNpemVfdCBjYW4gaG9sZCBhCnB0cmRpZmZfdCwgYW5k
IHRoYXQgYSBwb2ludGVyIHRvIGEgZnVuY3Rpb24gd2hpY2ggdGFrZXMgYSB0eXBlICoKYXJndW1l
bnQgY2FuIGJlIGNhc3QgYW5kIGNhbGxlZCBhcyBhIGZ1bmN0aW9uIHdoaWNoIHRha2VzIGEgdm9p
ZCAqLgoKSWYgc29tZW9uZSBwb3J0cyBDQ0FOIHRvIGEgcGxhdGZvcm0gd2hlcmUgdGhvc2UgYXJl
IG5vdCB0cnVlLCBJJ2QgYmUKZmFzY2luYXRlZC4uLgoKQ2hlZXJzLApSdXN0eS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QK
Y2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9j
Y2FuCg==
