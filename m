From: Ian Zimmerman <itz@very.loosely.org>
Subject: Re: Test failure
Date: Sat, 2 Sep 2017 01:00:25 -0700
Message-ID: <20170902080025.pteplhvgkx4nrzo2@matica.foolinux.mooo.com>
References: <20170901033420.qxcy4qyimzwv7tbd@matica.foolinux.mooo.com>
 <871snp92tc.fsf@rustcorp.com.au>
Reply-To: ccan@lists.ozlabs.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="2rlonqmgfgjuw5ux"
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ahiker.mooo.com (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkpSj1zJQzDqp3
 for <ccan@lists.ozlabs.org>; Sat,  2 Sep 2017 18:00:36 +1000 (AEST)
Received: from [10.8.78.6] (port=57010 helo=matica.foolinux.mooo.com)
 by ahiker.mooo.com with esmtp (Exim 4.89)
 (envelope-from <itz@ahiker.mooo.com>) id 1do3M3-00083G-2R
 for ccan@lists.ozlabs.org; Sat, 02 Sep 2017 01:00:35 -0700
Received: from itz by matica.foolinux.mooo.com with local (Exim 4.89)
 (envelope-from <itz@ahiker.mooo.com>) id 1do3Lu-0001Cd-0v
 for ccan@lists.ozlabs.org; Sat, 02 Sep 2017 01:00:26 -0700
Content-Disposition: inline
In-Reply-To: <871snp92tc.fsf@rustcorp.com.au>
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


--2rlonqmgfgjuw5ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2017-09-02 13:20, Rusty Russell wrote:

> > tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/io/ && touch ccan/io/.ok
> > io: Module examples with expected output give that output (examples_run): FAIL
> > /tmp/ccanlint-24192.1804289383/example-_info-io.c:2:output '' didn't match 'tr a-z a-z'
> >
> > io: Total score: 82/87 FAIL!
> > make: *** [Makefile:78: ccan/io/.ok] Error 1
> >
> > What's up?
> 
> Hmm, can't reproduce here.
> 
> Can you run this test manually?
> 
>   $ tools/ccanlint/ccanlint -k --target=examples_run ccan/io
>   $ echo tr A-Z a-z | strace /tmp/ccanlint-*/example-_info-io tr A-Z a-z
> 
> The output should show what's going wrong.

Attached.  I can't make any sense of it w/o dropping to gdb.

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
Do obvious transformation on domain to reply privately _only_ on Usenet.

--2rlonqmgfgjuw5ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=test_output

execve("/tmp/ccanlint-2217.1804289383/example-_info-io", ["/tmp/ccanlint-2217.1804289383/ex"..., "/tmp/ccanlint-28097.1804289383/e"..., "tr", "A-Z", "a-z"], [/* 51 vars */]) = 0
brk(NULL)                               = 0x7ee000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6c74233000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=114539, ...}) = 0
mmap(NULL, 114539, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f6c74217000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\7\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1680808, ...}) = 0
mmap(NULL, 3786968, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f6c73c74000
mprotect(0x7f6c73e07000, 2097152, PROT_NONE) = 0
mmap(0x7f6c74007000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x193000) = 0x7f6c74007000
mmap(0x7f6c7400d000, 14552, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f6c7400d000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6c74216000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6c74215000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6c74214000
arch_prctl(ARCH_SET_FS, 0x7f6c74215700) = 0
mprotect(0x7f6c74007000, 16384, PROT_READ) = 0
mprotect(0x60a000, 4096, PROT_READ)     = 0
mprotect(0x7f6c74234000, 4096, PROT_READ) = 0
munmap(0x7f6c74217000, 114539)          = 0
pipe([3, 4])                            = 0
pipe([5, 6])                            = 0
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f6c742159d0) = 4488
close(3)                                = 0
close(6)                                = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[PIPE], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f6c73ca7690}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
brk(NULL)                               = 0x7ee000
brk(0x80f000)                           = 0x80f000
fcntl(0, F_GETFL)                       = 0 (flags O_RDONLY)
fcntl(0, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
fcntl(4, F_GETFL)                       = 0x1 (flags O_WRONLY)
fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  = 0
fcntl(5, F_GETFL)                       = 0 (flags O_RDONLY)
fcntl(5, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
fcntl(1, F_GETFL)                       = 0x8402 (flags O_RDWR|O_APPEND|O_LARGEFILE)
fcntl(1, F_SETFL, O_RDWR|O_APPEND|O_NONBLOCK|O_LARGEFILE) = 0
poll([{fd=0, events=POLLIN}, {fd=-4}, {fd=5, events=POLLIN}, {fd=1, events=POLLOUT}], 4, -1) = 3 ([{fd=0, revents=POLLIN|POLLHUP}, {fd=5, revents=POLLIN}, {fd=1, revents=POLLOUT}])
read(0, "tr A-Z a-z\n", 4096)           = 11
read(5, "\0", 4095)                     = 1
write(1, "\0", 1)                       = 1
poll([{fd=0, events=POLLIN}, {fd=4, events=POLLOUT}, {fd=5, events=POLLIN}, {fd=1, events=POLLOUT}], 4, -1) = 3 ([{fd=0, revents=POLLHUP}, {fd=4, revents=POLLOUT}, {fd=1, revents=POLLOUT}])
close(0)                                = 0
write(4, "tr A-Z a-z\n", 11)            = 11
close(4)                                = 0
poll([{fd=1, events=POLLOUT}, {fd=5, events=POLLIN}], 2, -1) = 1 ([{fd=1, revents=POLLOUT}])
write(1, "\0", 1)                       = 1
poll([{fd=-1}, {fd=5, events=POLLIN}], 2, -1) = 1 ([{fd=5, revents=POLLIN}])
read(5, "r a-z a-z\n", 4094)            = 10
poll([{fd=1, events=POLLOUT}, {fd=5, events=POLLIN}], 2, -1) = 2 ([{fd=1, revents=POLLOUT}, {fd=5, revents=POLLHUP}])
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=4488, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
write(1, " a-z a-z\n", 9 a-z a-z
)               = 9
close(5)                                = 0
poll([{fd=1, events=POLLOUT}], 1, -1)   = 1 ([{fd=1, revents=POLLOUT}])
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 18446744073709551607) = -1 EFAULT (Bad address)
close(1)                                = 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 4488
exit_group(0)                           = ?
+++ exited with 0 +++
--2rlonqmgfgjuw5ux
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--2rlonqmgfgjuw5ux--
