From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 08/13] configurator: Add output cflag option
 and macro
Date: Tue, 27 Sep 2016 15:17:00 +1000
Message-ID: <20160927051700.GR30322@umbus.fritz.box>
References: <cover.1474239353.git.kevin@kevinlocke.name>
 <cover.1474600863.git.kevin@kevinlocke.name>
 <369f4f0e7a01b08df4f62006cc2d0a2116290703.1474600863.git.kevin@kevinlocke.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1958434201015088983=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjq0w1sGTzDrTD
 for <ccan@lists.ozlabs.org>; Tue, 27 Sep 2016 15:20:32 +1000 (AEST)
In-Reply-To: <369f4f0e7a01b08df4f62006cc2d0a2116290703.1474600863.git.kevin@kevinlocke.name>
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


--===============1958434201015088983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U5J2I87mWnf1KeOw"
Content-Disposition: inline


--U5J2I87mWnf1KeOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 09:33:11PM -0600, Kevin Locke wrote:
> Unfortunately, not all compilers support -o as a command-line option for
> specifying the output file.  Visual Studio cl.exe issues warning D9035
> when -o is given, which is detected as a compile warning by the
> configurator.
>=20
> To support such compilers, add the command-line option -O to
> configurator which can be used to specify the cflag for setting the
> output executable file name.  Additionally define the macro
> CCAN_OUTPUT_EXE_CFLAG in config.h and use it when invoking the compiler
> (e.g.  from ccanlint).
>=20
> For reference, the name CCAN_OUTPUT_EXE_CFLAG was chosen to avoid
> potential name conflicts in the future due to cl.exe requiring different
> flags for different types of output[1] (e.g. object files are /Fo:).
>=20
> 1.  https://msdn.microsoft.com/en-us/library/f1cb223a.aspx
>=20
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

This one has some more complex conflicts if applied without the
preceding ones, so I haven't applied it yet.

