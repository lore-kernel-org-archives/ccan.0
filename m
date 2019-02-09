From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: configurator still segfaults, what am I doing wrong?
Date: Sat, 09 Feb 2019 14:00:38 +1030
Message-ID: <87o97ld4f5.fsf@rustcorp.com.au>
References: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43xHd16zcLzDq5b
 for <ccan@lists.ozlabs.org>; Sat,  9 Feb 2019 14:30:45 +1100 (AEDT)
In-Reply-To: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Ian Zimmerman <itz@very.loosely.org>, Ccan Mailinglist <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

Ian Zimmerman <itz@very.loosely.org> writes:
>  matica!60 ccantest$ /home/itz/git/ccan/tools/create-ccan-tree --build-type=make+config /home/itz/ccantest/ccan tal
> Building ccan_depends, modfiles
> sh: line 1: 17440 Segmentation fault      (core dumped) ./configurator.out 2>&1

OK, that's weird.  If you run tools/configurator/configurator normally
does it do this?  If so, try under gdb...

> Cleaning source tree
> Adding ccan/alignof
> modfiles: Getting canonical version of directory ccan/alignof: No such file or directory

This is because the create-ccan-tree script is horrible, and needs to be
run from the toplevel ccan dir, AFAICT.

Thanks,
Rusty.
