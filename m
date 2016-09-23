From: Kevin Locke <kevin@kevinlocke.name>
Subject: [PATCH v2 10/13] configurator: Fix warning in
 HAVE_FOR_LOOP_DECLARATION
Date: Thu, 22 Sep 2016 21:33:13 -0600
Message-ID: <9ea3d4767d9c89fad47facb5d51f4b7b9ccd813f.1474600863.git.kevin@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name
 [IPv6:2605:6400:2:fed5:22:0:f2f6:c0f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgJqD3jGczDsmJ
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

VmlzdWFsIEMrKyBwcmludHMgIndhcm5pbmcgQzQ3MDI6IHVucmVhY2hhYmxlIGNvZGUiIGR1ZSB0
byB0aGUgcmV0dXJuCnN0YXRlbWVudCBhZnRlciB0aGUgZm9yIGxvb3Agd2hpY2ggaXMgbmV2ZXIg
cmVhY2hlZC4gIEZpeCB0aGlzIGJ5CnNldHRpbmcgYSB2YXJpYWJsZSByZXR1cm5lZCBieSBhIHNp
bmdsZSByZXR1cm4gc3RhdGVtZW50IGF0IHRoZSBlbmQuCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBM
b2NrZSA8a2V2aW5Aa2V2aW5sb2NrZS5uYW1lPgotLS0KIHRvb2xzL2NvbmZpZ3VyYXRvci9jb25m
aWd1cmF0b3IuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRv
ci5jIGIvdG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvci5jCmluZGV4IGQzZTAxY2QuLmE0
MzA2MWIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyYXRvci9jb25maWd1cmF0b3IuYworKysg
Yi90b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yLmMKQEAgLTIyMiw4ICsyMjIsOSBAQCBz
dGF0aWMgc3RydWN0IHRlc3QgdGVzdHNbXSA9IHsKIAkgICIJcmV0dXJuIHNpemVvZihvZmZfdCkg
PT0gOCA/IDAgOiAxO1xuIgogCSAgIn1cbiIgfSwKIAl7ICJIQVZFX0ZPUl9MT09QX0RFQ0xBUkFU
SU9OIiwgSU5TSURFX01BSU4sIE5VTEwsIE5VTEwsCi0JICAiZm9yIChpbnQgaSA9IDA7IGkgPCBh
cmdjOyBpKyspIHsgcmV0dXJuIDA7IH07XG4iCi0JICAicmV0dXJuIDE7IiB9LAorCSAgImludCBy
ZXQgPSAxO1xuIgorCSAgImZvciAoaW50IGkgPSAwOyBpIDwgYXJnYzsgaSsrKSB7IHJldCA9IDA7
IH07XG4iCisJICAicmV0dXJuIHJldDsiIH0sCiAJeyAiSEFWRV9GTEVYSUJMRV9BUlJBWV9NRU1C
RVIiLCBPVVRTSURFX01BSU4sIE5VTEwsIE5VTEwsCiAJICAic3RydWN0IGZvbyB7IHVuc2lnbmVk
IGludCB4OyBpbnQgYXJyW107IH07IiB9LAogCXsgIkhBVkVfR0VUUEFHRVNJWkUiLCBERUZJTkVT
X0ZVTkMsIE5VTEwsIE5VTEwsCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMu
b3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9jY2FuCg==
