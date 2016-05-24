From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] Build info files
Date: Tue, 24 May 2016 21:13:24 +1000
Message-ID: <20160524111324.GG17226@voom.fritz.box>
References: <1462823981-1972-1-git-send-email-david@gibson.dropbear.id.au>
 <1462823981-1972-3-git-send-email-david@gibson.dropbear.id.au>
 <87k2ik5ahc.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7935868179137872691=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDYzT2hnDzDqDD
 for <ccan@lists.ozlabs.org>; Tue, 24 May 2016 22:06:29 +1000 (AEST)
In-Reply-To: <87k2ik5ahc.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============7935868179137872691==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Content-Disposition: inline


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 02:16:39PM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > All modules have a _info file (a C file, despite the lack of extension)
> > giving metadata for the module.  The Makefiles have a rule to build the=
se..
> > but it's broken (missing an include directive).
> >
> > This patch fixes the rule, and builds the info binaries for all modules=
 by
> > default.  This is a useful check and also useful for manually inspecting
> > a module's metadata.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> Sorry for the delay.  These are great, please apply.

Done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRDdUAAoJEGw4ysog2bOSfkwQAIsBtqfAoNz5kzZH//gYY+vo
ma/ksC/1ew4RtmAIZbuzKvM2a2Vooa79Hl0hFAj77TWFsrb2NfOaiOpU/XQRox77
CItvVOHjc1WzdjDOmJMKZx4YZblrAs37rbNjxAIhxhvoHQi6iMfVf7tNWyNqnnfP
1p7m+HsxswdYlzyX4yrY3N4Mxt6SOGJE8gI9MpmOkPAdi5JctmehvjAH5Z/fiaR/
sl+giYzUeAED3/2uIbdIWxUenUPlxgwnOcY9WsRY2096zwXNIFkTrDrMt/GbzPEH
2XVXoT8Rd5Rzf9hO0fA5vHSWnpTfilAL2IpdWaRDcgDs+f3FK/r9Du9xw1uYAyKR
7tLSig1GdDV2ck0mkUxid/2G10KPPE0Y8qU8VAvQE7H9ge48FaH58JTdQutN1tzb
NQPR0AuQZp6rXTIJMFvWSC5zVhhYMwpBiL7ZouOsOoFWc9atZ5Sg4/LdYrDWPOrH
ZruNf2TrWjCwQmCHdb0Pw1BmLXvubjhupd9b6HzUXEJT8UZEhyTRTIjYbHV/Y0oR
f+RFNk6agNx7Zd9NC7VZ0YYg7cCnNvi2BT/8TI3k/yhwp/CJ5oZZMcH7hsU0UuuS
XtxQ4BRMgwnWQKZb6at/mjC7NvhuQrcnYDcCt6eq0XzvwNKkNySXgxealvy++vaG
3c8IhBgpuI8VzjhLttLE
=jgxm
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--

--===============7935868179137872691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7935868179137872691==--
