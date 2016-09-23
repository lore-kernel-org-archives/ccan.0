From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v2 12/13] Makefile: Define CFLAGS_FORCE_C_SOURCE macro
Date: Thu, 22 Sep 2016 21:33:15 -0600
Message-ID: <a0934c257f9a1fb5c99b89fd6cf01e7b450d0f10.1474600863.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgJqD5DlqzDsmK
 for <ccan@lists.ozlabs.org>; Fri, 23 Sep 2016 13:33:27 +1000 (AEST)
In-Reply-To: <cover.1474600863.git.kevin@kevinlocke.name>
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
LXMgY2Nhbi8kKgogCiBjY2FuLyUvaW5mbzogY2Nhbi8lL19pbmZvIGNvbmZpZy5oCi0JJChDQykg
JChDQ0FOX0NGTEFHUykgLUkuIC1vICRAIC14IGMgJDwKKwkkKENDKSAkKENDQU5fQ0ZMQUdTKSAt
SS4gLW8gJEAgJChDRkxBR1NfRk9SQ0VfQ19TT1VSQ0UpICQ8CiAKIGFsbF9pbmZvOiAkKE1PRFM6
JT1jY2FuLyUvaW5mbykKIApkaWZmIC0tZ2l0IGEvTWFrZWZpbGUtY2NhbiBiL01ha2VmaWxlLWNj
YW4KaW5kZXggNWM4ZGVhMi4uZDRhNTUyOCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUtY2NhbgorKysg
Yi9NYWtlZmlsZS1jY2FuCkBAIC01LDYgKzUsNyBAQAogI0NDQU5fQ0ZMQUdTPS1nIC1PMyAtV2Fs
bCAtV3N0cmljdC1wcm90b3R5cGVzIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVdtaXNzaW5nLXBy
b3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3BvaW50ZXItYXJpdGggLVd3cml0ZS1z
dHJpbmdzIC1XdW5kZWYgLURDQ0FOX1NUUl9ERUJVRz0xCiBDQ0FOX0NGTEFHUz0tZzMgLWdnZGIg
LVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XbWlzc2lu
Zy1wcm90b3R5cGVzIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVdwb2ludGVyLWFyaXRoIC1Xd3Jp
dGUtc3RyaW5ncyAtV3VuZGVmIC1EQ0NBTl9TVFJfREVCVUc9MQogQ0ZMQUdTID0gJChDQ0FOX0NG
TEFHUykgLUkuICQoREVQR0VOKQorQ0ZMQUdTX0ZPUkNFX0NfU09VUkNFID0gLXggYwogCiBNT0RT
IDo9IGFfc3RhciBcCiAJYWdhIFwKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFi
cy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
