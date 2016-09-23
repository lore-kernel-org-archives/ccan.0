From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v2 01/13] configurator: Replace unlink with remove
Date: Thu, 22 Sep 2016 21:33:04 -0600
Message-ID: <162623821ba082524e6b43a0e9b90ff881b26bd6.1474600863.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name [205.185.125.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgJq81WP6zDsld
 for <ccan@lists.ozlabs.org>; Fri, 23 Sep 2016 13:33:23 +1000 (AEST)
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

QWx0aG91Z2ggV2luZG93cyBwcm92aWRlcyB1bmxpbmssIHVzaW5nIGl0IGFkZHMgY29tcGxpY2F0
aW9uIGR1ZSB0byB0aGUKbGFjayBvZiB1bmlzdGQuaCB3aGljaCBtdXN0IGJlIGluY2x1ZGVkIHRv
IGRlZmluZSB0aGUgZnVuY3Rpb24gb24gUE9TSVgKc3lzdGVtcy4gIEluc3RlYWQsIHVzZSByZW1v
dmUsIHdoaWNoIEM4OSByZXF1aXJlcyB0byBiZSBpbiBzdGRpby5oLgoKU2lnbmVkLW9mZi1ieTog
S2V2aW4gTG9ja2UgPGtldmluQGtldmlubG9ja2UubmFtZT4KUmV2aWV3ZWQtYnk6IERhdmlkIEdp
YnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PgotLS0KIHRvb2xzL2NvbmZpZ3VyYXRv
ci9jb25maWd1cmF0b3IuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmF0b3IvY29uZmln
dXJhdG9yLmMgYi90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMKaW5kZXggNjdkYWRj
Ni4uZTMyMmM3NiAxMDA2NDQKLS0tIGEvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5j
CisrKyBiL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3IuYwpAQCAtNjM5LDggKzYzOSw4
IEBAIGludCBtYWluKGludCBhcmdjLCBjb25zdCBjaGFyICphcmd2W10pCiAJCXJ1bl90ZXN0KGNt
ZCwgJnRlc3RzW2ldKTsKIAlmcmVlKGNtZCk7CiAKLQl1bmxpbmsoT1VUUFVUX0ZJTEUpOwotCXVu
bGluayhJTlBVVF9GSUxFKTsKKwlyZW1vdmUoT1VUUFVUX0ZJTEUpOworCXJlbW92ZShJTlBVVF9G
SUxFKTsKIAogCXByaW50ZigiLyogR2VuZXJhdGVkIGJ5IENDQU4gY29uZmlndXJhdG9yICovXG4i
CiAJICAgICAgICIjaWZuZGVmIENDQU5fQ09ORklHX0hcbiIKLS0gCjIuOS4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpjY2FuIG1haWxpbmcgbGlzdApj
Y2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2Nj
YW4K
