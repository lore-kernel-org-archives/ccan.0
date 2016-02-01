From: David Gibson <david@gibson.dropbear.id.au>
Subject: Test failure in rszshm
Date: Mon, 1 Feb 2016 22:08:09 +1100
Message-ID: <20160201110809.GK23043@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7353960147004870064=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 374C71A0179
 for <ccan@lists.ozlabs.org>; Mon,  1 Feb 2016 22:07:14 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@dancancode.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============7353960147004870064==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qp+4iQ/pA/lPyvuI"
Content-Disposition: inline


--Qp+4iQ/pA/lPyvuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

So, for me at least, ccanlint is failing on the rszshm module (and
therefore make check is failing as well).  I only see one commit for
that module, so I think it must have always been broken.

not ok 13 - rszshm_mk(&t, 4096, NULL, scan) =3D=3D NULL && errno =3D=3D ENO=
MEM
#     Failed test (/home/dwg/src/ccan/ccan/rszshm/test/run.c:main() at
line 96)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qp+4iQ/pA/lPyvuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrzyZAAoJEGw4ysog2bOSZPcQAIoA9bwWdwwiHEj9IzL/J2T/
xsDX/JidsVnDq23a/zx6BfMBd0/Fk5ERQkgsUKoWa3yPhz8jatbycjxMz35fq6o3
+cHjbUtQQ4UJIKB/iz7/o6U5J65uBwGCFipnQJQkOrHrUQwgo3BZELVJ3UKYDEiV
CK90sCFTV/BYwKQig+Lu9dq/14B2IoqD4tgofdf7VHRLvoRBNPCmFl8fQYFRYst0
mriHZb8pbeiM7Bm3iRms7kxkRFjrzwTHsQVejxMNjApiIizbCBHWtKdzZjPIPx5/
EQvx0HycWpBerZoheK2TkJPwx+0agUmR3VlbCwfpJVlrI4suRrAaYxqTecvCNxXn
Iag77Bhkhj+xm5J8itM955EzMIEMBjJiM3h1nl77BS2jrDkfQm4G2CbLxu/iGbVe
iUGlJLlRFln94gXSN/CslTl62fuTqNBiobYqv+HEqJ9nYaUQwJS3OBnfKjR9+ACj
n9nuhPcN6VTgJwCw6CFrs7SGF5bfKwrCiOISYpAgt7qY97USj08JuO5nf94F1xzB
5nq9erZPK+WWaGUjRs5OgFGyHfYjDM1Rd9NLFwdxJ5CaTZTULDPFaiNznssACor1
Na+CZtqqDGm01XdlWKkoaICII3pbJbrPHooKfK44pyi9NGOO++9eOQF8RJ38Pj02
v8jgM8J57V32Eh6CTERV
=D7HW
-----END PGP SIGNATURE-----

--Qp+4iQ/pA/lPyvuI--

--===============7353960147004870064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============7353960147004870064==--
