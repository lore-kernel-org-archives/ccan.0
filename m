From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Test failure
Date: Fri, 1 Sep 2017 15:09:57 +1000
Message-ID: <20170901050957.GN3386@umbus.fritz.box>
References: <20170901033420.qxcy4qyimzwv7tbd@matica.foolinux.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5999433217129814795=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xk6tS1GnPzDqj2
 for <ccan@lists.ozlabs.org>; Fri,  1 Sep 2017 15:17:04 +1000 (AEST)
In-Reply-To: <20170901033420.qxcy4qyimzwv7tbd@matica.foolinux.mooo.com>
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


--===============5999433217129814795==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3snK74p7ddXn3Qrx"
Content-Disposition: inline


--3snK74p7ddXn3Qrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 08:34:21PM -0700, Ian Zimmerman wrote:
> Trying to run make check on current master, I get:
>=20
> [many successful tests snipped]
>=20
> tools/ccanlint/ccanlint -s --deps-fail-ignore   ccan/io/ && touch ccan/io=
/.ok
> io: Module examples with expected output give that output (examples_run):=
 FAIL
> /tmp/ccanlint-24192.1804289383/example-_info-io.c:2:output '' didn't matc=
h 'tr a-z a-z'
>=20
> io: Total score: 82/87 FAIL!
> make: *** [Makefile:78: ccan/io/.ok] Error 1
>=20
> What's up?

What platform?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3snK74p7ddXn3Qrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmo66IACgkQbDjKyiDZ
s5JMiQ//ZIQVyF5XimC7xMzZT6xJ+soMkaTUUwutXka9ytpPCRz0eGHfqkt6oSTE
4ULSXyYi20H6GVGehC7EINf6xtu2BnLo6lZxHhHBy5qrbfismdZKsiHeEtW7eDiy
63XqKSWhNdh72W2TNRUGlaMxKyexScmKYbl9TYWXUHSPTqzmiakNvqgnGrpQType
SWlgsQmufqbUSmeux/kJXCMpP1B05V7bDMLX0b3WlLrnPpvbvYQ4oeOWQSj2HjTY
va4jBokqY3fS4eNqptbbfHPSNwjgInoeeWNoaZqxTtTKzMCf7HK9OEWGxHq5D3Xz
2958o1yUtv/ZRfXB/wa8YeY776sFndr9hhR+QUnC4JjF7gDHJ7vBph6gwOKLjXBh
2d+UAOeu8WlXP+MuJUvfy6uJdWewK8bK2b68iJA8AObkeOtotFzRb4W+hoOxObe7
w9gtL5XDBtwPTj/03O/lLV/QT134d98XdjZpmkA1nJdm304tnJSUQNYKJMQHAw7r
Uemk8NI7QuWKMCNZhi0NUrMBrbTsWM0NHANPX1iCL9Djpl74IE6GFpVdp7DWiuKZ
gw6OHWbnGZXz5J0iGNJHQlangpYhk7A7EL2rGCQUI1hITHyX5gVMOo3NUR8e8d2p
A/UHe0KwEAZTowYI5AW2DbrmtvVZEl5AGlAnAc27v4gQ94RSL2k=
=5VaM
-----END PGP SIGNATURE-----

--3snK74p7ddXn3Qrx--

--===============5999433217129814795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5999433217129814795==--
