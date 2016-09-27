From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] aga: trivial: fix description of aga_bfs
Date: Tue, 27 Sep 2016 11:31:00 +1000
Message-ID: <20160927013100.GA15376@umbus.fritz.box>
References: <1474925220-1172-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2447332643048007447=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjlzn4tswzDrSk
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 13:04:21 +1000 (AEST)
In-Reply-To: <1474925220-1172-1-git-send-email-cota@braap.org>
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


--===============2447332643048007447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 05:27:00PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied to master, thanks.

> ---
>  ccan/aga/aga.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ccan/aga/aga.h b/ccan/aga/aga.h
> index d09d4c7..e9bd1db 100644
> --- a/ccan/aga/aga.h
> +++ b/ccan/aga/aga.h
> @@ -347,7 +347,7 @@ struct aga_node *aga_bfs_explore(struct aga_graph *g,=
 struct aga_node *n);
>   *
>   * Performs a breadth first search.  The block following this macro is
>   * executed with @_n set first to @_start, then to each node reachable
> - * from @_start in depth first search order.
> + * from @_start in breadth-first search order.
>   *
>   * aga_bfs_start() must be called before this macro is used.
>   */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6cvRAAoJEGw4ysog2bOSiBEP/1FKs0c8Az0hBLNq+bvMHeAj
xOF0f4aOkkUVCoKrBdbCGzuOmVAI1NL7CeEzX0eszTufDair4GaxIaj6H6XsBZWP
Ik2h/+3bRtdLHL0sVE1fjBkHiEgMy2bphimRMmsn9PDrP4roD0wM9sBAGwIpZtJ7
4egMUU6kvoS9XluTSt3vzad15PXgdvESJ8sOLxjWYRnjnmqMwM9UK0ogplCLPdI8
E/JayQpg+BjV0TlBQykwi++6YLBtVTTz2suhamzFZLwaZG8PyEwk8cy2Vtuo+2de
sc9xgQLVPBk6imd/wjPacwCQqRnP+SOvl9wtv+kqBEaaEhbAjqkfJGWnDB3qEBdd
CVr2FunlP3szyZeDNCNt07gFJXYxTVy0Q9vtckMdvyAypE3HF/Ubt5PVmN5HuXNs
tHyAGhdJ9zbJfdY86hXGByOtDIs/VbP/jL727Z9JqK+UI9GohTJeoTRQ/73T2qKS
NGCdUbs8Rcp18XR6r6X4pK4pLqbpRSQfXbMMwv69ZUbHpUHCvfjFjsk+XiKTfH86
WN5chICX7QMlw58pNH7ZH9y6dciRlDH60QRp3HatgxCbLh1C9LZTPL1hYwv6PUfQ
3wudE4y+5XqX8wpR4QVp1e9hn+6b3Q9jfcELkD9e7oLtwM0EcJhmh9QweD1xGFeT
cTJGvc249RhJ7xg0/t56
=TKFK
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============2447332643048007447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============2447332643048007447==--
