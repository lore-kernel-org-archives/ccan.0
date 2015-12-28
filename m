From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: deque: New module
Date: Mon, 28 Dec 2015 14:43:37 +1100
Message-ID: <20151228034337.GA15174@voom>
References: <20151223121144.GB27038@ip-172-31-61-248.ec2.internal>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3310713068880143740=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E609F1A0024
 for <ccan@lists.ozlabs.org>; Mon, 28 Dec 2015 14:45:02 +1100 (AEDT)
In-Reply-To: <20151223121144.GB27038@ip-172-31-61-248.ec2.internal>
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


--===============3310713068880143740==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 12:11:44PM +0000, Dan Good wrote:
> deque - type-preserving resizing circular deque

Concept looks good.  There are some fairly minor nits in the
implementation that I've noted below.  However, none are serious
enough to hold up merging, so I've applied this.  I did modify
trivially to remove some trailing whitespace.

It would be nice to address some of the comments in follow up
commits, particularly some of the portability issues.

> Signed-off-by: Dan Good <dan@dancancode.com>
> ---
>  Makefile-ccan          |   1 +
>  ccan/deque/LICENSE     |   1 +
>  ccan/deque/_info       | 140 +++++++++++++++++++++++++++
>  ccan/deque/deque.c     |  91 ++++++++++++++++++
>  ccan/deque/deque.h     | 252 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  ccan/deque/test/run1.c | 140 +++++++++++++++++++++++++++
>  ccan/deque/test/run2.c |  59 ++++++++++++
>  ccan/deque/test/run3.c |  37 ++++++++
>  8 files changed, 721 insertions(+)
>  create mode 120000 ccan/deque/LICENSE
>  create mode 100644 ccan/deque/_info
>  create mode 100644 ccan/deque/deque.c
>  create mode 100644 ccan/deque/deque.h
>  create mode 100644 ccan/deque/test/run1.c
>  create mode 100644 ccan/deque/test/run2.c
>  create mode 100644 ccan/deque/test/run3.c
>=20
> diff --git a/Makefile-ccan b/Makefile-ccan
> index 8eac2d7..8d99bbf 100644
> --- a/Makefile-ccan
> +++ b/Makefile-ccan
> @@ -57,6 +57,7 @@ MODS_WITH_SRC :=3D aga \
>  	crypto/shachain \
>  	daemonize \
>  	daemon_with_notify \
> +	deque \
>  	dgraph \
>  	eratosthenes \
>  	err \
> diff --git a/ccan/deque/LICENSE b/ccan/deque/LICENSE
> new file mode 120000
> index 0000000..4f8ee74
> --- /dev/null
> +++ b/ccan/deque/LICENSE
> @@ -0,0 +1 @@
> +../../licenses/APACHE-2
> \ No newline at end of file
> diff --git a/ccan/deque/_info b/ccan/deque/_info
> new file mode 100644
> index 0000000..b1a47bb
> --- /dev/null
> +++ b/ccan/deque/_info
> @@ -0,0 +1,140 @@
> +#include "config.h"
> +#include <stdio.h>
> +#include <string.h>
> +
> +/**
> + * deque - type-preserving resizing circular deque
> + *
> + * This is a deque (double-ended queue, pronounced deck) implementation =
using
> + * a resizing circular buffer.  At steady state, deque operations can pr=
oceed
> + * perpetually without mallocing.  The initial capacity must be specifie=
d and
> + * is a lower bound when shrinking.  Buffer capacity is doubled at enque=
ue
> + * to a full deque.  Shrink behavior choices are never shrink, shrink to
> + * minimum when the queue is empty, or shrink by half when the queue is =
at 20%
> + * of capacity.  Operation names are in the Perl/Ruby style.
> + *
> + * Example:
> + *	// Evaluates arithmetic expressions using Dijkstra's two-stack algori=
thm.
> + *	// Original: http://algs4.cs.princeton.edu/13stacks/EvaluateDeluxe.ja=
va.html
> + *	#define _XOPEN_SOURCE 700

This define suggests non-portability.

> + *	#include <stdio.h>
> + *	#include <stdlib.h>
> + *	#include <ctype.h>
> + *	#include <err.h>
> + *	#include <ccan/deque/deque.h>
> + *
> + *	static double eval(char op, double a, double b)
> + *	{
> + *		switch (op) {
> + *		case '+': return a + b;
> + *		case '-': return a - b;
> + *		case '/': return a / b;
> + *		case '*': return a * b;
> + *		}
> + *		errx(1, "bad op: %c", op);
> + *	}
> + *
> + *	char opchr[] =3D { '(', ')', '+', '-', '*', '/' };
> + *	int  opprc[] =3D {  0 ,  0 ,  1 ,  1 ,  2 ,  2  };
> + *
> + *	static int precedence(char op)
> + *	{
> + *		int i;
> + *		for (i =3D 0; i < sizeof(opchr); i++)
> + *			if (opchr[i] =3D=3D op)
> + *				return opprc[i];
> + *		return -1;
> + *	}
> + *
> + *	#define ok(x) ({ int n =3D (x); if (n =3D=3D -1) err(1, "%s", #x); n;=
 })
> + *
> + *	int main(int argc, char *argv[])
> + *	{
> + *		DEQ_WRAP(char) *ops;
> + *		DEQ_WRAP(double) *vals;
> + *		char *ln =3D NULL, *p, op;
> + *		size_t lnsz =3D 0;
> + *		double a, b;
> + *		int n;
> + *
> + *		ok(deq_new(ops,  8, DEQ_NO_SHRINK));
> + *		ok(deq_new(vals, 8, DEQ_NO_SHRINK));
> + *
> + *		while (getline(&ln, &lnsz, stdin) > 0) {
> + *
> + *			for (p =3D ln; *p; p++) {
> + *				if (isspace(*p))
> + *					continue;
> + *
> + *				if (precedence(*p) =3D=3D -1) {
> + *					if (sscanf(p, "%lf%n", &a, &n) !=3D 1)
> + *						errx(1, "parse fail: %s", p);
> + *					ok(deq_push(vals, a));
> + *					p +=3D n - 1;
> + *					continue;
> + *				}
> + *
> + *				while (1) {
> + *					if (*p =3D=3D '(' || deq_last(ops, &op) =3D=3D 0 || (precedence(*=
p) > precedence(op))) {
> + *						ok(deq_push(ops, *p));
> + *						break;
> + *					}
> + *
> + *					ok(deq_pop(ops, &op));
> + *
> + *					if (op =3D=3D '(') {
> + *						assert(*p =3D=3D ')');
> + *						break;
> + *					}
> + *					else {
> + *						if (deq_len(vals) < 2)
> + *							errx(1, "out of values");
> + *						ok(deq_pop(vals, &b));
> + *						ok(deq_pop(vals, &a));
> + *						ok(deq_push(vals, eval(op, a, b)));
> + *					}
> + *				}
> + *			}
> + *
> + *			while (ok(deq_pop(ops, &op)) =3D=3D 1) {
> + *				if (deq_len(vals) < 2)
> + *					errx(1, "out of values");
> + *				ok(deq_pop(vals, &b));
> + *				ok(deq_pop(vals, &a));
> + *				ok(deq_push(vals, eval(op, a, b)));
> + *			}
> + *
> + *			if ((n =3D deq_len(vals)) !=3D 1)
> + *				errx(1, "wrong number of values: %d", n);
> + *
> + *			ok(deq_pop(vals, &a));
> + *			printf("%.lf\n", a);
> + *		}
> + *
> + *		if (ferror(stdin))
> + *			err(1, "getline");
> + *
> + *		deq_free(ops);
> + *		deq_free(vals);
> + *		free(ln);
> + *		exit(0);
> + *	}
> + *
> + * License: APACHE-2
> + * Author: Dan Good <dan@dancancode.com>
> + */
> +int main(int argc, char *argv[])
> +{
> +	/* Expect exactly one argument */
> +	if (argc !=3D 2)
> +		return 1;
> +
> +	if (strcmp(argv[1], "depends") =3D=3D 0)
> +		return 0;
> +	if (strcmp(argv[1], "testdepends") =3D=3D 0) {
> +		printf("ccan/failtest\n");
> +		return 0;
> +	}
> +
> +	return 1;
> +}
> diff --git a/ccan/deque/deque.c b/ccan/deque/deque.c
> new file mode 100644
> index 0000000..c984092
> --- /dev/null
> +++ b/ccan/deque/deque.c
> @@ -0,0 +1,91 @@

