Return-Path: <SRS0=m9xQ=CU=lists.ozlabs.org=ccan-bounces+ccan=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C08C43461
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 09:27:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D281C2087C
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 09:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nexedi.com header.i=kirr@nexedi.com header.b="b9jDu/Cg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="V0UsXOkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D281C2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nexedi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnr5D5gdXzDqjY
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 19:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mandrillapp.com (client-ip=198.2.134.14;
 helo=mail134-14.atl141.mandrillapp.com;
 envelope-from=bounce-md_31050260.5f5b3f7f.v1-f0c54b02174e4c628fea411c6a032b06@mandrillapp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nexedi.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nexedi.com header.i=kirr@nexedi.com header.a=rsa-sha256
 header.s=mandrill header.b=b9jDu/Cg; 
 dkim=pass (1024-bit key;
 unprotected) header.d=mandrillapp.com header.i=@mandrillapp.com
 header.a=rsa-sha256 header.s=mandrill header.b=V0UsXOkO; 
 dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 19:27:40 AEST
Received: from mail134-14.atl141.mandrillapp.com
 (mail134-14.atl141.mandrillapp.com [198.2.134.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnr581dLNzDqhH
 for <ccan@lists.ozlabs.org>; Fri, 11 Sep 2020 19:27:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=nexedi.com;
 h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=kirr@nexedi.com; 
 bh=k/0tgnvDa0DNu7xGN2jqm5oyfRREAxF/ym/bxhkUUVY=;
 b=b9jDu/CgVazfJRt9wifkCrBrj27CCdmFQ7wHU3YPpI6cYrByLGAX7C3XBIwwBQPmIC4AGMG/T8p6
 uiCDtF3BkI3WKivNqOzUlPqGlgOL4KF2W3KbGlYdVAiGRyEyzPC/uoROrzeaYLY7iE+UhgMpvkVi
 JbrUPfaS7fnQMR79Duw=
Received: from pmta03.mandrill.prod.atl01.rsglab.com (127.0.0.1) by
 mail134-14.atl141.mandrillapp.com id hbd1go1sau8v for <ccan@lists.ozlabs.org>;
 Fri, 11 Sep 2020 09:12:31 +0000 (envelope-from
 <bounce-md_31050260.5f5b3f7f.v1-f0c54b02174e4c628fea411c6a032b06@mandrillapp.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1599815551; h=From : 
 Subject : To : Cc : Message-Id : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=k/0tgnvDa0DNu7xGN2jqm5oyfRREAxF/ym/bxhkUUVY=; 
 b=V0UsXOkOOLrCT3wWd4Co/lhLVFiWUdcSh6pTW1LtfBig8eVoEPMg/Jsp3MkfI+7cT2sY1S
 z8RUgvx3uEu+KIZoiK7Lzzns71gm6QJRbJx/iAJC+2rDApvP4PVeA68lPcUHBw5AQMAKtfE6
 sU+2Epv2w14DFoDnxJVMpV9Vq49/Y=
From: Kirill Smelkov <kirr@nexedi.com>
Received: from [87.98.221.171] by mandrillapp.com id
 f0c54b02174e4c628fea411c6a032b06; Fri, 11 Sep 2020 09:12:31 +0000
To: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200911091225.GA2967@deco.navytux.spb.ru>
References: <20200910191610.131510-1-kirr@nexedi.com>
 <20200911005734.GG66834@yekko.fritz.box>
In-Reply-To: <20200911005734.GG66834@yekko.fritz.box>
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here:
 http://mandrillapp.com/contact/abuse?id=31050260.f0c54b02174e4c628fea411c6a032b06
X-Mandrill-User: md_31050260
Date: Fri, 11 Sep 2020 09:12:31 +0000
MIME-Version: 1.0
Subject: Re: [ccan] [PATCH] *: Fix build with recent gcc/binutils
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

On Fri, Sep 11, 2020 at 10:57:34AM +1000, David Gibson wrote:
> On Thu, Sep 10, 2020 at 07:16:19PM +0000, Kirill Smelkov wrote:
> > With current Debian testing I get:
> > 
> > 	tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/compiler/ && touch ccan/compiler/.ok
> > 	compiler: Module tests compile (tests_compile): FAIL
> > 	/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/compiler/test/run-is_compile_constant.c:Compile failed:
> > 	/usr/bin/ld: /tmp/ccanlint-129350.1804289383/tap.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/tap/tap.h:249: multiple definition of `tap_fail_callback'; /tmp/ccrAwqbl.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/tap/tap.h:249: first defined here
> > 	collect2: error: ld returned 1 exit status
> > 	...
> > 
> > 	cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/ccanlint/ccanlint.d -MTtools/ccanlint/ccanlint tools/ccanlint/ccanlint.c tools/ccanlint/async.o tools/ccanlint/file_analysis.o tools/ccanlint/licenses.o tools/ccanlint/tests/avoids_cpp_reserved.o tools/ccanlint/tests/depends_accurate.o tools/ccanlint/tests/depends_build.o tools/ccanlint/tests/depends_build_without_features.o tools/ccanlint/tests/depends_exist.o tools/ccanlint/tests/examples_compile.o tools/ccanlint/tests/examples_exist.o tools/ccanlint/tests/examples_relevant.o tools/ccanlint/tests/examples_run.o tools/ccanlint/tests/hash_if.o tools/ccanlint/tests/headers_idempotent.o tools/ccanlint/tests/info_compiles.o tools/ccanlint/tests/info_documentation_exists.o tools/ccanlint/tests/info_exists.o tools/ccanlint/tests/info_ported.o tools/ccanlint/tests/info_summary_single_line.o tools/cca
 nlin
> >  t/tests/license_comment.o tools/ccanlint/tests/license_depends_compat.o tools/ccanlint/tests/license_exists.o tools/ccanlint/tests/license_file_compat.o tools/ccanlint/tests/main_header_compiles.o tools/ccanlint/tests/main_header_exists.o tools/ccanlint/tests/module_builds.o tools/ccanlint/tests/module_links.o tools/ccanlint/tests/no_trailing_whitespace.o tools/ccanlint/tests/objects_build.o tools/ccanlint/tests/objects_build_with_stringchecks.o tools/ccanlint/tests/objects_build_without_features.o tools/ccanlint/tests/reduce_features.o tools/ccanlint/tests/tests_compile.o tools/ccanlint/tests/tests_compile_coverage.o tools/ccanlint/tests/tests_coverage.o tools/ccanlint/tests/tests_exist.o tools/ccanlint/tests/tests_helpers_compile.o tools/ccanlint/tests/tests_pass.o tools/ccanlint/tests/tests_pass_valgrind.o tools/ccanlint/tests/tests_pass_without_features.o ccan/autodata/autodata.o ccan/dgraph/dgraph.o ccan/ilog/ilog.o ccan/lbalance/lbalance.o ccan/ptr_valid/ptr_valid.o ccan/s
 trma
> >  p/strmap.o tools/ccan_dir.o tools/compi
> > 	le.o tools/depends.o tools/doc_extract-core.o tools/gcov.o tools/manifest.o tools/read_config_header.o tools/tools.o ccan/asort/asort.o ccan/err/err.o ccan/foreach/foreach.o ccan/hash/hash.o ccan/htable/htable.o ccan/list/list.o ccan/membuf/membuf.o ccan/noerr/noerr.o ccan/opt/helpers.o ccan/opt/opt.o ccan/opt/parse.o ccan/opt/usage.o ccan/rbuf/rbuf.o ccan/read_write_all/read_write_all.o ccan/str/debug.o ccan/str/str.o ccan/take/take.o ccan/tal/tal.o ccan/tal/grab_file/grab_file.o ccan/tal/link/link.o ccan/tal/path/path.o ccan/tal/str/str.o ccan/time/time.o -lm -o tools/ccanlint/ccanlint
> > 	/usr/bin/ld: tools/ccanlint/async.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	/usr/bin/ld: tools/ccanlint/file_analysis.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	/usr/bin/ld: tools/ccanlint/licenses.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	/usr/bin/ld: tools/ccanlint/tests/avoids_cpp_reserved.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined
> > 	here
> > 	/usr/bin/ld: tools/ccanlint/tests/depends_accurate.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	/usr/bin/ld: tools/ccanlint/tests/depends_build.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	/usr/bin/ld: tools/ccanlint/tests/depends_build_without_features.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> > 	...
> > 
> > The errors are valid becuase symbols are declared without extern in .h
> > files and those .h files are included from multiple translation units.
> > 
> > -> Fix it. I'm not sure why it used to compile ok before.
> > 
> > Signed-off-by: Kirill Smelkov <kirr@nexedi.com>
> 
> Applied, thanks.

Thanks, David.

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
