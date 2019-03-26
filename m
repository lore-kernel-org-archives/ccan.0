From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: make check fails in coroutine module
Date: Tue, 26 Mar 2019 15:31:29 +1100
Message-ID: <20190326043129.GP9393@umbus.fritz.box>
References: <20190317223944.rebtzvfszp63qrze@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5597281967339460775=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Sz341dNNzDqFB
 for <ccan@lists.ozlabs.org>; Tue, 26 Mar 2019 15:40:48 +1100 (AEDT)
In-Reply-To: <20190317223944.rebtzvfszp63qrze@matica.foolinux.mooo.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Ian Zimmerman <itz@very.loosely.org>
Cc: Ccan Mailinglist <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============5597281967339460775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDuspjMMC1Ui5ypn"
Content-Disposition: inline


--NDuspjMMC1Ui5ypn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2019 at 03:39:44PM -0700, Ian Zimmerman wrote:
> cc -g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition -Wundef -Wm=
issing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings -D=
CCAN_STR_DEBUG=3D1 -I.  -MMD -MP -MFccan/coroutine/coroutine.o.d -MTccan/co=
routine/coroutine.o -c ccan/coroutine/coroutine.c -o ccan/coroutine/corouti=
ne.o
> tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/coroutine/ && touch =
ccan/coroutine/.ok
> coroutine: Module's run and api tests pass (tests_pass): FAIL (+0/3)
> /home/itz/git/ccan/ccan/coroutine/test/api-2.c:1..10
> ok 1 - coroutine_stack_check(stack1, NULL) =3D=3D stack1
> ok 2 - coroutine_stack_size(stack1) =3D=3D bufsz - COROUTINE_STK_OVERHEAD
> ok 3 - coroutine_stack_check(stack2, NULL) =3D=3D stack2
> ok 4 - coroutine_stack_size(stack2) =3D=3D bufsz - COROUTINE_STK_OVERHEAD
> sh: line 1: 24908 Segmentation fault      (core dumped) valgrind -q --lea=
k-check=3Dfull --log-fd=3D3 /tmp/ccanlint-24709.1804289383/api-2 3> /tmp/cc=
anlint-24709.1804289383/api-2.valgrind-log
>=20
> ... more (use -vv to see them all)
> coroutine: Total score: 35/43 FAIL!
> make: *** [Makefile:78: ccan/coroutine/.ok] Error 1
>=20
> Perhaps it is relevant that the configurator check causing the segfault
> - as discussed in the other thread - is HAVE_POINTER_SAFE_MAKECONTEXT
> which, I believe, is only used by coroutine module.
>=20
> Platform: x86_64, Fedora 28, gcc 8.3.1, glibc 2.27.  I didn't set any
> special build flags or anything.

Urgh, yeah, it's broken.  Finding time to debug and fix it is proving
difficult.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NDuspjMMC1Ui5ypn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlyZqyEACgkQbDjKyiDZ
s5IsehAAprGkTytdubOx7/6XQk1hJAkg+VHO2M11uuNOeUFBAEyJEVC3VbI0QsxH
jSOAqGtB6UyNDfMJzuCGBKMJ0ZkC1ZgW4NPtAFl6lF6vYPUtp+4Tgw+9dQip9S4v
WK/2yW9qZYa0mLw0UCMoI2dZqFi6iTce1xjoPe6JhYGkQoi5s3t8FRYKhb/fNnjM
mFNCGi9277xLET1H/nHFAPbp3ML3SzYHl6o60AqGrr+xYW7gQbn5MrIIS7nY78Mm
SBzMMi9dqE49dWbUGptGWI0gJYi0TvR2/t19EpPe3ju9M58kIbAdkma+Vqnfovmd
5bDsdpAThzGNUNa/3UWzbeXyBMRFTmJRV2VumR0OfT0DwzwRT7Yp3mzn3QjMyoN6
kwMfXq9nghmdvH4TUIMr9cqX2nYGxALSVZW00E52nlSXyzYgonRZujlx65MD2vMe
WTqXQd28xsAf94HHmYlotcNFZFnMoFGTzht8YBluC8FWH1Ol03/bc+jkFjF9GYV1
9SMONXuYOGYYWImcO+VKn0ZB7bJJx/rhtBXTwDKj/oLL9FqnDSHdmdBxBWQUbolx
tZC0oBF54bHlFNmZPw1aT1rpVs+hh4rqNVuoBSLw8HUOWZloqiBA2Jg9355avmKb
1NvAXEA9H6wE7lgRV5N3wV5JKH+sFrsEnC/kE2yDO/3reD574/M=
=ohZQ
-----END PGP SIGNATURE-----

--NDuspjMMC1Ui5ypn--

--===============5597281967339460775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============5597281967339460775==--
