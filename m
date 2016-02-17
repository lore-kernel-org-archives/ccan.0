From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/4] altstack: Declare memory clobbers
Date: Wed, 17 Feb 2016 11:09:38 +1100
Message-ID: <20160217000938.GQ2269@voom.redhat.com>
References: <1455602965-3201-1-git-send-email-david@gibson.dropbear.id.au>
 <1455602965-3201-4-git-send-email-david@gibson.dropbear.id.au>
 <CACNkOJN+AH9oYc5XfwKVgYYhu3-3d7_rr6wCZkSSAhxG4vjWKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3717871870711612249=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 20FFA1A005A
 for <ccan@lists.ozlabs.org>; Wed, 17 Feb 2016 11:08:43 +1100 (AEDT)
In-Reply-To: <CACNkOJN+AH9oYc5XfwKVgYYhu3-3d7_rr6wCZkSSAhxG4vjWKw@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: Dan Good <dan@dancancode.com>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org


--===============3717871870711612249==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="25rOlkxR6a4U87uN"
Content-Disposition: inline


--25rOlkxR6a4U87uN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 05:29:39PM +0000, Dan Good wrote:
> Thank you for the fixes and improvements.  The clobber change is the only
> that gives me pause.  I think the volatile keyword on both is sufficient =
to
> prevent re-ordering.  Are you sure we need the memory clobber?
> Thanks.

I'm not 100% sure, but I'm fairly confident.  AFAICT the volatile
keyword stops the asm section being elided if the output arguments
aren't used, and it prevents it being moved outside a loop if the
compiler things the input arguments don't change.  It doesn't appear
to prevent other code, including memory accesses from being moved
around the asm.  In fact, from the gcc manual:

|  Note that the compiler can move even volatile 'asm' instructions
| relative to other code, including across jump instructions.  For
| example, on many targets there is a system register that controls the
| rounding mode of floating-point operations.  Setting it with a volatile
| 'asm', as in the following PowerPC example, does not work reliably.
|=20
|      asm volatile("mtfsf 255, %0" : : "f" (fpenv));
|      sum =3D x + y;
|=20
|  The compiler may move the addition back before the volatile 'asm'.  To
| make it work as expected, add an artificial dependency to the 'asm' by
| referencing a variable in the subsequent code, for example:
|=20
|      asm volatile ("mtfsf 255,%1" : "=3DX" (sum) : "f" (fpenv));
|      sum =3D x + y;

>  -Dan
>=20
> On Tue, Feb 16, 2016 at 5:04 AM David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > altstack includes a couple of inline asm blocks with x86 push and pop
> > instructions.  These instructions will access memory (the stack), but
> > that's not declared in inline asm statement.  We seem to be getting away
> > with it, but in theory that could allow the compiler to re-order access=
es
> > to local variables across the asm block.  Since those blocks change the
> > location of the stack, that could be very bad.
> >
> > Adding a "memory" clobber should prevent this (effectively making the a=
sm
> > blocks a compiler memory barrier).
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  ccan/altstack/altstack.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/ccan/altstack/altstack.c b/ccan/altstack/altstack.c
> > index 640344d..6351293 100644
> > --- a/ccan/altstack/altstack.c
> > +++ b/ccan/altstack/altstack.c
> > @@ -108,9 +108,10 @@ int altstack(rlim_t max, void *(*fn)(void *), void
> > *arg, void **out)
> >                         "mov %1, %%rsp\n\t"
> >                         "sub $8, %%rsp\n\t"
> >                         "push %%r10"
> > -                       : "=3Dr" (rsp_save_[0]) : "0" (m + max) : "r10"=
);
> > +                       : "=3Dr" (rsp_save_[0]) : "0" (m + max) : "r10",
> > "memory");
> >                 out_ =3D fn_(arg_);
> > -               asm volatile ("pop %rsp");
> > +               asm volatile ("pop %%rsp"
> > +                             : : : "memory");
> >                 ret =3D 0;
> >                 if (out) *out =3D out_;
> >         }
> >
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--25rOlkxR6a4U87uN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWw7pCAAoJEGw4ysog2bOSSTEP/R2yqhRMKaUN8k8URMrEfqkj
bTAr1HdsIU9ycqUwUZfXUXzr2dJhCd5P8gT3QV9u2mQWNysliNlqSL3yDt7Mrtn0
p+3QQM8FFa8vlRpvTCn4IaLPRHOaYXEqWKIdjCtvgiRUmj65CiYn3yUuEfT5rueE
5rpeCcgXF5GfddplUvn8ODCvIiEWkBGkIly/Oxes+gB5doAQyiBQKz6YvC47d0vD
6/YaoZ3EZZxfZ45XC+LxF1ivhJfjUx1YR6eqIkKvFKiWopEda+nPt5XWwPjiS1KQ
aXoN22Qcb5Dq6spm4CHMx+0eZyG1zHED4JVWtGIBFzU/IqtnqherI+fe2GWdpntg
Y2oRAFyQ1+nf5VAC9rngtCGYm04cOwM+/t77Sl8BuCi3Icl5ATb0HUIEWvmWwNR7
GsHrPrDRsqx9AYl8GrJCuhWb0rfitwOaZCZS2ulsil7mRRWJY1R1dqtYw9nCyTbB
wzi6hrLau3NwgqS1IqilWjJDur2MCh8jmaheQiZqww3QllCuonN9BbK/KrDNpfaq
Insv3roWYo8dWY94LF6XR3QiW3ULzK1x+M0UKvyXBOO1H5F9Ob4AHvp1dccr7UeD
WEASgYogkNb9pyKj0NdCwav6MRYV5JmSEvNnkEjWFEV7rvUUfSRTkSu1lfWdWcY+
vyG/8OKxyn1W1St86Xdf
=Nu5J
-----END PGP SIGNATURE-----

--25rOlkxR6a4U87uN--

--===============3717871870711612249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3717871870711612249==--
