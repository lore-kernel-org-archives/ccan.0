From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] permutation: Generate permutations of arrays
Date: Tue, 29 Sep 2015 01:01:14 +1000
Message-ID: <20150928150114.GP11620@voom.redhat.com>
References: <1443269503-21685-1-git-send-email-david@gibson.dropbear.id.au>
 <87lhbspcqi.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6990501304051954167=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5C6511A01E3
 for <ccan@lists.ozlabs.org>; Tue, 29 Sep 2015 01:57:27 +1000 (AEST)
In-Reply-To: <87lhbspcqi.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============6990501304051954167==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JF+ytOk7PH04NsRm"
Content-Disposition: inline


--JF+ytOk7PH04NsRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2015 at 04:31:25PM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > + * Example:
> > + *	#include <stdio.h>
> > + *	#include <ccan/permutation/permutation.h>
> > + *
> > + *	int main(int argc, char *argv[])
> > + *	{
> > + *		int i;
> > + *		struct permutation *pi =3D permutation_new(argc - 1);
> > + *
> > + *		do {
> > + *			for (i =3D 1; i <=3D argc; i++)
> > + *				printf("%s ", argv[i]);
> > + *			printf("\n");
> > + *		} while (permutation_change_array(pi,
> > + *		         &argv[1], sizeof(argv[1])));
> > + *		exit(0);
> > + *	}
>=20
> That is a masterful example.  It's not quite right though: (i < argc,
> not i <=3D argc).
>=20
> I tried adding:
>=20
>  *     // Given 1 2 3 outputs 1 2 3 1 3 2 3 1 2 3 2 1 2 3 1 2 1 3
>=20
> But ccanlint isn't clever enough to ignore the \n.
>=20
> Let me fix that now...

Fixed those nits and a couple of others, and committed.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JF+ytOk7PH04NsRm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCVY6AAoJEGw4ysog2bOSuGcP/33RsXZp0730dFqxrA/6iVFS
1akQkzaQd59eutgls+jPCa8EG+1revsiXpxja5DOYrxoL500MsuhajjdW4SK/GT0
ocKnK4yGyVYlzB550NRO4miiRIDkP9WTPsDP7YlMUvmvA0vRn1XS/KTGXae3JLR8
Xd398yIAN7IZ7dg4CMDLqENDLFtGcbNB78PDVobDgarUbXXSmvjc3y0pYJCJ2VlI
Bbp+KMu9AkVHIrO6fR9e5XsO/zkp3E3Wbz7GGzg26wZNF4jabUr8RcpnroK3PKVU
kjXQ+UtbwkO3xzj/ej6UR8e3AyClh9JyOQsxz2FtVHkdpObQ2XcyZiXOr0KwsZYr
20oFqiKCi/TCtM0Qw0dCqiogHWkLP+7WDfXnppT7uJ1zxu9aj6WyeSJIePxB+TB7
JohZD5v6F0+sMprv/vCBjEEf4u/GYGAHD/0rgOM1Bc/07j2upARWKLvDZ1lgW0nx
bZI7MszdpLsgJxG7Q6eE5tgUcD2SEyo3KKldNSomcZCZjCfQf17vYbG2o9aUXdhP
wG2SKNBL9k6tJQZbHJnzo9mvvEkTMofoKOa1bUZeh20GN8I1tj22VxE25DR9rglM
yZoHh7eOHS7q37UZiLwD0k7sQaqVuR/eo9wdfTFO64kvXDjPMh0VUgoWDWhsBeLS
psCM+lfP/QWA5lHgV7rB
=04FB
-----END PGP SIGNATURE-----

--JF+ytOk7PH04NsRm--

--===============6990501304051954167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============6990501304051954167==--