It's usual to put a one-line reference to the license at the beginning
of the .c and .h files.  In fact I thought ccanlint already added that
for you.

Also, it's important to *always* include "config.h" before anything else.

> +#include <assert.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include "deque.h"
> +
> +int deq_resize_(struct deq *q, unsigned n)
> +{
> +	char *t;
> +
> +	assert(q && n > 0 && n >=3D q->len);
> +
> +	if (!(t =3D malloc(q->esz * n)))
> +		return -1;
> +
> +	if (q->len) {
> +		unsigned part1 =3D q->head + q->len <=3D q->cap ? q->len : q->cap - q-=
>head;
> +		unsigned part2 =3D q->len - part1;
> +		memcpy(t, q->v + q->head * q->esz, q->esz * part1);
> +		if (part2)
> +			memcpy(t + q->esz * part1, q->v, q->esz * part2);
> +	}
> +	if (q->cap)
> +		free(q->v);
> +
> +	q->v    =3D t;
> +	q->head =3D 0;
> +	q->tail =3D q->len;
> +	q->cap  =3D n;
> +
> +	return 0;
> +}
> +
> +int deq_op_(struct deq *q, enum deq_op op, unsigned *i)
> +{
> +	assert(q && i);
> +	assert(op =3D=3D DEQ_PUSH || op =3D=3D DEQ_POP ||  op =3D=3D DEQ_SHIFT =
|| op =3D=3D DEQ_UNSHIFT);

Is there really any reason to multiplex all the operations into a
single function - there's not much shared code, particularly if you
used some grow/shrink helpers.

> +	switch (op) {
> +	case DEQ_PUSH:
> +	case DEQ_UNSHIFT:
> +		if (q->len =3D=3D q->cap && deq_resize_(q, q->cap =3D=3D 0 ? q->min : =
q->cap * 2) =3D=3D -1)
> +			return -1;
> +		break;
> +	case DEQ_POP:
> +	case DEQ_SHIFT:
> +		if (q->cap > q->min) {
> +			if (q->shrink =3D=3D DEQ_SHRINK_IF_EMPTY && q->len =3D=3D 1 && deq_re=
size_(q, q->min) =3D=3D -1)
> +				return -1;
> +			if (q->shrink =3D=3D DEQ_SHRINK_AT_20PCT && (q->len - 1) * 5 <=3D q->=
cap && deq_resize_(q, q->cap / 2) =3D=3D -1)
> +				return -1;
> +		}
> +		if (q->len =3D=3D 0)
> +			return 0;
> +	}
> +
> +	switch (op) {
> +	case DEQ_PUSH:
> +		*i =3D q->tail++;
> +		q->tail  %=3D q->cap;
> +		q->len++;
> +		break;
> +	case DEQ_SHIFT:
> +		*i =3D q->head++;
> +		q->head %=3D q->cap;
> +		q->len--;
> +		break;
> +	case DEQ_POP:
> +		q->tail =3D (q->tail =3D=3D 0 ? q->cap : q->tail) - 1;
> +		*i =3D q->tail;
> +		q->len--;
> +		break;
> +	case DEQ_UNSHIFT:
> +		q->head =3D (q->head =3D=3D 0 ? q->cap : q->head) - 1;
> +		*i =3D q->head;
> +		q->len++;
> +		break;
> +	}
> +=09
> +	return 1;
> +}
> +
> +void deq_reset_(struct deq *q)
> +{
> +	assert(q);
> +
> +	if (q->v)
> +		free(q->v);
> +
> +	q->v =3D 0;
> +	q->head =3D q->tail =3D q->len =3D q->cap =3D 0;
> +}
> diff --git a/ccan/deque/deque.h b/ccan/deque/deque.h
> new file mode 100644
> index 0000000..1e5b4e8
> --- /dev/null
> +++ b/ccan/deque/deque.h
> @@ -0,0 +1,252 @@
> +#ifndef _DEQUE_H
> +#define _DEQUE_H
> +
> +#include <assert.h>
> +
> +/**
> + * struct deq - deque metadata
> + * @v: char pointer to malloced memory
> + * @head: index of first item in deque
> + * @tail: index after last item in deque
> + * @len: length of deque
> + * @cap: total capacity of deque
> + * @min: initial capacity of deque
> + * @esz: element size
> + * @shrink: flag specifying shrink behavior
> + *
> + * len is distance between head and tail. cap changes with resizing.
> + * shrink must be one of DEQ_NO_SHRINK, DEQ_SHRINK_IF_EMPTY, or DEQ_SHRI=
NK_AT_20PCT.
> + * When shrinking, min is the smallest size.
> + */
> +
> +enum deq_flag { DEQ_NO_SHRINK, DEQ_SHRINK_IF_EMPTY, DEQ_SHRINK_AT_20PCT =
};
> +
> +struct deq {
> +	char *v;
> +	unsigned head, tail, len, cap, min, esz, shrink;
> +};
> +
> +/**
> + * DEQ_WRAP - declare a wrapper type for struct deq and base type
> + * @basetype: the base type to wrap
> + *
> + * Example:
> + *	// init inline, defer malloc to first push/unshift
> + *	struct point { int x, y; } a;
> + *	DEQ_WRAP(struct point) pointq =3D DEQ_INIT(sizeof(struct point), 64, =
DEQ_NO_SHRINK);
> + *
> + *	// or init and malloc by function call
> + *	struct vector3 { double x, y, z; };
> + *	typedef DEQ_WRAP(struct vector3) vector3q_t;
> + *	vector3q_t v;
> + *
> + *	if (deq_init(&v, 16, DEQ_SHRINK_IF_EMPTY) =3D=3D -1)
> + *		err(1, "deq_init");
> + *
> + *	a.x =3D 1; a.y =3D 1;
> + *	// first malloc for pointq
> + *	if (deq_push(&pointq, a) =3D=3D -1)
> + *		err(1, "deq_push");
> + */
> +#define DEQ_WRAP(basetype)	\
> +	union {			\
> +		struct deq deq;	\
> +		basetype *v;	\
> +	}

