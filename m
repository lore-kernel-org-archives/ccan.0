From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 3/3] Makefile-web: Quote the names in the error
	message
Date: Wed,  9 Dec 2015 11:47:52 +1030
Message-ID: <1449623872-12857-3-git-send-email-joel@jms.id.au>
References: <1449623872-12857-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9A0371A05C8
 for <ccan@lists.ozlabs.org>; Wed,  9 Dec 2015 12:18:10 +1100 (AEDT)
Received: by pacwq6 with SMTP id wq6so20582303pac.1
 for <ccan@lists.ozlabs.org>; Tue, 08 Dec 2015 17:18:09 -0800 (PST)
Received: from icarus.au.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 62sm7249460pfl.90.2015.12.08.17.18.07
 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Dec 2015 17:18:08 -0800 (PST)
In-Reply-To: <1449623872-12857-1-git-send-email-joel@jms.id.au>
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

IHByb2dyZXNzIGZvdW5kIGJ1dCBmdWJhciBpbiBNT0QKCmlzIG5vdzoKCiAncHJvZ3Jlc3MnIGZv
dW5kIGJ1dCAnZnViYXInIGluIE1PRAoKU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2Vs
QGptcy5pZC5hdT4KLS0tCiBNYWtlZmlsZS13ZWIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZS13ZWIgYi9N
YWtlZmlsZS13ZWIKaW5kZXggM2I5ZjExMTI0ODI0Li5hN2Y5Mjk3MGRlMTkgMTAwNjQ0Ci0tLSBh
L01ha2VmaWxlLXdlYgorKysgYi9NYWtlZmlsZS13ZWIKQEAgLTE1LDcgKzE1LDcgQEAgdXBsb2Fk
OiBmYXN0Y2hlY2sgbW9kY2hlY2sKIAogIyBDaGVjayBNT0RTIGxpc3QgaW4gTWFrZWZpbGUtY2Nh
biBtYXRjaGVzIG1vZHVsZXMgd2UgZmluZC4KIG1vZGNoZWNrOgotCUBGT1VORD0kJChlY2hvICQk
KGZpbmQgY2NhbiAtbmFtZSBfaW5mbyB8IHNlZCAncyxjY2FuL1woLipcKS9faW5mbyxcMSwnIHwg
c29ydCkgKTsgTElTVEVEPSQkKGVjaG8gJCQoZWNobyAkKE1PRFMpIHwgdHIgJyAnICdcMDEyJyB8
IHNvcnQpICk7IGlmIFsgIiQkRk9VTkQiID0gIiQkTElTVEVEIiBdOyB0aGVuIGV4aXQgMDsgZmk7
IHdoaWxlIHRydWU7IGRvIGE9IiQke0ZPVU5EJSUgKn0iOyBiPSIkJHtMSVNURUQlJSAqfSI7IGlm
IFsgIiQkYSIgIT0gIiQkYiIgXTsgdGhlbiBlY2hvICIkJGEgZm91bmQgYnV0ICQkYiBpbiBNT0Qi
ID4mMjsgZXhpdCAxOyBmaTsgRk9VTkQ9IiQke0ZPVU5EIyogfSI7IExJU1RFRD0iJCR7TElTVEVE
IyogfSI7IGRvbmUKKwlARk9VTkQ9JCQoZWNobyAkJChmaW5kIGNjYW4gLW5hbWUgX2luZm8gfCBz
ZWQgJ3MsY2Nhbi9cKC4qXCkvX2luZm8sXDEsJyB8IHNvcnQpICk7IExJU1RFRD0kJChlY2hvICQk
KGVjaG8gJChNT0RTKSB8IHRyICcgJyAnXDAxMicgfCBzb3J0KSApOyBpZiBbICIkJEZPVU5EIiA9
ICIkJExJU1RFRCIgXTsgdGhlbiBleGl0IDA7IGZpOyB3aGlsZSB0cnVlOyBkbyBhPSIkJHtGT1VO
RCUlICp9IjsgYj0iJCR7TElTVEVEJSUgKn0iOyBpZiBbICIkJGEiICE9ICIkJGIiIF07IHRoZW4g
ZWNobyAiJyQkYScgZm91bmQgYnV0ICckJGInIGluIE1PRCIgPiYyOyBleGl0IDE7IGZpOyBGT1VO
RD0iJCR7Rk9VTkQjKiB9IjsgTElTVEVEPSIkJHtMSVNURUQjKiB9IjsgZG9uZQogCiBjbGVhbi10
cmVlOgogCVsgIiQoV0VCREVWKSIgXSB8fCAhIGdpdCBzdGF0dXMgLS1wb3JjZWxhaW4gfCBncmVw
IC4KLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0
cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
