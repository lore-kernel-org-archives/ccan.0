From: Ian Zimmerman <itz@very.loosely.org>
Subject: configurator still segfaults, what am I doing wrong?
Date: Thu, 7 Feb 2019 20:13:10 -0800
Message-ID: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from very.loosely.org (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wjNp2gh7zDqVR
 for <ccan@lists.ozlabs.org>; Fri,  8 Feb 2019 15:48:10 +1100 (AEDT)
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
To: Ccan Mailinglist <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org

 matica!60 ccantest$ /home/itz/git/ccan/tools/create-ccan-tree --build-type=make+config /home/itz/ccantest/ccan tal
Building ccan_depends, modfiles
sh: line 1: 17440 Segmentation fault      (core dumped) ./configurator.out 2>&1
Cleaning source tree
Adding ccan/alignof
modfiles: Getting canonical version of directory ccan/alignof: No such file or directory
Adding ccan/build_assert
modfiles: Getting canonical version of directory ccan/build_assert: No such file or directory
Adding ccan/check_type
modfiles: Getting canonical version of directory ccan/check_type: No such file or directory
Adding ccan/compiler
modfiles: Getting canonical version of directory ccan/compiler: No such file or directory
Adding ccan/container_of
modfiles: Getting canonical version of directory ccan/container_of: No such file or directory
Adding ccan/hash
modfiles: Getting canonical version of directory ccan/hash: No such file or directory
Adding ccan/htable
modfiles: Getting canonical version of directory ccan/htable: No such file or directory
Adding ccan/likely
modfiles: Getting canonical version of directory ccan/likely: No such file or directory
Adding ccan/list
modfiles: Getting canonical version of directory ccan/list: No such file or directory
Adding ccan/str
modfiles: Getting canonical version of directory ccan/str: No such file or directory
Adding ccan/take
modfiles: Getting canonical version of directory ccan/take: No such file or directory
Adding ccan/tal
modfiles: Getting canonical version of directory ccan/tal: No such file or directory
Adding ccan/typesafe_cb
modfiles: Getting canonical version of directory ccan/typesafe_cb: No such file or directory
Adding licenses
Adding build infrastructure
cp: cannot stat '/home/itz/git/ccan/tools/..//Makefile-ccan': No such file or directory
Adding configurator
Done. ccan source tree built in /home/itz/ccantest/ccan

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
To reply privately _only_ on Usenet and on broken lists
which rewrite From, fetch the TXT record for no-use.mooo.com.
