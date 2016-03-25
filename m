From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/3] staticmoduleinfo: Replace deprecated split()
	with explode()
Date: Fri, 25 Mar 2016 23:42:14 +1030
Message-ID: <1458911534-8822-4-git-send-email-andrew@aj.id.au>
References: <1458911534-8822-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from hapkido.dreamhost.com (hapkido.dreamhost.com [66.33.216.122])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWkHM6BBSzDq5k
 for <ccan@lists.ozlabs.org>; Sat, 26 Mar 2016 00:12:31 +1100 (AEDT)
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by hapkido.dreamhost.com (Postfix) with ESMTP id 6BBEEC9215
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:30 -0700 (PDT)
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id 6B0F9114068
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:28 -0700 (PDT)
Received: from lasair.aj.id.au (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 9727911406F
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:27 -0700 (PDT)
In-Reply-To: <1458911534-8822-1-git-send-email-andrew@aj.id.au>
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

c3BsaXQoKSB3YXMgZGVwcmVjYXRlZCBpbiBQSFA1IGFuZCB3YXMgcmVtb3ZlZCBpbiBQSFA3WzFd
LiBBbgphbHRlcm5hdGl2ZSBmdW5jdGlvbiBpcyBleHBsb2RlKCksIHdoaWNoIHdhcyBpbnRyb2R1
Y2VkIGluIFBIUDRbMV0uClNvIGdpdmVuIHdlIHByZXZpb3VzbHkgaGFkIGEgaGFyZCBkZXBlbmRl
bmN5IG9uIHRoZSBwaHA1IGJpbmFyeSwgc3dpdGNoCnRvIGV4cGxvZGUoKS4KClsxXSBodHRwczov
L3NlY3VyZS5waHAubmV0L21hbnVhbC9lbi9mdW5jdGlvbi5zcGxpdC5waHAKWzJdIGh0dHBzOi8v
c2VjdXJlLnBocC5uZXQvbWFudWFsL2VuL2Z1bmN0aW9uLmV4cGxvZGUucGhwCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgotLS0KIHdlYi9zdGF0aWNtb2R1
bGVpbmZvLnBocCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3dlYi9zdGF0aWNtb2R1bGVpbmZvLnBocCBiL3dlYi9zdGF0
aWNtb2R1bGVpbmZvLnBocAppbmRleCA3ZjM4OGMyLi5hYzRhYzY4IDEwMDY0NAotLS0gYS93ZWIv
c3RhdGljbW9kdWxlaW5mby5waHAKKysrIGIvd2ViL3N0YXRpY21vZHVsZWluZm8ucGhwCkBAIC02
Myw3ICs2Myw3IEBAIGlmICgkZXh0ZGVwZW5kcykgewogPGgzPkV4dGVybmFsIGRlcGVuZGVuY2ll
czo8L2gzPgogPHVsIGNsYXNzPSdleHRlcm5hbC1kZXBlbmRlbmNpZXMnPgogPD9waHAKLQlmb3Jl
YWNoIChzcGxpdCgiXG4iLCAkZXh0ZGVwZW5kcykgYXMgJGRlcCkgeworCWZvcmVhY2ggKGV4cGxv
ZGUoIlxuIiwgJGV4dGRlcGVuZHMpIGFzICRkZXApIHsKIAkJJGZpZWxkcz1wcmVnX3NwbGl0KCIv
XHMrLyIsICRkZXApOwogCQllY2hvICI8bGk+IiAuICRmaWVsZHNbMF0uJyAnOwogCQlpZiAoY291
bnQoJGZpZWxkcykgPiAxKQotLSAKMi43LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9y
ZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
