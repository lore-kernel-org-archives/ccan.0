From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH 9/9] configurator: DEFAULT_{COMPILER, FLAGS} for MSVC
Date: Sun, 18 Sep 2016 18:52:06 -0600
Message-ID: <e6fb8c32a91b86cfe9dfe43cffca37d10ae6067c.1474239353.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scndp4glpzDsdl
 for <ccan@lists.ozlabs.org>; Mon, 19 Sep 2016 11:01:34 +1000 (AEST)
In-Reply-To: <cover.1474239353.git.kevin@kevinlocke.name>
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

V2hlbiBjb21waWxpbmcgd2l0aCBWaXN1YWwgU3R1ZGlvLCB1c2UgZGVmYXVsdCBjb21waWxlciBu
YW1lIGFuZCBmbGFncwp3aGljaCBhcmUgbGlrZWx5IHRvIHdvcmsgd2l0aCB0aGUga25vd24tYXZh
aWxhYmxlIGNvbXBpbGVyLgoKVGhpcyBpcyBhbHNvIGEgY29udmVuaWVuY2UgZm9yIHVzZXJzIHdo
byBtYXkgbm90IGtub3cgd2hhdCBhcmd1bWVudHMKY2wuZXhlIG1heSBuZWVkIHRvIGNvbXBpbGUg
dGhlIHRlc3RzLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gTG9ja2UgPGtldmluQGtldmlubG9ja2Uu
bmFtZT4KLS0tCiB0b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMgfCA2ICsrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZp
Z3VyYXRvci9jb25maWd1cmF0b3IuYyBiL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3Iu
YwppbmRleCA4MjBjY2Y3Li40ZjA4NzAxIDEwMDY0NAotLS0gYS90b29scy9jb25maWd1cmF0b3Iv
Y29uZmlndXJhdG9yLmMKKysrIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCkBA
IC0zNSw4ICszNSwxNCBAQAogI2RlZmluZSBwY2xvc2UgX3BjbG9zZQogI2VuZGlmCiAKKyNpZmRl
ZiBfTVNDX1ZFUgorI2RlZmluZSBERUZBVUxUX0NPTVBJTEVSICJjbCIKKyNkZWZpbmUgREVGQVVM
VF9GTEFHUyAiL25vbG9nbyAvWmkgL1c0ICIgXAorCSIvRF9DUlRfTk9OU1REQ19OT19XQVJOSU5H
UyAvRF9DUlRfU0VDVVJFX05PX1dBUk5JTkdTIC9GZToiCisjZWxzZQogI2RlZmluZSBERUZBVUxU
X0NPTVBJTEVSICJjYyIKICNkZWZpbmUgREVGQVVMVF9GTEFHUyAiLWczIC1nZ2RiIC1XYWxsIC1X
dW5kZWYgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3N0cmlj
dC1wcm90b3R5cGVzIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLW8iCisjZW5kaWYKIAogI2RlZmlu
ZSBPVVRQVVRfRklMRSAiY29uZmlndXJhdG9yLm91dCIKICNkZWZpbmUgSU5QVVRfRklMRSAiY29u
ZmlndXJhdG9ydGVzdC5jIgotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9y
ZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
