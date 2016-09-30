From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] list: add slist.h for singly-linked list (WIP)
Date: Fri, 30 Sep 2016 10:07:32 +1000
Message-ID: <20160930000732.GN30519@umbus.fritz.box>
References: <1475187432-7389-1-git-send-email-cota@braap.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4208625195394573996=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slXc24N1zzDrYh
 for <ccan@lists.ozlabs.org>; Fri, 30 Sep 2016 10:38:26 +1000 (AEST)
In-Reply-To: <1475187432-7389-1-git-send-email-cota@braap.org>
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


--===============4208625195394573996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TN8pJM9vJMHHFgJc"
Content-Disposition: inline


--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 06:17:12PM -0400, Emilio G. Cota wrote:
> AFAIK there's no "proper" (as in "same API as ccan/list") singly-linked
> list implementation in CCAN.
>=20
> The appended is obviously incomplete (e.g. no debug, no deletions) but as=
 is
> it gives me a ~15% speedup when doing a BFS traversal of a large graph, w=
hose
> edges are represented as an adjacency list.
>=20
> - Should we have something like this? I tried adding a for_each macro to
>   lqueue but that was just too ugly to live. Yes, one could just use *next
>   pointers in the original code, but then there's no list_for_each, and
>   no trivial update path to a doubly-linked list should the need arise.

It depends a bit how much of the list interface can be duplicated.
When I wrote lstack and lqueue, it was suggested I base them on a
general singly linked list module.  I investigated that, but got
bogged down in the details of what the interface should be, and how
much it could resemble the list interface.  That's what I restricted
myself to the more limited special purpose interfaces.

But if you can pull it off, it would be a nice thing to have.

> - If so, should it be a separate module, a submodule under list, or just
>   a header next to list.h?
>   I'm just dropping slist.h here due to laziness; I like the idea of havi=
ng
>   both singly and doubly-linked list implementations under list/ though,
>   so that they can share code and are less likely be overlooked by
>   users.

Interesting question.  My first inclination would have been simply to
have it as a separate module alongside list.  But your suggestion of
making it a list submodule is persuasive.