It might be nice to use the existing tcon module to handle the
wrapping here

> +
> +#define DEQ_INIT_DEQ(esz, min, shrink) \
> +	(struct deq) { 0, 0, 0, 0, 0, (min), (esz), (shrink) }

I think compound literals may be a gcc extension.

> +
> +#define DEQ_INIT(esz, min, shrink) { .deq =3D DEQ_INIT_DEQ(esz, min, shr=
ink) }
> +
> +/**
> + * deq_init - initialize struct deq and malloc
> + * @w: pointer to wrapper
> + * @min: initial capacity of deque
> + * @shrink: flag specifying shrink behavior
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int deq_resize_(struct deq *q, unsigned n);
> +#define deq_init(w, min, shrink) ({				\
> +	(w)->deq =3D DEQ_INIT_DEQ(sizeof(*(w)->v), min, shrink);	\
> +	deq_resize_(&(w)->deq, (min));				\
> +})

And I'm pretty sure statement expressions are a gcc extension.

> +
> +/**
> + * deq_new - malloc wrapper and run deq_init
> + * @w: pointer to wrapper
> + * @min: initial capacity of deque
> + * @shrink: flag specifying shrink behavior
> + *
> + * Example:
> + *	vector3q_t *z;
> + *
> + *	if (deq_new(z, 16, DEQ_SHRINK_AT_20PCT) =3D=3D -1)
> + *		err(1, "deq_new");
> + *	//later
> + *	deq_free(z);
> + *
> + * Returns: pointer on success, NULL on error
> + */
> +#define deq_new(w, min, shrink) ({			\
> +	w =3D malloc(sizeof(*w));				\
> +	if (w && deq_init(w, min, shrink) =3D=3D -1) {	\
> +		free(w);				\
> +		w =3D 0;					\
> +	}						\
> +	w ? 0 : -1;					\
> +})
> +
> +enum deq_op { DEQ_PUSH, DEQ_POP, DEQ_SHIFT, DEQ_UNSHIFT };
> +int deq_op_(struct deq *q, enum deq_op op, unsigned *i);
> +
> +/**
> + * deq_push - add element to end of deque
> + * @w: pointer to wrapper
> + * @e: element to add
> + *
> + * Returns: 1 on success, -1 on error
> + */
> +#define deq_push(w, e) ({					\
> +	unsigned __i;						\
> +	int __ret =3D deq_op_(&(w)->deq, DEQ_PUSH, &__i);		\
> +	if (__ret =3D=3D 1)						\
> +		(w)->v[__i] =3D (e);				\
> +	__ret;							\
> +})
> +
> +/**
> + * deq_unshift - add element to beginning of deque
> + * @w: pointer to wrapper
> + * @e: element to add
> + *
> + * Returns: 1 on success, -1 on error
> + */
> +#define deq_unshift(w, e) ({					\
> +	unsigned __i;						\
> +	int __ret =3D deq_op_(&(w)->deq, DEQ_UNSHIFT, &__i);	\
> +	if (__ret =3D=3D 1)						\
> +		(w)->v[__i] =3D (e);				\
> +	__ret;							\
> +})
> +
> +/**
> + * deq_pop - dequeue element from end of deque
> + * @w: pointer to wrapper
> + * @e: pointer to receive dequeued element
> + *
> + * Returns: 1 on success, 0 if deque is empty, -1 on error
> + *
> + * Example:
> + *	DEQ_WRAP(int) w =3D DEQ_INIT(sizeof(int), 8, DEQ_NO_SHRINK);
> + *	int ret, i;
> + *	// ... after enqueuing some ints
> + *	while ((ret =3D deq_pop(&w, &i)) =3D=3D 1)
> + *		printf("%d\n", i);
> + *	if (ret =3D=3D -1)
> + *		err(1, "deq_pop");
> + */
> +#define deq_pop(w, e) ({					\
> +	unsigned __i;						\
> +	int __ret =3D deq_op_(&(w)->deq, DEQ_POP, &__i);		\
> +	if (__ret =3D=3D 1)						\
> +		*(e) =3D (w)->v[__i];				\
> +	__ret;							\
> +})
> +
> +/**
> + * deq_shift - dequeue element from beginning of deque
> + * @w: pointer to wrapper
> + * @e: pointer to receive dequeued element
> + *
> + * Returns: 1 on success, 0 if deque is empty, -1 on error
> + */
> +#define deq_shift(w, e) ({					\
> +	unsigned __i;						\
> +	int __ret =3D deq_op_(&(w)->deq, DEQ_SHIFT, &__i);	\
> +	if (__ret =3D=3D 1)						\
> +		*(e) =3D (w)->v[__i];				\
> +	__ret;							\
> +})
> +
> +/**
> + * deq_first - get element from beginning of deque, deque is unchanged
> + * @w: pointer to wrapper
> + * @e: pointer to receive element
> + *
> + * Returns: 1 on success, 0 if deque is empty
> + */
> +#define deq_first(w, e) ({			\
> +	int __ret =3D 0;				\
> +	assert(w);				\
> +	assert(e);				\
> +	if ((w)->deq.len > 0) {			\
> +		*(e) =3D (w)->v[(w)->deq.head];	\
> +		__ret =3D 1;			\
> +	}					\
> +	__ret;					\
> +})
> +
> +/**
> + * deq_last - get element from end of deque, deque is unchanged
> + * @w: pointer to wrapper
> + * @e: pointer to receive element
> + *
> + * Returns: 1 on success, 0 if deque is empty
> + */
> +#define deq_last(w, e) ({				\
> +	int __ret =3D 0;					\
> +	assert(w);					\
> +	assert(e);					\
> +	if ((w)->deq.len > 0) {				\
> +		unsigned __i =3D (w)->deq.tail =3D=3D 0 ?	\
> +			(w)->deq.cap : (w)->deq.tail;	\
> +		*(e) =3D (w)->v[__i - 1];			\
> +		__ret =3D 1;				\
> +	}						\
> +	__ret;						\
> +})
> +
> +/**
> + * deq_reset - set struct deq indexes and counters to zero, and free mal=
loced buffer
> + * @w: pointer to wrapper
> + *
> + * Returns: void
> + */
> +void deq_reset_(struct deq *q);
> +#define deq_reset(w) do {	\
> +	assert(w);		\
> +	deq_reset_(&(w)->deq);	\
> +	(w)->v =3D 0;		\
> +} while (0)
> +
> +/**
> + * deq_free - run deq_reset and free malloced wrapper
> + * @w: pointer to wrapper
> + *
> + * Returns: void
> + */
> +#define deq_free(w) do {	\
> +	deq_reset(w);		\
> +	free(w);		\
> +	w =3D 0;			\
> +} while (0)
> +
> +/**
> + * deq_len - return deque length
> + * @w: pointer to wrapper
> + *
> + * Returns: int
> + */
> +#define deq_len(w) ({ assert(w); (w)->deq.len; })
> +
> +/**
> + * deq_cap - return deque capacity
> + * @w: pointer to wrapper
> + *
> + * Returns: int
> + */
> +#define deq_cap(w) ({ assert(w); (w)->deq.cap; })
> +
> +#endif
> diff --git a/ccan/deque/test/run1.c b/ccan/deque/test/run1.c
> new file mode 100644
> index 0000000..8d953ea
> --- /dev/null
> +++ b/ccan/deque/test/run1.c

