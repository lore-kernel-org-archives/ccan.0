From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/7] tools: Remove fd leak
Date: Mon,  3 Apr 2017 21:11:08 +1000
Message-ID: <20170403111112.27201-4-david@gibson.dropbear.id.au>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxTts6qMQzDqGv
 for <ccan@lists.ozlabs.org>; Mon,  3 Apr 2017 21:11:17 +1000 (AEST)
In-Reply-To: <20170403111112.27201-1-david@gibson.dropbear.id.au>
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
Cc: rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org

Y29tcGlsZV9pbmZvKCkgY2FuIGxlYWsgYW4gb3BlbiBmaWxlIGRlc2NyaXB0b3Igd3JpdGVfYWxs
KCkgZmFpbHMuICBUaGlzCmNvcnJlY3RzIGl0LgoKRm91bmQgYnkgQ292ZXJpdHkuCgpTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT4KLS0tCiB0
b29scy9kZXBlbmRzLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9kZXBlbmRzLmMgYi90b29scy9kZXBl
bmRzLmMKaW5kZXggZTZhNzlkNy4uMzZiNTgwOSAxMDA2NDQKLS0tIGEvdG9vbHMvZGVwZW5kcy5j
CisrKyBiL3Rvb2xzL2RlcGVuZHMuYwpAQCAtNTQsOCArNTQsMTAgQEAgY2hhciAqY29tcGlsZV9p
bmZvKGNvbnN0IHZvaWQgKmN0eCwgY29uc3QgY2hhciAqZGlyKQogCWZkID0gb3BlbihpbmZvX2Nf
ZmlsZSwgT19XUk9OTFl8T19DUkVBVHxPX0VYQ0wsIDA2MDApOwogCWlmIChmZCA8IDApCiAJCXJl
dHVybiBOVUxMOwotCWlmICghd3JpdGVfYWxsKGZkLCBpbmZvLCB0YWxfY291bnQoaW5mbyktMSkp
CisJaWYgKCF3cml0ZV9hbGwoZmQsIGluZm8sIHRhbF9jb3VudChpbmZvKS0xKSkgeworCQljbG9z
ZShmZCk7CiAJCXJldHVybiBOVUxMOworCX0KIAogCWlmIChjbG9zZShmZCkgIT0gMCkKIAkJcmV0
dXJuIE5VTEw7Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBz
Oi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
