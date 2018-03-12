From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: why add the result of check_type in container_of
Date: Mon, 12 Mar 2018 11:19:39 +0800
Message-ID: <20180312031939.GA29780@HP>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4003Bl5MP4zF07t
 for <ccan@lists.ozlabs.org>; Mon, 12 Mar 2018 14:19:59 +1100 (AEDT)
Received: by mail-pg0-x22a.google.com with SMTP id r26so5956310pgv.13
 for <ccan@lists.ozlabs.org>; Sun, 11 Mar 2018 20:19:59 -0700 (PDT)
Content-Disposition: inline
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

SGksCgpJIG5vdGljZSB0aGF0IGluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBjb250YWluZXJfb2Yo
KSwgdGhlIHJlc3VsdGluZyBwb2ludGVyCndpbGwgYmUgYWR2YW5jZWQgYnkgMSBpZiB0eXBlcyBt
aXNtYXRjaDoKCiNkZWZpbmUgY29udGFpbmVyX29mKG1lbWJlcl9wdHIsIGNvbnRhaW5pbmdfdHlw
ZSwgbWVtYmVyKSAgIFwKCSAoKGNvbnRhaW5pbmdfdHlwZSAqKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAoJICAoKGNoYXIgKikobWVtYmVyX3B0cikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCgkgICAtIGNvbnRhaW5lcl9vZmYoY29udGFpbmluZ190eXBlLCBt
ZW1iZXIpKSAgICAgICAgICAgIFwKCSAgKyBjaGVja190eXBlc19tYXRjaCgqKG1lbWJlcl9wdHIp
LCAoKGNvbnRhaW5pbmdfdHlwZSAqKTApLT5tZW1iZXIpKQoKd2hlcmUgY2hlY2tfdHlwZXNfbWF0
Y2goKSBpcyBkZWZpbmVkIGFzIAoKI2RlZmluZSBjaGVja190eXBlc19tYXRjaChleHByMSwgZXhw
cjIpCQlcCgkoKHR5cGVvZihleHByMSkgKikwICE9ICh0eXBlb2YoZXhwcjIpICopMCkKCndoaWNo
IHdpbGwgcmV0dXJuIDEgaWYgdHlwZXMgbWlzbWF0Y2guCgpJTU8sIGFkdmFuY2luZyB0aGUgd3Jv
bmcgcG9pbnRlciAocmVzdWx0aW5nIGZyb20gbWlzbWF0Y2ggdHlwZXMpIGJ5IDEgd2lsbApvbmx5
IG1ha2UgdGhpbmdzIHdvcnNlLCBhbmQgdXNlcnMgdXN1YWxseSBvbmx5IGdldCBnYXJiYWdlIHJl
c3VsdHMgYW5kIHdpbGwgbm90CmJlIGF3YXJlIG9mIHRoZSB0eXBlLW1pc21hdGNoIGJ1Zy4gV291
bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHRocm93IGFuIGJ1aWxkaW5nCmVycm9yL3dhcm5pbmcgZm9y
IHRoYXQ/CgpZdWJpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpjY2FuIG1haWxpbmcgbGlzdApjY2FuQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0
cy5vemxhYnMub3JnL2xpc3RpbmZvL2NjYW4K
