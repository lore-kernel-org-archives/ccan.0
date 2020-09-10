Return-Path: <SRS0=MnlF=CT=lists.ozlabs.org=ccan-bounces+ccan=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCB5C43461
	for <ccan@archiver.kernel.org>; Thu, 10 Sep 2020 19:31:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5346821556
	for <ccan@archiver.kernel.org>; Thu, 10 Sep 2020 19:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nexedi.com header.i=kirr@nexedi.com header.b="eVLJWg3l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="htrC/J9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5346821556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nexedi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnTXX53k9zDqgV
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 05:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mandrillapp.com (client-ip=198.2.186.6;
 helo=mail186-6.suw21.mandrillapp.com;
 envelope-from=bounce-md_31050260.5f5a7b83.v1-2daef5a02a8845b8bcde8b6494ad4109@mandrillapp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nexedi.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nexedi.com header.i=kirr@nexedi.com header.a=rsa-sha256
 header.s=mandrill header.b=eVLJWg3l; 
 dkim=pass (1024-bit key;
 unprotected) header.d=mandrillapp.com header.i=@mandrillapp.com
 header.a=rsa-sha256 header.s=mandrill header.b=htrC/J9n; 
 dkim-atps=neutral
X-Greylist: delayed 909 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 05:31:32 AEST
Received: from mail186-6.suw21.mandrillapp.com
 (mail186-6.suw21.mandrillapp.com [198.2.186.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnTXN0dFwzDqg9
 for <ccan@lists.ozlabs.org>; Fri, 11 Sep 2020 05:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=nexedi.com;
 h=From:Subject:To:Cc:Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=kirr@nexedi.com; 
 bh=z+txiAypGeamGtqIPK8EX+qql9h8kofHpOvQbtdAiyU=;
 b=eVLJWg3l8x3OP4JAvPAic9yM38USpGA3hR+NCjtVgkEMIX91GUbsbmUWUj+NbbpGfcGR3Mmao6/j
 mnF9D5oWQL2wVDWTt2Djx/hL3RKEZ1EsKZMDuHAocEnT4x9KY/Sxxg5uc8Ovnaxnenn3KyjQoRRq
 m3Gic7x9r4qcNTW5N3U=
Received: from pmta02.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail186-6.suw21.mandrillapp.com id hb9vh8174bk8 for <ccan@lists.ozlabs.org>;
 Thu, 10 Sep 2020 19:16:19 +0000 (envelope-from
 <bounce-md_31050260.5f5a7b83.v1-2daef5a02a8845b8bcde8b6494ad4109@mandrillapp.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1599765379; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=z+txiAypGeamGtqIPK8EX+qql9h8kofHpOvQbtdAiyU=; 
 b=htrC/J9nJuzzfa1vZG/CjOjc0tMV5g/Q2xaww46andFGYqLCI/l08e4tu2QpW9E5O/adIF
 469Cyso55ulIGUrZrR0pxehXEqMRN2l5BTD+M0K5ug5sECKxp0vH8Q5ObuIVyo9TfIGjyOh7
 2O3n9dUuOzWJKaSWWWSVA2RXsyYnY=
From: Kirill Smelkov <kirr@nexedi.com>
Received: from [87.98.221.171] by mandrillapp.com id
 2daef5a02a8845b8bcde8b6494ad4109; Thu, 10 Sep 2020 19:16:19 +0000
X-Mailer: git-send-email 2.28.0
To: ccan@lists.ozlabs.org
Message-Id: <20200910191610.131510-1-kirr@nexedi.com>
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here:
 http://mandrillapp.com/contact/abuse?id=31050260.2daef5a02a8845b8bcde8b6494ad4109
X-Mandrill-User: md_31050260
Date: Thu, 10 Sep 2020 19:16:19 +0000
MIME-Version: 1.0
Subject: [ccan] [PATCH] *: Fix build with recent gcc/binutils
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

With current Debian testing I get:

	tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/compiler/ && touch ccan/compiler/.ok
	compiler: Module tests compile (tests_compile): FAIL
	/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/compiler/test/run-is_compile_constant.c:Compile failed:
	/usr/bin/ld: /tmp/ccanlint-129350.1804289383/tap.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/tap/tap.h:249: multiple definition of `tap_fail_callback'; /tmp/ccrAwqbl.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/tap/tap.h:249: first defined here
	collect2: error: ld returned 1 exit status
	...

	cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/ccanlint/ccanlint.d -MTtools/ccanlint/ccanlint tools/ccanlint/ccanlint.c tools/ccanlint/async.o tools/ccanlint/file_analysis.o tools/ccanlint/licenses.o tools/ccanlint/tests/avoids_cpp_reserved.o tools/ccanlint/tests/depends_accurate.o tools/ccanlint/tests/depends_build.o tools/ccanlint/tests/depends_build_without_features.o tools/ccanlint/tests/depends_exist.o tools/ccanlint/tests/examples_compile.o tools/ccanlint/tests/examples_exist.o tools/ccanlint/tests/examples_relevant.o tools/ccanlint/tests/examples_run.o tools/ccanlint/tests/hash_if.o tools/ccanlint/tests/headers_idempotent.o tools/ccanlint/tests/info_compiles.o tools/ccanlint/tests/info_documentation_exists.o tools/ccanlint/tests/info_exists.o tools/ccanlint/tests/info_ported.o tools/ccanlint/tests/info_summary_single_line.o tools/ccanlin
 t/tests/license_comment.o tools/ccanlint/tests/license_depends_compat.o tools/ccanlint/tests/license_exists.o tools/ccanlint/tests/license_file_compat.o tools/ccanlint/tests/main_header_compiles.o tools/ccanlint/tests/main_header_exists.o tools/ccanlint/tests/module_builds.o tools/ccanlint/tests/module_links.o tools/ccanlint/tests/no_trailing_whitespace.o tools/ccanlint/tests/objects_build.o tools/ccanlint/tests/objects_build_with_stringchecks.o tools/ccanlint/tests/objects_build_without_features.o tools/ccanlint/tests/reduce_features.o tools/ccanlint/tests/tests_compile.o tools/ccanlint/tests/tests_compile_coverage.o tools/ccanlint/tests/tests_coverage.o tools/ccanlint/tests/tests_exist.o tools/ccanlint/tests/tests_helpers_compile.o tools/ccanlint/tests/tests_pass.o tools/ccanlint/tests/tests_pass_valgrind.o tools/ccanlint/tests/tests_pass_without_features.o ccan/autodata/autodata.o ccan/dgraph/dgraph.o ccan/ilog/ilog.o ccan/lbalance/lbalance.o ccan/ptr_valid/ptr_valid.o ccan/strma
 p/strmap.o tools/ccan_dir.o tools/compi
	le.o tools/depends.o tools/doc_extract-core.o tools/gcov.o tools/manifest.o tools/read_config_header.o tools/tools.o ccan/asort/asort.o ccan/err/err.o ccan/foreach/foreach.o ccan/hash/hash.o ccan/htable/htable.o ccan/list/list.o ccan/membuf/membuf.o ccan/noerr/noerr.o ccan/opt/helpers.o ccan/opt/opt.o ccan/opt/parse.o ccan/opt/usage.o ccan/rbuf/rbuf.o ccan/read_write_all/read_write_all.o ccan/str/debug.o ccan/str/str.o ccan/take/take.o ccan/tal/tal.o ccan/tal/grab_file/grab_file.o ccan/tal/link/link.o ccan/tal/path/path.o ccan/tal/str/str.o ccan/time/time.o -lm -o tools/ccanlint/ccanlint
	/usr/bin/ld: tools/ccanlint/async.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	/usr/bin/ld: tools/ccanlint/file_analysis.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	/usr/bin/ld: tools/ccanlint/licenses.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	/usr/bin/ld: tools/ccanlint/tests/avoids_cpp_reserved.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined
	here
	/usr/bin/ld: tools/ccanlint/tests/depends_accurate.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	/usr/bin/ld: tools/ccanlint/tests/depends_build.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	/usr/bin/ld: tools/ccanlint/tests/depends_build_without_features.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
	...

The errors are valid becuase symbols are declared without extern in .h
files and those .h files are included from multiple translation units.

-> Fix it. I'm not sure why it used to compile ok before.

Signed-off-by: Kirill Smelkov <kirr@nexedi.com>
---
 ccan/tap/tap.c            | 1 +
 ccan/tap/tap.h            | 2 +-
 tools/ccanlint/licenses.h | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ccan/tap/tap.c b/ccan/tap/tap.c
index bf8a276c..b3782104 100644
--- a/ccan/tap/tap.c
+++ b/ccan/tap/tap.c
@@ -43,6 +43,7 @@ static const char *todo_msg_fixed = "libtap malloc issue";
 static int todo = 0;
 static int test_died = 0;
 static int test_pid;
+void (*tap_fail_callback)(void) = NULL;
 
 /* Encapsulate the pthread code in a conditional.  In the absence of
    libpthread the code does nothing.
diff --git a/ccan/tap/tap.h b/ccan/tap/tap.h
index 5b21ff75..22c245d5 100644
--- a/ccan/tap/tap.h
+++ b/ccan/tap/tap.h
@@ -246,6 +246,6 @@ void plan_skip_all(const char *reason);
  *
  * This can be used to ease debugging, or exit on the first failure.
  */
-void (*tap_fail_callback)(void);
+extern void (*tap_fail_callback)(void);
 
 #endif /* CCAN_TAP_H */
diff --git a/tools/ccanlint/licenses.h b/tools/ccanlint/licenses.h
index 60d20376..b921fa62 100644
--- a/tools/ccanlint/licenses.h
+++ b/tools/ccanlint/licenses.h
@@ -30,7 +30,7 @@ struct license_info {
 };
 
 /* Is [project license][file license] compatible? */
-bool license_compatible[LICENSE_UNKNOWN+1][LICENSE_UNKNOWN];
+extern bool license_compatible[LICENSE_UNKNOWN+1][LICENSE_UNKNOWN];
 
 extern const struct license_info licenses[];
 
-- 
2.28.0

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