>=20
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  ccan/list/slist.h | 195 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 195 insertions(+)
>  create mode 100644 ccan/list/slist.h
>=20
> diff --git a/ccan/list/slist.h b/ccan/list/slist.h
> new file mode 100644
> index 0000000..d0eae32
> --- /dev/null
> +++ b/ccan/list/slist.h
> @@ -0,0 +1,195 @@
> +/* Licensed under BSD-MIT - see LICENSE file for details */
> +#ifndef CCAN_SLIST_H
> +#define CCAN_SLIST_H
> +//#define CCAN_SLIST_DEBUG 1
> +#include <ccan/str/str.h>
> +#include <ccan/container_of/container_of.h>
> +#include <ccan/check_type/check_type.h>
> +
> +/**
> + * struct slist_node - an entry in a singly-linked list
> + * @next: next entry (self if empty)
> + *
> + * This is used as an entry in a singly-linked list.
> + * Example:
> + *	struct child {
> + *		const char *name;
> + *		// Linked list of all us children.
> + *		struct slist_node slist;
> + *	};
> + */
> +struct slist_node {
> +	struct slist_node *next;
> +};
> +
> +/**
> + * struct slist_head - the head of a singly-linked list
> + * @h: the slist_head (containing next pointer)
> + *
> + * This is used as the head of a singly-linked list.
> + * Example:
> + *	struct parent {
> + *		const char *name;
> + *		struct slist_head children;
> + *		unsigned int num_children;
> + *	};
> + */
> +struct slist_head {
> +	struct slist_node n;
> +};
> +
> +#define SLIST_LOC __FILE__  ":" stringify(__LINE__)
> +#ifdef CCAN_SLIST_DEBUG
> +#define slist_debug(h, loc) slist_check((h), loc)
> +#define slist_debug_node(n, loc) slist_check_node((n), loc)
> +#else
> +#define slist_debug(h, loc) ((void)loc, h)
> +#define slist_debug_node(n, loc) ((void)loc, n)
> +#endif
> +
> +/**
> + * SLIST_HEAD_INIT - initializer for an empty slist_head
> + * @name: the name of the slist.
> + *
> + * Explicit initializer for an empty slist.
> + *
> + * See also:
> + *	SLIST_HEAD, slist_head_init()
> + *
> + * Example:
> + *	static struct slist_head my_slist =3D SLIST_HEAD_INIT(my_slist);
> + */
> +#define SLIST_HEAD_INIT(name) { { &(name).n } }
> +
> +/**
> + * SLIST_HEAD - define and initialize an empty slist_head
> + * @name: the name of the slist.
> + *
> + * The SLIST_HEAD macro defines a slist_head and initializes it to an em=
pty
> + * slist.  It can be prepended by "static" to define a static slist_head.
> + *
> + * See also:
> + *	SLIST_HEAD_INIT, slist_head_init()
> + *
> + * Example:
> + *	static SLIST_HEAD(my_global_slist);
> + */
> +#define SLIST_HEAD(name) \
> +	struct slist_head name =3D SLIST_HEAD_INIT(name)
> +
> +/**
> + * slist_head_init - initialize a slist_head
> + * @h: the slist_head to set to the empty slist
> + *
> + * Example:
> + *	...
> + *	struct parent *parent =3D malloc(sizeof(*parent));
> + *
> + *	slist_head_init(&parent->children);
> + *	parent->num_children =3D 0;
> + */
> +static inline void slist_head_init(struct slist_head *h)
> +{
> +	h->n.next =3D &h->n;
> +}
> +
> +/**
> + * slist_add - add an entry at the start of a linked list.
> + * @h: the slist_head to add the node to
> + * @n: the slist_node to add to the list.
> + *
> + * The slist_node does not need to be initialized; it will be overwritte=
n.
> + * Example:
> + *	struct child *child =3D malloc(sizeof(*child));
> + *
> + *	child->name =3D "marvin";
> + *	slist_add(&parent->children, &child->slist);
> + *	parent->num_children++;
> + */
> +#define slist_add(h, n) slist_add_(h, n, SLIST_LOC)
> +static inline void slist_add_(struct slist_head *h,
> +			      struct slist_node *n,
> +			      const char *abortstr)
> +{
> +	n->next =3D h->n.next;
> +	h->n.next =3D n;
> +}
> +
> +/**
> + * slist_for_each - iterate through a slist.
> + * @h: the slist_head (warning: evaluated multiple times!)
> + * @i: the structure containing the slist_node
> + * @member: the slist_node member of the structure
> + *
> + * This is a convenient wrapper to iterate @i over the entire slist.  It=
's
> + * a for loop, so you can break and continue as normal.
> + *
> + * Example:
> + *	slist_for_each(&parent->children, child, slist)
> + *		printf("Name: %s\n", child->name);
> + */
> +#define slist_for_each(h, i, member)					\
> +	slist_for_each_off(h, i, slist_off_var_(i, member))
> +
> +/**
> + * slist_for_each_off - iterate through a slist of memory regions.
> + * @h: the slist_head
> + * @i: the pointer to a memory region wich contains slist node data.
> + * @off: offset(relative to @i) at which slist node data resides.
> + *
> + * This is a low-level wrapper to iterate @i over the entire slist, used=
 to
> + * implement all oher, more high-level, for-each constructs. It's a for =
loop,
> + * so you can break and continue as normal.
> + *
> + * WARNING! Being the low-level macro that it is, this wrapper doesn't k=
now
> + * nor care about the type of @i. The only assumption made is that @i po=
ints
> + * to a chunk of memory that at some @offset, relative to @i, contains a
> + * properly filled `struct slist_node' which in turn contains pointers to
> + * memory chunks and it's turtles all the way down. With all that in mind
> + * remember that given the wrong pointer/offset couple this macro will
> + * happily churn all you memory untill SEGFAULT stops it, in other words
> + * caveat emptor.
> + *
> + * It is worth mentioning that one of legitimate use-cases for that wrap=
per
> + * is operation on opaque types with known offset for `struct slist_node'
> + * member(preferably 0), because it allows you not to disclose the type =
of
> + * @i.
> + *
> + * Example:
> + *	slist_for_each_off(&parent->children, child,
> + *				offsetof(struct child, slist))
> + *		printf("Name: %s\n", child->name);
> + */
> +#define slist_for_each_off(h, i, off)					\
> +	for (i =3D slist_node_to_off_(slist_debug(h, SLIST_LOC)->n.next,	\
> +					(off));				\
> +	     slist_node_from_off_((void *)i, (off)) !=3D &(h)->n;		\
> +	     i =3D slist_node_to_off_(slist_node_from_off_((void *)i,	\
> +					(off))->next, (off)))
> +
> +/* Offset helper functions so we only single-evaluate. */
> +static inline void *slist_node_to_off_(struct slist_node *node, size_t o=
ff)
> +{
> +	return (void *)((char *)node - off);
> +}
> +static inline struct slist_node *slist_node_from_off_(void *ptr, size_t =
off)
> +{
> +	return (struct slist_node *)((char *)ptr + off);
> +}
> +
> +/* Get the offset of the member, but make sure it's a slist_node. */
> +#define slist_off_(type, member)					\
> +	(container_off(type, member) +					\
> +	 check_type(((type *)0)->member, struct slist_node))
> +
> +#define slist_off_var_(var, member)				\
> +	(container_off_var(var, member) +			\
> +	 check_type(var->member, struct slist_node))
> +
> +#if HAVE_TYPEOF
> +#define slist_typeof(var) typeof(var)
> +#else
> +#define slist_typeof(var) void *
> +#endif
> +
> +#endif /* CCAN_SLIST_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TN8pJM9vJMHHFgJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7azCAAoJEGw4ysog2bOSM7sQAJYwxS/tCqe26kcp0nN19y3d
N7nkWluzin774cIOepXY6XrTcDRFAuVLq3CaAi63RbYg80STNSA4GA4U63DXaG7b
q6yra0FbQ+SKip8sICFmxIRNGNkDyxRXG8qFqFx6MLU7Rcrl0Iiv8r5zTas1AvzP
Ab7KsTaaGIFyBn3W0XUgTn4mvczBhHUCfZLihXnjNQA8xTVC72RPAAgULsp47rF+
oPxYupCQarfOQTiOr1l7IdyEKfhxKhh2/dnXscYqANHL0A9PCCw5wufb3t9G/jD8
OgExAdxgdzFpvQUbaCZh8M+mcs43X86D9ZcvxgWpmgaQwCLuTRfXTlwzbXI0Mfsh
I+yxTb5nw/26hW1v9ZI1NcUoSMteqsA7hR/hJ9NSZZm2wj460EpMwQ2BRCUuqPcH
hqyZ0I2j05vUctAl+ax85ZwZUb/j1LqqhZ1pWPqtOyNPNtBoA5YBJ8+dw2u/dQJg
k9e547mDLG6QfvYrwUrDcgBIZTM5KXBKFaghHFGOic86KKOnyqpiGCDV1z/eHQkz
Toi7hueDWZJOgdPXN9Auisso+OTr/uGnyJOX5aOcPatNox75jggDPudezyTbjail
b/lnx+ES00BCD+KBWpXCKC+kWP+vkMfIWGUoHdjQjYlXx1oLxYKsTigZAbC+ftTy
bt9fzQsm+mT31g4k4tL+
=kuFy
-----END PGP SIGNATURE-----

--TN8pJM9vJMHHFgJc--

--===============4208625195394573996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============4208625195394573996==--
