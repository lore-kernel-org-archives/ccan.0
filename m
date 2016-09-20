From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: [PATCH 2/9] configurator: Reimplement run using popen
Date: Tue, 20 Sep 2016 00:22:41 -0600
Message-ID: <3c2cefdf-ea69-d3c4-dff6-bfdbbe63e8eb@kevinlocke.name>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <ecf5714e7fa8075e08d54911675aa0a55b95b014.1474239353.git.kevin@kevinlocke.name>
 <20160920050023.GL20488@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from praxis.kevinlocke.name (praxis.kevinlocke.name
 [IPv6:2605:6400:2:fed5:22:0:f2f6:c0f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdXjx1ksczDsfq
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 16:22:45 +1000 (AEST)
In-Reply-To: <20160920050023.GL20488@umbus>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

T24gMDkvMTkvMjAxNiAxMTowMCBQTSwgRGF2aWQgR2lic29uIHdyb3RlOgogPiBPbiBTdW4sIFNl
cCAxOCwgMjAxNiBhdCAwNjo1MTo1OVBNIC0wNjAwLCBLZXZpbiBMb2NrZSB3cm90ZToKID4+IFJh
dGhlciB0aGFuIHVzaW5nIGZvcmsrcGlwZStzeXN0ZW0rd2FpdHBpZCwgbW9zdCBvZiB3aGljaCBh
cmUgb25seQogPj4gYXZhaWxhYmxlIG9uIFBPU0lYLWxpa2Ugc3lzdGVtcywgdXNlIHBvcGVuIHdo
aWNoIGlzIGFsc28gYXZhaWxhYmxlIG9uCiA+PiBXaW5kb3dzICh1bmRlciB0aGUgbmFtZSBfcG9w
ZW4pLgogPgogPiBDb25jZXB0IGxvb2tzIGdvb2QsIG9uZSBsaXR0bGUgd2FydC4KID4KID4+IFsu
Li5dCiA+PgogPj4gLXN0YXRpYyBjaGFyICpncmFiX2ZkKGludCBmZCkKID4+ICtzdGF0aWMgY2hh
ciAqZ3JhYl9zdHJlYW0oRklMRSAqZmlsZSkKID4+ICB7CiA+PiAtCWludCByZXQ7CiA+PiAtCXNp
emVfdCBtYXgsIHNpemUgPSAwOwogPj4gKwlzaXplX3QgbWF4LCByZXQsIHNpemUgPSAwOwogPj4g
IAljaGFyICpidWZmZXI7CiA+PgogPj4gLQltYXggPSAxNjM4NDsKID4+IC0JYnVmZmVyID0gbWFs
bG9jKG1heCsxKTsKID4+IC0Jd2hpbGUgKChyZXQgPSByZWFkKGZkLCBidWZmZXIgKyBzaXplLCBt
YXggLSBzaXplKSkgPiAwKSB7CiA+PiArCW1heCA9IEJVRlNJWjsKID4+ICsJYnVmZmVyID0gbWFs
bG9jKG1heCk7CiA+PiArCXdoaWxlICgocmV0ID0gZnJlYWQoYnVmZmVyK3NpemUsIDEsIG1heCAt
IHNpemUsIGZpbGUpKSA9PSBtYXggLSAKc2l6ZSkgewogPgogPiBUaGlzIGFzc3VtZXMgdGhhdCBm
cmVhZCgpIHdpbGwgbmV2ZXIgcmV0dXJuIGEgc2hvcnQgcmVhZCBleGNlcHQgb24gRU9GCiA+IG9y
IGVycm9yLiAgSSBleHBlY3QgdGhhdCB3aWxsIGJlIHRydWUgaW4gcHJhY3RpY2UgZm9yIHJlZ3Vs
YXIgZmlsZXMsCiA+IGJ1dCBJJ20gbm90IHN1cmUgaWYgaXQncyBhIGdvb2QgaWRlYSB0byByZWx5
IG9uIGl0LgoKSW50ZXJlc3RpbmcuICBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRo
ZSBmcmVhZCBjb3VsZG4ndCBzaG9ydCAKcmVhZC4gIFBPU0lYIGRlc2NyaWJlcyB0aGUgcmV0dXJu
IHZhbHVlIGFzICJ0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIApzdWNjZXNzZnVsbHkgcmVhZCB3aGlj
aCBpcyBsZXNzIHRoYW4gbml0ZW1zIG9ubHkgaWYgYSByZWFkIGVycm9yIG9yIAplbmQtb2YtZmls
ZSBpcyBlbmNvdW50ZXJlZC4iWzFdICBOb3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0LCBJIHN1cHBv
c2UgCkVJTlRSIGNvdWxkIGJlIGFuIGlzc3VlIGZvciBub24tZ2xpYmMgc3lzdGVtcy4gIElzIHRo
YXQgd2hhdCB5b3UgaGFkIGluIAptaW5kLCBvciBhcmUgdGhlcmUgb3RoZXIgaXNzdWVzIEknbSBv
dmVybG9va2luZz8gIChBbHNvIGZvciBmd3JpdGUgaW4gNi85PykKCktldmluCgoxLiAgaHR0cDov
L3B1YnMub3Blbmdyb3VwLm9yZy9vbmxpbmVwdWJzLzk2OTk5MTk3OTkvZnVuY3Rpb25zL2ZyZWFk
Lmh0bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2Nh
biBtYWlsaW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9jY2FuCg==
