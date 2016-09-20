From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/9] configurator: Use native directory separator
Date: Tue, 20 Sep 2016 15:04:29 +1000
Message-ID: <20160920050429.GN20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <6bacf5c820d4f52a16efd473681e10bacd6ba61f.1474239353.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8970118954423643006=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdWjm1PbszDsfj
 for <ccan@lists.ozlabs.org>; Tue, 20 Sep 2016 15:37:32 +1000 (AEST)
In-Reply-To: <6bacf5c820d4f52a16efd473681e10bacd6ba61f.1474239353.git.kevin@kevinlocke.name>
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


--===============8970118954423643006==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pjk796cY0SfIo9Z2"
Content-Disposition: inline


--Pjk796cY0SfIo9Z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 06:52:01PM -0600, Kevin Locke wrote:
> Although Windows APIs generally permit "/" or "\\" for directory
> separators in paths, cmd.exe does not recognize "./" when invoking
> executables using a relative path and prints the following error:
>=20
>     '.' is not recognized as an internal or external command,
>     operable program or batch file.
>=20
> Therefore, use "\\" when invoking tests on Windows.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

A bit ugly, but I think necessarily so to accomplish the goal.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tools/configurator/configurator.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index 9dcf307..e95fd70 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -41,6 +41,12 @@
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> =20
> +#ifdef _WIN32
> +#define DIR_SEP   "\\"
> +#else
> +#define DIR_SEP   "/"
> +#endif
> +
>  static const char *progname =3D "";
>  static int verbose;
> =20
> @@ -615,7 +621,7 @@ static bool run_test(const char *cmd, struct test *te=
st)
>  		free(output);
>  		/* We run INSIDE_MAIN tests for sanity checking. */
>  		if ((test->style & EXECUTE) || (test->style & INSIDE_MAIN)) {
> -			output =3D run("./" OUTPUT_FILE, &status);
> +			output =3D run("." DIR_SEP OUTPUT_FILE, &status);
>  			if (!(test->style & EXECUTE) && status !=3D 0)
>  				errx(1, "Test for %s failed with %i:\n%s",
>  				     test->name, status, output);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Pjk796cY0SfIo9Z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4MNcAAoJEGw4ysog2bOSM00P+QGtJZ0vRdHswpuSFXwga+fx
XVmCSw3b7lkSjlv8AetXtsvGoes1dlsNOL/m+s7XbGeVMGLtweFBZ3bPZJCfJbC+
HvZKCTMyDd+06dWFglbLXKX35X7+v1BBFgQdAy/u6l7aPTVzkxJT/oVE+4uQPEPK
osxQqcXz8TgHDeBUxZ2JMaQxmFpgGtHxXuckWzOssQsWyY6mzh/kxSwNR3U9nPWP
JI9DvMGD4TtSbTMnDGt60O5izhwE69GojtqjIaqeA3F/JaYbLfsy+b51WWewCVxM
ccVgjDLjAIKW0EBb+p9FkDAaX10Nn5Agff0Tyy7EJrZcox6VQiL3JMWbrcKGBOIP
EttR5g7l46LxmV4giJCPiPKGO20SIDJ5L+TEYxnuTuGhTGZp05sQddSqUQ7vqQ7J
1Km1TaJYcuCKswRSSrog9VHAdrTroiYKSE94M70GDXh0844g4ZjHsK/TBVHSoExJ
/tDP/7PeNKXAXJBK+mFXsVhPt5C0zWjPKKErn8gYDorXL8cKZp4MVlYPU6iOomAl
v5001In9ntQA4K9VE9uksgMaq2HSkddXv/wwlobFp9X6FOdllrWzil/D+iT3SyfG
+UqluEAJdi1upv9rlRTZgvFNPV2GEb1U/24W2bKU11c26fwtvQDmg7iDRLcvTOLz
+jDgvPCOCUPAmaVpqbRZ
=QMGH
-----END PGP SIGNATURE-----

--Pjk796cY0SfIo9Z2--

--===============8970118954423643006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8970118954423643006==--
