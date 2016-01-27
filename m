From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/5] idtree: Fix comparison is always false warning
Date: Thu, 28 Jan 2016 00:53:30 +1100
Message-ID: <1453902812-18621-4-git-send-email-david@gibson.dropbear.id.au>
References: <1453902812-18621-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1AF2D1A0174
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

aWR0cmVlLmM6MTQ2IHRyaWdnZXJzIGEgImNvbXBhcmlzb24gaXMgYWx3YXlzIGZhbHNlIiB3YXJu
aW5nIG9uIHNvbWUKY29tcGlsZXIgY29uZmlndXJhdGlvbnMsIHNpbmNlIHRoZSAnaWQnIHZhcmlh
YmxlIGlzIHVuc2lnbmVkLgoKRWxzZXdoZXJlIGluIHRoZSBtb2R1bGUgaWRzIHNlZW0gdG8gYmUg
cmVwcmVzZW50ZWQgYnkgKHNpZ25lZCkgaW50cywgc28KdXNlIHRoZSBzYW1lIGNvbnZlbnRpb24g
aGVyZSwgc3VwcHJlc3NpbmcgdGhlIHdhcm5pbmcgYW5kIGFsc28gbWF5YmUgYmVpbmcKbW9yZSBj
b3JyZWN0IGluIG90aGVyIHdheXMuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlk
QGdpYnNvbi5kcm9wYmVhci5pZC5hdT4KLS0tCiBjY2FuL2lkdHJlZS9pZHRyZWUuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvY2Nhbi9pZHRyZWUvaWR0cmVlLmMgYi9jY2FuL2lkdHJlZS9pZHRyZWUuYwppbmRleCBl
ODg3MzkyLi40OGFkZDZhIDEwMDY0NAotLS0gYS9jY2FuL2lkdHJlZS9pZHRyZWUuYworKysgYi9j
Y2FuL2lkdHJlZS9pZHRyZWUuYwpAQCAtMTAwLDcgKzEwMCw4IEBAIHN0YXRpYyBpbnQgc3ViX2Fs
bG9jKHN0cnVjdCBpZHRyZWUgKmlkcCwgY29uc3Qgdm9pZCAqcHRyLCBpbnQgKnN0YXJ0aW5nX2lk
KQogCWludCBuLCBtLCBzaDsKIAlzdHJ1Y3QgaWR0cmVlX2xheWVyICpwLCAqcG47CiAJc3RydWN0
IGlkdHJlZV9sYXllciAqcGFbTUFYX0xFVkVMKzFdOwotCXVuc2lnbmVkIGludCBsLCBpZCwgb2lk
OworCXVuc2lnbmVkIGludCBsOworCWludCBpZCwgb2lkOwogCXVpbnQzMl90IGJtOwogCiAJbWVt
c2V0KHBhLCAwLCBzaXplb2YocGEpKTsKLS0gCjIuNS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96
bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
