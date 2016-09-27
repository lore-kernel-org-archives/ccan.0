From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 06/13] configurator: Print test source without
 cat
Date: Tue, 27 Sep 2016 15:06:31 +1000
Message-ID: <20160927050631.GN30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <626f8d4f08934a2e69472f2b5eed34631aabfa5e.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0643386044307937169=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1qtczDrTC
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <626f8d4f08934a2e69472f2b5eed34631aabfa5e.1474600863.git.kevin@kevinlocke.name>
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


--===============0643386044307937169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0kRkyLZR5zsR9u2P"
Content-Disposition: inline


--0kRkyLZR5zsR9u2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:09PM -0600, Kevin Locke wrote:
> Windows does not provide cat.  Instead, copy the test source to stdout
> using the file stream to which it was written.
>=20
> Changes since v1:
> - Create fwrite_noeintr to avoid EINTR in fwrite without writing any
>   data.
> - Handle short reads from fread.  This can happen with non-conformant
>   libc or if EINTR occurs after reading some data.
> - Handle short writes from fwrite.  This can happen with non-conformant
>   libc or if EINTR occurs after writing some data.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

As with patch 2, I'm not sure about the need for fwrite_noeintr().

> ---
>  tools/configurator/configurator.c | 48 +++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 31e3d11..51d7ac8 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -438,6 +438,42 @@ static size_t fread_noeintr(void *ptr, size_t size, =
size_t nitems,
>  	return ret;
>  }
> =20
> +static size_t fwrite_noeintr(const void *ptr, size_t size, size_t nitems,
> +		FILE *stream)
> +{
> +	size_t ret;
> +
> +	do {
> +		errno =3D 0;
> +		ret =3D fwrite(ptr, size, nitems, stream);
> +	} while (ret =3D=3D 0 && errno =3D=3D EINTR);
> +
> +	return ret;
> +}
> +
> +static size_t fcopy(FILE *fsrc, FILE *fdst)
> +{
> +	char buffer[BUFSIZ];
> +	size_t copied =3D 0, rsize;
> +
> +	while ((rsize =3D fread_noeintr(buffer, 1, BUFSIZ, fsrc)) > 0) {
> +		size_t wsize, wtotal =3D 0;
> +
> +		while (wtotal < rsize &&
> +		       ((wsize =3D fwrite_noeintr(buffer + wtotal, 1,
> +						rsize - wtotal, fdst)) > 0)) {
> +			wtotal +=3D wsize;
> +		}
> +
> +		if (wtotal < rsize)
> +			break;
> +
> +		copied +=3D wtotal;
> +	}
> +
> +	return copied;
> +}
> +
>  static char *grab_stream(FILE *file)
>  {
>  	size_t max, ret, size =3D 0;
> @@ -562,7 +598,7 @@ static bool run_test(const char *cmd, struct test *te=
st)
>  		}
>  	}
> =20
> -	outf =3D fopen(INPUT_FILE, "w");
> +	outf =3D fopen(INPUT_FILE, verbose > 1 ? "w+" : "w");
>  	if (!outf)
>  		err(1, "creating %s", INPUT_FILE);
> =20
> @@ -593,11 +629,13 @@ static bool run_test(const char *cmd, struct test *=
test)
>  		abort();
> =20
>  	}
> -	fclose(outf);
> =20
> -	if (verbose > 1)
> -		if (system("cat " INPUT_FILE) =3D=3D -1)
> -			;
> +	if (verbose > 1) {
> +		fseek(outf, 0, SEEK_SET);
> +		fcopy(outf, stdout);
> +	}
> +
> +	fclose(outf);
> =20
>  	newcmd =3D strdup(cmd);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0kRkyLZR5zsR9u2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f5WAAoJEGw4ysog2bOSX3AP/j5WDCXCPRNryTZCDWJ79utT
+wNwn4sC9YuiYw/pDXyjj9ueit1P9ESPawIUAxfQAKwNYKJoON0FiVJIWKKBY0xN
4xxj/LWaWMqOPvIiw+N3WA1gvuXqrYCj2wnf9tqOnqwZ9Fjdn2mncDlTT2Jrvifq
LSj7UdF9d5anxfXx1oyVmC4di9FSm9k55GCdLaBUsEsHv9m7BMfUsagm3ERtKfFt
boQDa7HDOs4OlcBQO+8lVUx/rBBoCOkSr/KR2+tuDJvf5XcqXNDtsc8sWeDRhpGY
ODC0Jyw4+n9o55Hl/zH97aZjIxBdBNhDHDOkY7ia4K8rABe5RVlIckmz4hCdDAb9
XGeY5CSh3mgD4ooWXJPh+T0srNmwl+omXRS9CWlllSGnvqX47lbBPqo/G0iQiGXd
5thf5UaI2heU1jEjHDH5sTl7OcdwOiaDPBwMs30Fl0Frf7hXjh1m/h3PNgxFN62h
4FscrYa68RBfYOSXMWK1Snj9lznkfqefSLgm8DDb3dSv/0hU+7RRvUEWbTO3B/Aj
LCW/VXDe688+V5Nr/3falZuMeCfoiUj03u3nPG3XnPqYYbPg44m4vlI9AkIuPpFS
1LLReRv/wd06K2BY6CFT5cFTQBAPLIf/V4qMOJ7/4jcWiNvAViPNwPcJ7lXWwp3b
B+nzi7Zcgu9n9qkuNe3j
=9u94
-----END PGP SIGNATURE-----

--0kRkyLZR5zsR9u2P--

--===============0643386044307937169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0643386044307937169==--
