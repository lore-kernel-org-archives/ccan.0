From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/4] altstack: Declare memory clobbers
Date: Tue, 16 Feb 2016 17:09:24 +1100
Message-ID: <1455602965-3201-4-git-send-email-david@gibson.dropbear.id.au>
References: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B90C01A004C
 for <ccan@lists.ozlabs.org>; Tue, 16 Feb 2016 21:04:16 +1100 (AEDT)
In-Reply-To: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
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

YWx0c3RhY2sgaW5jbHVkZXMgYSBjb3VwbGUgb2YgaW5saW5lIGFzbSBibG9ja3Mgd2l0aCB4ODYg
cHVzaCBhbmQgcG9wCmluc3RydWN0aW9ucy4gIFRoZXNlIGluc3RydWN0aW9ucyB3aWxsIGFjY2Vz
cyBtZW1vcnkgKHRoZSBzdGFjayksIGJ1dAp0aGF0J3Mgbm90IGRlY2xhcmVkIGluIGlubGluZSBh
c20gc3RhdGVtZW50LiAgV2Ugc2VlbSB0byBiZSBnZXR0aW5nIGF3YXkKd2l0aCBpdCwgYnV0IGlu
IHRoZW9yeSB0aGF0IGNvdWxkIGFsbG93IHRoZSBjb21waWxlciB0byByZS1vcmRlciBhY2Nlc3Nl
cwp0byBsb2NhbCB2YXJpYWJsZXMgYWNyb3NzIHRoZSBhc20gYmxvY2suICBTaW5jZSB0aG9zZSBi
bG9ja3MgY2hhbmdlIHRoZQpsb2NhdGlvbiBvZiB0aGUgc3RhY2ssIHRoYXQgY291bGQgYmUgdmVy
eSBiYWQuCgpBZGRpbmcgYSAibWVtb3J5IiBjbG9iYmVyIHNob3VsZCBwcmV2ZW50IHRoaXMgKGVm
ZmVjdGl2ZWx5IG1ha2luZyB0aGUgYXNtCmJsb2NrcyBhIGNvbXBpbGVyIG1lbW9yeSBiYXJyaWVy
KS4KClNpZ25lZC1vZmYtYnk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlk
LmF1PgotLS0KIGNjYW4vYWx0c3RhY2svYWx0c3RhY2suYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY2Nhbi9h
bHRzdGFjay9hbHRzdGFjay5jIGIvY2Nhbi9hbHRzdGFjay9hbHRzdGFjay5jCmluZGV4IDY0MDM0
NGQuLjYzNTEyOTMgMTAwNjQ0Ci0tLSBhL2NjYW4vYWx0c3RhY2svYWx0c3RhY2suYworKysgYi9j
Y2FuL2FsdHN0YWNrL2FsdHN0YWNrLmMKQEAgLTEwOCw5ICsxMDgsMTAgQEAgaW50IGFsdHN0YWNr
KHJsaW1fdCBtYXgsIHZvaWQgKigqZm4pKHZvaWQgKiksIHZvaWQgKmFyZywgdm9pZCAqKm91dCkK
IAkJCSJtb3YgJTEsICUlcnNwXG5cdCIKIAkJCSJzdWIgJDgsICUlcnNwXG5cdCIKIAkJCSJwdXNo
ICUlcjEwIgotCQkJOiAiPXIiIChyc3Bfc2F2ZV9bMF0pIDogIjAiIChtICsgbWF4KSA6ICJyMTAi
KTsKKwkJCTogIj1yIiAocnNwX3NhdmVfWzBdKSA6ICIwIiAobSArIG1heCkgOiAicjEwIiwgIm1l
bW9yeSIpOwogCQlvdXRfID0gZm5fKGFyZ18pOwotCQlhc20gdm9sYXRpbGUgKCJwb3AgJXJzcCIp
OworCQlhc20gdm9sYXRpbGUgKCJwb3AgJSVyc3AiCisJCQkgICAgICA6IDogOiAibWVtb3J5Iik7
CiAJCXJldCA9IDA7CiAJCWlmIChvdXQpICpvdXQgPSBvdXRfOwogCX0KLS0gCjIuNS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcg
bGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3Rp
bmZvL2NjYW4K
