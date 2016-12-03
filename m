From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCHv2 2/2] generator: Rewrite to use coroutine module
Date: Sat, 03 Dec 2016 10:43:43 +1030
Message-ID: <87h96l98eg.fsf@rustcorp.com.au>
References: <20161201112840.32213-1-david@gibson.dropbear.id.au>
 <20161201112840.32213-2-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVsm250v2zDw43
 for <ccan@lists.ozlabs.org>; Sat,  3 Dec 2016 11:46:42 +1100 (AEDT)
In-Reply-To: <20161201112840.32213-2-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>, ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+IHdyaXRlczoKPiBVc2Ug
dGhlIG5ldyBjb3JvdXRpbmUgbW9kdWxlIHRvIGFic3RyYWN0IGF3YXkgb3VyIGRlcGVuZGVuY2Ug
b24KPiB1Y29udGV4dC4KClRoZXNlIGJvdGggbG9vayBncmVhdCEKCkNoZWVycywKUnVzdHkuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGlu
ZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlz
dGluZm8vY2Nhbgo=
