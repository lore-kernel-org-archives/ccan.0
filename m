From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/4] Correctly include dependencies for nested
 modules
Date: Mon, 2 May 2016 13:33:42 +0400
Message-ID: <20160502093342.GA2313@littlecatz>
References: <1462003309-22541-1-git-send-email-david@gibson.dropbear.id.au>
 <1462003309-22541-5-git-send-email-david@gibson.dropbear.id.au>
 <87fuu25qy9.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846439748332624959=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qyzf93gKGzDqCj
 for <ccan@lists.ozlabs.org>; Mon,  2 May 2016 19:34:25 +1000 (AEST)
In-Reply-To: <87fuu25qy9.fsf@rustcorp.com.au>
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
Cc: ccan@lists.ozlabs.org, rusty@rustcoorp.com.au
List-Id: ccan@lists.ozlabs.org


--===============1846439748332624959==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 01, 2016 at 02:12:54PM +0930, Paul 'Rusty' Russell wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > Currently we pull auto-generated dependencies into the Makefile with
> > include ccan/*/*.d.  That will omit any .d files from nested modules,
> > meaning things might not be correctly rebuilt there.
> >
> > Correct this by using the list of modules instead of a 1-level wildcard.
>=20
> Thanks, these look great, please apply.

Done.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXJx72AAoJEGw4ysog2bOSsZgQALbdGp4j+VLm2OLQtSdTj24O
widNdtYOPBBcuvNpTbx3FoertMlw7xAoGFkWB37HSkLhpJ6VMJWRA6QLu9zdYZ8t
rAg3Rw76u8WyuWQUTKevfA+TF7hGQpsYhTBzpYAXEtvOSEXnh6eLTI56AI77YGGU
96kUXAN4IlvbgHmGTa0LdWNv+QE4XnvIczhYhEjIvJYL+/WoFmuTEUVscwF76YJj
HCAsU0EssfvQmcWmVHh+VQW3Zk0IAcs472+LWC34fjTB8QKzx+p57QwAHQyayaa3
pBGHmN6n5ukj9fJ/q2PJ+O9uYXXjlJ9x+fdhRusQCUJc/LEPkeaHKPZBy1OzBijr
59oPDrid6B5ldEoI2ET4fgk9gayZzpYCt+HhOTLl5fF8R+vdGMIi/XRyPKE0GP0b
nSiZbZGaoQ6X1o9LzrgduE2r9+aA9W1SsYgQseikWRoXjwK5PPduvrnsxBiIkiYg
1Y/JLKmiHemGMGIVtj4J179TQC7kmBNXiGgBgtpZ3j5oOkbk4fYFJFWOnJO/3uYk
PywDHflO/Xr6Q7bW0SPBLzwZcnyut9MrtdfWaER0ydaSPRfalA/vRZqFB9RuYM72
GPlV5sQbGI2h0LHhs7VG7Cgst2a/Ei6hWl552DrKVwJuFfUTQRtoGtcVWah21VvA
KTD3yfI61rUITr8hFwaq
=N8rL
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============1846439748332624959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1846439748332624959==--
