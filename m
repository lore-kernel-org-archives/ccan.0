From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/3] Makefile-ccan: Add cppmagic to MODS_NO_SRC
Date: Fri, 25 Mar 2016 23:42:12 +1030
Message-ID: <1458911534-8822-2-git-send-email-andrew@aj.id.au>
References: <1458911534-8822-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from hapkido.dreamhost.com (hapkido.dreamhost.com [66.33.216.122])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWkHL0WG9zDq5k
 for <ccan@lists.ozlabs.org>; Sat, 26 Mar 2016 00:12:29 +1100 (AEDT)
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by hapkido.dreamhost.com (Postfix) with ESMTP id DFBCBC9222
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:27 -0700 (PDT)
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id DDB7D11406C
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:25 -0700 (PDT)
Received: from lasair.aj.id.au (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 2DDCA11406B
 for <ccan@lists.ozlabs.org>; Fri, 25 Mar 2016 06:12:24 -0700 (PDT)
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

VGhlIGVycm9yIGJlbG93IHdhcyBlbmNvdW50ZXJlZCB3aGVuIGJ1aWxkaW5nIHRoZSB3ZWJwYWdl
cyB0YXJnZXQ6CgogICAgJCBta2RpciAvdG1wL2NjYW4td2ViZGlyCiAgICAkIG1ha2UgV0VCRElS
PS90bXAvY2Nhbi13ZWJkaXIgd2VicGFnZXMKICAgIC4uLgogICAgaW50ZXItZGVwZW5kcwogICAg
WyAiIiBdIHx8ICEgZ2l0IHN0YXR1cyAtLXBvcmNlbGFpbiB8IGdyZXAgLgogICAgbWtkaXIgLXAg
L3RtcC9jY2FuLXdlYmRpci90YXJiYWxscwogICAgbWtkaXIgLXAgL3RtcC9jY2FuLXdlYmRpci90
YXJiYWxscy93aXRoLWRlcHMKICAgIG1rZGlyIC1wIC90bXAvY2Nhbi13ZWJkaXIvaW5mbwogICAg
Y3AgY29uZmlnLmggL3RtcC9jY2FuLXdlYmRpci9leGFtcGxlLWNvbmZpZy5oCiAgICAnY3BwbWFn
aWMnIGZvdW5kIGJ1dCAnY3B1aWQnIGluIE1PRAogICAgTWFrZWZpbGUtd2ViOjE4OiByZWNpcGUg
Zm9yIHRhcmdldCAnbW9kY2hlY2snIGZhaWxlZAogICAgbWFrZTogKioqIFttb2RjaGVja10gRXJy
b3IgMQogICAgbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KCkFkZCBj
cHBtYWdpYyB0byBNT0RTX05PX1NSQyB0byBhdm9pZCB0aGUgYnVpbGQgZmFpbHVyZS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Ci0tLQogTWFrZWZpbGUt
Y2NhbiB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUtY2NhbiBiL01ha2VmaWxlLWNjYW4KaW5kZXggYTBi
ZTU4Zi4uODY1ZGI5ZSAxMDA2NDQKLS0tIGEvTWFrZWZpbGUtY2NhbgorKysgYi9NYWtlZmlsZS1j
Y2FuCkBAIC0xNyw2ICsxNyw3IEBAIE1PRFNfTk9fU1JDIDo9IGFsaWdub2YgXAogCWNoZWNrX3R5
cGUgXAogCWNvbXBpbGVyIFwKIAljb250YWluZXJfb2YgXAorCWNwcG1hZ2ljIFwKIAlkYXJyYXkg
XAogCWVuZGlhbiBcCiAJbHF1ZXVlIFwKQEAgLTUwLDkgKzUxLDkgQEAgTU9EU19XSVRIX1NSQyA6
PSBhZ2EgXAogCWNkdW1wIFwKIAljaGFyc2V0IFwKIAljaW5pcGFyc2VyIFwKKwljcHVpZCBcCiAJ
Y3JjIFwKIAljcmNzeW5jIFwKLQljcHVpZCBcCiAJY3J5cHRvL3JpcGVtZDE2MCBcCiAJY3J5cHRv
L3NoYTI1NiBcCiAJY3J5cHRvL3NoYWNoYWluIFwKLS0gCjIuNy4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxp
c3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
