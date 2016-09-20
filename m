From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 8/9] configurator: Pass output cflag to
 configurator
Date: Tue, 20 Sep 2016 15:23:59 +1000
Message-ID: <20160920052359.GR20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <39df3703e2b3c4be2524990f4a8ea10fa3a42b21.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2689235390099026702=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjm68GwzDsfm
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:32 +1000 (AEST)
In-Reply-To: <39df3703e2b3c4be2524990f4a8ea10fa3a42b21.1474239353.git.kevin@kevinlocke.name>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Kevin Locke <kevin@kevinlocke.name>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============2689235390099026702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v4cNTr+tRGSs1txX"
Content-Disposition: inline


--v4cNTr+tRGSs1txX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:52:05PM -0600, Kevin Locke wrote:
> Unfortunately, not all compilers support -o as a command-line option for
> specifying the output file.  Visual Studio cl.exe issues warning D9035
> when -o is given, which is detected as a compile warning by the
> configurator.
>=20
> To support such compilers, pass the output flag as the last flag to the
> configurator.
>=20
> This is a breaking change.  Existing scripts which pass flags to the
> compiler must be modified to add "-o" as the last flag.  As noted in the
> cover letter for this patch series, I'm open to considering alternatives
> if this is unacceptable.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

So, as it stands, this change completely breaks ccanlint on POSIX,
which is not ok.  Specifically it looks like the problem is that the
DEFAULT_FLAGS from the configurator make it into CCAN_CFLAGS in
config.h.  ccanlint then tries to add further options and its own -o
to the end of that, which isn't going to work.

In short, I think the problem is that ccanlint needs fixes to work
with MSVC (and possibly anything much else apart from gcc).  I think
we need to look at how to fix that and the configurator together with
each other.

Not having working ccanlint on Windows seems like a pretty big, since
its the main tool for testing ccan, amongst other things.

> ---
>  Makefile                          | 2 +-
>  tools/configurator/configurator.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 127b875..f36ccb5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -89,7 +89,7 @@ FORCE:
> =20
>  # Ensure we don't end up with empty file if configurator fails!
>  config.h: tools/configurator/configurator Makefile Makefile-ccan
> -	tools/configurator/configurator $(CC) $(CCAN_CFLAGS) > $@.tmp && mv $@.=
tmp $@
> +	tools/configurator/configurator $(CC) $(CCAN_CFLAGS) -o > $@.tmp && mv =
$@.tmp $@
> =20
>  include tools/Makefile
>  -include inter-depends
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 0c30aff..820ccf7 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -36,7 +36,7 @@
>  #endif
> =20
>  #define DEFAULT_COMPILER "cc"
> -#define DEFAULT_FLAGS "-g3 -ggdb -Wall -Wundef -Wmissing-prototypes -Wmi=
ssing-declarations -Wstrict-prototypes -Wold-style-definition"
> +#define DEFAULT_FLAGS "-g3 -ggdb -Wall -Wundef -Wmissing-prototypes -Wmi=
ssing-declarations -Wstrict-prototypes -Wold-style-definition -o"
> =20
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> @@ -672,7 +672,7 @@ int main(int argc, const char *argv[])
>  	if (argc > 1) {
>  		if (strcmp(argv[1], "--help") =3D=3D 0) {
>  			printf("Usage: configurator [-v] [<compiler> <flags>...]\n"
> -			       "  <compiler> <flags> will have \"-o <outfile> <infile.c>\" ap=
pended\n"
> +			       "  <compiler> <flags> will have \"<outfile> <infile.c>\" appen=
ded\n"
>  			       "Default: %s %s\n",
>  			       DEFAULT_COMPILER, DEFAULT_FLAGS);
>  			exit(0);
> @@ -691,7 +691,7 @@ int main(int argc, const char *argv[])
>  	if (argc =3D=3D 1)
>  		argv =3D default_args;
> =20
> -	cmd =3D connect_args(argv, " -o " OUTPUT_FILE " " INPUT_FILE);
> +	cmd =3D connect_args(argv, OUTPUT_FILE " " INPUT_FILE);
>  	for (i =3D 0; i < sizeof(tests)/sizeof(tests[0]); i++)
>  		run_test(cmd, &tests[i]);
>  	free(cmd);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--v4cNTr+tRGSs1txX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MfsAAoJEGw4ysog2bOSadwQANL8x6UI39I5NyH3ASddX5V0
RGTHXg+LGjBzJ+vC95K9O1w7YpATKRWS/6Ql0245OTGSpsocC5U7bqc8uenKYiCq
1ZX5Sz/MwndBlspnMBWSzBkRaaHs8wtK+W6bhEX/NFXgH2cevOqWGkAEi1YgiFA9
Fr9AE+xAkAkU6Q2kUUfEULuVAEQflca3waxPcJWE4+n9OcNaROrntBU+voKgyQL6
6q0s9xmrm/4O9wO0FUphnYtQq7Hz58SyPtRB9jyzJcVO7//GdBE7xorec6c2+eu4
aXzDQw02OBWi3yEyzF42I03Hg3PglyLywSRZGV0QwoKJtZNBqJe582bhnUw7SrFR
rVbVW/ydroDYyyEE5yXd+AC2SX346Tp8Hdgb2qHLnuH56Y8GS2P2JV4M53X/4b7F
nc4b2I+TvCJZhkUr+HsjF84cJ6VIv+U1vIp29GViZUeZHk7KQb3Q8IBTsLAMVods
EOuL7ZdbTeNF99k2kjfieBjSu++HjtR9mODhhaUK1GbArlhGi9oV/Yyq4bKbx1Dg
GFm4yjpXRjVr5GpQMeNe4oM2272i27W1ZhznD6JcwX87mji40zU+ICxccgLxV4vb
i5mu82/bekhdDkqlbyHdPZguKvxsIBLmjJPf/AynHs4WHdvzXUFLJhySliPsvxeZ
iIRgbWzLgel0WjenmPKJ
=zLIQ
-----END PGP SIGNATURE-----

--v4cNTr+tRGSs1txX--

--===============2689235390099026702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2689235390099026702==--
