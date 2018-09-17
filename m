From: Rusty Russell <rusty@rustcorp.com.au>
Subject: ccan/membuf
Date: Mon, 17 Sep 2018 10:59:47 +0930
Message-ID: <87bm8wc3n8.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42D7pT5zv7zDqpy
 for <ccan@lists.ozlabs.org>; Mon, 17 Sep 2018 11:29:53 +1000 (AEST)
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

Hi all,

        I've found myself open-coding linear memory queues in several
places; particularly for strings which want memory continuity.  They're
pretty inefficient (realloc, memmove) for a huge number of elements, but
they're great for things you expect to be small.

I'm adapting my code to use it now, but here's the patch if anyone is
interested in nitpicking the API!

Cheers,
Rusty.

Subject: membuf: new module for linear memory buffers.

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

diff --git a/ccan/membuf/LICENSE b/ccan/membuf/LICENSE
new file mode 120000
index 00000000..2354d129
--- /dev/null
+++ b/ccan/membuf/LICENSE
@@ -0,0 +1 @@
+../../licenses/BSD-MIT
\ No newline at end of file
diff --git a/ccan/membuf/_info b/ccan/membuf/_info
new file mode 100644
index 00000000..bdcbce2b
--- /dev/null
+++ b/ccan/membuf/_info
@@ -0,0 +1,51 @@
+#include "config.h"
+#include <stdio.h>
+#include <string.h>
+
+/**
+ * membuf - simple linear memory buffer routines.
+ *
+ * It's common to want a linear memory buffer, where you can get memory on
+ * the end, and consume memory from the start.  The details of actually
+ * when to enlarge or move the buffer are slightly nontrivial, so they're
+ * encapsulated here.
+ *
+ * License: BSD-MIT
+ * Author: Rusty Russell <rusty@rustcorp.com.au>
+ *
+ * Example:
+ * #include <ccan/membuf/membuf.h>
+ * #include <string.h>
+ * #include <stdio.h>
+ *
+ * // Given "hello world" outputs helloworld
+ * // Given "hello there world" outputs hellothereworld
+ * int main(int argc, char *argv[])
+ * {
+ *	MEMBUF(char) charbuf;
+ *
+ *	membuf_init(&charbuf, malloc(10), 10, membuf_realloc);
+ *
+ *	for (int i = 1; i < argc; i++)
+ *		strcpy(membuf_add(&charbuf, strlen(argv[i])), argv[i]);
+ *
+ *	// This is dumb, we could do all at once, but shows technique.
+ *	while (membuf_num_elems(&charbuf) > 0)
+ *		printf("%c", *(char *)membuf_consume(&charbuf, 1));
+ *	printf("\n");
+ *	return 0;
+ * }
+ */
+int main(int argc, char *argv[])
+{
+	/* Expect exactly one argument */
+	if (argc != 2)
+		return 1;
+
+	if (strcmp(argv[1], "depends") == 0) {
+		printf("ccan/tcon\n");
+		return 0;
+	}
+
+	return 1;
+}
diff --git a/ccan/membuf/membuf.c b/ccan/membuf/membuf.c
new file mode 100644
index 00000000..b3b2f08d
--- /dev/null
+++ b/ccan/membuf/membuf.c
@@ -0,0 +1,60 @@
+/* MIT (BSD) license - see LICENSE file for details */
+#include <ccan/membuf/membuf.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+
+void membuf_init_(struct membuf *mb,
+		  void *elems, size_t num_elems, size_t elemsize,
+		  void *(*expandfn)(struct membuf *, void *, size_t))
+{
+
+	mb->start = mb->end = 0;
+	mb->max_elems = num_elems;
+	mb->elems = elems;
+	mb->expandfn = expandfn;
+}
+
+size_t membuf_prepare_space_(struct membuf *mb,
+			     size_t num_extra, size_t elemsize)
+{
+	char *oldstart = membuf_elems_(mb, elemsize);
+
+	/* Always reset in the trivial empty case. */
+	if (mb->start == mb->end)
+		mb->start = mb->end = 0;
+	
+	if (membuf_num_space_(mb) >= num_extra)
+		return 0;
+
+	/* There are two ways to make space: enlarge buffer, and memmove
+	 * down.  We use a simple heuristic: if we are using less than half
+	 * the buffer, and memmove would get us sufficient space, do that. */
+	if (membuf_num_elems_(mb) <= mb->max_elems / 2
+	    && membuf_num_elems_(mb) + num_extra <= mb->max_elems) {
+		memmove(mb->elems, oldstart, (mb->end - mb->start) * elemsize);
+		mb->end -= mb->start;
+		mb->start = 0;
+	} else {
+		void *expand;
+
+		/* Since we're going to expand, at least double. */
+		if (num_extra < mb->max_elems)
+			num_extra = mb->max_elems;
+
+		expand = mb->expandfn(mb, mb->elems,
+				      (mb->max_elems + num_extra) * elemsize);
+		if (!expand) {
+			errno = ENOMEM;
+		} else {
+			mb->max_elems += num_extra;
+			mb->elems = expand;
+		}
+	}
+	return (char *)membuf_elems_(mb, elemsize) - oldstart;
+}
+
+void *membuf_realloc(struct membuf *mb, void *rawelems, size_t newsize)
+{
+	return realloc(rawelems, newsize);
+}
diff --git a/ccan/membuf/membuf.h b/ccan/membuf/membuf.h
new file mode 100644
index 00000000..dcb48752
--- /dev/null
+++ b/ccan/membuf/membuf.h
@@ -0,0 +1,209 @@
+/* MIT (BSD) license - see LICENSE file for details */
+#ifndef CCAN_MEMBUF_H
+#define CCAN_MEMBUF_H
+#include "config.h"
+#include <assert.h>
+#include <ccan/tcon/tcon.h>
+
+/**
+ * struct membuf - representation of a memory buffer.
+ *
+ * It's exposed here to allow you to embed it and so we can inline the
+ * trivial functions.
+ */
+struct membuf {
+	/* These are the cursors into buf elements */
+	size_t start;
+	size_t end;
+
+	/* Number of elements in buf */
+	size_t max_elems;
+	/* The buffer; at this low-level, untyped. */
+	char *elems;
+
+	void *(*expandfn)(struct membuf *, void *elems, size_t max_elems);
+};
+
+/**
+ * MEMBUF - declare a type-specific membuf
+ * @membertype: type for this buffer's values.
+ *
+ * You use this to create your own typed membuf.
+ *
+ * Example:
+ *	MEMBUF(int *) intp_membuf;
+ *	printf("Address of our int * membuf = %p\n", &intp_membuf);
+ */
+#define MEMBUF(membertype)					\
+	TCON_WRAP(struct membuf, membertype canary)
+
+/**
+ * membuf_init - initialize a type-specfic membuf.
+ * @mb: the MEMBUF() declared membuf.
+ * @elems: the initial buffer, if any.
+ * @max_elems: the initial space @elems, in number of elements.
+ * @expandfn: the function to enlarge buf (eg. membuf_realloc).
+ *
+ * Example:
+ *	membuf_init(&intp_membuf, NULL, 0, membuf_realloc);
+ */
+#define membuf_init(mb, elems, num, expandfn)				\
+	membuf_init_(tcon_unwrap(tcon_check_ptr((mb), canary, (elems))), \
+		     (elems), (num), tcon_sizeof((mb), canary), (expandfn))
+
+void membuf_init_(struct membuf *mb,
+		  void *elems, size_t max_elems, size_t elemsize,
+		  void *(*expandfn)(struct membuf *, void *, size_t));
+
+/**
+ * membuf_realloc - simple membuf helper to do realloc().
+ *
+ * Assumes initial buffer was NULL, or malloc().
+ */
+void *membuf_realloc(struct membuf *mb, void *rawelems, size_t newsize);
+
+/**
+ * membuf_num_elems - number of populated elements in the membuf.
+ * @mb: the MEMBUF() declared membuf.
+ */
+#define membuf_num_elems(mb) membuf_num_elems_(tcon_unwrap(mb))
+
+static inline size_t membuf_num_elems_(const struct membuf *mb)
+{
+	return mb->end - mb->start;
+}
+
+/**
+ * membuf_elems - pointer to the populated elements in the membuf.
+ * @mb: the MEMBUF() declared membuf.
+ */
+#define membuf_elems(mb)						\
+	tcon_cast_ptr(mb, canary,					\
+		      membuf_elems_(tcon_unwrap(mb), tcon_sizeof((mb), canary)))
+
+static inline void *membuf_elems_(const struct membuf *mb, size_t elemsize)
+{
+	return mb->elems + mb->start * elemsize;
+}
+
+/**
+ * membuf_consume - we've used up this many membuf_elems.
+ * @mb: the MEMBUF() declared membuf.
+ * @num: the number of elems.
+ *
+ * Returns a pointer to the old start of membuf, so you can mark consumed
+ * and actually process in a single call.
+ */
+#define membuf_consume(mb, num)						\
+	tcon_cast_ptr(mb, canary,					\
+		      membuf_consume_(tcon_unwrap(mb), (num),		\
+				      tcon_sizeof((mb), canary)))
+
+static inline void *membuf_consume_(struct membuf *mb,
+				    size_t num, size_t elemsize)
+{
+	void *old_start = membuf_elems_(mb, elemsize);
+	assert(num <= membuf_num_elems_(mb));
+	mb->start += num;
+
+	return old_start;
+}
+
+/**
+ * membuf_num_space - number of unpopulated elements at end of the membuf.
+ * @mb: the MEMBUF() declared membuf.
+ */
+#define membuf_num_space(mb) membuf_num_space_(tcon_unwrap(mb))
+
+static inline size_t membuf_num_space_(const struct membuf *mb)
+{
+	return mb->max_elems - mb->end;
+}
+
+/**
+ * membuf_space - pointer to the unpopulated elements at end of membuf.
+ * @mb: the MEMBUF() declared membuf.
+ */
+#define membuf_space(mb)						\
+	tcon_cast_ptr(mb, canary,					\
+		      membuf_space_(tcon_unwrap(mb), tcon_sizeof((mb), canary)))
+
+static inline void *membuf_space_(struct membuf *mb, size_t elemsize)
+{
+	return mb->elems + mb->end * elemsize;
+}
+
+/**
+ * membuf_prepare_space - internal routine to make sure we've got space.
+ * @mb: the MEMBUF() declared membuf.
+ * @num_extra: the minimum number of elements of space we need
+ *
+ * Usually you wouldn't call this yourself; see membuf_add() below.  But
+ * you might use this if you need to know about moves within mb->elements
+ * so you can adjust your own pointers/offsets.
+ *
+ * It returns the offset *in bytes* between the old locations and the new.
+ * This is because it may not be a whole number of elements, in the case
+ * of realloc!
+ *
+ * If you want to check for expandfn failure (which sets errno to
+ * ENOMEM), you can check if membuf_num_space() is < num_extra which will
+ * never otherwise happen.
+ */
+#define membuf_prepare_space(mb, num_extra)			\
+	membuf_prepare_space_(tcon_unwrap(mb),			\
+			      (num_extra),			\
+			      tcon_sizeof((mb), canary))
+
+size_t membuf_prepare_space_(struct membuf *mb,
+			     size_t num_extra, size_t elemsize);
+
+/**
+ * membuf_add - add to the end of the membuf.
+ * @mb: the MEMBUF() declared membuf.
+ * @num: the number of elements (must be that much space available!).
+ *
+ * Returns the pointer to the space just added, in case you want to
+ * populate it afterwards.
+ *
+ * Note that this may invalidate existing buf pointers!  If you want to
+ * avoid that, call membuf_prepare_space(mb, num) first.
+ */
+#define membuf_add(mb, num)						\
+	tcon_cast_ptr(mb, canary,					\
+		      membuf_add_(tcon_unwrap(mb), (num),		\
+				  tcon_sizeof((mb), canary)))
+
+static inline void *membuf_add_(struct membuf *mb, size_t num, size_t elemsize)
+{
+	void *oldend;
+	membuf_prepare_space_(mb, num, elemsize);
+
+	oldend = membuf_space_(mb, elemsize);
+	/* We assume expandfn succeeded. */
+	assert(num <= membuf_num_space_(mb));
+	mb->end += num;
+
+	return oldend;
+}
+
+/**
+ * membuf_cleanup - reset membuf, return elems array for freeing.
+ * @mb: the MEMBUF() declared membuf.
+ *
+ * The mb will be empty after this, and crash if you try to expand it.
+ * You can membuf_init() it again, however.
+ *
+ * Example:
+ *	free(membuf_cleanup(&intp_membuf));
+ */
+#define membuf_cleanup(mb) membuf_cleanup_(tcon_unwrap(mb))
+
+static inline void *membuf_cleanup_(struct membuf *mb)
+{
+	mb->start = mb->end = mb->max_elems = 0;
+	mb->expandfn = NULL;
+
+	return mb->elems;
+}
+#endif /* CCAN_MEMBUF_H */
diff --git a/ccan/membuf/test/run.c b/ccan/membuf/test/run.c
new file mode 100644
index 00000000..08836e2a
--- /dev/null
+++ b/ccan/membuf/test/run.c
@@ -0,0 +1,103 @@
+#include <ccan/membuf/membuf.h>
+#include <stdlib.h>
+#include <string.h>
+
+static int num_realloc, num_memmove;
+
+void *memmove_test(void *dest, const void *src, size_t n);
+void *realloc_test(void *ptr, size_t size);
+
+void *memmove_test(void *dest, const void *src, size_t n)
+{
+	num_memmove++;
+	return memmove(dest, src, n);
+}
+
+void *realloc_test(void *ptr, size_t size)
+{
+	num_realloc++;
+	return realloc(ptr, size);
+}
+
+#undef memmove
+#define memmove memmove_test
+
+#undef realloc
+#define realloc realloc_test
+
+/* Include the C files directly. */
+#include <ccan/membuf/membuf.c>
+#include <ccan/tap/tap.h>
+
+int main(void)
+{
+	int prev_reallocs;
+	MEMBUF(int) intbuf;
+
+	/* This is how many tests you plan to run */
+	plan_tests(13 + 100 * 4 + 999);
+
+	membuf_init(&intbuf, malloc(10 * sizeof(int)), 10, membuf_realloc);
+	ok1(membuf_num_elems(&intbuf) == 0);
+	ok1(membuf_num_space(&intbuf) == 10);
+	ok1(membuf_space(&intbuf) != NULL);
+
+	/* Add 100 ints. */
+	for (int i = 0; i < 100; i++) {
+		memcpy(membuf_add(&intbuf, 1), &i, sizeof(i));
+		ok1(membuf_num_elems(&intbuf) == i+1);
+
+		/* Make sure membuf_elems works */
+		if (i == 0)
+			ok1(memcmp(membuf_elems(&intbuf), &i, sizeof(i)) == 0);
+	}
+
+
+	/* Pull 100 ints. */
+	for (int i = 0; i < 100; i++) {
+		ok1(memcmp(membuf_consume(&intbuf, 1), &i, sizeof(i)) == 0);
+		ok1(membuf_num_elems(&intbuf) == 100 - i - 1);
+	}
+
+	/* Should not have continuously realloced or memmoved */
+	ok1(num_realloc < 10);
+	ok1(num_memmove == 0);
+
+	/* Doing it again should give 0 reallocs. */
+	prev_reallocs = num_realloc;
+	for (int i = 0; i < 100; i++) {
+		memcpy(membuf_add(&intbuf, 1), &i, sizeof(i));
+		ok1(membuf_num_elems(&intbuf) == i+1);
+	}
+	ok1(num_realloc == prev_reallocs);
+	ok1(num_memmove == 0);
+
+	membuf_consume(&intbuf, 100);
+
+	/* Keep a single element in the queue, make sure we don't realloc! */
+	for (int i = 0; i < 1000; i++) {
+		memcpy(membuf_add(&intbuf, 1), &i, sizeof(i));
+		if (i > 0) {
+			int prev = i - 1;
+			ok1(memcmp(membuf_consume(&intbuf, 1),
+				   &prev, sizeof(prev)) == 0);
+		}
+	}
+
+	ok1(num_realloc == prev_reallocs);
+	/* Should have moved occasionally. */
+	ok1(num_memmove < 20);
+
+	ok1(membuf_consume(&intbuf, 1));
+	ok1(membuf_num_elems(&intbuf) == 0);
+	
+	/* Force it to more-than-double; make sure that works! */
+	memset(membuf_add(&intbuf, 300), 0, 300*sizeof(int));
+	ok1(membuf_num_elems(&intbuf) == 300);
+
+	/* Free buffer so valgrind is happy. */
+	free(membuf_cleanup(&intbuf));
+
+	/* This exits depending on whether all tests passed */
+	return exit_status();
+}
