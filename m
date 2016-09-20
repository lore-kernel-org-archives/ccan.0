From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/9] configurator: Reimplement run using popen
Date: Tue, 20 Sep 2016 23:28:26 +1000
Message-ID: <20160920132826.GI20488@umbus>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <ecf5714e7fa8075e08d54911675aa0a55b95b014.1474239353.git.kevin@kevinlocke.name>
 <20160920050023.GL20488@umbus>
 <3c2cefdf-ea69-d3c4-dff6-bfdbbe63e8eb@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5397646614576884651=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdlL30Bw6zDsfk
 for <ccan@lists.ozlabs.org>; Wed, 21 Sep 2016 00:21:15 +1000 (AEST)
In-Reply-To: <3c2cefdf-ea69-d3c4-dff6-bfdbbe63e8eb@kevinlocke.name>
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


--===============5397646614576884651==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FYos7FMnk2wAe7eG"
Content-Disposition: inline


--FYos7FMnk2wAe7eG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 12:22:41AM -0600, Kevin Locke wrote:
> On 09/19/2016 11:00 PM, David Gibson wrote:
> > On Sun, Sep 18, 2016 at 06:51:59PM -0600, Kevin Locke wrote:
> >> Rather than using fork+pipe+system+waitpid, most of which are only
> >> available on POSIX-like systems, use popen which is also available on
> >> Windows (under the name _popen).
> >
> > Concept looks good, one little wart.
> >
> >> [...]
> >>
> >> -static char *grab_fd(int fd)
> >> +static char *grab_stream(FILE *file)
> >>  {
> >> -	int ret;
> >> -	size_t max, size =3D 0;
> >> +	size_t max, ret, size =3D 0;
> >>  	char *buffer;
> >>
> >> -	max =3D 16384;
> >> -	buffer =3D malloc(max+1);
> >> -	while ((ret =3D read(fd, buffer + size, max - size)) > 0) {
> >> +	max =3D BUFSIZ;
> >> +	buffer =3D malloc(max);
> >> +	while ((ret =3D fread(buffer+size, 1, max - size, file)) =3D=3D max =
- size) {
> >
> > This assumes that fread() will never return a short read except on EOF
> > or error.  I expect that will be true in practice for regular files,
> > but I'm not sure if it's a good idea to rely on it.
>=20
> Interesting.  I was under the impression that the fread couldn't short re=
ad.
> POSIX describes the return value as "the number of elements successfully
> read which is less than nitems only if a read error or end-of-file is
> encountered."[1]  Now that I think about it, I suppose EINTR could be an
> issue for non-glibc systems.  Is that what you had in mind, or are there
> other issues I'm overlooking?  (Also for fwrite in 6/9?)

Ah..so it does.  I'm afraid I just looked at the Linux man page, not
the POSIX requirements, and it didn't mention this constraint.

I guess it's ok then.  Although.. I do wonder a bit whether we can
trust all implementations to actually comply with this requirement.

>=20
> Kevin
>=20
> 1.  http://pubs.opengroup.org/onlinepubs/9699919799/functions/fread.html
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FYos7FMnk2wAe7eG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4Tl6AAoJEGw4ysog2bOS0RsP/R6hYit9sy5TvEV//Pi1TbYD
aLdu1iE1Zops2JZIuODzUCoeyYPaZY6DQYQShe4B50l9RIU+LTE7GBPCsl9JAUXN
AQV5Z2ZN4XppnGIKO0uPs8dt89WnFtP+FzU4brvFHpOT4wkG1VUn7XUhJMVTQd3b
3QP+BXI9+VAZo0dHEV8bpPoCzhSDHDXP9eNMM0Pg4R0q9cGFyDLYns+PfjPPggB8
6LoMM+E7w1gOqbsGO9+/V1L4gfm+r+ELHrKh6pPKtxfrNdK3jtrlIwk2htqwaGbS
WTEf9vP6b89UPx7I3WC/e+4sHjCPz8bwxRXkKFJbQiD/QkTyvEuZnksiMbCLlK0F
TWE27EgnP4LRpQiBUV6+s6zXdRYXCbotfi9SDXhCQx8QUjzAbWh7V2ZSES693zwb
8sGbt/utGK3kzEfEILEkvz4/24Pl467nb1wfEP6j8Fc+eegbaBsPlwp1wlISl9d0
GsBkRADkIAYcT+cL99/kzj4/JyiW7UicL1tusmSF1ccEPQgr1xMt2NIqEB+25EwW
ziKqIJEmd2Oi6GuPXQgTOOb4QQAuvI72f/W8TkfcstvnKxq9S47iHrfIp2FvK8M+
Fy+i8JHT86UYnBntmqLF+UzQeG8PXVIcFWZ/VH9lkVutFhquEaXecyuINxB3yXlf
VyZ8vm0jTSioS044k5Fa
=AHUk
-----END PGP SIGNATURE-----

--FYos7FMnk2wAe7eG--

--===============5397646614576884651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============5397646614576884651==--
