From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 11/13] configurator: Return pointer difference
 as ptrdiff_t
Date: Tue, 27 Sep 2016 15:10:39 +1000
Message-ID: <20160927051039.GQ30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <054fcecdae96c41af557f6e7e2981074a69317a9.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8068762987651812121=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1hfLzDrT9
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <054fcecdae96c41af557f6e7e2981074a69317a9.1474600863.git.kevin@kevinlocke.name>
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


--===============8068762987651812121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1MCZUn4MZNv/LeVo"
Content-Disposition: inline


--1MCZUn4MZNv/LeVo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:14PM -0600, Kevin Locke wrote:
> On LLP64 systems (like 64-bit Windows) long is 32 bits while pointers
> are 64 bits, which results in a warning similar to the following:
>=20
> warning C4244: 'return': conversion from '__int64' to 'long', possible lo=
ss of data
>=20
> for HAVE_STACK_GROWS_UPWARDS.  Fix this by using the ptrdiff_t type
> introduced by C99 for this purpose.
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Applying.

> ---
>  tools/configurator/configurator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index a43061b..2acb0b2 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -298,7 +298,8 @@ static struct test tests[] =3D {
>  	  "	return __stop_mysec - __start_mysec;\n"
>  	  "}\n" },
>  	{ "HAVE_STACK_GROWS_UPWARDS", DEFINES_EVERYTHING|EXECUTE, NULL, NULL,
> -	  "static long nest(const void *base, unsigned int i)\n"
> +	  "#include <stddef.h>\n"
> +	  "static ptrdiff_t nest(const void *base, unsigned int i)\n"
>  	  "{\n"
>  	  "	if (i =3D=3D 0)\n"
>  	  "		return (const char *)&i - (const char *)base;\n"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1MCZUn4MZNv/LeVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6f9OAAoJEGw4ysog2bOSyB8QAL14C6+d4siBqgbEvDthrec0
cbXkDWiUaK+r/R1sTUd/InOABUGud5OfJK7d3OJ2D/YIQueE5eWvTN/Oc2kbpd1+
SKsQ1iJS6gNXf605jNeVaxTDn+MdtXgGuIpYd8Y0dobW1RNd0bk/H13o0GvbkCeQ
WpHZQwlI8Emy/81RRY6DnzQJ1LQBtQ874QfC6srsWCYBi6MQZITu8VdkuHHAA89a
L4lqlfNtpzBVtdRA4zQJnZAXXKIxKTyK91EJQKQ3xDyyNw59H8DC9cVhlJ0nXOnu
7ukFD83EvseNw4ecyAaFxdrrf4Sg9NoDEIoEKTG9nBc0iJgadHlaqivPRXIiViRw
Jf2HpnMd8QkyNSbIg3Ex0qjcdjfPxDxuzwIyM9QODP9pEpMrEZgZsdNcsByWOfT4
rXwT55TOv6VlxsvWykxukbC83A8dwce78Akxz7BKpUElsGapJq7bZRVekIcHio90
QPjwzt+IZFL7+i/5QRtFq3CRdMYld9ScAvgCvgdwgXgDT59GwPqaJadAazpXRofB
Id1rE4qO173w7D2Sa9BhW5RW1iwWCdRsL0Cnj7KE+dOu7iaTdbkyoXJGH2Qp4w1O
gZyvbVdgdj4D8203mbX6tMQ43v4MlX/wy3l3gqvYWweCxH77rXF8TOn8dlxNBh1J
/M0FNvnnHRhSmH79MtXB
=PHKR
-----END PGP SIGNATURE-----

--1MCZUn4MZNv/LeVo--

--===============8068762987651812121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8068762987651812121==--
