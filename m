From: Andrew Jeffery <andrew@aj.id.au>
Subject: ASan failures in CCAN
Date: Mon, 05 Oct 2015 08:40:43 +1030
Message-ID: <1443996643.20796.55.camel@aj.id.au>
Reply-To: andrew@aj.id.au
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-DukX+3nYd/ins/J9Yfyx"
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ipmail04.adl6.internode.on.net (ipmail04.adl6.internode.on.net
 [150.101.137.141])
 by lists.ozlabs.org (Postfix) with ESMTP id 81AC21A0026
 for <ccan@lists.ozlabs.org>; Mon,  5 Oct 2015 09:10:47 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--=-DukX+3nYd/ins/J9Yfyx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi all,

(Sorry if you receive this twice, it appeared as if the first email I
sent didn't make it to the list and so I'm sending it again)

Out of curiosity I built the ccan modules with ASan[1] enabled to see
what I could shake out. Initially I did it to see whether it was a
quicker approach than running the valgrind tests, but the answer
appears to be no (at least for this approach). However, there were some
aborts triggered by ASAN which may be worth looking into. Overall there
are 13 aborts recorded in 6 modules:

* autodata
* cpuid
* dgraph
* failtest
* opt
* stringbuilder

I've attached a couple of patches that I used to get the results.
I'm not proposing they be included, but they might be useful to
reproduce the crashers.

The approach was to add a new make target (asancheck), adjust CFLAGS to
include -fsanitize=address as necessary and then piggy-back off the
fastcheck target(s), as they exclude the valgrind tests amongst others.

I had tried to attach a compressed log of the ccanlint output at -vv
but the email doesn't appear to have made it through to the list,
However applying the patches makes it easy to generate, so it's not
essential. Anyway, I've pulled out the ASan failures from the log and
added them below (which might save some time and trawling), but I used
an awk script to extract them so I might not have captured all of the
anomalies:

    awk '/^==[0-9]+==ERROR/ { p=1 } { if (p == 1) { print } } /^==[0-9]+==ABORTING/ { p=0; print ""; }' ...

Overall, I guess there are two types of outcomes:

1. The test case is misusing memory
2. The module is misusing memory

I started poking around to see if I could resolve some of the aborts,
but in some cases the solution wasn't immediately obvious to me (not
being familiar with the modules' implementations). As such I haven't
binned the aborts into cases 1 and 2 above, but hopefully the results
are interesting regardless :)

Cheers,

Andrew

[1] https://en.wikipedia.org/wiki/AddressSanitizer

The errors:

==4130==ERROR: AddressSanitizer: global-buffer-overflow on address 0x000000607280 at pc 0x4018f5 bp 0x7ffec5004b50 sp 0x7ffec5004b40
READ of size 32 at 0x000000607280 thread T0
    #0 0x4018f4 in autodata_make_table /home/ajeffery/Development/ccan/ccan/autodata/autodata.c:52
    #1 0x401c6a in main /home/ajeffery/Development/ccan/ccan/autodata/test/run-fools.c:62
    #2 0x2b94631fa7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #3 0x401508 in _start (/tmp/ccanlint-3978.1804289383/run-fools-1+0x401508)

0x000000607288 is located 0 bytes to the right of global variable 'fake_alpha' from '/home/ajeffery/Development/ccan/ccan/autodata/test/run-fools.c' (0x607280) of size 8
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/autodata/autodata.c:52 autodata_make_table
Shadow bytes around the buggy address:
  0x0000800b8e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0000800b8e10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0000800b8e20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0000800b8e30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0000800b8e40: 00 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
=>0x0000800b8e50:[00]f9 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
  0x0000800b8e60: 00 00 00 00 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
  0x0000800b8e70: 00 00 00 00 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
  0x0000800b8e80: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
  0x0000800b8e90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0000800b8ea0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==4130==ABORTING

