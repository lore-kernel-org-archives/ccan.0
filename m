Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560D9C25B76
	for <ccan@archiver.kernel.org>; Sat,  1 Jun 2024 12:20:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrzZx1Spzz30Wl
	for <ccan@archiver.kernel.org>; Sat,  1 Jun 2024 22:20:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=marknaughton.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marknaughton.com (client-ip=185.26.107.241; helo=smtpmciv5.myservices.hosting; envelope-from=mark@marknaughton.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 435 seconds by postgrey-1.37 at boromir; Sat, 01 Jun 2024 22:20:02 AEST
Received: from smtpmciv5.myservices.hosting (smtpmciv5.myservices.hosting [185.26.107.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrzZp4tYcz30TR
	for <ccan@lists.ozlabs.org>; Sat,  1 Jun 2024 22:20:02 +1000 (AEST)
Received: from mail1.netim.hosting (unknown [185.26.106.174])
	by smtpmciv5.myservices.hosting (Postfix) with ESMTP id BB56E20615;
	Sat,  1 Jun 2024 14:12:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail1.netim.hosting (Postfix) with ESMTP id 1A9B180098;
	Sat,  1 Jun 2024 14:12:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail1.netim.hosting
Received: from mail1.netim.hosting ([127.0.0.1])
	by localhost (mail1-2.netim.hosting [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gSm1ftpCqUCV; Sat,  1 Jun 2024 14:12:38 +0200 (CEST)
Received: from archtop.localdomain (unknown [10.192.1.83])
	(Authenticated sender: mark@marknaughton.com)
	by mail1.netim.hosting (Postfix) with ESMTPSA id 8715180093;
	Sat,  1 Jun 2024 14:12:38 +0200 (CEST)
Date: Sat, 1 Jun 2024 13:12:36 +0100
From: Mark Naughton <mark@marknaughton.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <ovrlq2xlpf7tlgddkjpdhfhgupnunwjfqbnyih6nmv6z4couc5@lygsksebv4vb>
References: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
 <ZjwL8iUYUeJQZl8m@a4bf019067fa.jf.intel.com>
 <Zlroeyxsa_d80DuA@zatzit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zlroeyxsa_d80DuA@zatzit>
Subject: Re: [ccan] New to ccan
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
Cc: ccan@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>

Most of the ccan modules are relatively self-contatined, they can easily
be integrated into your project just by changing the relevant include
paths.

I have noticed Google search has gotten far worse at finding all of the
hidden-gem C libraries out there, so really websites like ccan are more
useful than ever.
_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