AFAICT you're not accessing any of the module internals in this test,
so you might be better off making this api1.c, in which case you don't
need to #include deque.c.

That distinction is pretty non-obvious I'll grant you - many existing
modules use run.c when they could be using api.c

> @@ -0,0 +1,140 @@
> +#include <ccan/deque/deque.h>
> +/* Include the C files directly. */
> +#include <ccan/deque/deque.c>
> +#include <ccan/tap/tap.h>
> +
> +int main(void)
> +{
> +	char t, *save;
> +
> +	plan_tests(64);
> +
> +	DEQ_WRAP(char) *a;

Mixing declarations and statements (plan_tests()) isn't supported by
all compilers / C versions.

> +	ok1(deq_new(a, 4, DEQ_SHRINK_AT_20PCT) =3D=3D 0);
> +	ok1(a->v && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 && a->deq.len =
=3D=3D 0 && a->deq.cap =3D=3D 4 &&
> +	    a->deq.min =3D=3D 4 && a->deq.esz =3D=3D 1 && a->deq.shrink =3D=3D =
DEQ_SHRINK_AT_20PCT);
> +	save =3D a->v;
> +	memset(a->v, 0, a->deq.cap);
> +	ok1(deq_len(a) =3D=3D 0 && deq_cap(a) =3D=3D 4);
> +
> +	ok1(deq_push(a, 'a') =3D=3D 1);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 1 &&=
 a->deq.len =3D=3D 1 && a->deq.cap =3D=3D 4);
