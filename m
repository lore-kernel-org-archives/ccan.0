From: Eric Wong <normalperson@yhbt.net>
Subject: Re: Makefile-ccan missing for create-ccan-tree?
Date: Wed, 7 Nov 2018 23:06:52 +0000
Message-ID: <20181107230652.kblcmwui7ysxkgz2@starla>
References: <20180614223300.nod6kpjupa3pbkzb@dcvr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from dcvr.yhbt.net (dcvr.yhbt.net
 [IPv6:2600:3c01::f03c:91ff:fe96:f5d6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r2MM1zgWzF3KY
 for <ccan@lists.ozlabs.org>; Thu,  8 Nov 2018 10:15:27 +1100 (AEDT)
Content-Disposition: inline
In-Reply-To: <20180614223300.nod6kpjupa3pbkzb@dcvr>
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

Ping?  I just ran into this again.

Eric Wong <normalperson@yhbt.net> wrote:
> Hello, using "-b make" or "-b make+config" seems broken since
> commit 2ee3b7c5586c283412ace072eed9d70a86368efd
> ("Makefile: First try at rewriting the ccan Makefile.")
> 
> 	$ tools/create-ccan-tree -b make timeout timer
> 	<snip>
> 	cp: cannot stat 'tools/..//Makefile-ccan': No such file or directory
> 	Done. ccan source tree built in timeout
> 	# timeout/Makefile still has "include Makefile-ccan" in there
> 
> I'll probably find a different way to deal with Ruby extension
> building, anyways, but figured I'd report it.  Thanks.
