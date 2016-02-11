From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: git error on push
Date: Thu, 11 Feb 2016 10:48:02 +1000
Message-ID: <20160211004802.GJ29288@voom.bne.redhat.com>
References: <CACNkOJNXT0Dg_jkkvVE9V-Fs_5kHg0REwfUe9EFGP_Qb=XRcVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3244524357129045585=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CA851A0019
 for <ccan@lists.ozlabs.org>; Thu, 11 Feb 2016 12:16:00 +1100 (AEDT)
In-Reply-To: <CACNkOJNXT0Dg_jkkvVE9V-Fs_5kHg0REwfUe9EFGP_Qb=XRcVQ@mail.gmail.com>
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
Cc: "ccan@lists.ozlabs.org" <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============3244524357129045585==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="utPK4TBebyzZxMrE"
Content-Disposition: inline


--utPK4TBebyzZxMrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 07:15:02PM +0000, Dan Good wrote:
> Hi, I'm trying to push the stack alignment patch to the repo, but no joy:
>=20
> 0$ git push origin masterCounting objects: 8, done.
> Compressing objects: 100% (7/7), done.
> Writing objects: 100% (8/8), 1.42 KiB | 0 bytes/s, done.
> Total 8 (delta 5), reused 0 (delta 0)
> remote: W NAME/ccan/altstack/altstack.c ccan dancancode DENIED by fallthru
> remote: error: hook declined to update refs/heads/master
> To ccan@ozlabs.org:ccan
> ! [remote rejected] master -> master (hook declined)
> error: failed to push some refs to 'ccan@ozlabs.org:ccan'
> 1$
>=20
> Is altstack on lockdown? Thanks. -Dan

Well, it's certainly not supposed to be.  I had a look at the gitolite
configuration and I'm not seeing anything obvious wrong:

        RW NAME/ccan/altstack   =3D dancancode

Have you double checked that you're using the same ssh key as the one
you sent to us?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--utPK4TBebyzZxMrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWu9pCAAoJEGw4ysog2bOSVyUP/3eN9OYkI/NDVSZmk5JsUAOo
t00P9fNvSE6dAIE3EX+p2b9XH8Psi0uWFS1HmvYVlHFt3niZwhkXHkVRjWFHFLon
Q2NTXf2es4FjPODbB/YvymLix0MmafYuAjRQdUDJw3ZvyhppmirUq3Vd4lVYlTBe
i7lkLkfOS/E7H28qqkXIZxHv6OsFiyLF7wDKzp1XkCe9T3jUgBcy8RUMQEdPTDRm
M55edtGHH8Mt9xj44ESuN3ExtqSBWgZOc9giaciABsIlf9cixhNGzIEaY8qKvWZ/
/b/P/rMarzNqiKW8xdDSnfuNLRTbnAW5i7C1KbN8ZjJNhhv0+GFASyvrBSoPKACj
Ic0aODS21GS1JFUJZGaSYbIdjmLbN7ExTvwdWUNwk60B1JCxqcZHTFFrSuasqiik
unOYIMDgfNdFkkZFb9rjujcxWFcYLfq2qCHSRgYV9es8Noq3m5+UdurxEpOVP/X+
VFt19tWBRCE9hy7YZBVDSo+IlRv+HqzVtoAn14emVqzMvuHJbwkTegeZh5b20ANc
V9+BOkBfyK1FUG83F17OmVKwl/EgtFSlcE0EK2MQjDjY7WeQVyJtyeIreTbPRZ22
R8lwNCE8gbWsnU0b+7Q+W3alyKfouepemZbntZNmS+YLoxHmR1ma6iTOOEqu7xTE
d5APxjLVYLM15HgJK65D
=rN/T
-----END PGP SIGNATURE-----

--utPK4TBebyzZxMrE--

--===============3244524357129045585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3244524357129045585==--