> +	ok1(a->v[0] =3D=3D 'a');
> +	ok1(t =3D '~' && deq_first(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(t =3D '~' && deq_last(a, &t)  =3D=3D 1 && t =3D=3D 'a');
> +	ok1(deq_len(a) =3D=3D 1 && deq_cap(a) =3D=3D 4);
> +
> +	ok1(t =3D '~' && deq_pop(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 0 && a->deq.cap =3D=3D 4);
> +
> +	ok1(deq_unshift(a, 'a') =3D=3D 1);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 3 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 1 && a->deq.cap =3D=3D 4);
> +	ok1(a->v[3] =3D=3D 'a');
> +	ok1(t =3D '~' && deq_first(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(t =3D '~' && deq_last(a, &t)  =3D=3D 1 && t =3D=3D 'a');
> +
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 0 && a->deq.cap =3D=3D 4);
> +
> +	memset(a->v, 0, a->deq.cap);
> +	deq_push(a, 'a');
> +	deq_push(a, 'b');
> +	deq_push(a, 'c');
> +	deq_push(a, 'd');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 4 && a->deq.cap =3D=3D 4);
> +	ok1(strncmp("abcd", a->v + a->deq.head, a->deq.len) =3D=3D 0);
> +	ok1(t =3D '~' && deq_first(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(t =3D '~' && deq_last(a, &t)  =3D=3D 1 && t =3D=3D 'd');
> +
> +	deq_push(a, 'e');
> +	ok1(a->v !=3D save);
> +	save =3D a->v;
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 5 &&=
 a->deq.len =3D=3D 5 && a->deq.cap =3D=3D 8);
> +	ok1(strncmp("abcde", a->v + a->deq.head, a->deq.len) =3D=3D 0);
> +	ok1(t =3D '~' && deq_first(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(t =3D '~' && deq_last(a, &t)  =3D=3D 1 && t =3D=3D 'e');
> +	ok1(deq_len(a) =3D=3D 5 && deq_cap(a) =3D=3D 8);
> +
> +
> +	deq_push(a, 'f');
> +	deq_push(a, 'g');
> +	deq_push(a, 'h');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 8 && a->deq.cap =3D=3D 8);
> +	ok1(strncmp("abcdefgh", a->v + a->deq.head, a->deq.len) =3D=3D 0);
> +
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'b');
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'c');
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'd');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 4 && a->deq.tail =3D=3D 0 &&=
 a->deq.len =3D=3D 4 && a->deq.cap =3D=3D 8);
