From: Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] bitmap: Allow bitmap type to be forward declared
Date: Tue, 22 Oct 2019 07:53:26 +0000
Message-ID: <20191022075321.GA1701@link.navytux.spb.ru>
References: <20191021150903.25159-1-kirr@nexedi.com>
 <20191022052520.GI6439@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail112.us4.mandrillapp.com (mail112.us4.mandrillapp.com
 [205.201.136.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y5jz1Q9xzDqFt
 for <ccan@lists.ozlabs.org>; Tue, 22 Oct 2019 19:08:37 +1100 (AEDT)
Received: from pmta07.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail112.us4.mandrillapp.com id hlqsge174e0g for <ccan@lists.ozlabs.org>;
 Tue, 22 Oct 2019 07:53:27 +0000 (envelope-from
 <bounce-md_31050260.5daeb576.v1-0dd12646a6a5438d917992714af0bdd2@mandrillapp.com>)
In-Reply-To: <20191022052520.GI6439@umbus.fritz.box>
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDQ6MjU6MjBQTSArMTEwMCwgRGF2aWQgR2lic29uIHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAzOjA5OjIwUE0gKzAwMDAsIEtpcmlsbCBT
bWVsa292IHdyb3RlOgo+ID4gQ3VycmVudGx5IGJpdG1hcCB0eXBlIGlzIGRlZmluZWQgdmlhIHVu
dGFnZ2VkIHN0cnVjdCB3aGljaCBtYWtlcyBpdAo+ID4gaW1wb3NzaWJsZSB0byBmb3J3YXJkIGRl
Y2xhcmUgaXQuIEZvcndhcmQtZGVjbGFyaW5nIGlzIHVzZWZ1bCBzaW5jZSBhbGwKPiA+IGJpdG1h
cCBmdW5jdGlvbnMgb25seSB1c2UgYml0bWFwKiBhbmQgaW4gcHVibGljIHVzZXItdmlzaWJsZQo+
ID4gaGVhZGVycy9kYXRhc3RydWN0dXJlcyBpdCBpcyBlbm91Z2ggdG8gaW5kaWNhdGUgdGhhdCBh
IGRhdGEgZmllbGQgd2l0aAo+ID4gYml0bWFwIHBvaW50ZXIgaXMgdGhlcmUsIHdoZXJlYXMgYml0
bWFwLmggY2FuIGJlIGluY2x1ZGVkIG9ubHkgaW4KPiA+IGltcGxlbWVudGF0aW9uLgo+ID4gCj4g
PiBCZXNpZGUgdGhhdCBzb21lIGhlYWRlcnMgYXJlIGluY2x1ZGVkIGJ5IGJvdGggQyBhbmQgQysr
IHBhcnRzIG9mIGEKPiA+IHByb2plY3QsIGFuZCB3aGVuIGNjYW4vYml0bWFwLmggaXMgcHJvY2Vz
c2VkIGJ5IEMrKyBjb21waWxlciBpdCBnaXZlczoKPiA+IAo+ID4gICAgIC4vM3JkcGFydHkvY2Nh
bi9jY2FuL2JpdG1hcC9iaXRtYXAuaDogSW4gZnVuY3Rpb24g4oCYYml0bWFwKiBiaXRtYXBfYWxs
b2MobG9uZyB1bnNpZ25lZCBpbnQp4oCZOgo+ID4gICAgIC4vM3JkcGFydHkvY2Nhbi9jY2FuL2Jp
dG1hcC9iaXRtYXAuaDoyMDE6MTU6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDigJh2
b2lkKuKAmSB0byDigJhiaXRtYXAq4oCZIFstZnBlcm1pc3NpdmVdCj4gPiAgICAgICByZXR1cm4g
bWFsbG9jKGJpdG1hcF9zaXplb2YobmJpdHMpKTsKPiA+ICAgICAgICAgICAgICB+fn5+fn5efn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgICAgLi8zcmRwYXJ0eS9jY2FuL2NjYW4vYml0bWFwL2Jp
dG1hcC5oOiBJbiBmdW5jdGlvbiDigJhiaXRtYXAqIGJpdG1hcF9yZWFsbG9jMChiaXRtYXAqLCBs
b25nIHVuc2lnbmVkIGludCwgbG9uZyB1bnNpZ25lZCBpbnQp4oCZOgo+ID4gICAgIC4vM3JkcGFy
dHkvY2Nhbi9jY2FuL2JpdG1hcC9iaXRtYXAuaDoyMjc6MTg6IGVycm9yOiBpbnZhbGlkIGNvbnZl
cnNpb24gZnJvbSDigJh2b2lkKuKAmSB0byDigJhiaXRtYXAq4oCZIFstZnBlcm1pc3NpdmVdCj4g
PiAgICAgICBiaXRtYXAgPSByZWFsbG9jKGJpdG1hcCwgYml0bWFwX3NpemVvZihuYml0cykpOwo+
ID4gICAgICAgICAgICAgICAgfn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+
ID4gICAgIC4vM3JkcGFydHkvY2Nhbi9jY2FuL2JpdG1hcC9iaXRtYXAuaDogSW4gZnVuY3Rpb24g
4oCYYml0bWFwKiBiaXRtYXBfcmVhbGxvYzEoYml0bWFwKiwgbG9uZyB1bnNpZ25lZCBpbnQsIGxv
bmcgdW5zaWduZWQgaW50KeKAmToKPiA+ICAgICAuLzNyZHBhcnR5L2NjYW4vY2Nhbi9iaXRtYXAv
Yml0bWFwLmg6MjM4OjE4OiBlcnJvcjogaW52YWxpZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCri
gJkgdG8g4oCYYml0bWFwKuKAmSBbLWZwZXJtaXNzaXZlXQo+ID4gICAgICAgYml0bWFwID0gcmVh
bGxvYyhiaXRtYXAsIGJpdG1hcF9zaXplb2YobmJpdHMpKTsKPiA+IAo+ID4gLT4gR2l2ZSB0byB1
c2VycyBhYmlsaXR5IG5vdCB0byBmb3JjZS1pbmNsdWRlIGNjYW4vYml0bWFwLmggYnkKPiA+IGZv
cndhcmQtZGVjbGFyaW5nIGJpdG1hcHMgbGlrZSB0aGlzOgo+ID4gCj4gPiAgICAgdHlwZWRlZiBz
dHJ1Y3QgYml0bWFwIGJpdG1hcDsKPiA+ICAgICAuLi4KPiA+ICAgICBzdHJ1Y3QgTXlTdHJ1Y3Qg
ewo+ID4gICAgICAgICBiaXRtYXAgKm15X2JpdG1hcDsKPiA+ICAgICB9Owo+ID4gCj4gPiBDYzog
RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBLaXJpbGwgU21lbGtvdiA8a2lyckBuZXhlZGkuY29tPgo+IAo+IEFwcGxpZWQsIHRoYW5r
cy4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3Rz
Lm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
