From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Annoying warning, a.k.a. how to add to CFLAGS
Date: Tue, 05 Sep 2017 11:15:14 +1000
Message-ID: <1504574114.28363.1.camel@aj.id.au>
References: <20170901032350.zoafocu3c5ifknq6@matica.foolinux.mooo.com>
 <87ingz7015.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8465397306215679931=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmTKm73yNzDrBS
 for <ccan@lists.ozlabs.org>; Tue,  5 Sep 2017 11:15:24 +1000 (AEST)
In-Reply-To: <87ingz7015.fsf@rustcorp.com.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Rusty Russell <rusty@rustcorp.com.au>, ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============8465397306215679931==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+toGRFTJfu2+8LjHvIlb"


--=-+toGRFTJfu2+8LjHvIlb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-04 at 10:27 +0930, Rusty Russell wrote:
> > Ian Zimmerman <itz@very.loosely.org> writes:
> > When I checkout current master, run ./tools/configurator/configurator >
> > config.h and then make, I get exactly 1 warning for the whole thing:
> >=20
> > ccan/strgrp/strgrp.c: In function =E2=80=98grp_for=E2=80=99:
> > ccan/strgrp/strgrp.c:296:0: warning: ignoring #pragma omp parallel [-Wu=
nknown-pragmas]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#pragma omp parallel for schedule(dynamic=
)
> >=20
> > I figured out that I can silence that by adding -fopenmp to my CFLAGS.
> > But how to do that permanently?=C2=A0=C2=A0I don't want to specify that=
 on the
> > command line every time, and I also don't want to set it in the
> > environment because sometimes I compile other things than ccan ;-)
>=20
> Hmm, well, if you're compiling strgrp, you should be adding CFLAGS
> from _info, which sets this correctly.
>=20
> In this case, we could just test defined(_OPENMP) instead of
> HAVE_OPENMP, though, which would automagically work.

Yeah, I was never really happy with what I did with HAVE_OPENMP, and I
don't recall why I did it. I'd be happy with a patch implementing
Rusty's suggestion of #if defined(_OPENMP).

Andrew
--=-+toGRFTJfu2+8LjHvIlb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZrfqiAAoJEJ0dnzgO5LT509YQAJIl4Nl/X8w7D823DfjmAh1E
KvTU63c4hiIZHrMjrZMInIyYkojxx/9zqbo+USqIUc0E/ph6BQqW12TJAlOOfabr
3gYs5N8roRhL516MwTTKkDhf8AYV8BfHLnQdZBXbGUmicyxENU7gWV60gIZuwpgr
WeQpDgO5Gh7LIr8IxARvyOkkQ4NEi2llsYuG2Ndbr7J3kYd4vQ+jZce8ptoqWfzZ
8uLqSrpPlq4mmSO7G3WgrR+Nmz8Dk5y12lU6IHrWk/QHNq8vyhfr7VayrbS0kBhx
/ABgpKLGh2N2C3AWxKCAhVhY0TF6i0N7hZQbPSpTLLVMKdEDIpSyU2KR19HPK750
6+SAYOs8inDzx5uC8cvpvqSSeQy2Ctqj/85LKYu107ka10DMVgE/yjDe1LyXCr60
kjGhtvf80PL+lU76C5bDk/lcaLYD0BoBmZfR6ORThSoowJVHxYLabjf8/Q8ZB69E
rYkU9Tl4IK5PhcU48I2EGCLSI1tyei1GSqpLLlo2haKSkk1khdGUSIhzgVFMKfhp
BPPykr0JsNxP9o/yPiHAWUnaNI8HKyvQprTMZy3Di4Sjplw32ZfBjznv3l8329OH
kQSucEYgO03FEgisQLQMUPbsb/JN8EPNzDsD+oKiFPFtIsswxQqbOAoL2kUCmQ/T
HvPb+uCxyqWXubpardXF
=Y2os
-----END PGP SIGNATURE-----

--=-+toGRFTJfu2+8LjHvIlb--


--===============8465397306215679931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============8465397306215679931==--
