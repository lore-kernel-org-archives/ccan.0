From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: configurator still segfaults, what am I doing wrong?
Date: Fri, 22 Feb 2019 15:45:49 +1030
Message-ID: <87r2c0v1x6.fsf@rustcorp.com.au>
References: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
 <87o97ld4f5.fsf@rustcorp.com.au>
 <20190209224423.qvo356b3jy3oyowr@matica.foolinux.mooo.com>
 <87lg2kiomh.fsf@rustcorp.com.au>
 <20190221063828.pm3eaugvxlcasli5@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445qqj6S8MzDqDx
 for <ccan@lists.ozlabs.org>; Sat, 23 Feb 2019 12:09:37 +1100 (AEDT)
In-Reply-To: <20190221063828.pm3eaugvxlcasli5@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Ian Zimmerman <itz@very.loosely.org>, ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

Ian Zimmerman <itz@very.loosely.org> writes:
> But I _am_ in that location.  I am trying to build ccan from git sources.
> See transcript:
>
...
> tools/gen_deps.sh ccan/intmap > ccan/intmap/.d || rm -f ccan/intmap/.d
> make: 'tools/configurator/configurator' is up to date.

It actually works fine.  We should suppress the output for that test
though.

Thanks,
Rusty.
