Return-Path: <SRS0=m9xQ=CU=lists.ozlabs.org=ccan-bounces+ccan=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3590C43461
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 01:27:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC626208FE
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 01:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="a41zzaB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC626208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BndRH5rZbzDqjv
	for <ccan@archiver.kernel.org>; Fri, 11 Sep 2020 11:27:39 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BndRB2QBkzDqjj
 for <ccan@lists.ozlabs.org>; Fri, 11 Sep 2020 11:27:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=a41zzaB2; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BndRB17Q8z9sVR; Fri, 11 Sep 2020 11:27:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599787654;
 bh=TJMMr01O+9Tzm7SdIM/n9z4PCh2fKEH0N/4Rg+Wv+PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a41zzaB2mjTffSMCgHfJU9ioRlENG5GyQMZLNAXQpdsrQULZFsmmmU1QbstL65s6u
 gFon9afO5psj0tBLKLxmoTLAv+fPnHeMrhxWqTDL6DiZs/v6LFCim3w+6bWgd8Mifs
 Mp/EgQkc6oBzluB5E1+ziRVjiJL8XJ21NXVbZwaA=
Date: Fri, 11 Sep 2020 10:57:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Kirill Smelkov <kirr@nexedi.com>
Message-ID: <20200911005734.GG66834@yekko.fritz.box>
References: <20200910191610.131510-1-kirr@nexedi.com>
MIME-Version: 1.0
In-Reply-To: <20200910191610.131510-1-kirr@nexedi.com>
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
Content-Type: multipart/mixed; boundary="===============8668019287873759309=="
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>


--===============8668019287873759309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fCcDWlUEdh43YKr8"
Content-Disposition: inline


