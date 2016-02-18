From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/4] altstack: Declare memory clobbers
Date: Thu, 18 Feb 2016 16:49:30 +1100
Message-ID: <20160218054930.GJ15224@voom.fritz.box>
References: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
 <1455602965-3201-4-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJN+AH9oYc5XfwKVgYYhu3-3d7_rr6wCZkSSAhxG4vjWKw@mail.gmail.com>
 <20160217000938.GQ2269@voom.redhat.com>
 <CACNkOJPwRNWyUw+mv=RR+9hShPfUaCu3EGbNTeOhGRmmc6zA-w@mail.gmail.com>
 <20160218030914.GF15224@voom.fritz.box>
 <CACNkOJMsLzcKVuhWwNYKw-LQJhjJT4kYCFLfbYUsYW911WVu1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5078773307914890928=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D1BD11A046D
 for <ccan@lists.ozlabs.org>; Thu, 18 Feb 2016 16:56:15 +1100 (AEDT)
In-Reply-To: <CACNkOJMsLzcKVuhWwNYKw-LQJhjJT4kYCFLfbYUsYW911WVu1w@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@gooddan.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============5078773307914890928==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Re2uCLPLNzqOLVJA"
Content-Disposition: inline


--Re2uCLPLNzqOLVJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 04:45:36AM +0000, Dan Good wrote:
> Would you, please?  Thank you.

Done.

>=20
> On Wed, Feb 17, 2016 at 10:11 PM David Gibson <david@gibson.dropbear.id.a=
u>
> wrote:
>=20
> > On Wed, Feb 17, 2016 at 07:06:09AM +0000, Dan Good wrote:
> > > Looking at the objdump before and after, the clobber changes seem to =
add
> > a
> > > single mov instruction (9 additional bytes plus subsequent address
> > > offsets).  That seems a very low price to pay for the additional
> > > assurances.  -Dan
> >
> > I would tend to agree.
> >
> > Do you want to apply these patches, or will I?
> >
> > >
> > > On Tue, Feb 16, 2016 at 7:08 PM David Gibson <
> > david@gibson.dropbear.id.au>
> > > wrote:
> > >
> > > > On Tue, Feb 16, 2016 at 05:29:39PM +0000, Dan Good wrote:
> > > > > Thank you for the fixes and improvements.  The clobber change is =
the
> > only
> > > > > that gives me pause.  I think the volatile keyword on both is
> > sufficient
> > > > to
> > > > > prevent re-ordering.  Are you sure we need the memory clobber?
> > > > > Thanks.
> > > >
> > > > I'm not 100% sure, but I'm fairly confident.  AFAICT the volatile
> > > > keyword stops the asm section being elided if the output arguments
> > > > aren't used, and it prevents it being moved outside a loop if the
> > > > compiler things the input arguments don't change.  It doesn't appear
> > > > to prevent other code, including memory accesses from being moved
> > > > around the asm.  In fact, from the gcc manual:
> > > >
> > > > |  Note that the compiler can move even volatile 'asm' instructions
> > > > | relative to other code, including across jump instructions.  For
> > > > | example, on many targets there is a system register that controls=
 the
