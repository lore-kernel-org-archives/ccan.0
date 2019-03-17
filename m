From: Ian Zimmerman <itz@very.loosely.org>
Subject: Re: configurator still segfaults, what am I doing wrong?
Date: Sun, 17 Mar 2019 14:12:46 -0700
Message-ID: <20190317211246.5uircrruea4jz5h2@matica.foolinux.mooo.com>
References: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
 <87o97ld4f5.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from very.loosely.org (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44MsXq2Qf5zDqMK
 for <ccan@lists.ozlabs.org>; Mon, 18 Mar 2019 08:15:22 +1100 (AEDT)
Content-Disposition: inline
In-Reply-To: <87o97ld4f5.fsf@rustcorp.com.au>
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

On 2019-02-09 14:00, Rusty Russell wrote:

> > Cleaning source tree
> > Adding ccan/alignof

> > modfiles: Getting canonical version of directory ccan/alignof: No
> > such file or directory

> This is because the create-ccan-tree script is horrible, and needs to be
> run from the toplevel ccan dir, AFAICT.

So, why has the following been dropped?  The Travis failure seems to be
accidental.

https://github.com/rustyrussell/ccan/pull/72

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
To reply privately _only_ on Usenet and on broken lists
which rewrite From, fetch the TXT record for no-use.mooo.com.
