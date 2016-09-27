From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 12/13] Makefile: Define CFLAGS_FORCE_C_SOURCE
 macro
Date: Tue, 27 Sep 2016 15:18:50 +1000
Message-ID: <20160927051850.GT30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <a0934c257f9a1fb5c99b89fd6cf01e7b450d0f10.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0484926549420331598=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1n68zDrTB
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <a0934c257f9a1fb5c99b89fd6cf01e7b450d0f10.1474600863.git.kevin@kevinlocke.name>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Kevin Locke <kevin@kevinlocke.name>, Paul 'Rusty' Russell <rusty@rustcorp.com.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============0484926549420331598==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0M7E0x35R+W+EAky"
Content-Disposition: inline


--0M7E0x35R+W+EAky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:15PM -0600, Kevin Locke wrote:
> This macro holds the C compiler flag(s) to force input files to be
> recognized as C sources regardless of extension.  It is defined to allow
> overriding on the make command line.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

So.. this approach works.

But I've been wondering for a while if the weird thing we do of having
the _info files not have a .c extension is a good idea.

I think the underscore enough is probably enough to mark those
special, so things might be less messy if we just called them _info.c.

Rusty, thoughts?

> ---
>  Makefile      | 2 +-
>  Makefile-ccan | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 127b875..37ff17d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -64,7 +64,7 @@ summary-fastcheck/%: tools/ccanlint/ccanlint $(OBJFILES)
>  	$(CCANLINT_FAST) -s ccan/$*
> =20
>  ccan/%/info: ccan/%/_info config.h
> -	$(CC) $(CCAN_CFLAGS) -I. -o $@ -x c $<
> +	$(CC) $(CCAN_CFLAGS) -I. -o $@ $(CFLAGS_FORCE_C_SOURCE) $<
> =20
>  all_info: $(MODS:%=3Dccan/%/info)
> =20
> diff --git a/Makefile-ccan b/Makefile-ccan
> index 5c8dea2..d4a5528 100644
> --- a/Makefile-ccan
> +++ b/Makefile-ccan
> @@ -5,6 +5,7 @@
>  #CCAN_CFLAGS=3D-g -O3 -Wall -Wstrict-prototypes -Wold-style-definition -=
Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-strings =
-Wundef -DCCAN_STR_DEBUG=3D1
>  CCAN_CFLAGS=3D-g3 -ggdb -Wall -Wstrict-prototypes -Wold-style-definition=
 -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wwrite-string=
s -Wundef -DCCAN_STR_DEBUG=3D1
>  CFLAGS =3D $(CCAN_CFLAGS) -I. $(DEPGEN)
> +CFLAGS_FORCE_C_SOURCE =3D -x c
> =20
>  MODS :=3D a_star \
>  	aga \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0M7E0x35R+W+EAky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6gE6AAoJEGw4ysog2bOSPJoP/iDUbA6heIMhJ1YkahOnsdQr
y2r0IgEEnZH/yqLMwYLkjAbwQCSDg8yxZcr9TkZBa/6vXzG8qZK1D/n2LX1Bswov
QML2UDR0ypXXV9NBmK9nqoMox79rbj4Ax70XkpEihTfcxu/Z+JQe2uHEHyog2Gx4
1czV+GQx4e7VHdZ/AQ7Owf2QN/QEn3WamZqpzHKK6TfDPScOpNI06r46QFVSx8Dj
c1/jmV0L/EfvlM6USzZ1N4Csq4mNJ3JvTAsFkrXqVfTkasyxAIfPFx5ZZ3h/PAWp
VkFucS8gIiAtHj7oQkvL9B4/Bd/ThhoHgyPsME8iWJ25VUMxO//Wm8cLrKkUVc7I
9RpLwf2r2/3AXc9BKYD3J3QOsqSASTwFdm3f/Dw45/uwsvo5Qkr5Rx7opXuHkQRB
k/UuHarqJFi8L0ICjJ6r0L5CMiKJjW3PBLYILWFNcVEzeRsqjIzrFbeivPjwwg58
ugNtMZRwgv1BKEeMEl7aR9REfLhu/owqRfVhZJEBii+3BtvF++aREBqndNeade1P
tYUdwcyKP4zqyMuSzjrnUp0K1mPFyKYZgQ0Mwhef0s7EHuM1PtWq6N1JwdaX3c7m
2rJqJIFwiyn7hpoKvoi6w8fkiJHVVKkKzvi/BEbXITofQENMWE+llScrRFkVWB5p
vE7oh40HHWHen6qXjYCl
=RVSn
-----END PGP SIGNATURE-----

--0M7E0x35R+W+EAky--

--===============0484926549420331598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0484926549420331598==--
