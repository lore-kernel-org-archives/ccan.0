From: Ian Zimmerman <itz@very.loosely.org>
Subject: Re: make check fails in coroutine module
Date: Tue, 26 Mar 2019 12:58:06 -0700
Message-ID: <20190326195806.zpxnolrlw243k72y@matica.foolinux.mooo.com>
References: <20190317223944.rebtzvfszp63qrze@matica.foolinux.mooo.com>
 <20190326043129.GP9393@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from very.loosely.org (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TMnT2zhjzDqKl
 for <ccan@lists.ozlabs.org>; Wed, 27 Mar 2019 07:15:24 +1100 (AEDT)
Content-Disposition: inline
In-Reply-To: <20190326043129.GP9393@umbus.fritz.box>
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

On 2019-03-26 15:31, David Gibson wrote:

> > ... more (use -vv to see them all)
> > coroutine: Total score: 35/43 FAIL!
> > make: *** [Makefile:78: ccan/coroutine/.ok] Error 1
> > 
> > Perhaps it is relevant that the configurator check causing the
> > segfault - as discussed in the other thread - is
> > HAVE_POINTER_SAFE_MAKECONTEXT which, I believe, is only used by
> > coroutine module.

> Urgh, yeah, it's broken.  Finding time to debug and fix it is proving
> difficult.

Ok, I understand that perfectly.  But I'd like to contrbiute to ccan,
and I'll only feel comfortable doing that when I have a clean test suite
to start with.  What would you suggest as a workaround?  Maybe a local
branch with the coroutine module removed?

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
To reply privately _only_ on Usenet and on broken lists
which rewrite From, fetch the TXT record for no-use.mooo.com.