--fCcDWlUEdh43YKr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 07:16:19PM +0000, Kirill Smelkov wrote:
> With current Debian testing I get:
>=20
> 	tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/compiler/ && touch =
ccan/compiler/.ok
> 	compiler: Module tests compile (tests_compile): FAIL
> 	/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/ccan/compiler/test/r=
un-is_compile_constant.c:Compile failed:
> 	/usr/bin/ld: /tmp/ccanlint-129350.1804289383/tap.o:/home/kirr/src/wendel=
in/wendelin.core/3rdparty/ccan/ccan/tap/tap.h:249: multiple definition of `=
tap_fail_callback'; /tmp/ccrAwqbl.o:/home/kirr/src/wendelin/wendelin.core/3=
rdparty/ccan/ccan/tap/tap.h:249: first defined here
> 	collect2: error: ld returned 1 exit status
> 	...
>=20
> 	cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -W=
missing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -=
DCCAN_STR_DEBUG=3D1 -I.  -MMD -MP -MFtools/ccanlint/ccanlint.d -MTtools/cca=
nlint/ccanlint tools/ccanlint/ccanlint.c tools/ccanlint/async.o tools/ccanl=
int/file_analysis.o tools/ccanlint/licenses.o tools/ccanlint/tests/avoids_c=
pp_reserved.o tools/ccanlint/tests/depends_accurate.o tools/ccanlint/tests/=
depends_build.o tools/ccanlint/tests/depends_build_without_features.o tools=
/ccanlint/tests/depends_exist.o tools/ccanlint/tests/examples_compile.o too=
ls/ccanlint/tests/examples_exist.o tools/ccanlint/tests/examples_relevant.o=
 tools/ccanlint/tests/examples_run.o tools/ccanlint/tests/hash_if.o tools/c=
canlint/tests/headers_idempotent.o tools/ccanlint/tests/info_compiles.o too=
ls/ccanlint/tests/info_documentation_exists.o tools/ccanlint/tests/info_exi=
sts.o tools/ccanlint/tests/info_ported.o tools/ccanlint/tests/info_summary_=
single_line.o tools/ccanlin
>  t/tests/license_comment.o tools/ccanlint/tests/license_depends_compat.o =
tools/ccanlint/tests/license_exists.o tools/ccanlint/tests/license_file_com=
pat.o tools/ccanlint/tests/main_header_compiles.o tools/ccanlint/tests/main=
_header_exists.o tools/ccanlint/tests/module_builds.o tools/ccanlint/tests/=
module_links.o tools/ccanlint/tests/no_trailing_whitespace.o tools/ccanlint=
/tests/objects_build.o tools/ccanlint/tests/objects_build_with_stringchecks=
=2Eo tools/ccanlint/tests/objects_build_without_features.o tools/ccanlint/t=
ests/reduce_features.o tools/ccanlint/tests/tests_compile.o tools/ccanlint/=
tests/tests_compile_coverage.o tools/ccanlint/tests/tests_coverage.o tools/=
ccanlint/tests/tests_exist.o tools/ccanlint/tests/tests_helpers_compile.o t=
ools/ccanlint/tests/tests_pass.o tools/ccanlint/tests/tests_pass_valgrind.o=
 tools/ccanlint/tests/tests_pass_without_features.o ccan/autodata/autodata.=
o ccan/dgraph/dgraph.o ccan/ilog/ilog.o ccan/lbalance/lbalance.o ccan/ptr_v=
alid/ptr_valid.o ccan/strma
>  p/strmap.o tools/ccan_dir.o tools/compi
> 	le.o tools/depends.o tools/doc_extract-core.o tools/gcov.o tools/manifes=
t.o tools/read_config_header.o tools/tools.o ccan/asort/asort.o ccan/err/er=
r.o ccan/foreach/foreach.o ccan/hash/hash.o ccan/htable/htable.o ccan/list/=
list.o ccan/membuf/membuf.o ccan/noerr/noerr.o ccan/opt/helpers.o ccan/opt/=
opt.o ccan/opt/parse.o ccan/opt/usage.o ccan/rbuf/rbuf.o ccan/read_write_al=
l/read_write_all.o ccan/str/debug.o ccan/str/str.o ccan/take/take.o ccan/ta=
l/tal.o ccan/tal/grab_file/grab_file.o ccan/tal/link/link.o ccan/tal/path/p=
ath.o ccan/tal/str/str.o ccan/time/time.o -lm -o tools/ccanlint/ccanlint
> 	/usr/bin/ld: tools/ccanlint/async.o:/home/kirr/src/wendelin/wendelin.cor=
e/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple definiti=
on of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendeli=
n.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first define=
d here
> 	/usr/bin/ld: tools/ccanlint/file_analysis.o:/home/kirr/src/wendelin/wend=
elin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: multiple =
definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin=
/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: firs=
t defined here
> 	/usr/bin/ld: tools/ccanlint/licenses.o:/home/kirr/src/wendelin/wendelin.=
core/3rdparty/ccan/tools/ccanlint/licenses.h:33: multiple definition of `li=
cense_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/wendelin/wendelin.core/3r=
dparty/ccan/tools/ccanlint/../ccanlint/licenses.h:33: first defined here
> 	/usr/bin/ld: tools/ccanlint/tests/avoids_cpp_reserved.o:/home/kirr/src/w=
endelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h=
:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kir=
r/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licen=
ses.h:33: first defined
> 	here
> 	/usr/bin/ld: tools/ccanlint/tests/depends_accurate.o:/home/kirr/src/wend=
elin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33=
: multiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/s=
rc/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses=
=2Eh:33: first defined here
> 	/usr/bin/ld: tools/ccanlint/tests/depends_build.o:/home/kirr/src/wendeli=
n/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint/licenses.h:33: m=
ultiple definition of `license_compatible'; /tmp/cc72h7qq.o:/home/kirr/src/=
wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../ccanlint/licenses.h:=
33: first defined here
> 	/usr/bin/ld: tools/ccanlint/tests/depends_build_without_features.o:/home=
/kirr/src/wendelin/wendelin.core/3rdparty/ccan/./tools/ccanlint/../ccanlint=
/licenses.h:33: multiple definition of `license_compatible'; /tmp/cc72h7qq.=
o:/home/kirr/src/wendelin/wendelin.core/3rdparty/ccan/tools/ccanlint/../cca=
nlint/licenses.h:33: first defined here
> 	...
>=20
> The errors are valid becuase symbols are declared without extern in .h
> files and those .h files are included from multiple translation units.
>=20
> -> Fix it. I'm not sure why it used to compile ok before.
>=20
> Signed-off-by: Kirill Smelkov <kirr@nexedi.com>

