From: Ian Zimmerman <itz@very.loosely.org>
Subject: Re: configurator still segfaults, what am I doing wrong?
Date: Wed, 20 Feb 2019 22:38:28 -0800
Message-ID: <20190221063828.pm3eaugvxlcasli5@matica.foolinux.mooo.com>
References: <20190208041310.koahd5nlpc3a6hb3@matica.foolinux.mooo.com>
 <87o97ld4f5.fsf@rustcorp.com.au>
 <20190209224423.qvo356b3jy3oyowr@matica.foolinux.mooo.com>
 <87lg2kiomh.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from very.loosely.org (very.loosely.org [173.255.215.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444lPG4s54zDqCY
 for <ccan@lists.ozlabs.org>; Thu, 21 Feb 2019 17:46:25 +1100 (AEDT)
Content-Disposition: inline
In-Reply-To: <87lg2kiomh.fsf@rustcorp.com.au>
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

On 2019-02-13 09:46, Rusty Russell wrote:

> Ian Zimmerman <itz@very.loosely.org> writes:
> > On 2019-02-09 14:00, Rusty Russell wrote:
> >
> >> Ian Zimmerman <itz@very.loosely.org> writes:
> >> >  matica!60 ccantest$ /home/itz/git/ccan/tools/create-ccan-tree --build-type=make+config /home/itz/ccantest/ccan tal
> >> > Building ccan_depends, modfiles
> >> > sh: line 1: 17440 Segmentation fault      (core dumped) ./configurator.out 2>&1
> >> 
> >> OK, that's weird.  If you run tools/configurator/configurator normally
> >> does it do this?  If so, try under gdb...
> >
> > Not much help, see below.  Could this be some kind of resource
> > exhaustion?  My desktop has "only" 8GB store.  Also, what is this about
> > "configurator.out"??  The executable name in the file system is called
> > "configurator".
> 
> Actually, I missed that; it's a configurator test failing, which is
> actually OK.
> 
> Your problem is actually not being in the top-level of the ccan dir.

But I _am_ in that location.  I am trying to build ccan from git sources.
See transcript:

 matica!43 ccan$ make tools/configurator/configurator
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/configurator/configurator.d -MTtools/configurator/configurator tools/configurator/configurator.c -o tools/configurator/configurator
tools/configurator/configurator cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  >config.h.tmp && mv config.h.tmp config.h
sh: line 1:  4977 Segmentation fault      (core dumped) ./configurator.out 2>&1
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/antithread/alloc/info -x c ccan/antithread/alloc/_info
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/doc_extract-core.o.d -MTtools/doc_extract-core.o -c tools/doc_extract-core.c -o tools/doc_extract-core.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/depends.o.d -MTtools/depends.o -c tools/depends.c -o tools/depends.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/read_config_header.o.d -MTtools/read_config_header.o -c tools/read_config_header.c -o tools/read_config_header.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/gcov.o.d -MTtools/gcov.o -c tools/gcov.c -o tools/gcov.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/ccan_dir.o.d -MTtools/ccan_dir.o -c tools/ccan_dir.c -o tools/ccan_dir.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/compile.o.d -MTtools/compile.o -c tools/compile.c -o tools/compile.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/tools.o.d -MTtools/tools.o -c tools/tools.c -o tools/tools.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/manifest.o.d -MTtools/manifest.o -c tools/manifest.c -o tools/manifest.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/asort/asort.o.d -MTccan/asort/asort.o -c ccan/asort/asort.c -o ccan/asort/asort.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/err/err.o.d -MTccan/err/err.o -c ccan/err/err.c -o ccan/err/err.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/foreach/foreach.o.d -MTccan/foreach/foreach.o -c ccan/foreach/foreach.c -o ccan/foreach/foreach.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/hash/hash.o.d -MTccan/hash/hash.o -c ccan/hash/hash.c -o ccan/hash/hash.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/htable/htable.o.d -MTccan/htable/htable.o -c ccan/htable/htable.c -o ccan/htable/htable.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/list/list.o.d -MTccan/list/list.o -c ccan/list/list.c -o ccan/list/list.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/membuf/membuf.o.d -MTccan/membuf/membuf.o -c ccan/membuf/membuf.c -o ccan/membuf/membuf.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/noerr/noerr.o.d -MTccan/noerr/noerr.o -c ccan/noerr/noerr.c -o ccan/noerr/noerr.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/opt/helpers.o.d -MTccan/opt/helpers.o -c ccan/opt/helpers.c -o ccan/opt/helpers.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/opt/opt.o.d -MTccan/opt/opt.o -c ccan/opt/opt.c -o ccan/opt/opt.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/opt/usage.o.d -MTccan/opt/usage.o -c ccan/opt/usage.c -o ccan/opt/usage.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/opt/parse.o.d -MTccan/opt/parse.o -c ccan/opt/parse.c -o ccan/opt/parse.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/rbuf/rbuf.o.d -MTccan/rbuf/rbuf.o -c ccan/rbuf/rbuf.c -o ccan/rbuf/rbuf.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/read_write_all/read_write_all.o.d -MTccan/read_write_all/read_write_all.o -c ccan/read_write_all/read_write_all.c -o ccan/read_write_all/read_write_all.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/str/str.o.d -MTccan/str/str.o -c ccan/str/str.c -o ccan/str/str.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/str/debug.o.d -MTccan/str/debug.o -c ccan/str/debug.c -o ccan/str/debug.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/take/take.o.d -MTccan/take/take.o -c ccan/take/take.c -o ccan/take/take.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/tal/tal.o.d -MTccan/tal/tal.o -c ccan/tal/tal.c -o ccan/tal/tal.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/tal/grab_file/grab_file.o.d -MTccan/tal/grab_file/grab_file.o -c ccan/tal/grab_file/grab_file.c -o ccan/tal/grab_file/grab_file.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/tal/link/link.o.d -MTccan/tal/link/link.o -c ccan/tal/link/link.c -o ccan/tal/link/link.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/tal/path/path.o.d -MTccan/tal/path/path.o -c ccan/tal/path/path.c -o ccan/tal/path/path.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/tal/str/str.o.d -MTccan/tal/str/str.o -c ccan/tal/str/str.c -o ccan/tal/str/str.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFccan/time/time.o.d -MTccan/time/time.o -c ccan/time/time.c -o ccan/time/time.o
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -MMD -MP -MFtools/ccan_depends.d -MTtools/ccan_depends tools/ccan_depends.c tools/doc_extract-core.o tools/depends.o tools/read_config_header.o tools/gcov.o tools/ccan_dir.o tools/compile.o tools/tools.o tools/manifest.o ccan/asort/asort.o ccan/err/err.o ccan/foreach/foreach.o ccan/hash/hash.o ccan/htable/htable.o ccan/list/list.o ccan/membuf/membuf.o ccan/noerr/noerr.o ccan/opt/helpers.o ccan/opt/opt.o ccan/opt/usage.o ccan/opt/parse.o ccan/rbuf/rbuf.o ccan/read_write_all/read_write_all.o ccan/str/str.o ccan/str/debug.o ccan/take/take.o ccan/tal/tal.o ccan/tal/grab_file/grab_file.o ccan/tal/link/link.o ccan/tal/path/path.
 o ccan/tal/str/str.o ccan/time/time.o -lm -o tools/ccan_depends
tools/gen_deps.sh ccan/antithread/alloc > ccan/antithread/alloc/.d || rm -f ccan/antithread/alloc/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/stack/info -x c ccan/tal/stack/_info
tools/gen_deps.sh ccan/tal/stack > ccan/tal/stack/.d || rm -f ccan/tal/stack/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/autoptr/info -x c ccan/tal/autoptr/_info
tools/gen_deps.sh ccan/tal/autoptr > ccan/tal/autoptr/.d || rm -f ccan/tal/autoptr/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/grab_file/info -x c ccan/tal/grab_file/_info
tools/gen_deps.sh ccan/tal/grab_file > ccan/tal/grab_file/.d || rm -f ccan/tal/grab_file/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/path/info -x c ccan/tal/path/_info
tools/gen_deps.sh ccan/tal/path > ccan/tal/path/.d || rm -f ccan/tal/path/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/link/info -x c ccan/tal/link/_info
tools/gen_deps.sh ccan/tal/link > ccan/tal/link/.d || rm -f ccan/tal/link/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/str/info -x c ccan/tal/str/_info
tools/gen_deps.sh ccan/tal/str > ccan/tal/str/.d || rm -f ccan/tal/str/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/io/fdpass/info -x c ccan/io/fdpass/_info
tools/gen_deps.sh ccan/io/fdpass > ccan/io/fdpass/.d || rm -f ccan/io/fdpass/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/str/base32/info -x c ccan/str/base32/_info
tools/gen_deps.sh ccan/str/base32 > ccan/str/base32/.d || rm -f ccan/str/base32/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/str/hex/info -x c ccan/str/hex/_info
tools/gen_deps.sh ccan/str/hex > ccan/str/hex/.d || rm -f ccan/str/hex/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/sha256/info -x c ccan/crypto/sha256/_info
tools/gen_deps.sh ccan/crypto/sha256 > ccan/crypto/sha256/.d || rm -f ccan/crypto/sha256/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/shachain/info -x c ccan/crypto/shachain/_info
tools/gen_deps.sh ccan/crypto/shachain > ccan/crypto/shachain/.d || rm -f ccan/crypto/shachain/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/ripemd160/info -x c ccan/crypto/ripemd160/_info
tools/gen_deps.sh ccan/crypto/ripemd160 > ccan/crypto/ripemd160/.d || rm -f ccan/crypto/ripemd160/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/hkdf_sha256/info -x c ccan/crypto/hkdf_sha256/_info
tools/gen_deps.sh ccan/crypto/hkdf_sha256 > ccan/crypto/hkdf_sha256/.d || rm -f ccan/crypto/hkdf_sha256/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/siphash24/info -x c ccan/crypto/siphash24/_info
tools/gen_deps.sh ccan/crypto/siphash24 > ccan/crypto/siphash24/.d || rm -f ccan/crypto/siphash24/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/sha512/info -x c ccan/crypto/sha512/_info
tools/gen_deps.sh ccan/crypto/sha512 > ccan/crypto/sha512/.d || rm -f ccan/crypto/sha512/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crypto/hmac_sha256/info -x c ccan/crypto/hmac_sha256/_info
tools/gen_deps.sh ccan/crypto/hmac_sha256 > ccan/crypto/hmac_sha256/.d || rm -f ccan/crypto/hmac_sha256/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/cdump/info -x c ccan/cdump/_info
tools/gen_deps.sh ccan/cdump > ccan/cdump/.d || rm -f ccan/cdump/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/antithread/info -x c ccan/antithread/_info
tools/gen_deps.sh ccan/antithread > ccan/antithread/.d || rm -f ccan/antithread/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/strmap/info -x c ccan/strmap/_info
tools/gen_deps.sh ccan/strmap > ccan/strmap/.d || rm -f ccan/strmap/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/heap/info -x c ccan/heap/_info
tools/gen_deps.sh ccan/heap > ccan/heap/.d || rm -f ccan/heap/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/bytestring/info -x c ccan/bytestring/_info
tools/gen_deps.sh ccan/bytestring > ccan/bytestring/.d || rm -f ccan/bytestring/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tlist2/info -x c ccan/tlist2/_info
tools/gen_deps.sh ccan/tlist2 > ccan/tlist2/.d || rm -f ccan/tlist2/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/daemon_with_notify/info -x c ccan/daemon_with_notify/_info
tools/gen_deps.sh ccan/daemon_with_notify > ccan/daemon_with_notify/.d || rm -f ccan/daemon_with_notify/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/alignof/info -x c ccan/alignof/_info
tools/gen_deps.sh ccan/alignof > ccan/alignof/.d || rm -f ccan/alignof/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/pr_log/info -x c ccan/pr_log/_info
tools/gen_deps.sh ccan/pr_log > ccan/pr_log/.d || rm -f ccan/pr_log/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/bdelta/info -x c ccan/bdelta/_info
tools/gen_deps.sh ccan/bdelta > ccan/bdelta/.d || rm -f ccan/bdelta/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ttxml/info -x c ccan/ttxml/_info
tools/gen_deps.sh ccan/ttxml > ccan/ttxml/.d || rm -f ccan/ttxml/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/take/info -x c ccan/take/_info
tools/gen_deps.sh ccan/take > ccan/take/.d || rm -f ccan/take/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/rbuf/info -x c ccan/rbuf/_info
tools/gen_deps.sh ccan/rbuf > ccan/rbuf/.d || rm -f ccan/rbuf/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/aga/info -x c ccan/aga/_info
tools/gen_deps.sh ccan/aga > ccan/aga/.d || rm -f ccan/aga/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/read_write_all/info -x c ccan/read_write_all/_info
tools/gen_deps.sh ccan/read_write_all > ccan/read_write_all/.d || rm -f ccan/read_write_all/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/grab_file/info -x c ccan/grab_file/_info
tools/gen_deps.sh ccan/grab_file > ccan/grab_file/.d || rm -f ccan/grab_file/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/strset/info -x c ccan/strset/_info
tools/gen_deps.sh ccan/strset > ccan/strset/.d || rm -f ccan/strset/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/fdpass/info -x c ccan/fdpass/_info
tools/gen_deps.sh ccan/fdpass > ccan/fdpass/.d || rm -f ccan/fdpass/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tap/info -x c ccan/tap/_info
tools/gen_deps.sh ccan/tap > ccan/tap/.d || rm -f ccan/tap/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/lpq/info -x c ccan/lpq/_info
tools/gen_deps.sh ccan/lpq > ccan/lpq/.d || rm -f ccan/lpq/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/json/info -x c ccan/json/_info
tools/gen_deps.sh ccan/json > ccan/json/.d || rm -f ccan/json/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/asearch/info -x c ccan/asearch/_info
tools/gen_deps.sh ccan/asearch > ccan/asearch/.d || rm -f ccan/asearch/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/talloc/info -x c ccan/talloc/_info
tools/gen_deps.sh ccan/talloc > ccan/talloc/.d || rm -f ccan/talloc/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/pipecmd/info -x c ccan/pipecmd/_info
tools/gen_deps.sh ccan/pipecmd > ccan/pipecmd/.d || rm -f ccan/pipecmd/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/avl/info -x c ccan/avl/_info
tools/gen_deps.sh ccan/avl > ccan/avl/.d || rm -f ccan/avl/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/eratosthenes/info -x c ccan/eratosthenes/_info
tools/gen_deps.sh ccan/eratosthenes > ccan/eratosthenes/.d || rm -f ccan/eratosthenes/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/cast/info -x c ccan/cast/_info
tools/gen_deps.sh ccan/cast > ccan/cast/.d || rm -f ccan/cast/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/array_size/info -x c ccan/array_size/_info
tools/gen_deps.sh ccan/array_size > ccan/array_size/.d || rm -f ccan/array_size/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/err/info -x c ccan/err/_info
tools/gen_deps.sh ccan/err > ccan/err/.d || rm -f ccan/err/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/htable/info -x c ccan/htable/_info
tools/gen_deps.sh ccan/htable > ccan/htable/.d || rm -f ccan/htable/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/structeq/info -x c ccan/structeq/_info
tools/gen_deps.sh ccan/structeq > ccan/structeq/.d || rm -f ccan/structeq/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/failtest/info -x c ccan/failtest/_info
tools/gen_deps.sh ccan/failtest > ccan/failtest/.d || rm -f ccan/failtest/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/likely/info -x c ccan/likely/_info
tools/gen_deps.sh ccan/likely > ccan/likely/.d || rm -f ccan/likely/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/rszshm/info -x c ccan/rszshm/_info
tools/gen_deps.sh ccan/rszshm > ccan/rszshm/.d || rm -f ccan/rszshm/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/minmax/info -x c ccan/minmax/_info
tools/gen_deps.sh ccan/minmax > ccan/minmax/.d || rm -f ccan/minmax/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/short_types/info -x c ccan/short_types/_info
tools/gen_deps.sh ccan/short_types > ccan/short_types/.d || rm -f ccan/short_types/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/opt/info -x c ccan/opt/_info
tools/gen_deps.sh ccan/opt > ccan/opt/.d || rm -f ccan/opt/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/idtree/info -x c ccan/idtree/_info
tools/gen_deps.sh ccan/idtree > ccan/idtree/.d || rm -f ccan/idtree/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/build_assert/info -x c ccan/build_assert/_info
tools/gen_deps.sh ccan/build_assert > ccan/build_assert/.d || rm -f ccan/build_assert/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ilog/info -x c ccan/ilog/_info
tools/gen_deps.sh ccan/ilog > ccan/ilog/.d || rm -f ccan/ilog/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/permutation/info -x c ccan/permutation/_info
tools/gen_deps.sh ccan/permutation > ccan/permutation/.d || rm -f ccan/permutation/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/lstack/info -x c ccan/lstack/_info
tools/gen_deps.sh ccan/lstack > ccan/lstack/.d || rm -f ccan/lstack/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/list/info -x c ccan/list/_info
tools/gen_deps.sh ccan/list > ccan/list/.d || rm -f ccan/list/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/bitops/info -x c ccan/bitops/_info
tools/gen_deps.sh ccan/bitops > ccan/bitops/.d || rm -f ccan/bitops/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/compiler/info -x c ccan/compiler/_info
tools/gen_deps.sh ccan/compiler > ccan/compiler/.d || rm -f ccan/compiler/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/lbalance/info -x c ccan/lbalance/_info
tools/gen_deps.sh ccan/lbalance > ccan/lbalance/.d || rm -f ccan/lbalance/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/check_type/info -x c ccan/check_type/_info
tools/gen_deps.sh ccan/check_type > ccan/check_type/.d || rm -f ccan/check_type/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/sparse_bsearch/info -x c ccan/sparse_bsearch/_info
tools/gen_deps.sh ccan/sparse_bsearch > ccan/sparse_bsearch/.d || rm -f ccan/sparse_bsearch/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tlist/info -x c ccan/tlist/_info
tools/gen_deps.sh ccan/tlist > ccan/tlist/.d || rm -f ccan/tlist/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/rbtree/info -x c ccan/rbtree/_info
tools/gen_deps.sh ccan/rbtree > ccan/rbtree/.d || rm -f ccan/rbtree/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/base64/info -x c ccan/base64/_info
tools/gen_deps.sh ccan/base64 > ccan/base64/.d || rm -f ccan/base64/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/time/info -x c ccan/time/_info
tools/gen_deps.sh ccan/time > ccan/time/.d || rm -f ccan/time/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/a_star/info -x c ccan/a_star/_info
tools/gen_deps.sh ccan/a_star > ccan/a_star/.d || rm -f ccan/a_star/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crcsync/info -x c ccan/crcsync/_info
tools/gen_deps.sh ccan/crcsync > ccan/crcsync/.d || rm -f ccan/crcsync/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/charset/info -x c ccan/charset/_info
tools/gen_deps.sh ccan/charset > ccan/charset/.d || rm -f ccan/charset/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/noerr/info -x c ccan/noerr/_info
tools/gen_deps.sh ccan/noerr > ccan/noerr/.d || rm -f ccan/noerr/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/mem/info -x c ccan/mem/_info
tools/gen_deps.sh ccan/mem > ccan/mem/.d || rm -f ccan/mem/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tcon/info -x c ccan/tcon/_info
tools/gen_deps.sh ccan/tcon > ccan/tcon/.d || rm -f ccan/tcon/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/coroutine/info -x c ccan/coroutine/_info
tools/gen_deps.sh ccan/coroutine > ccan/coroutine/.d || rm -f ccan/coroutine/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/jacobson_karels/info -x c ccan/jacobson_karels/_info
tools/gen_deps.sh ccan/jacobson_karels > ccan/jacobson_karels/.d || rm -f ccan/jacobson_karels/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/siphash/info -x c ccan/siphash/_info
tools/gen_deps.sh ccan/siphash > ccan/siphash/.d || rm -f ccan/siphash/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/endian/info -x c ccan/endian/_info
tools/gen_deps.sh ccan/endian > ccan/endian/.d || rm -f ccan/endian/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/stringbuilder/info -x c ccan/stringbuilder/_info
tools/gen_deps.sh ccan/stringbuilder > ccan/stringbuilder/.d || rm -f ccan/stringbuilder/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ptrint/info -x c ccan/ptrint/_info
tools/gen_deps.sh ccan/ptrint > ccan/ptrint/.d || rm -f ccan/ptrint/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/asprintf/info -x c ccan/asprintf/_info
tools/gen_deps.sh ccan/asprintf > ccan/asprintf/.d || rm -f ccan/asprintf/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/xstring/info -x c ccan/xstring/_info
tools/gen_deps.sh ccan/xstring > ccan/xstring/.d || rm -f ccan/xstring/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/objset/info -x c ccan/objset/_info
tools/gen_deps.sh ccan/objset > ccan/objset/.d || rm -f ccan/objset/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/btree/info -x c ccan/btree/_info
tools/gen_deps.sh ccan/btree > ccan/btree/.d || rm -f ccan/btree/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/foreach/info -x c ccan/foreach/_info
tools/gen_deps.sh ccan/foreach > ccan/foreach/.d || rm -f ccan/foreach/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/membuf/info -x c ccan/membuf/_info
tools/gen_deps.sh ccan/membuf > ccan/membuf/.d || rm -f ccan/membuf/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/bitmap/info -x c ccan/bitmap/_info
tools/gen_deps.sh ccan/bitmap > ccan/bitmap/.d || rm -f ccan/bitmap/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/lqueue/info -x c ccan/lqueue/_info
tools/gen_deps.sh ccan/lqueue > ccan/lqueue/.d || rm -f ccan/lqueue/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/hash/info -x c ccan/hash/_info
tools/gen_deps.sh ccan/hash > ccan/hash/.d || rm -f ccan/hash/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/container_of/info -x c ccan/container_of/_info
tools/gen_deps.sh ccan/container_of > ccan/container_of/.d || rm -f ccan/container_of/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/block_pool/info -x c ccan/block_pool/_info
tools/gen_deps.sh ccan/block_pool > ccan/block_pool/.d || rm -f ccan/block_pool/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/md4/info -x c ccan/md4/_info
tools/gen_deps.sh ccan/md4 > ccan/md4/.d || rm -f ccan/md4/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/dgraph/info -x c ccan/dgraph/_info
tools/gen_deps.sh ccan/dgraph > ccan/dgraph/.d || rm -f ccan/dgraph/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/invbloom/info -x c ccan/invbloom/_info
tools/gen_deps.sh ccan/invbloom > ccan/invbloom/.d || rm -f ccan/invbloom/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ccan_tokenizer/info -x c ccan/ccan_tokenizer/_info
tools/gen_deps.sh ccan/ccan_tokenizer > ccan/ccan_tokenizer/.d || rm -f ccan/ccan_tokenizer/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/argcheck/info -x c ccan/argcheck/_info
tools/gen_deps.sh ccan/argcheck > ccan/argcheck/.d || rm -f ccan/argcheck/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/breakpoint/info -x c ccan/breakpoint/_info
tools/gen_deps.sh ccan/breakpoint > ccan/breakpoint/.d || rm -f ccan/breakpoint/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/version/info -x c ccan/version/_info
tools/gen_deps.sh ccan/version > ccan/version/.d || rm -f ccan/version/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tal/info -x c ccan/tal/_info
tools/gen_deps.sh ccan/tal > ccan/tal/.d || rm -f ccan/tal/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/timer/info -x c ccan/timer/_info
tools/gen_deps.sh ccan/timer > ccan/timer/.d || rm -f ccan/timer/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/generator/info -x c ccan/generator/_info
tools/gen_deps.sh ccan/generator > ccan/generator/.d || rm -f ccan/generator/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/cpuid/info -x c ccan/cpuid/_info
tools/gen_deps.sh ccan/cpuid > ccan/cpuid/.d || rm -f ccan/cpuid/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/asort/info -x c ccan/asort/_info
tools/gen_deps.sh ccan/asort > ccan/asort/.d || rm -f ccan/asort/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/stringmap/info -x c ccan/stringmap/_info
tools/gen_deps.sh ccan/stringmap > ccan/stringmap/.d || rm -f ccan/stringmap/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/isaac/info -x c ccan/isaac/_info
tools/gen_deps.sh ccan/isaac > ccan/isaac/.d || rm -f ccan/isaac/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/io/info -x c ccan/io/_info
tools/gen_deps.sh ccan/io > ccan/io/.d || rm -f ccan/io/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/iscsi/info -x c ccan/iscsi/_info
tools/gen_deps.sh ccan/iscsi > ccan/iscsi/.d || rm -f ccan/iscsi/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/order/info -x c ccan/order/_info
tools/gen_deps.sh ccan/order > ccan/order/.d || rm -f ccan/order/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/edit_distance/info -x c ccan/edit_distance/_info
tools/gen_deps.sh ccan/edit_distance > ccan/edit_distance/.d || rm -f ccan/edit_distance/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ciniparser/info -x c ccan/ciniparser/_info
tools/gen_deps.sh ccan/ciniparser > ccan/ciniparser/.d || rm -f ccan/ciniparser/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/tally/info -x c ccan/tally/_info
tools/gen_deps.sh ccan/tally > ccan/tally/.d || rm -f ccan/tally/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/typesafe_cb/info -x c ccan/typesafe_cb/_info
tools/gen_deps.sh ccan/typesafe_cb > ccan/typesafe_cb/.d || rm -f ccan/typesafe_cb/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/deque/info -x c ccan/deque/_info
tools/gen_deps.sh ccan/deque > ccan/deque/.d || rm -f ccan/deque/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/ptr_valid/info -x c ccan/ptr_valid/_info
tools/gen_deps.sh ccan/ptr_valid > ccan/ptr_valid/.d || rm -f ccan/ptr_valid/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/darray/info -x c ccan/darray/_info
tools/gen_deps.sh ccan/darray > ccan/darray/.d || rm -f ccan/darray/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/str/info -x c ccan/str/_info
tools/gen_deps.sh ccan/str > ccan/str/.d || rm -f ccan/str/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/daemonize/info -x c ccan/daemonize/_info
tools/gen_deps.sh ccan/daemonize > ccan/daemonize/.d || rm -f ccan/daemonize/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/pushpull/info -x c ccan/pushpull/_info
tools/gen_deps.sh ccan/pushpull > ccan/pushpull/.d || rm -f ccan/pushpull/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/crc/info -x c ccan/crc/_info
tools/gen_deps.sh ccan/crc > ccan/crc/.d || rm -f ccan/crc/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/strgrp/info -x c ccan/strgrp/_info
tools/gen_deps.sh ccan/strgrp > ccan/strgrp/.d || rm -f ccan/strgrp/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/cppmagic/info -x c ccan/cppmagic/_info
tools/gen_deps.sh ccan/cppmagic > ccan/cppmagic/.d || rm -f ccan/cppmagic/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/autodata/info -x c ccan/autodata/_info
tools/gen_deps.sh ccan/autodata > ccan/autodata/.d || rm -f ccan/autodata/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/net/info -x c ccan/net/_info
tools/gen_deps.sh ccan/net > ccan/net/.d || rm -f ccan/net/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/utf8/info -x c ccan/utf8/_info
tools/gen_deps.sh ccan/utf8 > ccan/utf8/.d || rm -f ccan/utf8/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/agar/info -x c ccan/agar/_info
tools/gen_deps.sh ccan/agar > ccan/agar/.d || rm -f ccan/agar/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/rfc822/info -x c ccan/rfc822/_info
tools/gen_deps.sh ccan/rfc822 > ccan/rfc822/.d || rm -f ccan/rfc822/.d
cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -DCCAN_STR_DEBUG=1 -I.  -I. -o ccan/intmap/info -x c ccan/intmap/_info
tools/gen_deps.sh ccan/intmap > ccan/intmap/.d || rm -f ccan/intmap/.d
make: 'tools/configurator/configurator' is up to date.

> PS. Running ./tools/configurator/configurator --verbose will tell you
> what test it was, if you're curious...

Sorry to be a pain, but:

 matica!44 ccan$ ./tools/configurator/configurator --verbose
./tools/configurator/configurator: Unknown option --verbose

-- 
Please don't Cc: me privately on mailing lists and Usenet,
if you also post the followup to the list or newsgroup.
To reply privately _only_ on Usenet and on broken lists
which rewrite From, fetch the TXT record for no-use.mooo.com.
