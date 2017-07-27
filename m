From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 0/4] Replace TCON() with TCON_WRAP()
Date: Thu, 27 Jul 2017 17:27:48 +1000
Message-ID: <20170727072748.GD7970@umbus.fritz.box>
References: <20170723122907.10686-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0525755774424081950=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ81G1Bg9zDrJY
 for <ccan@lists.ozlabs.org>; Thu, 27 Jul 2017 20:51:46 +1000 (AEST)
In-Reply-To: <20170723122907.10686-1-david@gibson.dropbear.id.au>
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


--===============0525755774424081950==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2017 at 10:29:03PM +1000, David Gibson wrote:
> ccan/tcon has two basic ways to be used.  With TCON() which adds a
> type canary to a user's existing structure, or with TCON_WRAP(), which
> wraps a user's structure creating a new structure with the canaries.
>=20
> TCON() is older and has several modules already using it.
> Unfortunately, it uses flexible-array members which aren't allowed in
> the middle of structures, except as a gcc extension.  That means with
> a "normal" compiler TCON() invocations can only appear at the end of a
> structure.  More importantly it also means a structure including them
> can never be embedded in another structure except at the end.
>=20
> In short, using TCON() is either non-portable, or badly violates
> principle of least surprise.  So, this series removes use of it from
> all existing ccan modules.

Rusty,  any thoughts on this?

Unless there's an objection, I'm inclined to commit it.

> David Gibson (4):
>   tlist: Use TCON_WRAP instead of TCON
>   jset: Use TCON_WRAP instead of TCON
>   jmap: Use TCON_WRAP instead of TCON
>   objset: Use TCON_WRAP instead of TCON
>=20
>  ccan/jmap/jmap.h      | 59 +++++++++++++++++++++++++++++----------------=
------
>  ccan/jmap/test/run.c  |  8 +++----
>  ccan/jset/jset.h      | 45 ++++++++++++++++++++++++---------------
>  ccan/jset/test/run.c  |  9 ++++----
>  ccan/objset/objset.h  | 31 +++++++++++++++------------
>  ccan/tlist/_info      |  6 +-----
>  ccan/tlist/test/run.c | 24 ++++++++++-----------
>  ccan/tlist/tlist.h    | 25 +++++++++++-----------
>  8 files changed, 114 insertions(+), 93 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll5lfQACgkQbDjKyiDZ
s5Ipmw/9HhzO+tSofiPi9eMuTemnHvbqk3fa1R75lkm1Ry/hkNkbCvrgbNdy/yaq
2btjy7gYLY4rwvsfOpcHjjVKuspGiLkNPAxxGRfYxCd/MnOrt7N2kp/5zlH1MPZ6
6ZeC3c3eG5h7uT9yQcCLrxLf90xogiDNBhEqyv4yi42+H9Y2x7+xtxy/XN/T+5+2
NulJpLd2OHxLyDHnsLtJYRiW3uHq5SO8r5Jc6xUF1UlFMTo0LD12DAYtXsyJPX5x
cpV5y77f912VOqDRDgyYbzbgirZOSMdRsUOYYeOVO5A6CoZIhViT7gv9pupu+Z04
R0XOi6y6sE2Ees1rUgB/+DbXZPZYrz+FdHAXqpobaobgygxcLJhvWWl5RyCGwKla
NMCkqv6EziGj32DiDBQvURD7TV6NEq+SPPOBAoK/DqiXzPh+aRgww0vTNRXd5nNO
18UpuGJG7zu/PnftPyULwFBdskFWy/LOHSyS/s71SOKjYF/+zwBONZJX5jk1ENIY
czcjlEaUxXiIxNoS+VAwPJ44wShsPxOyDMvcY3XaBNRCe/2EU1rbhiVMbEqpL9W4
GZJUrdFfd846oiRKQuOIu3COEMMBVZeJpDh4QorbWr+0Y8VmEqRHwEy/vvYASU2U
GMRYvN2/eK3r11Oqp/ZEHx3sOXZIIqaPA0IWqY+krgz0FjBVm34=
=1h67
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--

--===============0525755774424081950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0525755774424081950==--