Applied, thanks.

> ---
>  ccan/tap/tap.c            | 1 +
>  ccan/tap/tap.h            | 2 +-
>  tools/ccanlint/licenses.h | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/ccan/tap/tap.c b/ccan/tap/tap.c
> index bf8a276c..b3782104 100644
> --- a/ccan/tap/tap.c
> +++ b/ccan/tap/tap.c
> @@ -43,6 +43,7 @@ static const char *todo_msg_fixed =3D "libtap malloc is=
sue";
>  static int todo =3D 0;
>  static int test_died =3D 0;
>  static int test_pid;
> +void (*tap_fail_callback)(void) =3D NULL;
> =20
>  /* Encapsulate the pthread code in a conditional.  In the absence of
>     libpthread the code does nothing.
> diff --git a/ccan/tap/tap.h b/ccan/tap/tap.h
> index 5b21ff75..22c245d5 100644
> --- a/ccan/tap/tap.h
> +++ b/ccan/tap/tap.h
> @@ -246,6 +246,6 @@ void plan_skip_all(const char *reason);
>   *
>   * This can be used to ease debugging, or exit on the first failure.
>   */
> -void (*tap_fail_callback)(void);
> +extern void (*tap_fail_callback)(void);
> =20
>  #endif /* CCAN_TAP_H */
> diff --git a/tools/ccanlint/licenses.h b/tools/ccanlint/licenses.h
> index 60d20376..b921fa62 100644
> --- a/tools/ccanlint/licenses.h
> +++ b/tools/ccanlint/licenses.h
> @@ -30,7 +30,7 @@ struct license_info {
>  };
> =20
>  /* Is [project license][file license] compatible? */
> -bool license_compatible[LICENSE_UNKNOWN+1][LICENSE_UNKNOWN];
> +extern bool license_compatible[LICENSE_UNKNOWN+1][LICENSE_UNKNOWN];
> =20
>  extern const struct license_info licenses[];
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fCcDWlUEdh43YKr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9ay3wACgkQbDjKyiDZ
s5KdehAAi36oHhXjEzX6s6PY7/PHVGytwiIiZ6cHA50wPkOM3v8ZguR+o3i/K0zD
/voxZOuk525AqJyJkN6UpoRv3TOYpXGQeP5ax06BjUplXAtCOdMyRIUaLd3dRCqf
8HrFpxQRkMHSObA3MxtI2sFC2EHnNROBvHGHbbZijcWJhsKWUywvmctP+AsnKOQK
y/bcwnOj8hVVRsi6suiqPn3mZ9qoBR1w4OSpOgWq5JgblCKNjHpUuZjg/Nxib+wj
7kR8/nooARZIPL0zPQIx5Zq7zlxocX9yeRWZoSEaAMOBuKphYRSJww0sAHoLjoRy
ZU8W1uqL2yPoK3veeNIo74wWj/0eGZZr/EWD2T6wK2I7R5/HGEoRzoVUpW7ezNZu
iL4vFNZ9ukP7A7yRp3wJ5uH/k7alHYE8SvUhJWa++DD1dLp/EFq2RXiKOh6x+KQo
3qBQBNkSLtSoZOBswCtLgBOZt5zURamaAKWKgkqEJAcOrhSEIeEZafbR6WlMV5nH
cSodgfVGieeUO6EsOhZUNSn/NsDxQ1g9MdaOLL6N6njOyNr0kcD5sYpQYrHZSojy
tl24bxQVgDcCWwNG4uCVS1wNCD8rUv0N7/vA8altA6/Xw2BVg0BUYhgvW99zuUjj
Huw9GayHWBrcSpVqBMPIc2XGi3qeP16DpoYSIAHvOq/Volal8Ew=
=Ceno
-----END PGP SIGNATURE-----

--fCcDWlUEdh43YKr8--

--===============8668019287873759309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============8668019287873759309==--