==7419==ERROR: AddressSanitizer: SEGV on unknown address 0x00009109b4d0 (pc 0x2b5fc3b22ddd sp 0x7ffd8851a5c0 bp 0x7ffd8851a610 T0)
    #0 0x2b5fc3b22ddc in strncmp (/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/libasan.so.1+0x38ddc)
    #1 0x401451 in cpuid_get_cpu_type /home/ajeffery/Development/ccan/ccan/cpuid/test/../cpuid.c:241
    #2 0x40112e in cpuid_get_name /home/ajeffery/Development/ccan/ccan/cpuid/test/../cpuid.h:277
    #3 0x402755 in cpuid_write_info /home/ajeffery/Development/ccan/ccan/cpuid/test/../cpuid.c:376
    #4 0x4042a1 in main /home/ajeffery/Development/ccan/ccan/cpuid/test/run.c:16
    #5 0x2b5fc49e67af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #6 0x401058 in _start (/tmp/ccanlint-7375.1804289383/run+0x401058)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: SEGV ??:0 strncmp
==7419==ABORTING

==8615==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffd63b167b0 at pc 0x4016f1 bp 0x7ffd63b166f0 sp 0x7ffd63b166e0
READ of size 8 at 0x7ffd63b167b0 thread T0
    #0 0x4016f0 in dgraph_clear_node /home/ajeffery/Development/ccan/ccan/dgraph/dgraph.c:28
    #1 0x40340b in main /home/ajeffery/Development/ccan/ccan/dgraph/test/run-debug.c:91
    #2 0x2b86789b97af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #3 0x401128 in _start (/tmp/ccanlint-8442.1804289383/run-debug+0x401128)

Address 0x7ffd63b167b0 is located in stack of thread T0 at offset 128 in frame
    #0 0x402627 in main /home/ajeffery/Development/ccan/ccan/dgraph/test/run-debug.c:21

  This frame has 4 object(s):
    [32, 36) 'count'
    [96, 128) 'n1' <== Memory access at offset 128 overflows this variable
    [160, 192) 'n2'
    [224, 256) 'n3'
