From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 13/13] Add appveyor.yml
Date: Tue, 27 Sep 2016 15:20:23 +1000
Message-ID: <20160927052023.GU30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <f8be9edfcd3a77c0ca43228179d3dbc214af868e.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1364980969204638602=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1hWZzDrT2
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <f8be9edfcd3a77c0ca43228179d3dbc214af868e.1474600863.git.kevin@kevinlocke.name>
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


--===============1364980969204638602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbZGpL0ScFxCd8mt"
Content-Disposition: inline


--kbZGpL0ScFxCd8mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:16PM -0600, Kevin Locke wrote:
> This file defines the AppVeyor CI (appveyor.com) settings.
>=20
> It builds using make+bash under MSYS2 so that the current build system
> can be used with minimal changes.  It currently only builds configurator
> and generates config.h.
>=20
> The build and test commands for more thorough testing are left as
> comments in appveyor.yml so interested parties can use them as a
> starting point for future work.
>=20
> Note that several compiler errors not related to configurator are
> printed due to make attempting to generate and include test-depends.
> Although Windows-specific code could be added to Makefile to avoid
> these, it seemed unwarranted if the compile errors may be fixed
> soon.

Nice, though I can't really test it until we've got the rest of the
Windows / MSVC fixes applied.

If possible it would be nice to have in the commit message, and maybe
as a comment in the yml file too, some instructions on how to view the
appveyor results - what page to go to, do you need a login etc.

>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---
>  appveyor.yml | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 appveyor.yml
>=20
> diff --git a/appveyor.yml b/appveyor.yml
> new file mode 100644
> index 0000000..822c4bd
> --- /dev/null
> +++ b/appveyor.yml
> @@ -0,0 +1,25 @@
> +version: 0.0.{build}
> +
> +platform:
> +- x86
> +- amd64
> +
> +build_script:
> +# Reset %PATH% to avoid msys/cygwin DLL conflicts which cause
> +# *** fatal error - cygheap base mismatch detected
> +- set PATH=3DC:\Windows\System32;C:\Windows;C:\Windows\System32\Wbem;C:\=
msys64\usr\bin
> +# Set environment variables for chosen compiler
> +- "\"C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\vcvarsal=
l.bat\" %Platform%"
> +# Ensure config.h can be generated.
> +# Note: Dash options avoid POSIX path conversion by msys
> +- "make config.h CC=3Dcl CCAN_CFLAGS=3D\"-nologo -Zi -FS -W4 -wd4200 -D_=
CRT_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS\" CFLAGS_FORCE_C_SOURCE=
=3D-TC OUTPUT_OPTION=3D-Fo:$@ DEPGEN=3D LD=3Dlink SHELL=3Dbash"
> +# FIXME:  Work in progress.  Disabled due to unfixed compile errors.
> +# FIXME:  -j%NUMBER_OF_PROCESSORS% won't work without DEPGEN for config.h
> +#         It may be possible to generate .d from cl using /showIncludes
> +#         See https://stackoverflow.com/q/37685069
> +#- "make tools CC=3Dcl CCAN_CFLAGS=3D\"-nologo -Zi -FS -W4 -wd4200 -D_CR=
T_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS\" CFLAGS_FORCE_C_SOURCE=3D-=
TC OUTPUT_OPTION=3D-Fo:$@ DEPGEN=3D LD=3Dlink SHELL=3Dbash"
> +#- "make -k CC=3Dcl CCAN_CFLAGS=3D\"-nologo -Zi -FS -W4 -wd4200 -D_CRT_N=
ONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS\" CFLAGS_FORCE_C_SOURCE=3D-TC =
OUTPUT_OPTION=3D-Fo:$@ DEPGEN=3D LD=3Dlink SHELL=3Dbash"
> +
> +test_script:
> +# FIXME:  Work in progress.  Disabled due to unfixed compile errors.
> +#- "make -k check CC=3Dcl CCAN_CFLAGS=3D\"-nologo -Zi -FS -W4 -wd4200 -D=
_CRT_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS\" CFLAGS_FORCE_C_SOURCE=
=3D-TC OUTPUT_OPTION=3D-Fo:$@ DEPGEN=3D LD=3Dlink SHELL=3Dbash"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kbZGpL0ScFxCd8mt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6gGXAAoJEGw4ysog2bOSMw4P/j1Vs2oSUxyr26EvI+jroqA3
zATS8SxKzFjWWVNDGF1hT0G+FVDZ0R9BNwILwuEQlM9905emdeH78z01wHKakDxO
jWay0wbA9V7m5StVwsk9dJzohaw6hOjOOc2POlYgfOxXT+uDQd6fhB6/fW87L6g/
UHuXRf2txQMPjC4Y3ScPLRk2iPnh/BUK/7PIsgJggymm4ZbH9N/8q+Iv26qozHco
QW9yZwV47Hr0Xgttwt9caYx+EIeF61VMBHzNg8ZWEB1D6IcN7IhX0y0znmzfUFu9
q1JLgKd7i8lB9PBZzu3xckBDmIlQsnMEBrNv97hzpe9bVxxrIZh2yVvWJ4v/1sRx
ayPCoQXXRZFNcn6Ym9CP7x1ByQ0G+CdQH3swn6kKv/eHTBNgVe5/lOA/R1WVBrjw
A5QQvXXk4A8k/COiTybbAPe9SEzZZCJzF5AnIX9QlphbRfAV1UyrX+oiD6UFenou
NPb/7fuUsH9bfdLOHVMbyMF5FBXKmKtRK5WpUBHXtbP/8uaTTdnz2hmQ5Pwzv5bJ
rVuuBAFWrlfrIXn8fOr+cD27d1ncFPu6PjAbqCYwwXllb/h60HbPnWFc59OBlo0w
nNZ2zSBxrPKVQLCTu4M7wviiFHQ5UJ2ePu5kGgcUOGpOV/s65VX5FXsndB+H8zZ3
ll9nToatyOd27ZR4cjpC
=7wUd
-----END PGP SIGNATURE-----

--kbZGpL0ScFxCd8mt--

--===============1364980969204638602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1364980969204638602==--
