From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v3 6/7] Makefile: Define CFLAGS_FORCE_C_SOURCE macro
Date: Wed, 28 Sep 2016 18:44:47 -0600
Message-ID: <3c34ab90ca8a21768ec863afb29ebff14a814f48.1475109043.git.kevin@kevinlocke.name>
References: <20160929002122.GK18880@umbus>
 <cover.1475109043.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name
 [IPv6:2605:6400:2:fed5:22:0:f2f6:c0f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skwnz6yvnzDsff
 for <ccan@lists.ozlabs.org>; Thu, 29 Sep 2016 10:44:55 +1000 (AEST)
In-Reply-To: <cover.1475109043.git.kevin@kevinlocke.name>
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

VGhpcyBtYWNybyBob2xkcyB0aGUgQyBjb21waWxlciBmbGFnKHMpIHRvIGZvcmNlIGlucHV0IGZp
bGVzIHRvIGJlCnJlY29nbml6ZWQgYXMgQyBzb3VyY2VzIHJlZ2FyZGxlc3Mgb2YgZXh0ZW5zaW9u
LiAgSXQgaXMgZGVmaW5lZCB0byBhbGxvdwpvdmVycmlkaW5nIG9uIHRoZSBtYWtlIGNvbW1hbmQg
bGluZS4KClNpZ25lZC1vZmYtYnk6IEtldmluIExvY2tlIDxrZXZpbkBrZXZpbmxvY2tlLm5hbWU+
Ci0tLQogTWFrZWZpbGUgICAgICB8IDIgKy0KIE1ha2VmaWxlLWNjYW4gfCAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTWFr
ZWZpbGUgYi9NYWtlZmlsZQppbmRleCAxMjdiODc1Li4zN2ZmMTdkIDEwMDY0NAotLS0gYS9NYWtl
ZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtNjQsNyArNjQsNyBAQCBzdW1tYXJ5LWZhc3RjaGVjay8l
OiB0b29scy9jY2FubGludC9jY2FubGludCAkKE9CSkZJTEVTKQogCSQoQ0NBTkxJTlRfRkFTVCkg
LXMgY2Nhbi8kKgoKIGNjYW4vJS9pbmZvOiBjY2FuLyUvX2luZm8gY29uZmlnLmgKLQkkKENDKSAk
KENDQU5fQ0ZMQUdTKSAtSS4gLW8gJEAgLXggYyAkPAorCSQoQ0MpICQoQ0NBTl9DRkxBR1MpIC1J
LiAtbyAkQCAkKENGTEFHU19GT1JDRV9DX1NPVVJDRSkgJDwKCiBhbGxfaW5mbzogJChNT0RTOiU9
Y2Nhbi8lL2luZm8pCgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUtY2NhbiBiL01ha2VmaWxlLWNjYW4K
aW5kZXggNWM4ZGVhMi4uZDRhNTUyOCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUtY2NhbgorKysgYi9N
YWtlZmlsZS1jY2FuCkBAIC01LDYgKzUsNyBAQAogI0NDQU5fQ0ZMQUdTPS1nIC1PMyAtV2FsbCAt
V3N0cmljdC1wcm90b3R5cGVzIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVdtaXNzaW5nLXByb3Rv
dHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3BvaW50ZXItYXJpdGggLVd3cml0ZS1zdHJp
bmdzIC1XdW5kZWYgLURDQ0FOX1NUUl9ERUJVRz0xCiBDQ0FOX0NGTEFHUz0tZzMgLWdnZGIgLVdh
bGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XbWlzc2luZy1w
cm90b3R5cGVzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVdwb2ludGVyLWFyaXRoIC1Xd3JpdGUt
c3RyaW5ncyAtV3VuZGVmIC1EQ0NBTl9TVFJfREVCVUc9MQogQ0ZMQUdTID0gJChDQ0FOX0NGTEFH
UykgLUkuICQoREVQR0VOKQorQ0ZMQUdTX0ZPUkNFX0NfU09VUkNFID0gLXggYwoKIE1PRFMgOj0g
YV9zdGFyIFwKIAlhZ2EgXAotLQoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3Jn
Cmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
