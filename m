From: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>
Subject: Re: [PATCH] Add Glibc like endianess check
Date: Wed, 13 Sep 2017 12:03:51 +0530
Message-ID: <20ab4a9b-747a-f73b-880f-38e55fb2c61c@linux.vnet.ibm.com>
References: <1505193793-776-1-git-send-email-akshay.adiga@linux.vnet.ibm.com>
 <871snc89in.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xsX1q2bnLzDqZx
 for <ccan@lists.ozlabs.org>; Wed, 13 Sep 2017 16:34:07 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8D6Xw05107444
 for <ccan@lists.ozlabs.org>; Wed, 13 Sep 2017 02:34:05 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cxswxux78-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <ccan@lists.ozlabs.org>; Wed, 13 Sep 2017 02:34:04 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ccan@lists.ozlabs.org> from <akshay.adiga@linux.vnet.ibm.com>;
 Wed, 13 Sep 2017 16:33:58 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8D6XtZW41615422
 for <ccan@lists.ozlabs.org>; Wed, 13 Sep 2017 16:33:55 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v8D6XtBk031493
 for <ccan@lists.ozlabs.org>; Wed, 13 Sep 2017 16:33:55 +1000
In-Reply-To: <871snc89in.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: ccan@lists.ozlabs.org, ego@linux.vnet.ibm.com, svaidy@linux.vnet.ibm.com
List-Id: ccan@lists.ozlabs.org

VGhhbmtzISEhCgpPbiAwOS8xMi8yMDE3IDA0OjMyIFBNLCBSdXN0eSBSdXNzZWxsIHdyb3RlOgo+
IEFrc2hheSBBZGlnYSA8YWtzaGF5LmFkaWdhQGxpbnV4LnZuZXQuaWJtLmNvbT4gd3JpdGVzOgo+
ID4gQW4gYXBwbGljYXRpb24gYnVpbHQgdXNpbmcgZ2xpYmMgd291bGQgZXhwZWN0IF9fQllURV9P
UkRFUiB0byB0ZWxsIGlmCj4gPiBpdCBzaG91bGQgYmUgY29tcGlsZWQgZm9yIEJJR19FTkRJQU4g
b3IgTElUVExFX0VORElBTiwgd2hlcmVhcyBjY2FuIHVzZXMKPiA+IEhBVkVfTElUVExFX0VORElB
TiBhbmQgSEFWRV9CSUdfRU5ESUFOIGZvciB0aGUgc2FtZSBwdXJwb3NlLgo+ID4KPiA+IEhlbmNl
IHNldHRpbmcgX19CWVRFX09SREVSIGJhc2VkIG9uIHdoYXQgQ0NBTiBwcm92aWRlcyB3aWxsIG5v
IGxvbmdlcgo+ID4gYnJlYWsgdGhlIGFwcGxpY2F0aW9ucyB3aGljaCBjaGVjayBlbmRpYW5uZXNz
IHRoZSBnbGliYyB3YXkuCj4KPiBUaGFua3MsIGFwcGxpZWQhCj4KPiBDaGVlcnMsCj4gUnVzdHku
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmNjYW4g
bWFpbGluZyBsaXN0CmNjYW5AbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5v
cmcvbGlzdGluZm8vY2Nhbgo=
