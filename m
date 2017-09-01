From: Ian Zimmerman <itz@very.loosely.org>
Subject: Annoying warning, a.k.a. how to add to CFLAGS
Date: Thu, 31 Aug 2017 20:23:50 -0700
Message-ID: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
Reply-To: ccan@lists.ozlabs.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ahiker.mooo.com (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xk4Xw4XL1zDqbZ
 for <ccan@lists.ozlabs.org>; Fri,  1 Sep 2017 13:31:44 +1000 (AEST)
Received: from [10.8.78.6] (port=59568 helo=matica.foolinux.mooo.com)
 by ahiker.mooo.com with esmtp (Exim 4.89)
 (envelope-from <itz@ahiker.mooo.com>) id 1dncYo-0000x1-3D
 for ccan@lists.ozlabs.org; Thu, 31 Aug 2017 20:23:58 -0700
Received: from itz by matica.foolinux.mooo.com with local (Exim 4.89)
 (envelope-from <itz@ahiker.mooo.com>) id 1dncYg-0001xA-Fr
 for ccan@lists.ozlabs.org; Thu, 31 Aug 2017 20:23:50 -0700
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

V2hlbiBJIGNoZWNrb3V0IGN1cnJlbnQgbWFzdGVyLCBydW4gLi90b29scy9jb25maWd1cmF0b3Iv
Y29uZmlndXJhdG9yID4KY29uZmlnLmggYW5kIHRoZW4gbWFrZSwgSSBnZXQgZXhhY3RseSAxIHdh
cm5pbmcgZm9yIHRoZSB3aG9sZSB0aGluZzoKCmNjYW4vc3RyZ3JwL3N0cmdycC5jOiBJbiBmdW5j
dGlvbiDigJhncnBfZm9y4oCZOgpjY2FuL3N0cmdycC9zdHJncnAuYzoyOTY6MDogd2FybmluZzog
aWdub3JpbmcgI3ByYWdtYSBvbXAgcGFyYWxsZWwgWy1XdW5rbm93bi1wcmFnbWFzXQogICAgICNw
cmFnbWEgb21wIHBhcmFsbGVsIGZvciBzY2hlZHVsZShkeW5hbWljKQoKSSBmaWd1cmVkIG91dCB0
aGF0IEkgY2FuIHNpbGVuY2UgdGhhdCBieSBhZGRpbmcgLWZvcGVubXAgdG8gbXkgQ0ZMQUdTLgpC
dXQgaG93IHRvIGRvIHRoYXQgcGVybWFuZW50bHk/ICBJIGRvbid0IHdhbnQgdG8gc3BlY2lmeSB0
aGF0IG9uIHRoZQpjb21tYW5kIGxpbmUgZXZlcnkgdGltZSwgYW5kIEkgYWxzbyBkb24ndCB3YW50
IHRvIHNldCBpdCBpbiB0aGUKZW52aXJvbm1lbnQgYmVjYXVzZSBzb21ldGltZXMgSSBjb21waWxl
IG90aGVyIHRoaW5ncyB0aGFuIGNjYW4gOy0pCgpJcyB0aGVyZSBhIHJlYXNvbiB3aHkgdGhpcyBp
cyBub3QgaW4gdGhlIG1hc3RlciBNYWtlZmlsZT8KCi0tIApQbGVhc2UgZG9uJ3QgQ2M6IG1lIHBy
aXZhdGVseSBvbiBtYWlsaW5nIGxpc3RzIGFuZCBVc2VuZXQsCmlmIHlvdSBhbHNvIHBvc3QgdGhl
IGZvbGxvd3VwIHRvIHRoZSBsaXN0IG9yIG5ld3Nncm91cC4KRG8gb2J2aW91cyB0cmFuc2Zvcm1h
dGlvbiBvbiBkb21haW4gdG8gcmVwbHkgcHJpdmF0ZWx5IF9vbmx5XyBvbiBVc2VuZXQuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBs
aXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGlu
Zm8vY2Nhbgo=
