From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: bitmap doesn't work on 32bit x86/ARM
Date: Thu, 11 Jul 2019 12:08:34 +1000
Message-ID: <20190711020834.GE13271@umbus.fritz.box>
References: <CAN89EwbVxFhvYS1G3vG7WGSLBBw6AUQA0HJ0QHWsUhH=otPbzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0499408884534721508=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kgMC3b27zDqfG
 for <ccan@lists.ozlabs.org>; Thu, 11 Jul 2019 12:42:31 +1000 (AEST)
In-Reply-To: <CAN89EwbVxFhvYS1G3vG7WGSLBBw6AUQA0HJ0QHWsUhH=otPbzQ@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Peng Zheng <howtofly@gmail.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============0499408884534721508==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 02:04:11PM +0800, Peng Zheng wrote:
> There is already an issue for this:
> https://github.com/rustyrussell/ccan/issues/80
>=20
> Because of the inactivity of github issues, I re-post it here. If
> mailing-list is the preferred way of communication, next time I will use =
it
> rather that github.

THe mailing list is generally the preferred venue, though now the
github bug is there I've used it to track this specific issue.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0mmh8ACgkQbDjKyiDZ
s5K9Vw//SZOZREvU8SffLUF+D9PiKK4v7QL2VrelvsgY6izy1+l6LQYhGU3prBC9
VQdcYfReLlnunh3sVh22rvbP/mWae2G6e9g95w+uiJ4Uhhs3qrE7P4lHgIQ/lqF5
8qMuAxJ325lhcTmU16nfSxgxoQAhQnNPEbaS0TRKmWFZq1NJg6Pqc+O6VA4t6Rm1
rz5cDcbtyPckNF4TeNOVY77VC1PwIV4OJJLsVZt4gBvghcBtEuKHuBgMVfiAbC06
aiX+wIyWSgAyab17PShuGLAgNcyqUTPg+RoQKtews1WCqzid71aVzp7N0rbhDlPO
6IwFgdTAAl8iGWwq7FOJs2Ve6iB4lELWMxeD1DJm1a2/LslDOdoTvQ1/jpl1PXAO
DDZhqBmuT+u44hbiVpxogsaPs+7NWqqLlQoSoc+6CGLtEajttanvU9f7rGiCpGMl
CSTlcBwvU6LdKEqV+JxLJhjfuPppRuM/gw2PZkjIAgNbGqaHy5botdbscbMyllqe
uAftCO+ixll/ZUHwJsm1R+8QrIsb+CXQ6c+l2yv0urYvcSE5hebIGNc177nuoixw
klyLur2XNSKDiKGDt4sCyc7UEjL0wlFI6h36F2iLSdtLem8ZSy5pc+EpSkT6aoPm
+7/LAHjkt86T1nQKWg7AwwcNr6wOra5OMZKCq8UEz6RuM2FsLco=
=dH9Q
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--

--===============0499408884534721508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan

--===============0499408884534721508==--
