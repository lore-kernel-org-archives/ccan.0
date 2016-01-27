From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 5/5] idtree: Fix undefined behaviour (left shift of
	signed value)
Date: Thu, 28 Jan 2016 00:53:32 +1100
Message-ID: <1453902812-18621-6-git-send-email-david@gibson.dropbear.id.au>
References: <1453902812-18621-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 940BA1A0174
 for <ccan@lists.ozlabs.org>; Thu, 28 Jan 2016 00:52:38 +1100 (AEDT)
In-Reply-To: <1453902812-18621-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au, jim.houston@ccur.com
List-Id: ccan@lists.ozlabs.org

fjAgd2lsbCBiZSBzaWduZWQgYW5kIG5lZ2F0aXZlIG9uIGFueSAycyBjb21wbGVtZW50IHN5c3Rl
bSwgYW5kCmxlZnQgc2hpZnRpbmcgYSBuZWdhdGl2ZSB2YWx1ZSBoYXMgdW5kZWZpbmVkIGJlaGF2
aW91ciBpbiBDLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJv
cGJlYXIuaWQuYXU+Ci0tLQogY2Nhbi9pZHRyZWUvaWR0cmVlLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jY2FuL2lk
dHJlZS9pZHRyZWUuYyBiL2NjYW4vaWR0cmVlL2lkdHJlZS5jCmluZGV4IDViZDg4ODIuLjZlNzU0
NTAgMTAwNjQ0Ci0tLSBhL2NjYW4vaWR0cmVlL2lkdHJlZS5jCisrKyBiL2NjYW4vaWR0cmVlL2lk
dHJlZS5jCkBAIC0yNzgsNyArMjc4LDcgQEAgdm9pZCAqaWR0cmVlX2xvb2t1cChjb25zdCBzdHJ1
Y3QgaWR0cmVlICppZHAsIGludCBpZCkKIAkgKiBwcmVzZW50LiAgSWYgc28sIHRhaW4ndCBvbmUg
b2Ygb3VycyEKIAkgKi8KIAlpZiAobiArIElEVFJFRV9CSVRTIDwgMzEgJiYKLQkgICAgKGlkICYg
fih+MCA8PCBNQVhfSURfU0hJRlQpKSA+PiAobiArIElEVFJFRV9CSVRTKSkKKwkgICAgKGlkICYg
fih+MFUgPDwgTUFYX0lEX1NISUZUKSkgPj4gKG4gKyBJRFRSRUVfQklUUykpCiAJICAgICByZXR1
cm4gTlVMTDsKIAogCS8qIE1hc2sgb2ZmIHVwcGVyIGJpdHMgd2UgZG9uJ3QgdXNlIGZvciB0aGUg
c2VhcmNoLiAqLwotLSAKMi41LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRw
czovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
