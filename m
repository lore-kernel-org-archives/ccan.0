From: Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH] cpuid: increment over size of cpu array,
 not just first one.
Date: Fri, 04 Nov 2016 21:14:21 +1030
Message-ID: <87fun7plru.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9JSP2ddlzDvXw
 for <ccan@lists.ozlabs.org>; Fri,  4 Nov 2016 21:47:17 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Ahmed Samy <f.fallen45@gmail.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

Rm91bmQgYnkgUENTIFN1aXRlLgoKUmVwb3J0ZWQtYnk6IEpvbiBHcmlmZml0aHMKU2lnbmVkLW9m
Zi1ieTogUnVzdHkgUnVzc2VsbCA8cnVzdHlAcnVzdGNvcnAuY29tLmF1PgoKZGlmZiAtLWdpdCBh
L2NjYW4vY3B1aWQvY3B1aWQuYyBiL2NjYW4vY3B1aWQvY3B1aWQuYwppbmRleCA5YTQyZDgzLi40
NTEwZGVmIDEwMDY0NAotLS0gYS9jY2FuL2NwdWlkL2NwdWlkLmMKKysrIGIvY2Nhbi9jcHVpZC9j
cHVpZC5jCkBAIC0yMzcsNyArMjM3LDcgQEAgY3B1dHlwZV90IGNwdWlkX2dldF9jcHVfdHlwZSh2
b2lkKQogCQl1aW50MzJfdCBpOwogCiAJCWdldF9jcHVpZChDUFVJRF9WRU5ET1JJRCwgJmksICZ1
LmJ1ZnUzMlswXSwgJnUuYnVmdTMyWzJdLCAmdS5idWZ1MzJbMV0pOwotCQlmb3IgKGkgPSAwOyBp
IDwgc2l6ZW9mKGNfY3B1bmFtZXMpIC8gc2l6ZW9mKGNfY3B1bmFtZXMpOyArK2kpIHsKKwkJZm9y
IChpID0gMDsgaSA8IHNpemVvZihjX2NwdW5hbWVzKSAvIHNpemVvZihjX2NwdW5hbWVzWzBdKTsg
KytpKSB7CiAJCQlpZiAoc3RybmNtcChjX2NwdW5hbWVzW2ldLCB1LmJ1ZiwgMTIpID09IDApIHsK
IAkJCQljcHV0eXBlID0gKGNwdXR5cGVfdClpOwogCQkJCWJyZWFrOwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxp
c3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
