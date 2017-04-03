From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/7] .travis.yml: Add support for Coverity Scan
Date: Mon, 3 Apr 2017 22:14:54 +1000
Message-ID: <20170403121454.GA13614@umbus.fritz.box>
References: <20170403111112.27201-1-david@gibson.dropbear.id.au>
 <20170403111112.27201-2-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2500768681925814565=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxYCZ6VfTzDq7Z
 for <ccan@lists.ozlabs.org>; Mon,  3 Apr 2017 23:40:58 +1000 (AEST)
In-Reply-To: <20170403111112.27201-2-david@gibson.dropbear.id.au>
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
Cc: rusty@rustcorp/com.au
List-Id: ccan@lists.ozlabs.org


--===============2500768681925814565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 09:11:06PM +1000, David Gibson wrote:
> Add support for Travis to upload builds to Coverity Scan.
>=20
> Travis encrypted keys are there which should make it work for builds
> at either:
>     https://travis-ci.org/rustyrussell/ccan
> or
>     https://travis-ci.org/dgibson/ccan
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  .travis.yml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 9f9dbcb..fe3dffc 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -1,6 +1,23 @@
>  language: c
>  sudo: false
> =20
> +# Coverity Scan uploads
> +env:
> +  global:
> +  # COVERITY_SCAN_TOKEN (rustyrussell/ccan)
> +  - secure: "RU+r62MYrhaUcFOiXykFt0lpFzQVL6f5gyAKOv39PpYK10rsI/cM6N8wORe=
H1EmI7ktn7M+g3Fs2jA+i+bZW4rZSfm379hzduWisEo0vEWNwyWiIrl1WjgGptFDwOCzMQHwo+u=
4zH6E+CAOWnje5Zw+elokVTfC1orLbuQHABG4=3D"
> +  # COVERITY_SCAN_TOKEN (dgibson/ccan)
> +  - secure: "OL7OqYjQPE6rpHwujZbZt1gR5TNYn6Z0b1JxBaL1AG+iHlTbRrFGqec/VpY=
i2SAlqcDZK3x2lUzsF+hzx4pNBLFu8wvMtDKD4grlME5M+Bu3LT+YnmWSkaCw1/01n/SFyeRAkN=
DUJhnp0wS5oJ9sWx6trKWf9Xw9HpoKlwbFEGM=3D"
> +
> +addons:
> +  coverity_scan:
> +    project:
> +      name: CCAN
> +      #description: CCAN
> +    notification_email: ccan@lists.ozlabs.org

Oops, this email still needs an update though.

> +    build_command: make
> +    branch_pattern: coverity_scan
> +
>  matrix:
>    include:
>    - compiler: gcc

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY4jy4AAoJEGw4ysog2bOSfIMQAJ4PVLaDq6AdfoPwgrEe2K0D
HM27DF+wCKU7jClbXDRS8S2ka0n7cje4clqlNK1aPrvBEMWV18P1qeytwI0o4Gb5
njDSn5A46TiEXZ2PwC6XEcOC569Ue4ViYzmosjT7KDrC2R9qGv5R3r5afxN3VdvQ
QkAG2ZE3Af3pzfCc4B4JcfroyTVaJfy8MWruijbTksGYdiq43OxX1UVfA05PgCtc
AZpMfo+n58idUFFZ5yJsfoFmSo01Cd5oTTGhXG+pZOzvGtwFaEsAoQWvEzkpPKEo
g51wDhj+9ZXDd4eMq0QcQZFfXgvqV66WNfy7Dmw6DO4R5sEmCE1NtOKKHmYar+t+
c7hP28goqZZIOeA9A8aYp+GsTitkQFmjEccbM8wmRP63ekCARKnMiJdJMZvUd1+v
Oc3Xevzo+uzlaneNsecVXjNdKw3d32CR1ZGEay4qMS+aXm3QMEFUC5/eBhZETLAP
Yq/C1ltVVk/qoZP4/B3z269c4TIebQ9g+8Ha0jPp+7Nn6elvoliQRPfJdcJ8nXuT
FRYz7UeKXlKahfz+XmXGlzbyd18H9lCjp8TuAtWsgBBGdhANRTICzhAsVkii3rkX
tisRuQHVJJB6UB6Rc06k+BjLkcSCt8LLGalE33lVf38aZgKrSyqMnfrR0nf6fKl6
xkiPN5CMq/WcaBEVCtZI
=Bqt1
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============2500768681925814565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2500768681925814565==--