> > > > | rounding mode of floating-point operations.  Setting it with a
> > volatile
> > > > | 'asm', as in the following PowerPC example, does not work reliabl=
y.
> > > > |
> > > > |      asm volatile("mtfsf 255, %0" : : "f" (fpenv));
> > > > |      sum =3D x + y;
> > > > |
> > > > |  The compiler may move the addition back before the volatile 'asm=
'.
> > To
> > > > | make it work as expected, add an artificial dependency to the 'as=
m'
> > by
> > > > | referencing a variable in the subsequent code, for example:
> > > > |
> > > > |      asm volatile ("mtfsf 255,%1" : "=3DX" (sum) : "f" (fpenv));
> > > > |      sum =3D x + y;
> > > >
> > > > >  -Dan
> > > > >
> > > > > On Tue, Feb 16, 2016 at 5:04 AM David Gibson <
> > > > david@gibson.dropbear.id.au>
> > > > > wrote:
> > > > >
> > > > > > altstack includes a couple of inline asm blocks with x86 push a=
nd
> > pop
> > > > > > instructions.  These instructions will access memory (the stack=
),
> > but
> > > > > > that's not declared in inline asm statement.  We seem to be get=
ting
> > > > away
> > > > > > with it, but in theory that could allow the compiler to re-order
> > > > accesses
> > > > > > to local variables across the asm block.  Since those blocks
> > change the
> > > > > > location of the stack, that could be very bad.
> > > > > >
> > > > > > Adding a "memory" clobber should prevent this (effectively maki=
ng
> > the
> > > > asm
> > > > > > blocks a compiler memory barrier).
> > > > > >
> > > > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > > > ---
> > > > > >  ccan/altstack/altstack.c | 5 +++--
> > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> > > > > > index 640344d..6351293 100644
> > > > > > --- a/ccan/altstack/altstack.c
> > > > > > +++ b/ccan/altstack/altstack.c
> > > > > > @@ -108,9 +108,10 @@ int altstack(rlim_t max, void *(*fn)(void =
*),
> > void
> > > > > > *arg, void **out)
> > > > > >                         "mov %1, %%rsp\n\t"
> > > > > >                         "sub $8, %%rsp\n\t"
> > > > > >                         "push %%r10"
> > > > > > -                       : "=3Dr" (rsp_save_[0]) : "0" (m + max)=
 :
> > "r10");
> > > > > > +                       : "=3Dr" (rsp_save_[0]) : "0" (m + max)=
 :
> > "r10",
> > > > > > "memory");
> > > > > >                 out_ =3D fn_(arg_);
> > > > > > -               asm volatile ("pop %rsp");
> > > > > > +               asm volatile ("pop %%rsp"
> > > > > > +                             : : : "memory");
> > > > > >                 ret =3D 0;
> > > > > >                 if (out) *out =3D out_;
> > > > > >         }
> > > > > >
> > > > > >
> > > >
> > > >
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Re2uCLPLNzqOLVJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWxVtqAAoJEGw4ysog2bOSrhgQANadVgB7+DAkD2KKzb0BujSN
fN+LpUSuDKEtShlvhmg6xBtn6mR2iKJf/v1eQ9dcWBQgsP56tfqb0H5U0GUR0Acy
pOpHuW0bXyKubYlU0KVExll3axYC4qLJy3JbG0SnCloL5rR5v1bku24vs63UOzuk
Hzv/lGzNI5WB5QZJPf82+A46ksgsvng2AWJ2kz0sDkVBi0HRT7APBKLsSCa889MB
LBg5Crr7EwnRKX3CiB490O+9qjgCIHtDn1HjnF35qfXyVxVBttWgvrC8XTYjyLDJ
pjALU4iP9fNLOGXwp4FNkTbUvLfS3MkF4yenQOQZONMAvVsrOaK5NLWlB5wHGnZF
LHYg0/RRSX3QvZvRn+7h/JG5v39ySH7zfm5b+prE8nLaaQtlh3Gywa5inr/9psON
xFu83CqXrish5l/+nKqkM6IPduD5SDYSZazmWcvv0yrsZCROoLz9R8pRqCfXlXKp
EomIHSIxLczofenN05oy2ZGOhSjYTH5C9vZ1J0AnnP9u4IPDj8Rj6qlcmY+jaYKr
80l5OZM3I7LdoOsWlnmHqxv9me/OVKT95wifCAOGW6aaWyy3DHjXPN1ExCH0vN/v
u3eDiurIR89jM0XvseFSV/N8DZ2p5KCO2IIkKkCp2e/si3c4Spyh/BkSllgeveN6
NzBwZ9LPG6hStfAVAz+E
=aNVs
-----END PGP SIGNATURE-----

--Re2uCLPLNzqOLVJA--

--===============5078773307914890928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5078773307914890928==--