> +	ok1(strncmp("efgh", a->v + a->deq.head, a->deq.len) =3D=3D 0);
> +	ok1(t =3D '~' && deq_first(a, &t) =3D=3D 1 && t =3D=3D 'e');
> +	ok1(t =3D '~' && deq_last(a, &t)  =3D=3D 1 && t =3D=3D 'h');
> +
> +	deq_push(a, 'i');
> +	deq_push(a, 'j');
> +	deq_push(a, 'k');
> +	deq_push(a, 'l');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 4 && a->deq.tail =3D=3D 4 &&=
 a->deq.len =3D=3D 8 && a->deq.cap =3D=3D 8);
> +	ok1(strncmp("ijklefgh", a->v, a->deq.len) =3D=3D 0);
> +
> +	deq_push(a, 'm');
> +	ok1(a->v !=3D save);
> +	save =3D a->v;
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 9 &&=
 a->deq.len =3D=3D 9 && a->deq.cap =3D=3D 16);
> +	ok1(strncmp("efghijklm", a->v + a->deq.head, a->deq.len) =3D=3D 0);
> +
> +	int i;
> +	for (i =3D 9, t =3D '!'; i <=3D 128; i++, t =3D (t =3D=3D '~' ? '!' : t=
 + 1))
> +		deq_push(a, t);
> +
> +	save =3D a->v;
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 129 =
&& a->deq.len =3D=3D 129 && a->deq.cap =3D=3D 256);
> +	int j;
> +	for(j =3D 0; i > 52; i--, j++)
> +		deq_shift(a, &t);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D j && a->deq.tail =3D=3D 129 =
&& a->deq.len =3D=3D 52 && a->deq.cap =3D=3D 256);
> +	deq_shift(a, &t);
> +	ok1(a->v !=3D save);
> +	save =3D a->v;
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 1 && a->deq.tail =3D=3D 52 &=
& a->deq.len =3D=3D 51 && a->deq.cap =3D=3D 128);
> +	ok1(strncmp("fghijklmnopqrstuvwxyz{|}~!\"#$%&'()*+,-./0123456789:", a->=
v + a->deq.head, a->deq.len) =3D=3D 0);
> +
> +	a->deq.shrink =3D DEQ_SHRINK_IF_EMPTY;
> +	for(i =3D a->deq.len; i > 1; i--)
> +		deq_shift(a, &t);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 51 && a->deq.tail =3D=3D 52 =
&& a->deq.len =3D=3D 1 && a->deq.cap =3D=3D 128);
> +	deq_shift(a, &t);
> +	ok1(a->v !=3D save);
> +	save =3D a->v;
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 1 && a->deq.tail =3D=3D 1 &&=
 a->deq.len =3D=3D 0 && a->deq.cap =3D=3D a->deq.min);
