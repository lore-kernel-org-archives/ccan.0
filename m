From: Andrew Jeffery <andrew@aj.id.au>
Subject: altstack causing travis-ci failures
Date: Sat, 26 Mar 2016 00:44:33 +1030
Message-ID: <1458915273.537.36.camel@aj.id.au>
Reply-To: andrew@aj.id.au
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5417834371624467323=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qWlg31MnczDq5k
 for <ccan@lists.ozlabs.org>; Sat, 26 Mar 2016 01:14:39 +1100 (AEDT)
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
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============5417834371624467323==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8Y9v6c9+NlTqVWmaOwUj"


--=-8Y9v6c9+NlTqVWmaOwUj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Dan,

I'm seeing a ccanlint failure for altstack on Travis-CI, e.g[1]:

    ...
    tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/aga
    tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/agar
    agar: Total score: 36/38
    tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/altstack
    altstack: Total score: 31/36 FAIL!
    make: *** [summary-check-altstack] Error 1
    tools/ccanlint/ccanlint --deps-fail-ignore -s ccan/antithread
    aga: Total score: 48/50
    ...

FWIW I haven't had this happen when running `make check` on my machine.
I ended up pushing the changes I was testing as the failure wasn't
related and wasn't something I could trigger locally (the commit tested
above is currently at the tip of master), but thought it would be
useful to highlight that something strange appears to be happening with
the altstack module, at least on Travis-CI.

Cheers,

Andrew

[1]=C2=A0https://travis-ci.org/amboar/ccan/jobs/118466416#L534
--=-8Y9v6c9+NlTqVWmaOwUj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW9UfJAAoJEJ0dnzgO5LT5RUwQAKC2CPrAY2Aw2t7dAYbJmQ/d
2XI4IRVDPsq242vo51FaMRZaRkkG8zFCSAWKfdfL48nawlsVZ8CfRFlWg51zGGwx
DW+7xeOfOLX+BTHegG6jvko0p+KGDT4/CC431mbwQRHo7LzoELTJ9AX2NjL7L452
z5rBVXDtjWnIdkpg8qROjD9bMsi8CKyjMwMet5iRnZNFKxtgW5XPr7L9QCzugqa8
+fyauDBBB7uZcC8XDUr6b8T2KhX073R6ac2jrRoFEVt9YD3h8F6hFECg7ugf7bjU
uZU7p/J84Rj9+AcG1164E7d7AAtCIP8WlKWfxMIV2bvar2MDIZ2r8aw4/n2eJoDf
jZO0KQ4RfW3lLNJoeJebufwbuP5aNvC29/l8waRm4x9WnKA+uJ87CWUftnclrCkT
r/CmEtm1144eo8a6BJrKV9vO49hdqA6i4s0na0aVeg2CdSxcUW75kEciM3dK7ykF
L7VVX9h9DArwaFlWIarv0wkhe1gEnSt+MLSoaTN6WtTNb8yosBXvX5cZgFXUOfpK
SMi5C4Rb6c8qO2L8a7KdAbO8XFgi0pqhWFSBJu09F7MQrjtcwxvJjTYHaUrYx/dI
lf0AR8zeY4ikbPINnjzw0+9T8E9TPnxWl2Tl3qeYNWZJWdC6kEoSW4dzzRcoZFrR
+5cjDGvxSHYmti7NDE8V
=V6Ww
-----END PGP SIGNATURE-----

--=-8Y9v6c9+NlTqVWmaOwUj--


--===============5417834371624467323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5417834371624467323==--
