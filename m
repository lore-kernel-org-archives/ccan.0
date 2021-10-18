Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB81ECAAD2
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 07:02:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBnH0KYGz2xHq
	for <ccan@archiver.kernel.org>; Thu,  1 Sep 2022 17:02:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=BtdASpdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=protonmail.com (client-ip=185.70.41.103; helo=mail-41103.protonmail.ch; envelope-from=zmnscpxj@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=BtdASpdF;
	dkim-atps=neutral
X-Greylist: delayed 370 seconds by postgrey-1.36 at boromir; Mon, 18 Oct 2021 19:02:04 AEDT
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4HXq8r2G1gz2xrX
	for <ccan@lists.ozlabs.org>; Mon, 18 Oct 2021 19:02:04 +1100 (AEDT)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4HXq1T5sHZz4wxc1
	for <ccan@lists.ozlabs.org>; Mon, 18 Oct 2021 07:55:41 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BtdASpdF"
Date: Mon, 18 Oct 2021 07:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1634543722;
	bh=prFknO+8rADaT27Q67eQ2dH76SoofYJk3TUHdZP+vCY=;
	h=Date:To:From:Reply-To:Subject:From;
	b=BtdASpdF/TUG30rvhkgwXEygtMygKZsOSTchhkIPn6mQgmvpRIRSsStKI7k97MmWk
	 x09A1oHj6c3UqWhlUolK6+pjuCQJfJuSLQqdjTgePmnlEdEBq9Doi0Adk+QJOn7or5
	 9jMEJSiveijMJXjXXUxii+NQ45gkJ0QoONpYC7bE=
To: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
From: ZmnSCPxj <ZmnSCPxj@protonmail.com>
Message-ID: <NphfBZ5QgfxSaZZzJKHPA8BkA3pMp1fUrfxsEytnbgis9tWzVSJjtnjiMzEkClp_XQr2cdEcFZLFQw2nvEbs_YDwLPADYgrQdK4BBjdu8rs=@protonmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:02:25 +1000
Subject: [ccan] [PATCH 1/2] closefrom: Close all file descriptors above a
 certain value.
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

From 0ff501e58f71e1ce9bc296eb9efe01755d562947 Mon Sep 17 00:00:00 2001
From: ZmnSCPxj jxPCSnmZ <ZmnSCPxj@protonmail.com>
Date: Mon, 18 Oct 2021 14:36:43 +0800
Subject: [PATCH 1/2] closefrom: Close all file descriptors above a certain
 value.

For more information: https://github.com/ElementsProject/lightning/issues/4868

Signed-off-by: ZmnSCPxj jxPCSnmZ <ZmnSCPxj@protonmail.com>

---
 ccan/closefrom/LICENSE            |   1 +
 ccan/closefrom/_info              |  65 ++++++++++
 ccan/closefrom/closefrom.c        | 196 ++++++++++++++++++++++++++++++
 ccan/closefrom/closefrom.h        |  54 ++++++++
 ccan/closefrom/test/run.c         | 189 ++++++++++++++++++++++++++++
 tools/configurator/configurator.c |  37 ++++++
 6 files changed, 542 insertions(+)
 create mode 120000 ccan/closefrom/LICENSE
 create mode 100644 ccan/closefrom/_info
 create mode 100644 ccan/closefrom/closefrom.c
 create mode 100644 ccan/closefrom/closefrom.h
 create mode 100644 ccan/closefrom/test/run.c

diff --git a/ccan/closefrom/LICENSE b/ccan/closefrom/LICENSE
new file mode 120000
index 00000000..b7951dab
--- /dev/null
+++ b/ccan/closefrom/LICENSE
@@ -0,0 +1 @@
+../../licenses/CC0
\ No newline at end of file
diff --git a/ccan/closefrom/_info b/ccan/closefrom/_info
new file mode 100644
index 00000000..4e6f2f16
--- /dev/null
+++ b/ccan/closefrom/_info
@@ -0,0 +1,65 @@
+#include "config.h"
+#include <stdio.h>
+#include <string.h>
+
+/**
+ * closefrom - close all fds starting from specified fd.
+ *
+ * This code is an example of what to do in a child process to
+ * ensure that none of the (possibly sensitive) file descriptors
+ * in the parent remain in the child process.
+ *
+ * License: CC0 (Public domain)
+ * Author: ZmnSCPxj jxPCSnmZ <ZmnSCPxj@protonmail.com>
+ *
+ * Example:
+ * #include <ccan/closefrom/closefrom.h>
+ * #include <ccan/err/err.h>
+ * #include <sys/resource.h>
+ * #include <sys/time.h>
+ * #include <sys/types.h>
+ * #include <sys/wait.h>
+ * #include <unistd.h>
+ *
+ * int main(int argc, char **argv)
+ * {
+ *	pid_t child;
+ *
+ *	if (closefrom_may_be_slow()) {
+ *		// If being emulated, then we might end up
+ *		// looping over a large _SC_OPEN_MAX
+ *		// (Some systems have it as INT_MAX!)
+ *		// If so, closefrom_may_be_slow() will return
+ *		// true and we should keep _SC_OPEN_MAX down
+ *		// by the below:
+ *		struct rlimit nofile = {1024, 1024};
+ *		setrlimit(RLIMIT_NOFILE, &nofile);
+ *	}
+ *
+ *	child = fork();
+ *	if (child < 0)
+ *		err(1, "Forking");
+ *	if (child == 0) {
+ *		closefrom(STDERR_FILENO + 1);
+ *		// Insert your *whatever* code here.
+ *		_exit(0);
+ *	}
+ *
+ *	waitpid(child, NULL, 0);
+ *
+ *	return 0;
+ * }
+ *
+ */
+int main(int argc, char *argv[])
+{
+	/* Expect exactly one argument */
+	if (argc != 2)
+		return 1;
+
+	if (strcmp(argv[1], "depends") == 0) {
+		return 0;
+	}
+
+	return 1;
+}
diff --git a/ccan/closefrom/closefrom.c b/ccan/closefrom/closefrom.c
new file mode 100644
index 00000000..b529f724
--- /dev/null
+++ b/ccan/closefrom/closefrom.c
@@ -0,0 +1,196 @@
+/* CC0 license (public domain) - see LICENSE file for details */
+#include <ccan/closefrom/closefrom.h>
+#include <dirent.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+/* See also:
+ * https://stackoverflow.com/a/918469
+ *
+ * The implementation below is not exhaustive of all the suggested above.
+ */
+
+#if !HAVE_CLOSEFROM
+
+/* IBM AIX.
+ * https://www.ibm.com/docs/en/aix/7.2?topic=f-fcntl-dup-dup2-subroutine
+ */
+#if HAVE_F_CLOSEM
+
+#include <fcntl.h>
+
+void closefrom(int fromfd)
+{
+	(void) fcntl(fromfd, F_CLOSEM, 0);
+}
+
+int closefrom_may_be_slow(void)
+{
+	return 0;
+}
+
+#else /* !HAVE_F_CLOSEM */
+
+#if HAVE_NR_CLOSE_RANGE
+#include <sys/syscall.h>
+#endif
+
+#define PROC_PID_FD_LEN \
+	( 6  /* /proc/ */ \
+	+ 20 /* 64-bit $PID */ \
+	+ 3  /* /fd */ \
+	+ 1  /* NUL */ \
+	)
+
+static int can_get_maxfd(void)
+{
+#if HAVE_F_MAXFD
+	int res = fcntl(0, F_MAXFD);
+	if (res < 0)
+		return 0;
+	else
+		return 1;
+#else
+	return 0;
+#endif
+}
+
+/* Linux >= 5.9 */
+static int can_close_range(void)
+{
+#if HAVE_NR_CLOSE_RANGE
+	int res = syscall(__NR_close_range, INT_MAX, INT_MAX, 0);
+	if (res < 0)
+		return 0;
+	return 1;
+#else
+	return 0;
+#endif
+}
+
+/* On Linux, Solaris, AIX, Cygwin, and NetBSD.  */
+static int can_open_proc_pid_fd(void)
+{
+	char dnam[PROC_PID_FD_LEN];
+	DIR *dir;
+
+	sprintf(dnam, "/proc/%ld/fd", (long) getpid());
+	dir = opendir(dnam);
+	if (!dir)
+		return 0;
+	closedir(dir);
+	return 1;
+}
+
+/* On FreeBSD and MacOS.  */
+static int can_open_dev_fd(void)
+{
+	DIR *dir;
+	dir = opendir("/dev/fd");
+	if (!dir)
+		return 0;
+	closedir(dir);
+	return 1;
+}
+
+int closefrom_may_be_slow(void)
+{
+	if (can_get_maxfd())
+		return 0;
+	else if (can_close_range())
+		return 0;
+	else if (can_open_proc_pid_fd())
+		return 0;
+	else if (can_open_dev_fd())
+		return 0;
+	else
+		return 1;
+}
+
+/* It is possible that we run out of available file descriptors.
+ * However, if we are going to close anyway, we could just try
+ * closing file descriptors until we reach maxfd.
+ */
+static
+DIR *try_opendir(const char *dnam, int *fromfd, int maxfd)
+{
+	DIR *dir;
+
+	do {
+		dir = opendir(dnam);
+		if (!dir && (errno == ENFILE || errno == EMFILE)) {
+			if (*fromfd < maxfd)
+				close((*fromfd)++);
+			else
+				break;
+		}
+	} while (!dir && (errno == ENFILE || errno == EMFILE));
+
+	return dir;
+}
+
+void closefrom(int fromfd)
+{
+	int saved_errno = errno;
+
+	int res;
+	int maxfd;
+
+	char dnam[PROC_PID_FD_LEN];
+	DIR *dir;
+	struct dirent *entry;
+
+	(void) res;
+
+	if (fromfd < 0)
+		goto quit;
+
+#if HAVE_NR_CLOSE_RANGE
+	res = syscall(__NR_close_range, fromfd, INT_MAX, 0);
+	if (res == 0)
+		goto quit;
+#endif
+
+	maxfd = sysconf(_SC_OPEN_MAX);
+
+	sprintf(dnam, "/proc/%ld/fd", (long) getpid());
+	dir = try_opendir(dnam, &fromfd, maxfd);
+	if (!dir)
+		dir = try_opendir("/dev/fd", &fromfd, maxfd);
+
+	if (dir) {
+		while ((entry = readdir(dir))) {
+			long fd;
+			char *endp;
+
+			fd = strtol(entry->d_name, &endp, 10);
+			if (entry->d_name != endp && *endp == '\0' &&
+			    fd >= 0 && fd < INT_MAX && fd >= fromfd &&
+			    fd != dirfd(dir) )
+				close(fd);
+		}
+		closedir(dir);
+		goto quit;
+	}
+
+#if HAVE_F_MAXFD
+	res = fcntl(0, F_MAXFD);
+	if (res >= 0)
+		maxfd = res + 1;
+#endif
+
+	/* Fallback.  */
+	for (; fromfd < maxfd; ++fromfd)
+		close(fromfd);
+
+quit:
+	errno = saved_errno;
+}
+
+#endif /* !HAVE_F_CLOSEM */
+
+#endif /* !HAVE_CLOSEFROM */
diff --git a/ccan/closefrom/closefrom.h b/ccan/closefrom/closefrom.h
new file mode 100644
index 00000000..e3270e6a
--- /dev/null
+++ b/ccan/closefrom/closefrom.h
@@ -0,0 +1,54 @@
+/* CC0 license (public domain) - see LICENSE file for details */
+#ifndef CCAN_CLOSEFROM_H
+#define CCAN_CLOSEFROM_H
+#include "config.h"
+
+#if HAVE_CLOSEFROM
+/* BSD.  */
+#include <unistd.h>
+/* Solaris.  */
+#include <stdlib.h>
+
+static inline
+int closefrom_may_be_slow(void)
+{
+	return 0;
+}
+
+#else /* !HAVE_CLOSEFROM */
+
+/**
+ * closefrom - Close all open file descriptors, starting
+ * at fromfd onwards.
+ * @fromfd: the first fd to close; it and all higher file descriptors
+ * will be closed.
+ *
+ * This is not multithread-safe: other threads in the same process
+ * may or may not open new file descriptors in parallel to this call.
+ * However, the expected use-case is that this will be called in a
+ * child process just after fork(), meaning the child process is still
+ * single-threaded.
+ */
+void closefrom_(int fromfd);
+/* In case the standard library has it, but declared in some
+ * *other* header we do not know of yet, we use closefrom_ in
+ * the actual name the linker sees.
+ */
+#define closefrom closefrom_
+
+/**
+ * closefrom_may_be_slow - check if the closefrom() function could
+ * potentially take a long time.
+ *
+ * The return value is non-0 if closefrom() is emulated by
+ * looping from fromfd to sysconf(_SC_OPEN_MAX), which can be
+ * very large (possibly even INT_MAX on some systems).
+ * If so, you might want to use setrlimit to limit _SC_OPEN_MAX.
+ * If this returns 0, then closefrom is efficient and you do not
+ * need to limit the number of file descriptors.
+ */
+int closefrom_may_be_slow(void);
+
+#endif /* !HAVE_CLOSEFROM */
+
+#endif /* CCAN_CLOSEFROM_H */
diff --git a/ccan/closefrom/test/run.c b/ccan/closefrom/test/run.c
new file mode 100644
index 00000000..843fbdcd
--- /dev/null
+++ b/ccan/closefrom/test/run.c
@@ -0,0 +1,189 @@
+#include <ccan/closefrom/closefrom.h>
+/* Include the C files directly. */
+#include <ccan/closefrom/closefrom.c>
+#include <ccan/tap/tap.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+/* Open a pipe, do closefrom, check pipe no longer works.   */
+static
+int pipe_close(void)
+{
+	int fds[2];
+	ssize_t wres;
+
+	char buf = '\0';
+
+	if (pipe(fds) < 0)
+		return 0;
+
+	/* Writing to the write end should succeed, the
+	 * pipe is working.  */
+	do {
+		wres = write(fds[1], &buf, 1);
+	} while ((wres < 0) && (errno == EINTR));
+	if (wres < 0)
+		return 0;
+
+	closefrom(STDERR_FILENO + 1);
+
+	/* Writing to the write end should fail because
+	 * everything should be closed.  */
+	do {
+		wres = write(fds[1], &buf, 1);
+	} while ((wres < 0) && (errno == EINTR));
+
+	return (wres < 0) && (errno == EBADF);
+}
+
+/* Open a pipe, fork, do closefrom in child, read pipe from parent,
+ * parent should see EOF.
+ */
+static
+int fork_close(void)
+{
+	int fds[2];
+	pid_t child;
+
+	char buf;
+	ssize_t rres;
+
+	if (pipe(fds) < 0)
+		return 0;
+
+	child = fork();
+	if (child < 0)
+		return 0;
+
+	if (child == 0) {
+		/* Child.  */
+		closefrom(STDERR_FILENO + 1);
+		_exit(0);
+	} else {
+		/* Parent.  */
+
+		/* Close write end of pipe.  */
+		close(fds[1]);
+
+		do {
+			rres = read(fds[0], &buf, 1);
+		} while ((rres < 0) && (errno == EINTR));
+
+		/* Should have seen EOF.  */
+		if (rres != 0)
+			return 0;
+
+		/* Clean up.  */
+		waitpid(child, NULL, 0);
+		closefrom(STDERR_FILENO + 1);
+	}
+
+	return 1;
+}
+/* Open a pipe, fork, in child set the write end to fd #3,
+ * in parent set the read end to fd #3, send a byte from
+ * child to parent, check.
+ */
+static
+int fork_communicate()
+{
+	int fds[2];
+	pid_t child;
+
+	char wbuf = 42;
+	char rbuf;
+	ssize_t rres;
+	ssize_t wres;
+
+	int status;
+
+	if (pipe(fds) < 0)
+		return 0;
+
+	child = fork();
+	if (child < 0)
+		return 0;
+
+	if (child == 0) {
+		/* Child.  */
+
+		/* Move write end to fd #3.  */
+		if (fds[1] != 3) {
+			if (dup2(fds[1], 3) < 0)
+				_exit(127);
+			close(fds[1]);
+			fds[1] = 3;
+		}
+
+		closefrom(4);
+
+		do {
+			wres = write(fds[1], &wbuf, 1);
+		} while ((wres < 0) && (errno == EINTR));
+		if (wres < 0)
+			_exit(127);
+
+		_exit(0);
+	} else {
+		/* Parent.  */
+
+		/* Move read end to fd #3.  */
+		if (fds[0] != 3) {
+			if (dup2(fds[0], 3) < 0)
+				return 0;
+			close(fds[0]);
+			fds[0] = 3;
+		}
+
+		closefrom(4);
+
+		/* Wait for child to finish.  */
+		waitpid(child, &status, 0);
+		if (!WIFEXITED(status))
+			return 0;
+		if (WEXITSTATUS(status) != 0)
+			return 0;
+
+		/* Read 1 byte.  */
+		do {
+			rres = read(fds[0], &rbuf, 1);
+		} while ((rres < 0) && (errno == EINTR));
+		if (rres < 0)
+			return 0;
+		if (rres != 1)
+			return 0;
+		/* Should get same byte as what was sent.  */
+		if (rbuf != wbuf)
+			return 0;
+
+		/* Next attempt to read should EOF.  */
+		do {
+			rres = read(fds[0], &rbuf, 1);
+		} while ((rres < 0) && (errno == EINTR));
+		if (rres < 0)
+			return 0;
+		/* Should EOF.  */
+		if (rres != 0)
+			return 0;
+
+	}
+
+	/* Clean up.  */
+	close(fds[0]);
+	return 1;
+}
+
+int main(void)
+{
+	/* This is how many tests you plan to run */
+	plan_tests(3);
+
+	ok1(pipe_close());
+	ok1(fork_close());
+	ok1(fork_communicate());
+
+	/* This exits depending on whether all tests passed */
+	return exit_status();
+}
diff --git a/tools/configurator/configurator.c b/tools/configurator/configurator.c
index c0598509..fee9df83 100644
--- a/tools/configurator/configurator.c
+++ b/tools/configurator/configurator.c
@@ -498,6 +498,43 @@ static const struct test base_tests[] = {
 	  "	return __builtin_cpu_supports(\"mmx\");\n"
 	  "}"
 	},
+	{ "HAVE_CLOSEFROM", "closefrom() offered by system",
+	  "DEFINES_EVERYTHING", NULL, NULL,
+	  "#include <stdlib.h>\n"
+	  "#include <unistd.h>\n"
+	  "int main(void) {\n"
+	  "    int res = closefrom(STDERR_FILENO + 1);\n"
+	  "    return res < 0;\n"
+	  "}\n"
+	},
+	{ "HAVE_F_CLOSEM", "F_CLOSEM defined for fctnl.",
+	  "DEFINES_EVERYTHING", NULL, NULL,
+	  "#include <fcntl.h>\n"
+	  "#include <unistd.h>\n"
+	  "int main(void) {\n"
+	  "    int res = fcntl(STDERR_FILENO + 1, F_CLOSEM, 0);\n"
+	  "    return res < 0;\n"
+	  "}\n"
+	},
+	{ "HAVE_NR_CLOSE_RANGE", "close_range syscall available as __NR_close_range.",
+	  "DEFINES_EVERYTHING", NULL, NULL,
+	  "#include <limits.h>\n"
+	  "#include <sys/syscall.h>\n"
+	  "#include <unistd.h>\n"
+	  "int main(void) {\n"
+	  "    int res = syscall(__NR_close_range, STDERR_FILENO + 1, INT_MAX, 0);\n"
+	  "    return res < 0;\n"
+	  "}\n"
+	},
+	{ "HAVE_F_MAXFD", "F_MAXFD defined for fcntl.",
+	  "DEFINES_EVERYTHING", NULL, NULL,
+	  "#include <fcntl.h>\n"
+	  "#include <unistd.h>\n"
+	  "int main(void) {\n"
+	  "    int res = fcntl(0, F_MAXFD);\n"
+	  "    return res < 0;\n"
+	  "}\n"
+	},
 };

 static void c12r_err(int eval, const char *fmt, ...)
--
2.33.0

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
