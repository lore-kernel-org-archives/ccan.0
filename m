From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] bitmap: Allow bitmap type to be forward declared
Date: Tue, 22 Oct 2019 16:25:20 +1100
Message-ID: <20191022052520.GI6439@umbus.fritz.box>
References: <20191021150903.25159-1-kirr@nexedi.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0390253835633810095=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y4Yn4LpxzDqHw
 for <ccan@lists.ozlabs.org>; Tue, 22 Oct 2019 18:16:29 +1100 (AEDT)
In-Reply-To: <20191021150903.25159-1-kirr@nexedi.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Kirill Smelkov <kirr@nexedi.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============0390253835633810095==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/GPgYEyhnw15BExa"
Content-Disposition: inline


--/GPgYEyhnw15BExa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 03:09:20PM +0000, Kirill Smelkov wrote:
> Currently bitmap type is defined via untagged struct which makes it
> impossible to forward declare it. Forward-declaring is useful since all
> bitmap functions only use bitmap* and in public user-visible
> headers/datastructures it is enough to indicate that a data field with
> bitmap pointer is there, whereas bitmap.h can be included only in
> implementation.
>=20
> Beside that some headers are included by both C and C++ parts of a
> project, and when ccan/bitmap.h is processed by C++ compiler it gives:
>=20
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h: In function =E2=80=98bitmap* bi=
tmap_alloc(long unsigned int)=E2=80=99:
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h:201:15: error: invalid conversio=
n from =E2=80=98void*=E2=80=99 to =E2=80=98bitmap*=E2=80=99 [-fpermissive]
>       return malloc(bitmap_sizeof(nbits));
>              ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h: In function =E2=80=98bitmap* bi=
tmap_realloc0(bitmap*, long unsigned int, long unsigned int)=E2=80=99:
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h:227:18: error: invalid conversio=
n from =E2=80=98void*=E2=80=99 to =E2=80=98bitmap*=E2=80=99 [-fpermissive]
>       bitmap =3D realloc(bitmap, bitmap_sizeof(nbits));
>                ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h: In function =E2=80=98bitmap* bi=
tmap_realloc1(bitmap*, long unsigned int, long unsigned int)=E2=80=99:
>     ./3rdparty/ccan/ccan/bitmap/bitmap.h:238:18: error: invalid conversio=
n from =E2=80=98void*=E2=80=99 to =E2=80=98bitmap*=E2=80=99 [-fpermissive]
>       bitmap =3D realloc(bitmap, bitmap_sizeof(nbits));
>=20
> -> Give to users ability not to force-include ccan/bitmap.h by
> forward-declaring bitmaps like this:
>=20
>     typedef struct bitmap bitmap;
>     ...
>     struct MyStruct {
>         bitmap *my_bitmap;
>     };
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Kirill Smelkov <kirr@nexedi.com>

Applied, thanks.

> ---
>  ccan/bitmap/bitmap.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ccan/bitmap/bitmap.h b/ccan/bitmap/bitmap.h
> index beeb1e95..54382801 100644
> --- a/ccan/bitmap/bitmap.h
> +++ b/ccan/bitmap/bitmap.h
> @@ -21,7 +21,7 @@ typedef unsigned long bitmap_word;
>  /*
>   * We wrap each word in a structure for type checking.
>   */
> -typedef struct {
> +typedef struct bitmap {
>  	bitmap_word w;
>  } bitmap;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/GPgYEyhnw15BExa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2ukr0ACgkQbDjKyiDZ
s5Im4Q/+POdREJMXDEOzuLcXL79rFRPjPoCTd/YVBRdTCS/A9eBUgFVdQTRkQ2og
bzdkrlkEU+gaux3QNF2JpLbCfanoYeYIkb3+ZanUGCCC5sDFV7m/vMgYWCpgGahZ
4CXm07NXorr1KsI/qftg1QRiqoQTsyqos3puwxJ13WLNUdRK77DG0qXOT3VzRN9p
tYPFyBl6ELk+7TTeHPbWo3m49W2SeodmchLPkgbT39881H2z+vkjH4BrIarRi7GN
fiqPBsY7nvELHkVhbXiTIEVAQvW5eyK9Vnha6KK/A0FAmg8wEVh9exOSsmsk22vA
20qNNKpN2ft1psqlhiDdyE+Qc4cw0Qsn8R5h+mbIn3dZ8JFNvpD8a3OTezm11sSc
cH9NeqBNnmKaudi+ox3Wx5h9QOsZxKWbzJ9RhIsu69O9Y54w+gEAL+Nxz2UMdNP0
PCeMAboEg5SduMhv3xvFbEWsU0jatbYVczn54Oj5VT8quRkTAOCQq0ZsphYMGzU5
S7ro1/eIyoTJNa1eka5jd9vX1X/I6up/ijC8Poi+SXGzEav8LOnv9EKSDaK2M4E/
HeozG9rCunTDoB0qdhsWZYW1DdapEb66HCTXJVwL95dIsgIm47FYuHzFKZ1oBMGe
69YT3GBot3lKroTm/f4VzdrFmbKQRpeST3rsuSc/Ek4ecwjJPHs=
=yySL
-----END PGP SIGNATURE-----

--/GPgYEyhnw15BExa--

--===============0390253835633810095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============0390253835633810095==--
