From: "Emilio G. Cota" <cota@braap.org>
Subject: Re: [PATCH 2/5] aga,agar: Dijkstra's algorithm
Date: Thu, 12 Nov 2015 16:59:51 -0500
Message-ID: <20151112215951.GA16207@flamenco>
References: <1447328568-14917-1-git-send-email-david@gibson.dropbear.id.au>
 <1447328568-14917-3-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DB2931A0225
 for <ccan@lists.ozlabs.org>; Fri, 13 Nov 2015 09:07:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 04B3620498
 for <ccan@lists.ozlabs.org>; Thu, 12 Nov 2015 16:59:37 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1447328568-14917-3-git-send-email-david@gibson.dropbear.id.au>
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

T24gVGh1LCBOb3YgMTIsIDIwMTUgYXQgMjI6NDI6NDUgKzExMDAsIERhdmlkIEdpYnNvbiB3cm90
ZToKPiBUaGlzIHVzZXMgdGhlIGxwcSBtb2R1bGUgYXMgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRo
ZSBwcmlvcml0eSBxdWV1ZS4gIFRoYXQKPiBtZWFucyB0aGlzIGltcGxlbWVudGF0aW9uIGlzIHNv
bWUgd2F5IGJlaGluZCB0aGUgdGhlb3JldGljYWwgZWZmaWNpZW5jeSBvZgo+IERpamtzdHJhJ3Mg
YWxnb3JpdGhtLiAgSXQgc2hvdWxkIGJlIHJlYXNvbmFibHkgc3RyYWlnaHRmb3J3YXJkIHRvIHN3
YXAgb3V0Cj4gdGhlIHByaW9yaXR5IHF1ZXVlIGZvciBhIGJldHRlciBvbmUgaW4gdGhlIGZ1dHVy
ZSwgdGhvdWdoLgoKSGF2ZSB5b3UgY29uc2lkZXJlZCB1c2luZyB0aGUgaGVhcCBtb2R1bGU/CgpU
aGFua3MsCgoJCUVtaWxpbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9s
aXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
