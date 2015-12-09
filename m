From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/3] web/logo: Use a relative protocol
Date: Wed,  9 Dec 2015 11:47:51 +1030
Message-ID: <1449623872-12857-2-git-send-email-joel@jms.id.au>
References: <1449623872-12857-1-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-pa0-x22d.google.com (mail-pa0-x22d.google.com
 [IPv6:2607:f8b0:400e:c03::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D96211A05C8
 for <ccan@lists.ozlabs.org>; Wed,  9 Dec 2015 12:18:08 +1100 (AEDT)
Received: by pacwq6 with SMTP id wq6so20581784pac.1
 for <ccan@lists.ozlabs.org>; Tue, 08 Dec 2015 17:18:06 -0800 (PST)
Received: from icarus.au.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 62sm7249460pfl.90.2015.12.08.17.18.04
 for <ccan@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Dec 2015 17:18:06 -0800 (PST)
In-Reply-To: <1449623872-12857-1-git-send-email-joel@jms.id.au>
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

VGhlIHdlYmZvbnQgZm9yY2VzIGh0dHAsIHdoaWNoIHJlc3VsdHMgaW4gYSBtaXhlZCBjb250ZW50
IHdhcm5pbmcgaWYKeW91J3JlIHZpc2l0aW5nIHRoZSBzaXRlIG9uIGh0dHBzLiBTdHJpcCB0aGUg
cHJvdG9jb2wgc28gd2UgdXNlIHdoYXRldmVyCnRoZSB1c2VyIGhhcyBjb25uZWN0ZWQgd2l0aC4K
ClNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQogd2ViL2xv
Z28uaHRtbCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3dlYi9sb2dvLmh0bWwgYi93ZWIvbG9nby5odG1sCmluZGV4IGQy
ODFkZjlmYzI0ZC4uYzBkMTUzMWIzMmNiIDEwMDY0NAotLS0gYS93ZWIvbG9nby5odG1sCisrKyBi
L3dlYi9sb2dvLmh0bWwKQEAgLTksNyArOSw3IEBAICR1cmxfcHJlZml4ID0gZ2V0ZW52KCJVUkxQ
UkVGSVgiKTsKICAgPHRpdGxlPmNjYW48L3RpdGxlPgogICA8bGluayByZWw9InN0eWxlc2hlZXQi
IHR5cGU9InRleHQvY3NzIiBocmVmPSI8Pz0kdXJsX3ByZWZpeD8+Y2Nhbi5jc3MiLz4KICAgPG1l
dGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13aWR0aCwgaW5pdGlhbC1z
Y2FsZT0xIj4KLSAgPGxpbmsgaHJlZj0naHR0cDovL2ZvbnRzLmdvb2dsZWFwaXMuY29tL2Nzcz9m
YW1pbHk9UmFsZXdheTozMDAnIHJlbD0nc3R5bGVzaGVldCcgdHlwZT0ndGV4dC9jc3MnPgorICA8
bGluayBocmVmPScvL2ZvbnRzLmdvb2dsZWFwaXMuY29tL2Nzcz9mYW1pbHk9UmFsZXdheTozMDAn
IHJlbD0nc3R5bGVzaGVldCcgdHlwZT0ndGV4dC9jc3MnPgogICA8bGluayBocmVmPSc8Pz0kdXJs
X3ByZWZpeD8+cHJldHRpZnkvc3JjL3ByZXR0aWZ5LmNzcycgcmVsPSdzdHlsZXNoZWV0JyB0eXBl
PSd0ZXh0L2Nzcyc+CiAgIDxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0IiBzcmM9Ijw/PSR1
cmxfcHJlZml4Pz5wcmV0dGlmeS9zcmMvcnVuX3ByZXR0aWZ5LmpzIj48L3NjcmlwdD4KIDxoZWFk
PgotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmNjYW4gbWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3Rz
Lm96bGFicy5vcmcvbGlzdGluZm8vY2Nhbgo=
