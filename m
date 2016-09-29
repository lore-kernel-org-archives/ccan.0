From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] list: trivial: fix typos in list_for_each_off's
 documentation
Date: Fri, 30 Sep 2016 09:42:54 +1000
Message-ID: <20160929234254.GM30519@umbus.fritz.box>
References: <1475186053-6436-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5298951805390295489=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slXc23j3bzDrYB
 for <ccan@lists.ozlabs.org>; Fri, 30 Sep 2016 10:38:26 +1000 (AEST)
In-Reply-To: <1475186053-6436-1-git-send-email-cota@braap.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============5298951805390295489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7vLGWvOrvbSM0Ba8"
Content-Disposition: inline


--7vLGWvOrvbSM0Ba8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 05:54:13PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied to master, thanks.

> ---
>  ccan/list/list.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/ccan/list/list.h b/ccan/list/list.h
> index a4c21f1..a6b0038 100644
> --- a/ccan/list/list.h
> +++ b/ccan/list/list.h
> @@ -716,12 +716,12 @@ static inline void list_prepend_list_(struct list_h=
ead *to,
>   * so you can break and continue as normal.
>   *
>   * WARNING! Being the low-level macro that it is, this wrapper doesn't k=
now
> - * nor care about the type of @i. The only assumtion made is that @i poi=
nts
> + * nor care about the type of @i. The only assumption made is that @i po=
ints
>   * to a chunk of memory that at some @offset, relative to @i, contains a
> - * properly filled `struct node_list' which in turn contains pointers to
> - * memory chunks and it's turtles all the way down. Whith all that in mi=
nd
> + * properly filled `struct list_node' which in turn contains pointers to
> + * memory chunks and it's turtles all the way down. With all that in mind
>   * remember that given the wrong pointer/offset couple this macro will
> - * happilly churn all you memory untill SEGFAULT stops it, in other words
> + * happily churn all you memory until SEGFAULT stops it, in other words
>   * caveat emptor.
>   *
>   * It is worth mentioning that one of legitimate use-cases for that wrap=
per

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7vLGWvOrvbSM0Ba8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7ab+AAoJEGw4ysog2bOSZMMP/Rfa3XNJWY7pJM7WykhZnbD9
qDIvmKOgkJ/mEkFG0ROrlOKft/CsKzaeOvAVvmDmlWxl2vbHgAylH+lbi8bzcqIs
xq0LaU/7KcWd8kbr+X9N2Lhd4ZKHlGNJRF8/qhbmy0o9LUjYGlZRgAC9nDhPHKn6
cQKK7wnDGqKl6exFygNK/c5inhJL/dqu2RH0T3AYvXBVXJSoKk9fUJuMnYcQEOxY
4/EnY8nZN5UIZgFFOvlAs1MOFiwb0IWALMsBx4LXTKx/ZCiEeG+t8iHGhRRTTn6a
ulZkILa5AImLXkUSdn2MKR0xQk9P/c/qcRX3adv5HdB1GOElQtInfA3OmiKz2IHE
7e5niV2QLyxv5hIVbSU96BoPlC496YdnAsv8AhWhm+UkyAmDT+XsfMWsylwpCF5E
xMOThlrxnzJmeReeMTnngE2j8pm+cK4zNyu36tGOYaX6WV80hjEf7vpqUNkCqudu
ETC9JLIzjGXZujsNmtJkv0sENm02aRr2tDlGe1kYb7r31262eYoFLqaKjN60QHF8
EQnjmd8VS2nt4SfHLiuFExRvg9a4BYflQ2M70wRbfaIWbD39CiKWaeC9s4OG/pve
TGiLbFJPdLUp63Mh9qAWtMZ2v5iC8Qtnbn7jEz1tk4rFHQMK3xT8kI7dHIVyraOz
WDd8/WZBZfFToZ5B/4GV
=uxc3
-----END PGP SIGNATURE-----

--7vLGWvOrvbSM0Ba8--

--===============5298951805390295489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5298951805390295489==--
