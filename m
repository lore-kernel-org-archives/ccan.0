From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/5] altstack: cleanups
Date: Fri,  3 Jun 2016 18:41:58 +1000
Message-ID: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLcx801VxzDqkL
 for <ccan@lists.ozlabs.org>; Fri,  3 Jun 2016 18:40:27 +1000 (AEST)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: dan@dancancode.com
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

RGFuLAoKSGVyZSBhcmUgYSBidW5jaCBvZiBhc3NvcnRlZCBjbGVhbnVwcyB0byB0aGUgYWx0c3Rh
Y2sgbW9kdWxlLiAgSWYgdGhleQpzZWVtIHJlYXNvbmFibGUgdG8geW91LCBwbGVhc2UgYXBwbHku
CgpEYXZpZCBHaWJzb24gKDUpOgogIGFsdHN0YWNrOiBDb25zb2xpZGF0ZSB0aHJlYWQtbG9jYWwg
dmFyaWFibGVzCiAgYWx0c3RhY2s6IFJlc3RvcmUgYWx0ZXJuYXRlIHNpZ25hbCBzdGFjayBzdGF0
ZQogIGFsdHN0YWNrOiBVc2UgcHRyaW50IGluc3RlYWQgb2YgYmFyZSBjYXN0cwogIGFsdHN0YWNr
OiBEb24ndCB1c2UgMCBwb2ludGVyIGxpdGVyYWxzCiAgYWx0c3RhY2s6IERvbid0IGxvZyBpbnRl
cm5hbCBjYWxscyBpbiB0ZXN0IGNhc2VzCgogY2Nhbi9hbHRzdGFjay9faW5mbyAgICAgIHwgIDkg
KysrKy0tCiBjY2FuL2FsdHN0YWNrL2FsdHN0YWNrLmMgfCA3OCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGNjYW4vYWx0c3RhY2svYWx0c3RhY2suaCB8
ICA2ICsrLS0KIGNjYW4vYWx0c3RhY2svdGVzdC9ydW4uYyB8IDc2ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0
aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCgotLSAKMi41LjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMu
b3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
