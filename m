From: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/5] cppmagic: Preprocessor tricks
Date: Wed, 27 Jan 2016 22:39:56 +1100
Message-ID: <1453894801-22652-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2EBE11A0070
 for <ccan@lists.ozlabs.org>; Wed, 27 Jan 2016 22:40:40 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au
List-Id: ccan@lists.ozlabs.org

Y2NhbiBhbHJlYWR5IGhhcyBjcHAgbWFjcm9zIHVzZWQgaW4gc29tZSBpbnRlcmVzdGluZyB3YXlz
LiAgVGhpcwptb2R1bGUgaXMgZmFyIG1vcmUgaW50ZXJlc3RpbmcuLiBvciBwb3NzaWJseSBob3Jy
aWZ5aW5nLgoKSXQgaW5jbHVkZXMgc29tZSB2ZXJ5IGZhbmN5IHByZXByb2Nlc3NvciB0ZWNobmlx
dWVzIGRlc2NyaWJlZCBpbiB0aGUKYXJ0aWNsZSBhdDoKICAgIGh0dHA6Ly9qaG5ldC5jby51ay9h
cnRpY2xlcy9jcHBfbWFnaWMKClRoaXMgaW5jbHVkZXMgcHJlcHJvY2Vzc2luZyB0aW1lIGV2YWx1
YXRlZCBjb25kaXRpb25hbHMsIChzb3J0IG9mKQpyZWN1cnNpb24gYW5kIGl0ZXJhdGlvbiBhY3Jv
c3MgdGhlIHBhcmFtZXRlcnMgb2YgdmFyYXJncyBtYWNyb3MuCgpEYXZpZCBHaWJzb24gKDUpOgog
IGNwcG1hZ2ljOiBOZXcgbW9kdWxlCiAgY3BwbWFnaWM6IExvZ2ljYWwgb3BlcmF0aW9ucwogIGNw
cG1hZ2ljOiBDb25kaXRpb25hbHMKICBjcHBtYWdpYzogQWxsb3cgbXVsdGlwbGUgYW5kIGRlZmVy
cmVkIGV2YWx1YXRpb24KICBjcHBtYWdpYzogSXRlcmF0aW9uCgogY2Nhbi9jcHBtYWdpYy9MSUNF
TlNFICAgIHwgICAxICsKIGNjYW4vY3BwbWFnaWMvX2luZm8gICAgICB8ICAzMCArKysrKysrKwog
Y2Nhbi9jcHBtYWdpYy9jcHBtYWdpYy5oIHwgMTkxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBjY2FuL2NwcG1hZ2ljL3Rlc3QvcnVuLmMgfCAgOTIgKysr
KysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzE0IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEyMDAwMCBjY2FuL2NwcG1hZ2ljL0xJQ0VOU0UKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBjY2FuL2NwcG1hZ2ljL19pbmZvCiBjcmVhdGUgbW9kZSAxMDA2NDQgY2Nhbi9jcHBtYWdp
Yy9jcHBtYWdpYy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgY2Nhbi9jcHBtYWdpYy90ZXN0L3J1bi5j
CgotLSAKMi41LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3Rz
Lm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
