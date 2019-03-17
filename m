From: Ian Zimmerman <itz@very.loosely.org>
Subject: make check fails in coroutine module
Date: Sun, 17 Mar 2019 15:39:44 -0700
Message-ID: <20190317223944.rebtzvfszp63qrze@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from very.loosely.org (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44MvmB4nDLzDqCX
 for <ccan@lists.ozlabs.org>; Mon, 18 Mar 2019 09:55:21 +1100 (AEDT)
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

cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/coroutine/coroutine.o.d -MTccan/coroutine/coroutine.o -c ccan/coroutine/coroutine.c -o ccan/coroutine/coroutine.o
tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/coroutine/ && touch ccan/coroutine/.ok
coroutine: Module's run and api tests pass (tests_pass): FAIL (+0/3)
/home/itz/git/ccan/ccan/coroutine/test/api-2.c:1..10
ok 1 - coroutine_stack_check(stack1, NULL) == stack1
ok 2 - coroutine_stack_size(stack1) == bufsz - COROUTINE_STK_OVERHEAD
ok 3 - coroutine_stack_check(stack2, NULL) == stack2
ok 4 - coroutine_stack_size(stack2) == bufsz - COROUTINE_STK_OVERHEAD
sh: line 1: 24908 Segmentation fault      (core dumped) valgrind -q --leak-check=full --log-fd=3 /tmp/ccanlint-24709.1804289383/api-2 3> /tmp/ccanlint-24709.1804289383/api-2.valgrind-log

... more (use -vv to see them all)
coroutine: Total score: 35/43 FAIL!
make: *** [Makefile:78: ccan/coroutine/.ok] Error 1

Perhaps it is relevant that the configurator check causing the segfault
- as discussed in the other thread - is HAVE_POINTER_SAFE_MAKECONTEXT
which, I believe, is only used by coroutine module.

Platform: x86_64, Fedora 28, gcc 8.3.1, glibc 2.27.  I didn't set any
special build flags or anything.

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
To reply privately _only_ on Usenet and on broken lists
which rewrite From, fetch the TXT record for no-use.mooo.com.
