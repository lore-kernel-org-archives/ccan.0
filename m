Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E6BECAAD1
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 07:02:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBnR6qjlz2xHq
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 17:02:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=v6hVBC7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=protonmail.com (client-ip=185.70.41.104; helo=mail-41104.protonmail.ch; envelope-from=zmnscpxj@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=v6hVBC7I;
	dkim-atps=neutral
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4HXqD35jS2z2xt6
	for <ccan@lists.ozlabs.org>; Mon, 18 Oct 2021 19:04:51 +1100 (AEDT)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4HXq2J2w8Jz4x756
	for <ccan@lists.ozlabs.org>; Mon, 18 Oct 2021 07:56:24 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="v6hVBC7I"
Date: Mon, 18 Oct 2021 07:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1634543773;
	bh=kdFw9C3FFWEkYfocz439lkYPP4axqlJhTbJDxN0qZWM=;
	h=Date:To:From:Reply-To:Subject:From;
	b=v6hVBC7IZ3/1c1dV4RU/VvahJ52EDWYTGpS5f+yMKXk0wFGPwLyQpAJ80ldM3RrEA
	 ZRagATv5F9c8hpH9+Fjg+H0cDH1n9bPjapJtTq6ZipK5mCBXNXg0ebR1B+c3hsRcuP
	 e5fjaKt2I5iXtz/LdJdBJ+BEJVT9mcxEBYtNaCcQ=
To: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
From: ZmnSCPxj <ZmnSCPxj@protonmail.com>
Message-ID: <NQALm57droQyV-k0BgF75D181ZT3z8Nv2b-x-eqNu73uLu8HCV1n8w_MGWqJHP2HoUpIaMn0FSvk9_sPSDMiI0jlhLB2cS-k80ysYIw-I44=@protonmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:02:25 +1000
Subject: [ccan] [PATCH 2/2] pipecmd: Use closefrom instead of iterating
 directly.
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
Reply-To: ZmnSCPxj <ZmnSCPxj@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>

From b48091be33010782e0b82245f3518c7b4cc94b9c Mon Sep 17 00:00:00 2001
From: ZmnSCPxj jxPCSnmZ <ZmnSCPxj@protonmail.com>
Date: Mon, 18 Oct 2021 15:50:31 +0800
Subject: [PATCH 2/2] pipecmd: Use closefrom instead of iterating directly.

Signed-off-by: ZmnSCPxj jxPCSnmZ <ZmnSCPxj@protonmail.com>

---
 ccan/pipecmd/_info     |  1 +
 ccan/pipecmd/pipecmd.c | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/ccan/pipecmd/_info b/ccan/pipecmd/_info
index 8c49511a..824f22e3 100644
--- a/ccan/pipecmd/_info
+++ b/ccan/pipecmd/_info
@@ -51,6 +51,7 @@ int main(int argc, char *argv[])
 		return 1;

 	if (strcmp(argv[1], "depends") == 0) {
+		printf("ccan/closefrom\n");
 		printf("ccan/noerr\n");
 		return 0;
 	}
diff --git a/ccan/pipecmd/pipecmd.c b/ccan/pipecmd/pipecmd.c
index 56cb67b6..0090275b 100644
--- a/ccan/pipecmd/pipecmd.c
+++ b/ccan/pipecmd/pipecmd.c
@@ -1,4 +1,5 @@
 /* CC0 license (public domain) - see LICENSE file for details */
+#include <ccan/closefrom/closefrom.h>
 #include <ccan/pipecmd/pipecmd.h>
 #include <ccan/noerr/noerr.h>
 #include <stdlib.h>
@@ -139,11 +140,21 @@ pid_t pipecmdarr(int *fd_tochild, int *fd_fromchild, int *fd_errfromchild,
 			close(errfromchild[1]);
 		}

+		/* Map execfail[1] to fd 3.  */
+		if (execfail[1] != 3) {
+			if (dup2(execfail[1], 3) == -1)
+				goto child_errno_fail;
+			/* CLOEXEC is not shared by dup2, so copy the flags
+			 * from execfail[1] to 3.
+			 */
+			if (fcntl(3, F_SETFD, fcntl(execfail[1], F_GETFD)) < 0)
+				goto child_errno_fail;
+			close(execfail[1]);
+			execfail[1] = 3;
+		}
+
 		/* Make (fairly!) sure all other fds are closed. */
-		int max = sysconf(_SC_OPEN_MAX);
-		for (i = 3; i < max; i++)
-			if (i != execfail[1])
-				close(i);
+		closefrom(4);

 		execvp(arr[0], arr);

--
2.33.0

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