> +
> +	deq_reset(a);
> +	ok1(!a->v);
> +	ok1(deq_unshift(a, 'a') =3D=3D 1);
> +	save =3D a->v;
> +	memset(a->v, 0, a->deq.cap - 1);
> +	ok1(t =3D '~' && deq_pop(a, &t) =3D=3D 1 && t =3D=3D 'a');
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 3 && a->deq.tail =3D=3D 3 &&=
 a->deq.len =3D=3D 0 && a->deq.cap =3D=3D 4);
> +
> +	deq_reset(a);
> +	deq_push(a, 'A');
> +	save =3D a->v;
> +	deq_unshift(a, 'B');
> +	deq_push(a, 'C');
> +	deq_unshift(a, 'D');
> +	ok1(strncmp("ACDB", a->v, 4) =3D=3D 0);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 2 && a->deq.tail =3D=3D 2 &&=
 a->deq.len =3D=3D 4 && a->deq.cap =3D=3D 4);
> +	ok1(t =3D '~' && deq_pop(a, &t) =3D=3D 1 && t =3D=3D 'C');
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'D');
> +	ok1(t =3D '~' && deq_shift(a, &t) =3D=3D 1 && t =3D=3D 'B');
> +	ok1(t =3D '~' && deq_pop(a, &t) =3D=3D 1 && t =3D=3D 'A');
> +
> +	ok1(deq_pop(a, &t) =3D=3D 0);
> +	ok1(deq_shift(a, &t) =3D=3D 0);
> +
> +	deq_free(a);
> +	ok1(!a);
> +
> +	return exit_status();
> +}
> diff --git a/ccan/deque/test/run2.c b/ccan/deque/test/run2.c
> new file mode 100644
> index 0000000..9250210
> --- /dev/null
> +++ b/ccan/deque/test/run2.c
> @@ -0,0 +1,59 @@
> +#include <stdlib.h>
> +#include <ccan/tap/tap.h>
> +#include <ccan/deque/deque.h>
> +/* Include the C files directly. */
> +
> +size_t malloc_sz;
> +#define malloc(x) malloc(malloc_sz =3D x)
> +#include <ccan/deque/deque.c>
> +
> +int main(void)
> +{
> +	struct quad { int w, x, y, z; } p, q, r, s, *save;
> +	assert(sizeof(struct quad) =3D=3D sizeof(int) * 4);
> +
> +	plan_tests(19);
> +
> +	typedef DEQ_WRAP(struct quad) qd_t;
> +	qd_t a_, *a =3D &a_;
> +
> +	ok1(deq_init(a, 4, DEQ_SHRINK_AT_20PCT) =3D=3D 0);
> +	ok1(malloc_sz =3D=3D sizeof(struct quad) * 4);
> +
> +	ok1(a->v && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 0 && a->deq.len =
=3D=3D 0 && a->deq.cap =3D=3D 4 &&
> +	    a->deq.min =3D=3D 4 && a->deq.esz =3D=3D sizeof(struct quad) && a->=
deq.shrink =3D=3D DEQ_SHRINK_AT_20PCT);
> +	save =3D a->v;
> +	memset(a->v, 0xFF, a->deq.cap * sizeof(struct quad));
> +
> +	int chk[12] =3D { 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3 };
> +	p =3D (struct quad) { 1, 1, 1, 1 };
> +	ok1(deq_push(a, p) =3D=3D 1);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 1 &&=
 a->deq.len =3D=3D 1 && a->deq.cap =3D=3D 4);
> +	ok1(memcmp(a->v, chk, sizeof(int) * 4) =3D=3D 0 && memcmp(a->v, chk, si=
zeof(chk)) !=3D 0);
> +	q =3D (struct quad) { 2, 2, 2, 2 };
> +	ok1(deq_push(a, q) =3D=3D 1);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 2 &&=
 a->deq.len =3D=3D 2 && a->deq.cap =3D=3D 4);
> +	ok1(memcmp(a->v, chk, sizeof(int) * 8) =3D=3D 0 && memcmp(a->v, chk, si=
zeof(chk)) !=3D 0);
> +	r =3D (struct quad) { 3, 3, 3, 3 };
> +	ok1(deq_push(a, r) =3D=3D 1);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 3 &&=
 a->deq.len =3D=3D 3 && a->deq.cap =3D=3D 4);
> +	ok1(memcmp(a->v, chk, sizeof(int) * 12) =3D=3D 0);
> +
> +	ok1(deq_shift(a, &s) =3D=3D 1 && s.w =3D=3D 1 && s.x =3D=3D 1 && s.y =
=3D=3D 1 && s.z =3D=3D 1);
> +	ok1(deq_shift(a, &s) =3D=3D 1 && s.w =3D=3D 2 && s.x =3D=3D 2 && s.y =
=3D=3D 2 && s.z =3D=3D 2);
> +	ok1(deq_shift(a, &s) =3D=3D 1 && s.w =3D=3D 3 && s.x =3D=3D 3 && s.y =
=3D=3D 3 && s.z =3D=3D 3);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 3 && a->deq.tail =3D=3D 3 &&=
 a->deq.len =3D=3D 0 && a->deq.cap =3D=3D 4);
