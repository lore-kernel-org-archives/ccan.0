Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A54ECAAD2
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 07:18:03 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJC7F6T2Dz2xVr
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 17:18:01 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJC7C4w1Lz2xHq
	for <ccan@lists.ozlabs.org>; Thu,  1 Sep 2022 17:17:59 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix, from userid 1011)
	id 4MJC786y77z4xGJ; Thu,  1 Sep 2022 17:17:56 +1000 (AEST)
From: Rusty Russell <rusty@rustcorp.com.au>
To: ccan <ccan@lists.ozlabs.org>
Date: Thu, 01 Sep 2022 16:47:51 +0930
Message-ID: <874jxrftr4.fsf@rustcorp.com.au>
MIME-Version: 1.0
Subject: [ccan] CCAN updates
X-BeenThere: ccan@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "If perl can, maybe ccan?" <ccan.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>

Hi all,

        Despite the fact that I let the domain name expire, and someone
squatted on it with an old version and an advertizing link (who knew?),
CCAN is still alive.  I use it in my day job, so I do update it fairly
regularly.

        It lives on GH until I find something better:

                https://github.com/rustyrussell/ccan/

        In the last year, two new modules "closefrom" (to close all fds
above a given number) and "rune" (a form of cryptographic cookie) have
been written.

I hope for those who continue to use it, it serves you well!

Cheers,
Rusty.
_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
