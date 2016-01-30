From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/5] cppmagic: Preprocessor tricks
Date: Sat, 30 Jan 2016 23:51:09 +1100
Message-ID: <20160130125109.GS23043@voom.redhat.com>
References: <1453894801-22652-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8213162792280035806=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 292291A006D
 for <ccan@lists.ozlabs.org>; Sun, 31 Jan 2016 16:57:42 +1100 (AEDT)
In-Reply-To: <1453894801-22652-1-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org, rusty@rustcorp.com.au
List-Id: ccan@lists.ozlabs.org


--===============8213162792280035806==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOmQO3H5Qmmwdmk8"
Content-Disposition: inline


--hOmQO3H5Qmmwdmk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2016 at 10:39:56PM +1100, David Gibson wrote:
> ccan already has cpp macros used in some interesting ways.  This
> module is far more interesting.. or possibly horrifying.
>=20
> It includes some very fancy preprocessor techniques described in the
> article at:
>     http://jhnet.co.uk/articles/cpp_magic
>=20
> This includes preprocessing time evaluated conditionals, (sort of)
> recursion and iteration across the parameters of varargs macros.

No comments so far.  Unless there's an objection in the next couple of
days, I'll commit this myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hOmQO3H5Qmmwdmk8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrLG9AAoJEGw4ysog2bOSndMQANuavZ1kztZguorwAnleLxcn
RPtOtbwiZW5lxBTfHfJ5j9M5qUAmxtmV9dXcZRWN+6VyBfmWAo4ZGdMmxDXN+IR1
Pc3LOW1tDqVJqEo1uYKFrm08Fo2TCQhamOy3DnsZBQXyr7GK4IPOSzWxw+mtNd+h
cGaET5QxOjLt0XlnV9qd14ze1LxwloW5ZnIgpES2vezRNsORzJ+whCxf/FQgMMz9
/paAyMiJO72o15EMWeBtHR3tlkoCfH5N/65cl1gJkG7oXPGNP/hCCMQKD6YoWdWm
o7+AbAtbtMKGwaUot9lZmyiqGBFt+8R38yF7FpHKt1ycdQmKHsN55ZNTgXTlwrDZ
d85N1YM9EtOHTL0nASpSV5oqq9EeGl6nSPX+y4bNQLMEydXe/7i8AQAQHzdDHYg4
+UztsJikVqhDG505j7yKwtmM3yeKqQLegVQCQJ9hk6NP9IbtnTdInO/kQPMSl5Gp
NUJLvJPK/JZ94q39xEpOARDvTj9fbQkDlWBY+clT4WKpAkxn0DIVR4Do/vQUmWeg
krljplrwq7ts/d1sBLNY7rIoYTXcSIGx4u3ykK5a616rcBuuYWIrn97rARqLL7IM
9rmnOj6Lx1KvTkkyCavbLXwiHvvtRXjrYCLmVcqn58AnsgZO+COl4p/ptqgTDDIq
I85WU2dSsz4FahYsazmx
=HNTB
-----END PGP SIGNATURE-----

--hOmQO3H5Qmmwdmk8--

--===============8213162792280035806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8213162792280035806==--
