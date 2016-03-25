From: Andrew Jeffery <andrew@aj.id.au>
Subject: Github mirror push rejected
Date: Sat, 26 Mar 2016 00:18:28 +1030
Message-ID: <1458913708.537.19.camel@aj.id.au>
Reply-To: andrew@aj.id.au
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0330813328782394905=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qWl513rK5zDq5k
 for <ccan@lists.ozlabs.org>; Sat, 26 Mar 2016 00:48:37 +1100 (AEDT)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: rusty <rusty@rustcorp.com.au>
Cc: ccan <ccan@lists.ozlabs.org>
List-Id: ccan@lists.ozlabs.org


--===============0330813328782394905==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3aqLc2XEcyeNvQ3lwdlR"


--=-3aqLc2XEcyeNvQ3lwdlR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Rusty,

I've just pushed some patches to the strgrp module to fix some
anomalies in the generated clusters, but I encountered the error below
in the process:

    $ git push ozlabs HEAD:master
    ...
    remote: + rm -rf /home/ccan/tmp/ccan-24657
    remote: + cd /home/ccan/ccan
    remote: + git push
    remote: To     git@github.com    :rustyrussell/ccan.git
    remote:=C2=A0=C2=A0! [rejected]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0master -> master (non-fast-forward)
    remote: error: failed to push some refs to     'git@github.com    :rust=
yrussell/ccan.git'
    remote: hint: Updates were rejected because the tip of your current bra=
nch is behind
    remote: hint: its remote counterpart. Integrate the remote changes (e.g=
.
    remote: hint: 'git pull ...') before pushing again.
    remote: hint: See the 'Note about fast-forwards' in 'git push --help' f=
or details.
    To     ccan@ozlabs.org    :ccan
    =C2=A0=C2=A0=C2=A0d23fb57..e8f7a97=C2=A0=C2=A0HEAD -> master

Seems the ozlabs.org repo had d23fb57c8e276090325162966b094ebf71e73e68
at the tip of master (before my push) whilst your github repo
has=C2=A0b75c31a84fd24e975f8cf409f35e5b3d08061f47. The merge-base was the
commit immediately prior in both
repos,=C2=A0bb88463014092a5550ea4c51a037e12e49446722. From the diff below i=
t
looks like an earlier revision made it into github before a reroll was
pushed to ozlabs.org?

Cheers,

Andrew

PS: The diff:

    $ git diff d23fb57c8e276090325162966b094ebf71e73e68=C2=A0b75c31a84fd24e=
975f8cf409f35e5b3d08061f47
    diff --git a/ccan/crypto/shachain/design.txt b/ccan/crypto/shachain/des=
ign.txt
    index b463976..8dc9743 100644
    --- a/ccan/crypto/shachain/design.txt
    +++ b/ccan/crypto/shachain/design.txt
    @@ -63,12 +63,9 @@ generate_from_seed(index):
    =C2=A0The Receiver's Tree
    =C2=A0-------------------
    =C2=A0
    -To derive the value for a index N, you need to have the root of a tree
    -which contains it.=C2=A0=C2=A0That is the same as needing an index I w=
hich is N
    -rounded down in binary: eg. if N is 0b001100001, you need 0b001100000,
    -0b001000000 or 0b000000000.
    -
    -Pseudocode:
    +You can derive a lesser index if it only involves setting bits
    +(ie. you can generate index 1 from index 0, but not the other way
    +around).=C2=A0=C2=A0Pseudocode:
    =C2=A0
    =C2=A0# Can we derive the value for to_index from from_index?
    =C2=A0can_derive(from_index, to_index):
    @@ -91,7 +88,7 @@ derive(from_index, to_index, from_value):
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return value
    =C2=A0
    =C2=A0If you are receiving values (in reverse order), you need to remem=
ber
    -up to 64 of them to derive all previous values.=C2=A0=C2=A0The simples=
t method
    +up to 63 of them to derive all previous values.=C2=A0=C2=A0The simples=
t method
    =C2=A0is to keep an array, indexed by the number of trailing zeroes in =
the
    =C2=A0received index:
    =C2=A0
    @@ -111,7 +108,7 @@ you can derive the value you want, eg:
    =C2=A0
    =C2=A0# Find an old value
    =C2=A0regenerate_value(index):
    -=C2=A0=C2=A0=C2=A0=C2=A0for i in known:
    +=C2=A0=C2=A0=C2=A0=C2=A0for i in remembered:
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if can_derive(i.i=
ndex, index):
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0return derive(i.index, i.value, index)
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fail

PPS: Seems I'm not without a failure as well - the commits I pushed are
missing the S-O-B line since I wrote them before I updated my git
aliases to add the flag in :/
--=-3aqLc2XEcyeNvQ3lwdlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW9UGsAAoJEJ0dnzgO5LT5urYQAK49t1Bgcc8wKKHSynuPxkO5
LALOffwwVN4k83FoyjOgabZ0lnzSPblfhI+EpvNwzU7dHw3b+1CMALZB/GCQbfuH
96pCYSFO2BhJrTZgA/hHTAuOPquvuvurPyE6YiUqpT4vfAJyXS0pF0o6PRQZAMoD
HDBS2cHVIE83Z6JB4uiZKZqNv+L+QZyOg4RQb6+Awzt7pAYTY3yoVtgvGmZLoD5E
CafLDS1zLO1uASaaEqow99if34np22ODp2OFBjHtbRgTDgj4EF5Oxo0Cr9qZ98Ey
289vvbVFz/ZqAAYrA0vUVmx56G8kUs4nRdevZwucospVd0FLafnWjZl9d2dYsZZE
FFQIP+HhOwzdIAdQNPojgE+fDIhqOCbALvqfts4voq3UTD2RWFwkCDRYVRk71IAc
3ld5zorKsw1DgwUYvqF1asFjbfs/WeM1waYzCkju/+07ETk8CJ04LqR5Z27Xkgxt
qaIl1A3JoyuOo+Zcnrlk0hCmcIai9rXSs1K3n+6iPrLhInCfcJfppnyP2Ma/qU/V
dqB+bNMug1h/dxK3Erh/4dw+57NZdItzAca3lP4JOfAqWhj7+Qm6EibI5yN3D74P
f+zZadrGDKdTxkBqUkyRDFiZkCip8OGk7tFVgOWV8+dMo3HTndqWObtCIELsNias
eTMYHJEA2mVRJMeWE/YG
=ja9T
-----END PGP SIGNATURE-----

--=-3aqLc2XEcyeNvQ3lwdlR--


--===============0330813328782394905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============0330813328782394905==--