HINT: this may be a false positive if your program uses some custom stack unwind mechanism or swapcontext
      (longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: stack-buffer-overflow /home/ajeffery/Development/ccan/ccan/dgraph/dgraph.c:28 dgraph_clear_node
Shadow bytes around the buggy address:
  0x10002c75aca0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75acb0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75acc0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75acd0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75ace0: 00 00 00 00 00 00 f1 f1 f1 f1 04 f4 f4 f4 f2 f2
=>0x10002c75acf0: f2 f2 00 00 00 00[f2]f2 f2 f2 00 00 00 00 f2 f2
  0x10002c75ad00: f2 f2 00 00 00 00 f3 f3 f3 f3 00 00 00 00 00 00
  0x10002c75ad10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75ad20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75ad30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10002c75ad40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==8615==ABORTING

==8617==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffc674607d0 at pc 0x4016e0 bp 0x7ffc67460710 sp 0x7ffc67460700
READ of size 8 at 0x7ffc674607d0 thread T0
    #0 0x4016df in dgraph_clear_node /home/ajeffery/Development/ccan/ccan/dgraph/dgraph.c:28
    #1 0x4032d1 in main /home/ajeffery/Development/ccan/ccan/dgraph/test/run.c:90
    #2 0x2ae2cad447af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #3 0x401128 in _start (/tmp/ccanlint-8442.1804289383/run+0x401128)

Address 0x7ffc674607d0 is located in stack of thread T0 at offset 128 in frame
    #0 0x4025b0 in main /home/ajeffery/Development/ccan/ccan/dgraph/test/run.c:20

  This frame has 4 object(s):
    [32, 36) 'count'
    [96, 128) 'n1' <== Memory access at offset 128 overflows this variable
    [160, 192) 'n2'
    [224, 256) 'n3'
HINT: this may be a false positive if your program uses some custom stack unwind mechanism or swapcontext
      (longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: stack-buffer-overflow /home/ajeffery/Development/ccan/ccan/dgraph/dgraph.c:28 dgraph_clear_node
Shadow bytes around the buggy address:
  0x10000ce840a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce840b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce840c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce840d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce840e0: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f4
=>0x10000ce840f0: f4 f4 f2 f2 f2 f2 00 00 00 00[f2]f2 f2 f2 00 00
  0x10000ce84100: 00 00 f2 f2 f2 f2 00 00 00 00 f3 f3 f3 f3 00 00
  0x10000ce84110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce84120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce84130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10000ce84140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==8617==ABORTING

==30445==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000040d4df at pc 0x403b0c bp 0x7fffc3dd99f0 sp 0x7fffc3dd99e0
READ of size 1 at 0x00000040d4df thread T0
    #0 0x403b0b in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x4043e2 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x40aa6b in main /home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c:146
    #3 0x2b666022e7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #4 0x401778 in _start (/tmp/ccanlint-29919.1804289383/run-add_desc-1+0x401778)

0x00000040d4df is located 1 bytes to the left of global variable '*.LC25' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c' (0x40d4e0) of size 1
  '*.LC25' is ascii string ''
0x00000040d4df is located 55 bytes to the right of global variable '*.LC24' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c' (0x40d4a0) of size 8
  '*.LC24' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x000080079a40: 00 00 06 f9 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
  0x000080079a50: 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9
  0x000080079a60: 02 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 00
  0x000080079a70: 07 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x000080079a80: 00 04 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
=>0x000080079a90: 00 00 00 00 00 f9 f9 f9 f9 f9 f9[f9]01 f9 f9 f9
  0x000080079aa0: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 05 f9 f9 f9
  0x000080079ab0: f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
  0x000080079ac0: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 05 f9 f9 f9
  0x000080079ad0: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 06 f9 f9 f9
  0x000080079ae0: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 f9 f9 f9
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30445==ABORTING

==30449==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000040c7ff at pc 0x403b0c bp 0x7ffcc49e75a0 sp 0x7ffcc49e7590
READ of size 1 at 0x00000040c7ff thread T0
    #0 0x403b0b in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x4097b6 in main /home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c:24
    #2 0x2b8c7d1787af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #3 0x401778 in _start (/tmp/ccanlint-29919.1804289383/run-consume_words-1+0x401778)

0x00000040c7ff is located 1 bytes to the left of global variable '*.LC25' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c' (0x40c800) of size 1
  '*.LC25' is ascii string ''
0x00000040c7ff is located 55 bytes to the right of global variable '*.LC24' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c' (0x40c7c0) of size 8
  '*.LC24' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x0000800798a0: 00 00 00 00 00 00 06 f9 f9 f9 f9 f9 00 f9 f9 f9
  0x0000800798b0: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9
  0x0000800798c0: f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
  0x0000800798d0: 00 00 00 00 07 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
  0x0000800798e0: f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9 03 f9 f9 f9
=>0x0000800798f0: f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9 f9 f9 f9[f9]
  0x000080079900: 01 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x000080079910: 05 f9 f9 f9 f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9
  0x000080079920: 04 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x000080079930: 05 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x000080079940: 06 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30449==ABORTING

==30455==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000041e3bf at pc 0x406b2f bp 0x7fff1085e410 sp 0x7fff1085e400
READ of size 1 at 0x00000041e3bf thread T0
    #0 0x406b2e in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x407405 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x407f84 in opt_usage /home/ajeffery/Development/ccan/ccan/opt/usage.c:226
    #3 0x402be5 in opt_usage_and_exit /home/ajeffery/Development/ccan/ccan/opt/helpers.c:192
    #4 0x40900b in parse_one /home/ajeffery/Development/ccan/ccan/opt/parse.c:99
    #5 0x40619d in opt_parse /home/ajeffery/Development/ccan/ccan/opt/opt.c:210
    #6 0x41978d in main /home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c:1071
    #7 0x2af1a17a27af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #8 0x401918 in _start (/tmp/ccanlint-29919.1804289383/run-helpers-1+0x401918)

0x00000041e3bf is located 1 bytes to the left of global variable '*.LC64' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c' (0x41e3c0) of size 1
  '*.LC64' is ascii string ''
0x00000041e3bf is located 55 bytes to the right of global variable '*.LC63' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c' (0x41e380) of size 8
  '*.LC63' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x00008007bc20: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 f9 f9 f9
  0x00008007bc30: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9
  0x00008007bc40: f9 f9 f9 f9 00 00 00 00 00 00 00 00 07 f9 f9 f9
  0x00008007bc50: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 04 f9 f9
  0x00008007bc60: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
=>0x00008007bc70: 00 f9 f9 f9 f9 f9 f9[f9]01 f9 f9 f9 f9 f9 f9 f9
  0x00008007bc80: 03 f9 f9 f9 f9 f9 f9 f9 05 f9 f9 f9 f9 f9 f9 f9
  0x00008007bc90: 00 02 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x00008007bca0: 00 05 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 f9 f9
  0x00008007bcb0: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
  0x00008007bcc0: 00 00 01 f9 f9 f9 f9 f9 00 05 f9 f9 f9 f9 f9 f9
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30455==ABORTING

==30463==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000041069f at pc 0x403bbb bp 0x7ffdcfb22fd0 sp 0x7ffdcfb22fc0
READ of size 1 at 0x00000041069f thread T0
    #0 0x403bba in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x404491 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x405010 in opt_usage /home/ajeffery/Development/ccan/ccan/opt/usage.c:226
    #3 0x4096c9 in main /home/ajeffery/Development/ccan/ccan/opt/test/run-usage.c:42
    #4 0x2b0d1ed237af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #5 0x401818 in _start (/tmp/ccanlint-29919.1804289383/run-usage-1+0x401818)

0x00000041069f is located 59 bytes to the right of global variable '*.LC15' from '/home/ajeffery/Development/ccan/ccan/opt/test/utils.c' (0x410660) of size 4
  '*.LC15' is ascii string 'eee'
0x00000041069f is located 1 bytes to the left of global variable '*.LC16' from '/home/ajeffery/Development/ccan/ccan/opt/test/utils.c' (0x4106a0) of size 1
  '*.LC16' is ascii string ''
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x00008007a080: f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9 00 00 01 f9
  0x00008007a090: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9
  0x00008007a0a0: f9 f9 f9 f9 00 00 01 f9 f9 f9 f9 f9 06 f9 f9 f9
  0x00008007a0b0: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 00 03 f9
  0x00008007a0c0: f9 f9 f9 f9 00 00 01 f9 f9 f9 f9 f9 04 f9 f9 f9
=>0x00008007a0d0: f9 f9 f9[f9]01 f9 f9 f9 f9 f9 f9 f9 00 01 f9 f9
  0x00008007a0e0: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 00 03 f9
  0x00008007a0f0: f9 f9 f9 f9 00 01 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
  0x00008007a100: f9 f9 f9 f9 00 00 03 f9 f9 f9 f9 f9 00 00 02 f9
  0x00008007a110: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 01 f9 f9
  0x00008007a120: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 00 03 f9
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30463==ABORTING

==30467==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000040d67f at pc 0x403c7d bp 0x7ffd13a41020 sp 0x7ffd13a41010
READ of size 1 at 0x00000040d67f thread T0
    #0 0x403c7c in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x404553 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x40abdc in main /home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c:146
    #3 0x2b6b544e27af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #4 0x4017c8 in _start (/tmp/ccanlint-29919.1804289383/run-add_desc+0x4017c8)

0x00000040d67f is located 1 bytes to the left of global variable '*.LC26' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c' (0x40d680) of size 1
  '*.LC26' is ascii string ''
0x00000040d67f is located 55 bytes to the right of global variable '*.LC25' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-add_desc.c' (0x40d640) of size 8
  '*.LC25' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x000080079a70: 00 00 06 f9 f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9
  0x000080079a80: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9
  0x000080079a90: f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
  0x000080079aa0: 00 00 00 00 07 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
  0x000080079ab0: f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9 03 f9 f9 f9
=>0x000080079ac0: f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9 f9 f9 f9[f9]
  0x000080079ad0: 01 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x000080079ae0: 05 f9 f9 f9 f9 f9 f9 f9 00 02 f9 f9 f9 f9 f9 f9
  0x000080079af0: 04 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x000080079b00: 05 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x000080079b10: 06 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30467==ABORTING

==30471==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000040c99f at pc 0x403c7d bp 0x7ffe18777d10 sp 0x7ffe18777d00
READ of size 1 at 0x00000040c99f thread T0
    #0 0x403c7c in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x409927 in main /home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c:24
    #2 0x2af06501b7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #3 0x4017c8 in _start (/tmp/ccanlint-29919.1804289383/run-consume_words+0x4017c8)

0x00000040c99f is located 1 bytes to the left of global variable '*.LC26' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c' (0x40c9a0) of size 1
  '*.LC26' is ascii string ''
0x00000040c99f is located 55 bytes to the right of global variable '*.LC25' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-consume_words.c' (0x40c960) of size 8
  '*.LC25' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x0000800798e0: 00 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x0000800798f0: 02 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9
  0x000080079900: 00 00 00 00 00 00 00 00 07 f9 f9 f9 f9 f9 f9 f9
  0x000080079910: 04 f9 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
  0x000080079920: 03 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9
=>0x000080079930: f9 f9 f9[f9]01 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9
  0x000080079940: f9 f9 f9 f9 05 f9 f9 f9 f9 f9 f9 f9 00 02 f9 f9
  0x000080079950: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
  0x000080079960: f9 f9 f9 f9 05 f9 f9 f9 f9 f9 f9 f9 03 f9 f9 f9
  0x000080079970: f9 f9 f9 f9 06 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
  0x000080079980: 00 00 00 00 00 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30471==ABORTING

==30477==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000041e53f at pc 0x406c90 bp 0x7fff0495d6d0 sp 0x7fff0495d6c0
READ of size 1 at 0x00000041e53f thread T0
    #0 0x406c8f in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x407566 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x4080e5 in opt_usage /home/ajeffery/Development/ccan/ccan/opt/usage.c:226
    #3 0x402c25 in opt_usage_and_exit /home/ajeffery/Development/ccan/ccan/opt/helpers.c:192
    #4 0x40916c in parse_one /home/ajeffery/Development/ccan/ccan/opt/parse.c:99
    #5 0x4061dd in opt_parse /home/ajeffery/Development/ccan/ccan/opt/opt.c:210
    #6 0x4198ee in main /home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c:1071
    #7 0x2b3dd2a1c7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #8 0x401958 in _start (/tmp/ccanlint-29919.1804289383/run-helpers+0x401958)

0x00000041e53f is located 1 bytes to the left of global variable '*.LC65' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c' (0x41e540) of size 1
  '*.LC65' is ascii string ''
0x00000041e53f is located 55 bytes to the right of global variable '*.LC64' from '/home/ajeffery/Development/ccan/ccan/opt/test/run-helpers.c' (0x41e500) of size 8
  '*.LC64' is ascii string 'Usage: '
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x00008007bc50: 00 00 06 f9 f9 f9 f9 f9 00 00 00 00 00 f9 f9 f9
  0x00008007bc60: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9
  0x00008007bc70: f9 f9 f9 f9 00 00 00 00 00 00 00 00 07 f9 f9 f9
  0x00008007bc80: f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9 00 04 f9 f9
  0x00008007bc90: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
=>0x00008007bca0: 00 f9 f9 f9 f9 f9 f9[f9]01 f9 f9 f9 f9 f9 f9 f9
  0x00008007bcb0: 03 f9 f9 f9 f9 f9 f9 f9 05 f9 f9 f9 f9 f9 f9 f9
  0x00008007bcc0: 00 02 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x00008007bcd0: 00 05 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 f9 f9
  0x00008007bce0: f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
  0x00008007bcf0: 00 00 01 f9 f9 f9 f9 f9 00 05 f9 f9 f9 f9 f9 f9
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30477==ABORTING

==30485==ERROR: AddressSanitizer: global-buffer-overflow on address 0x00000041083f at pc 0x403d1c bp 0x7fffb2feac90 sp 0x7fffb2feac80
READ of size 1 at 0x00000041083f thread T0
    #0 0x403d1b in consume_words /home/ajeffery/Development/ccan/ccan/opt/usage.c:73
    #1 0x4045f2 in add_desc /home/ajeffery/Development/ccan/ccan/opt/usage.c:130
    #2 0x405171 in opt_usage /home/ajeffery/Development/ccan/ccan/opt/usage.c:226
    #3 0x40982a in main /home/ajeffery/Development/ccan/ccan/opt/test/run-usage.c:42
    #4 0x2b0a350ad7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #5 0x401858 in _start (/tmp/ccanlint-29919.1804289383/run-usage+0x401858)

0x00000041083f is located 59 bytes to the right of global variable '*.LC15' from '/home/ajeffery/Development/ccan/ccan/opt/test/utils.c' (0x410800) of size 4
  '*.LC15' is ascii string 'eee'
0x00000041083f is located 1 bytes to the left of global variable '*.LC16' from '/home/ajeffery/Development/ccan/ccan/opt/test/utils.c' (0x410840) of size 1
  '*.LC16' is ascii string ''
SUMMARY: AddressSanitizer: global-buffer-overflow /home/ajeffery/Development/ccan/ccan/opt/usage.c:73 consume_words
Shadow bytes around the buggy address:
  0x00008007a0b0: 03 f9 f9 f9 f9 f9 f9 f9 02 f9 f9 f9 f9 f9 f9 f9
  0x00008007a0c0: 00 00 01 f9 f9 f9 f9 f9 03 f9 f9 f9 f9 f9 f9 f9
  0x00008007a0d0: 02 f9 f9 f9 f9 f9 f9 f9 00 00 01 f9 f9 f9 f9 f9
  0x00008007a0e0: 06 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x00008007a0f0: 00 00 03 f9 f9 f9 f9 f9 00 00 01 f9 f9 f9 f9 f9
=>0x00008007a100: 04 f9 f9 f9 f9 f9 f9[f9]01 f9 f9 f9 f9 f9 f9 f9
  0x00008007a110: 00 01 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x00008007a120: 00 00 03 f9 f9 f9 f9 f9 00 01 f9 f9 f9 f9 f9 f9
  0x00008007a130: 04 f9 f9 f9 f9 f9 f9 f9 00 00 03 f9 f9 f9 f9 f9
  0x00008007a140: 00 00 02 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
  0x00008007a150: 00 01 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==30485==ABORTING

==3496==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7fff5ac4e0f4 at pc 0x2b3d18650154 bp 0x7fff5ac4de40 sp 0x7fff5ac4d5e8
WRITE of size 6 at 0x7fff5ac4e0f4 thread T0
    #0 0x2b3d18650153 in strcpy (/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/libasan.so.1+0x30153)
    #1 0x40142b in stringbuilder_cpy /home/ajeffery/Development/ccan/ccan/stringbuilder/stringbuilder.c:27
    #2 0x401780 in stringbuilder_va /home/ajeffery/Development/ccan/ccan/stringbuilder/stringbuilder.c:49
    #3 0x40126a in stringbuilder_args /home/ajeffery/Development/ccan/ccan/stringbuilder/stringbuilder.c:11
    #4 0x401c19 in main /home/ajeffery/Development/ccan/ccan/stringbuilder/test/run.c:25
    #5 0x2b3d1951c7af in __libc_start_main (/lib64/libc.so.6+0x207af)
    #6 0x401088 in _start (/tmp/ccanlint-3415.1804289383/run+0x401088)

Address 0x7fff5ac4e0f4 is located in stack of thread T0 at offset 116 in frame
    #0 0x401a0d in main /home/ajeffery/Development/ccan/ccan/stringbuilder/test/run.c:11

  This frame has 2 object(s):
    [32, 48) 'str_array'
    [96, 116) 'string' <== Memory access at offset 116 overflows this variable
HINT: this may be a false positive if your program uses some custom stack unwind mechanism or swapcontext
      (longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: stack-buffer-overflow ??:0 strcpy
Shadow bytes around the buggy address:
  0x10006b581bc0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581bd0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581be0: f1 f1 f1 f1 00 00 00 f4 00 00 00 00 00 00 00 00
  0x10006b581bf0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=>0x10006b581c10: f1 f1 f1 f1 00 00 f4 f4 f2 f2 f2 f2 00 00[04]f4
  0x10006b581c20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581c30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581c40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581c50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x10006b581c60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07 
  Heap left redzone:       fa
  Heap right redzone:      fb
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack partial redzone:   f4
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Contiguous container OOB:fc
  ASan internal:           fe
==3496==ABORTING
--=-DukX+3nYd/ins/J9Yfyx
Content-Disposition: attachment; filename="0001-WIP-ASan-in-CCAN.patch"
Content-Type: text/x-patch; name="0001-WIP-ASan-in-CCAN.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA5ZjdhNGE2Zjg2ZTNlNDE0M2Q0NmQyOGM0OGUyMmU3YWYyYmZkYzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgpEYXRl
OiBNb24sIDIxIFNlcCAyMDE1IDIyOjQzOjEwICswOTMwClN1YmplY3Q6IFtQQVRDSCAxLzJdIFdJ
UDogQVNhbiBpbiBDQ0FOCgotLS0KIE1ha2VmaWxlICAgICAgfCAxMyArKysrKysrKysrKystCiBN
YWtlZmlsZS1jY2FuIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDE0
NTUyMGIuLmE4NmE3NGMgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0x
Myw3ICsxMyw4IEBACiAjIFdoZXJlIG1ha2Ugc2NvcmVzIHB1dHMgdGhlIHJlc3VsdHMKIFNDT1JF
RElSPXNjb3Jlcy8kKHNoZWxsIHdob2FtaSkvJChzaGVsbCB1bmFtZSAtcyktJChzaGVsbCB1bmFt
ZSAtbSktJChDQyktJChzaGVsbCBnaXQgZGVzY3JpYmUgLS1hbHdheXMgLS1kaXJ0eSkKIENDQU5M
SU5UPXRvb2xzL2NjYW5saW50L2NjYW5saW50IC0tZGVwcy1mYWlsLWlnbm9yZQotQ0NBTkxJTlRf
RkFTVD0kKENDQU5MSU5UKSAteCB0ZXN0c19wYXNzX3ZhbGdyaW5kIC14IHRlc3RzX2NvbXBpbGVf
Y292ZXJhZ2UKK0NDQU5MSU5UX0ZMQUdTPS12dgorQ0NBTkxJTlRfRkFTVD0kKENDQU5MSU5UKSAk
KENDQU5MSU5UX0ZMQUdTKSAteCB0ZXN0c19wYXNzX3ZhbGdyaW5kIC14IHRlc3RzX2NvbXBpbGVf
Y292ZXJhZ2UKIAogZGVmYXVsdDogbGliY2Nhbi5hCiAKQEAgLTI0LDYgKzI1LDE2IEBAIE1PRFNf
RVhDTFVERTo9am1hcCBqc2V0IG5mcyBvZ2dfdG9fcGNtIHRhbC90YWxsb2Mgd3d2aWF1ZGlvCiAK
IGluY2x1ZGUgTWFrZWZpbGUtY2NhbgogCithc2FuY2hlY2s6IHRvb2xzL2NjYW5saW50L2NjYW5s
aW50IGFzYW4tbW9kcworCithc2FuLW1vZHM6IENDQU5fQ0ZMQUdTICs9IC1mc2FuaXRpemU9YWRk
cmVzcworYXNhbi1tb2RzOiBDRkxBR1MgKz0gLWZzYW5pdGl6ZT1hZGRyZXNzCithc2FuLW1vZHM6
IGFzYW4tY29uZmlnICQoTU9EUzolPXN1bW1hcnktZmFzdGNoZWNrLSUpCisKKy5QSE9OWTogYXNh
bi1jb25maWcKK2FzYW4tY29uZmlnOiB0b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yIE1h
a2VmaWxlIE1ha2VmaWxlLWNjYW4KKwl0b29scy9jb25maWd1cmF0b3IvY29uZmlndXJhdG9yICQo
Q0MpICQoQ0NBTl9DRkxBR1MpID4gY29uZmlnLnRtcCAmJiBtdiBjb25maWcudG1wIGNvbmZpZy5o
CisKIGZhc3RjaGVjazogJChNT0RTOiU9c3VtbWFyeS1mYXN0Y2hlY2stJSkKIAogY2hlY2s6ICQo
TU9EUzolPXN1bW1hcnktY2hlY2stJSkKZGlmZiAtLWdpdCBhL01ha2VmaWxlLWNjYW4gYi9NYWtl
ZmlsZS1jY2FuCmluZGV4IGZiN2U0YzkuLjFjZjBjNTcgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlLWNj
YW4KKysrIGIvTWFrZWZpbGUtY2NhbgpAQCAtMiw5ICsyLDkgQEAKICMgRm9yIHNpbXBsZSBwcm9q
ZWN0cyB5b3UgY291bGQganVzdCBkbzoKICMJU1JDRklMRVMgKz0gJCh3aWxkY2FyZCBjY2FuLyov
Ki5jKQogCi0jQ0NBTl9DRkxBR1M9LWcgLU8zIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdv
bGQtc3R5bGUtZGVmaW5pdGlvbiAtV21pc3NpbmctcHJvdG90eXBlcyAtV21pc3NpbmctZGVjbGFy
YXRpb25zIC1XcG9pbnRlci1hcml0aCAtV3dyaXRlLXN0cmluZ3MgLVd1bmRlZiAtRENDQU5fU1RS
X0RFQlVHPTEKIENDQU5fQ0ZMQUdTPS1nMyAtZ2dkYiAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVz
IC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRl
Y2xhcmF0aW9ucyAtV3BvaW50ZXItYXJpdGggLVd3cml0ZS1zdHJpbmdzIC1XdW5kZWYgLURDQ0FO
X1NUUl9ERUJVRz0xCiBDRkxBR1MgPSAkKENDQU5fQ0ZMQUdTKSAtSS4gJChERVBHRU4pCitMREZM
QUdTPS1mc2FuaXRpemU9YWRkcmVzcwogCiAjIE1vZHVsZXMgd2hpY2ggYXJlIGp1c3QgYSBoZWFk
ZXI6CiBNT0RTX05PX1NSQyA6PSBhbGlnbm9mIFwKLS0gCjIuNS4zCgo=



--=-DukX+3nYd/ins/J9Yfyx
Content-Disposition: attachment; filename="0002-WIP-Makefile-ignore-ASan-aborts.patch"
Content-Type: text/x-patch; name="0002-WIP-Makefile-ignore-ASan-aborts.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAzZjUyOTNjMjE4NzJiNTE0NGQwNzM2YTlkY2EzYmEzYTk2ZmNiMzI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgpEYXRl
OiBUdWUsIDIyIFNlcCAyMDE1IDIyOjQxOjA1ICswOTMwClN1YmplY3Q6IFtQQVRDSCAyLzJdIFdJ
UDogTWFrZWZpbGU6IGlnbm9yZSBBU2FuIGFib3J0cwoKLS0tCiBNYWtlZmlsZSB8IDE4ICsrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGE4NmE3NGMuLmEzZDk0YWYgMTAwNjQ0Ci0t
LSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0zNSw2ICszNSwyNCBAQCBhc2FuLW1vZHM6
IGFzYW4tY29uZmlnICQoTU9EUzolPXN1bW1hcnktZmFzdGNoZWNrLSUpCiBhc2FuLWNvbmZpZzog
dG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvciBNYWtlZmlsZSBNYWtlZmlsZS1jY2FuCiAJ
dG9vbHMvY29uZmlndXJhdG9yL2NvbmZpZ3VyYXRvciAkKENDKSAkKENDQU5fQ0ZMQUdTKSA+IGNv
bmZpZy50bXAgJiYgbXYgY29uZmlnLnRtcCBjb25maWcuaAogCitzdW1tYXJ5LWZhc3RjaGVjay1h
dXRvZGF0YTogdG9vbHMvY2NhbmxpbnQvY2NhbmxpbnQgJChPQkpGSUxFUykKKwkkKENDQU5MSU5U
X0ZBU1QpIGNjYW4vYXV0b2RhdGEgfHwgdHJ1ZQorCitzdW1tYXJ5LWZhc3RjaGVjay1jcHVpZDog
dG9vbHMvY2NhbmxpbnQvY2NhbmxpbnQgJChPQkpGSUxFUykKKwkkKENDQU5MSU5UX0ZBU1QpIGNj
YW4vY3B1aWQgfHwgdHJ1ZQorCitzdW1tYXJ5LWZhc3RjaGVjay1kZ3JhcGg6IHRvb2xzL2NjYW5s
aW50L2NjYW5saW50ICQoT0JKRklMRVMpCisJJChDQ0FOTElOVF9GQVNUKSBjY2FuL2RncmFwaCB8
fCB0cnVlCisKK3N1bW1hcnktZmFzdGNoZWNrLWZhaWx0ZXN0OiB0b29scy9jY2FubGludC9jY2Fu
bGludCAkKE9CSkZJTEVTKQorCSQoQ0NBTkxJTlRfRkFTVCkgY2Nhbi9mYWlsdGVzdCB8fCB0cnVl
CisKK3N1bW1hcnktZmFzdGNoZWNrLW9wdDogdG9vbHMvY2NhbmxpbnQvY2NhbmxpbnQgJChPQkpG
SUxFUykKKwkkKENDQU5MSU5UX0ZBU1QpIGNjYW4vb3B0IHx8IHRydWUKKworc3VtbWFyeS1mYXN0
Y2hlY2stc3RyaW5nYnVpbGRlcjogdG9vbHMvY2NhbmxpbnQvY2NhbmxpbnQgJChPQkpGSUxFUykK
KwkkKENDQU5MSU5UX0ZBU1QpIGNjYW4vc3RyaW5nYnVpbGRlciB8fCB0cnVlCisKIGZhc3RjaGVj
azogJChNT0RTOiU9c3VtbWFyeS1mYXN0Y2hlY2stJSkKIAogY2hlY2s6ICQoTU9EUzolPXN1bW1h
cnktY2hlY2stJSkKLS0gCjIuNS4zCgo=



--=-DukX+3nYd/ins/J9Yfyx
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--=-DukX+3nYd/ins/J9Yfyx--