> ---
>  tools/compile.c                   | 15 ++++++++----
>  tools/configurator/configurator.c | 50 +++++++++++++++++++++++++++------=
------
>  tools/tools.h                     |  6 +++--
>  3 files changed, 49 insertions(+), 22 deletions(-)
>=20
> diff --git a/tools/compile.c b/tools/compile.c
> index b88c1d8..e796e3f 100644
> --- a/tools/compile.c
> +++ b/tools/compile.c
> @@ -7,8 +7,12 @@
>  #ifndef CCAN_CFLAGS
>  #define CCAN_CFLAGS DEFAULT_CCAN_CFLAGS
>  #endif
> +#ifndef CCAN_OUTPUT_EXE_CFLAG
> +#define CCAN_OUTPUT_EXE_CFLAG DEFAULT_CCAN_OUTPUT_EXE_CFLAG
> +#endif
>  const char *compiler =3D CCAN_COMPILER;
>  const char *cflags =3D CCAN_CFLAGS;
> +const char *outexecflag =3D CCAN_OUTPUT_EXE_CFLAG;
> =20
>  bool compile_verbose =3D false;
> =20
> @@ -37,8 +41,9 @@ bool compile_object(const void *ctx, const char *cfile,=
 const char *ccandir,
>  	if (compile_verbose)
>  		printf("Compiling %s\n", outfile);
>  	return run_command(ctx, NULL, output,
> -			   "%s %s -I%s -c -o %s %s",
> -			   compiler, cflags, ccandir, outfile, cfile);
> +			   "%s %s -I%s -c %s%s %s",
> +			   compiler, cflags, ccandir,
> +			   outexecflag, outfile, cfile);
>  }
> =20
>  /* Compile and link single C file, with object files.
> @@ -51,7 +56,7 @@ bool compile_and_link(const void *ctx, const char *cfil=
e, const char *ccandir,
>  	if (compile_verbose)
>  		printf("Compiling and linking %s\n", outfile);
>  	return run_command(ctx, NULL, output,
> -			   "%s %s -I%s -o %s %s %s %s",
> -			   compiler, cflags,
> -			   ccandir, outfile, cfile, objs, libs);
> +			   "%s %s -I%s %s%s %s %s %s",
> +			   compiler, cflags, ccandir,
> +			   outexecflag, outfile, cfile, objs, libs);
>  }
> diff --git a/tools/configurator/configurator.c b/tools/configurator/confi=
gurator.c
> index acf6cc0..d81f878 100644
> --- a/tools/configurator/configurator.c
> +++ b/tools/configurator/configurator.c
> @@ -40,6 +40,7 @@
> =20
>  #define DEFAULT_COMPILER "cc"
>  #define DEFAULT_FLAGS "-g3 -ggdb -Wall -Wundef -Wmissing-prototypes -Wmi=
ssing-declarations -Wstrict-prototypes -Wold-style-definition"
> +#define DEFAULT_OUTPUT_EXE_FLAG "-o"
> =20
>  #define OUTPUT_FILE "configurator.out"
>  #define INPUT_FILE "configuratortest.c"
> @@ -517,10 +518,12 @@ static char *run(const char *cmd, int *exitstatus)
>  	return ret;
>  }
> =20
> -static char *connect_args(const char *argv[], const char *extra)
> +static char *connect_args(const char *argv[], const char *outflag,
> +		const char *files)
>  {
> -	unsigned int i, len =3D strlen(extra) + 1;
> +	unsigned int i;
>  	char *ret;
> +	size_t len =3D strlen(outflag) + strlen(files) + 1;
> =20
>  	for (i =3D 1; argv[i]; i++)
>  		len +=3D 1 + strlen(argv[i]);
> @@ -530,10 +533,12 @@ static char *connect_args(const char *argv[], const=
 char *extra)
>  	for (i =3D 1; argv[i]; i++) {
>  		strcpy(ret + len, argv[i]);
>  		len +=3D strlen(argv[i]);
> -		if (argv[i+1])
> +		if (argv[i+1] || *outflag)
>  			ret[len++] =3D ' ';
>  	}
> -	strcpy(ret + len, extra);
> +	strcpy(ret + len, outflag);
> +	len +=3D strlen(outflag);
> +	strcpy(ret + len, files);
>  	return ret;
>  }
> =20
> @@ -702,33 +707,47 @@ int main(int argc, const char *argv[])
>  	unsigned int i;
>  	const char *default_args[]
>  		=3D { "", DEFAULT_COMPILER, DEFAULT_FLAGS, NULL };
> +	const char *outflag =3D DEFAULT_OUTPUT_EXE_FLAG;
> =20
>  	if (argc > 0)
>  		progname =3D argv[0];
> =20
> -	if (argc > 1) {
> +	while (argc > 1) {
>  		if (strcmp(argv[1], "--help") =3D=3D 0) {
> -			printf("Usage: configurator [-v] [<compiler> <flags>...]\n"
> -			       "  <compiler> <flags> will have \"-o <outfile> <infile.c>\" ap=
pended\n"
> -			       "Default: %s %s\n",
> -			       DEFAULT_COMPILER, DEFAULT_FLAGS);
> +			printf("Usage: configurator [-v] [-O<outflag>] [<compiler> <flags>...=
]\n"
> +			       "  <compiler> <flags> will have \"<outflag> <outfile> <infile.=
c>\" appended\n"
> +			       "Default: %s %s %s\n",
> +			       DEFAULT_COMPILER, DEFAULT_FLAGS,
> +			       DEFAULT_OUTPUT_EXE_FLAG);
>  			exit(0);
>  		}
> -		if (strcmp(argv[1], "-v") =3D=3D 0) {
> +		if (strncmp(argv[1], "-O", 2) =3D=3D 0) {
>  			argc--;
>  			argv++;
> -			verbose =3D 1;
> +			outflag =3D argv[1] + 2;
> +			if (!*outflag) {
> +				fprintf(stderr,
> +					"%s: option requires an argument -- O\n",
> +					argv[0]);
> +				exit(1);
> +			}
> +		} else if (strcmp(argv[1], "-v") =3D=3D 0) {
> +			argc--;
> +			argv++;
> +			verbose++;
>  		} else if (strcmp(argv[1], "-vv") =3D=3D 0) {
>  			argc--;
>  			argv++;
> -			verbose =3D 2;
> +			verbose +=3D 2;
> +		} else {
> +			break;
>  		}
>  	}
> =20
>  	if (argc =3D=3D 1)
>  		argv =3D default_args;
> =20
> -	cmd =3D connect_args(argv, " -o " OUTPUT_FILE " " INPUT_FILE);
> +	cmd =3D connect_args(argv, outflag, OUTPUT_FILE " " INPUT_FILE);
>  	for (i =3D 0; i < sizeof(tests)/sizeof(tests[0]); i++)
>  		run_test(cmd, &tests[i]);
>  	free(cmd);
> @@ -743,9 +762,10 @@ int main(int argc, const char *argv[])
>  	printf("#define _GNU_SOURCE /* Always use GNU extensions. */\n");
>  	printf("#endif\n");
>  	printf("#define CCAN_COMPILER \"%s\"\n", argv[1]);
> -	cmd =3D connect_args(argv+1, "");
> -	printf("#define CCAN_CFLAGS \"%s\"\n\n", cmd);
> +	cmd =3D connect_args(argv + 1, "", "");
> +	printf("#define CCAN_CFLAGS \"%s\"\n", cmd);
>  	free(cmd);
> +	printf("#define CCAN_OUTPUT_EXE_CFLAG \"%s\"\n\n", outflag);
>  	/* This one implies "#include <ccan/..." works, eg. for tdb2.h */
>  	printf("#define HAVE_CCAN 1\n");
>  	for (i =3D 0; i < sizeof(tests)/sizeof(tests[0]); i++)
> diff --git a/tools/tools.h b/tools/tools.h
> index 3b5c4be..668c91a 100644
> --- a/tools/tools.h
> +++ b/tools/tools.h
> @@ -11,6 +11,7 @@
>  /* These are the defaults. */
>  #define DEFAULT_CCAN_COMPILER "cc"
>  #define DEFAULT_CCAN_CFLAGS "-g"
> +#define DEFAULT_CCAN_OUTPUT_EXE_CFLAG "-o"
> =20
>  #define IDENT_CHARS	"ABCDEFGHIJKLMNOPQRSTUVWXYZ" \
>  			"abcdefghijklmnopqrstuvwxyz" \
> @@ -20,8 +21,9 @@
> =20
>  #define COVERAGE_CFLAGS "-fprofile-arcs -ftest-coverage"
> =20
> -/* Actual compiler and cflags (defaults to CCAN_COMPILER and CCAN_CFLAGS=
). */
> -extern const char *compiler, *cflags;
> +/* Actual compiler and cflags
> + * (defaults to CCAN_COMPILER, CCAN_CFLAGS, CCAN_OUTPUT_EXE_CFLAG). */
> +extern const char *compiler, *cflags, *outexecflag;
> =20
>  /* This compiles up the _info file into a temporary. */
>  char *compile_info(const void *ctx, const char *dir);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U5J2I87mWnf1KeOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6gDMAAoJEGw4ysog2bOS7B4QANVIe/HgXZnoWIuP5OSqaajL
/mhfiuX0ui3ob3QHqnOc5eg0eFs16dn7z/8lKUcv4zoUXsroo3pWq9yM02//3WH8
0tovS1gZ8eTzkdqQzaeXujMOSQBVmPQg8aciXK2FlHgU7i88u8AMM5/zcnjwFrnn
zBrDtm+OFqihGo7rWUskPxVKuFL44QqspSQE/oR1r6lxfWbhmdLZKu/QENzRRGvi
iSdHMAAPZ71D+PGimg5Dj9QNrAu+JMk8Fee4qyicXz84sg5uBa2oLMz2RtIxts38
r2JB4DY+eQIhHdNm/lhQB52Qm1Los2aNlB8k1/ky/37FG8f4F1GjLb8yOJFNpOia
rCI9XelTdUpNXigYR5of8iLuSFk01OLoSVCxSwPXpzVpMKsRLFw6wTIIxEKCyjOL
MRSQTfH7sfindmsVw/geUlvci4/3LQVGQsKpAsgaegXBwSNnAq6VWQqZvh/zxVNp
WuHLbfPllib9KmO0RsS2wdhwy2R5IwQtaxiP/OuhWa/jTYu7RO7JMBmrZCrYJMRa
/WN3JEtyY2g5Y41ncfkxORuVbFdWNfabDYWkanOl2ehHBxtF2iJ+oOWjhuhrCnWH
XRM+S1+JhEmgYErXhXCzolEhPwduBShPwxu0DjB29PujYI1yh8JPihSOjWlLDK3h
t9O++WWGVFLNjV5AJR8d
=RQRN
-----END PGP SIGNATURE-----

--U5J2I87mWnf1KeOw--

--===============1958434201015088983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1958434201015088983==--