> +	deq_push(a, p);
> +	deq_push(a, q);
> +	deq_push(a, r);
> +	deq_push(a, p);
> +	ok1(a->v =3D=3D save && a->deq.head =3D=3D 3 && a->deq.tail =3D=3D 3 &&=
 a->deq.len =3D=3D 4 && a->deq.cap =3D=3D 4);
> +
> +	deq_push(a, q);
> +	ok1(a->v !=3D save && a->deq.head =3D=3D 0 && a->deq.tail =3D=3D 5 && a=
->deq.len =3D=3D 5 && a->deq.cap =3D=3D 8);
> +	ok1(malloc_sz =3D=3D sizeof(struct quad) * 8);
> +
> +	deq_reset(a);
> +
> +	return exit_status();
> +}
> diff --git a/ccan/deque/test/run3.c b/ccan/deque/test/run3.c
> new file mode 100644
> index 0000000..91f1444
> --- /dev/null
> +++ b/ccan/deque/test/run3.c
> @@ -0,0 +1,37 @@
> +#include <ccan/failtest/failtest_override.h>
> +#include <ccan/failtest/failtest.h>
> +#include <ccan/deque/deque.h>
> +/* Include the C files directly. */
> +#include <ccan/deque/deque.c>
> +#include <ccan/tap/tap.h>
> +
> +int main(int argc, char *argv[])
> +{
> +	failtest_init(argc, argv);
> +	plan_tests(18);
> +
> +	DEQ_WRAP(char) *a;
> +	ok1(deq_new(a, 2, DEQ_SHRINK_IF_EMPTY) =3D=3D 0); // two mallocs
> +	ok1(a && deq_push(a, 'a') =3D=3D 1);
> +	ok1(a && deq_push(a, 'b') =3D=3D 1);
> +	ok1(a && deq_push(a, 'c') =3D=3D 1); // malloc to grow
> +
> +	char t;
> +	ok1(a && deq_pop(a, &t) =3D=3D 1);
> +	ok1(a && deq_pop(a, &t) =3D=3D 1);
> +	ok1(a && deq_pop(a, &t) =3D=3D 1);   // malloc to shrink
> +
> +	if (a) deq_free(a);
> +
> +	DEQ_WRAP(char) *b;
> +	ok1(deq_new(b, 5, DEQ_SHRINK_AT_20PCT) =3D=3D 0); // two mallocs
> +	int i;
> +	for (i =3D 0; b && i < 6; i++)
> +		ok1(deq_push(b, i + 'A') =3D=3D 1); // last iteration mallocs to grow
> +	for (; b && i > 2; i--)
> +		ok1(deq_pop(b, &t) =3D=3D 1);       // last iteration mallocs to shrink
> +
> +	if (b) deq_free(b);
> +
> +	failtest_exit(exit_status());
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWgK/pAAoJEGw4ysog2bOSw0sQALK+upY2TA9i4F26TYOxJA+e
93MgL1p8TmSW8x0bXGy7t1+Eh7jBFvJSfFkJz5wMpF+Suf8fjvGn92XdZO59ku0M
oh7iNVrb5Rnhl7lKhfNv4qCXTQ3cCtXcGXM7D+/PTpDVstKcSX6bu+nB0MlJAVuo
LpSA/ABvqW8w96hvXBt4kj4sEOXuxMEAxUDklRovsVxmRe8i4s9R/Xu5Fvd+TNuh
+hlUclykkGCYtdjxosBEfhb7sWAemnIrxolgE2jv34rlNcFptLanVlf6FUv8cqhD
5/Kr0oXWg97F7/xIMZFiFKaOpx8pIuC+NyU6lObnDAseXajpIa7O3NS8+NIMlK35
OPhnWwCJT2bLheqvRgNtjB/n6n2rg76Cf0PgjOR5wlEu5tCDNeuRt97xpb8zevat
tA5eOVFpdYFZZAHZIvdqR1LUN5lKNxvbiB5SPKDVMo8dmKVEcwmoCFU2/6HLBjtz
dxrH44ZqwrSPxaFagGTnSBMO6KJemyCyRe89H+6KNQrO3STSHiaAEDns6WkNStWM
BTxgJn751cK5EnZqY3jVm1xM6kDDglZYjI8oxaLpalQa79HRcSXRaZm2Gn969lx5
PN5zWdQ7jUMJ5g8etcQpMhjZxHjoDDYeyJsubFBMClw3BtHUdTkz4CBuUONTdNri
g+CrJwBKgYQnhTYVwBxj
=KL5/
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

--===============3310713068880143740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============3310713068880143740==--
