From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/3] Makefile-web: Download prettify from git
Date: Wed,  9 Dec 2015 11:47:50 +1030
Message-ID: <1449623872-12857-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9B52D1A05C8
 for <ccan@lists.ozlabs.org>; Wed,  9 Dec 2015 12:18:06 +1100 (AEDT)
Received: by pacdm15 with SMTP id dm15so20673731pac.3
 for <ccan@lists.ozlabs.org>; Tue, 08 Dec 2015 17:18:04 -0800 (PST)
Received: from icarus.au.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 62sm7249460pfl.90.2015.12.08.17.18.02
 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Dec 2015 17:18:03 -0800 (PST)
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

VGhlIFNWTiBtaXJyb3IgZGlzYXBwZWFyZWQgc29tZSB0aW1lIGFnby4gSXQgbm93IGxpdmVzIG9u
IEdpdGh1Yi4KClNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ci0t
LQogTWFrZWZpbGUtd2ViIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUtd2ViIGIvTWFrZWZpbGUtd2ViCmlu
ZGV4IGE4NGI5NTkwMjAzNC4uM2I5ZjExMTI0ODI0IDEwMDY0NAotLS0gYS9NYWtlZmlsZS13ZWIK
KysrIGIvTWFrZWZpbGUtd2ViCkBAIC0yOSw3ICsyOSw3IEBAICQoV0VCX1NVQkRJUlMpOiAkKFdF
QkRJUikKIAlta2RpciAtcCAkQAogCiAkKFBSRVRUSUZZKToKLQlzdm4gY2hlY2tvdXQgaHR0cDov
L2dvb2dsZS1jb2RlLXByZXR0aWZ5Lmdvb2dsZWNvZGUuY29tL3N2bi90cnVuay8gJChXRUJESVIp
L3ByZXR0aWZ5CisJZ2l0IGNsb25lIC0tZGVwdGg9MSBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xl
L2NvZGUtcHJldHRpZnkuZ2l0ICQoV0VCRElSKS9wcmV0dGlmeQogCiAkKFdFQkRJUikvanVua2Nv
ZGUvJS50YXIuYnoyOiBqdW5rY29kZS8lICQoV0VCRElSKS9qdW5rY29kZQogCWdpdCBscy1maWxl
cyAteiAkPCB8IHhhcmdzIC0wIC14IHRhciBjdmZqICRAIAotLSAKMi42LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNj
YW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nh
bgo=
