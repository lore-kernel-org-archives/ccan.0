From: Rusty Russell <rusty@rustcorp.com.au>
Subject: ccan/structeq: rewrite for safety.
Date: Wed, 04 Jul 2018 13:41:24 +0930
Message-ID: <874lhf4p3n.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L6xs0VRKzF1RK
 for <ccan@lists.ozlabs.org>; Wed,  4 Jul 2018 14:11:45 +1000 (AEST)
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

From 92be2eff52133138e4975308f6e731c46b53ace1 Mon Sep 17 00:00:00 2001
From: Rusty Russell <rusty@rustcorp.com.au>
Date: Wed, 4 Jul 2018 13:37:28 +0930
Subject: [PATCH] ccan/structeq: make it safe when there's padding.

ccan/cppmagic FTW!

The only issue is that we can't tell if there's padding or they've missed
a member, so we add a padding bytes count, so they'll get an error if it
(for example) the structure adds a new member later.

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
---
 ccan/crypto/shachain/shachain.h               |  4 +-
 ccan/structeq/LICENSE                         |  2 +-
 ccan/structeq/_info                           | 20 ++++----
 ccan/structeq/structeq.h                      | 46 +++++++++++++++----
 ccan/structeq/test/compile_fail-different.c   |  4 +-
 .../test/compile_fail-expect-any-padding.c    | 19 ++++++++
 .../test/compile_fail-expect-padding.c        | 19 ++++++++
 .../test/compile_fail-unexpceted-padding.c    | 20 ++++++++
 ccan/structeq/test/run-with-padding.c         | 32 +++++++++++++
 ccan/structeq/test/run.c                      |  8 ++--
 10 files changed, 149 insertions(+), 25 deletions(-)
 create mode 100644 ccan/structeq/test/compile_fail-expect-any-padding.c
 create mode 100644 ccan/structeq/test/compile_fail-expect-padding.c
 create mode 100644 ccan/structeq/test/compile_fail-unexpceted-padding.c
 create mode 100644 ccan/structeq/test/run-with-padding.c

diff --git a/ccan/crypto/shachain/shachain.h b/ccan/crypto/shachain/shachain.h
index d95b9736..3f9dcf6a 100644
--- a/ccan/crypto/shachain/shachain.h
+++ b/ccan/crypto/shachain/shachain.h
@@ -116,6 +116,8 @@ bool shachain_add_hash(struct shachain *chain,
  *
  * Example:
  * #include <ccan/structeq/structeq.h>
+ * // Defines sha256_eq
+ * STRUCTEQ_DEF(sha256, 0, u);
  *
  * static void next_hash(const struct sha256 *hash)
  * {
@@ -127,7 +129,7 @@ bool shachain_add_hash(struct shachain *chain,
  *	else {
  *		struct sha256 check;
  *		assert(shachain_get_hash(&chain, index+1, &check));
- *		assert(structeq(&check, hash));
+ *		assert(sha256_eq(&check, hash));
  *	}
  * }
  */
diff --git a/ccan/structeq/LICENSE b/ccan/structeq/LICENSE
index b7951dab..2354d129 120000
--- a/ccan/structeq/LICENSE
+++ b/ccan/structeq/LICENSE
@@ -1 +1 @@
-../../licenses/CC0
\ No newline at end of file
+../../licenses/BSD-MIT
\ No newline at end of file
diff --git a/ccan/structeq/_info b/ccan/structeq/_info
index d66e2960..1ac8d56d 100644
--- a/ccan/structeq/_info
+++ b/ccan/structeq/_info
@@ -6,9 +6,11 @@
  * structeq - bitwise comparison of structs.
  *
  * This is a replacement for memcmp, which checks the argument types are the
- * same.
+ * same, and takes into account padding in the structure.  When there is no
+ * padding, it becomes a memcmp at compile time (assuming a
+ * constant-optimizing compiler).
  *
- * License: CC0 (Public domain)
+ * License: BSD-MIT
  * Author: Rusty Russell <rusty@rustcorp.com.au>
  *
  * Example:
@@ -19,26 +21,22 @@
  *	struct mydata {
  *		int start, end;
  *	};
+ *	// Defines mydata_eq(a, b)
+ *	STRUCTEQ_DEF(mydata, 0, start, end);
  *	
  *	int main(void)
  *	{
  *		struct mydata a, b;
  *	
- *		// No padding in struct, otherwise this doesn't work!
- *		BUILD_ASSERT(sizeof(a) == sizeof(a.start) + sizeof(a.end));
- *	
  *		a.start = 100;
  *		a.end = 101;
  *	
- *		b.start = 100;
- *		b.end = 101;
- *	
  *		// They are equal.
- *		assert(structeq(&a, &b));
+ *		assert(mydata_eq(&a, &b));
  *	
  *		b.end++;
  *		// Now they are not.
- *		assert(!structeq(&a, &b));
+ *		assert(!mydata_eq(&a, &b));
  *	
  *		return 0;
  *	}
@@ -50,6 +48,8 @@ int main(int argc, char *argv[])
 		return 1;
 
 	if (strcmp(argv[1], "depends") == 0) {
+		printf("ccan/build_assert\n");
+		printf("ccan/cppmagic\n");
 		return 0;
 	}
 
diff --git a/ccan/structeq/structeq.h b/ccan/structeq/structeq.h
index 3af20c53..6b90754c 100644
--- a/ccan/structeq/structeq.h
+++ b/ccan/structeq/structeq.h
@@ -1,17 +1,45 @@
-/* CC0 (Public domain) - see LICENSE file for details */
+/* MIT (BSD) license - see LICENSE file for details */
 #ifndef CCAN_STRUCTEQ_H
 #define CCAN_STRUCTEQ_H
+#include <ccan/build_assert/build_assert.h>
+#include <ccan/cppmagic/cppmagic.h>
 #include <string.h>
+#include <stdbool.h>
 
 /**
- * structeq - are two structures bitwise equal (including padding!)
- * @a: a pointer to a structure
- * @b: a pointer to a structure of the same type.
+ * STRUCTEQ_DEF - define an ..._eq function to compare two structures.
+ * @sname: name of the structure, and function (<sname>_eq) to define.
+ * @padbytes: number of bytes of expected padding, or -1 if unknown.
+ * @...: name of every member of the structure.
  *
- * If you *know* a structure has no padding, you can memcmp them.  At
- * least this way, the compiler will issue a warning if the structs are
- * different types!
+ * This generates a single memcmp() call in the common case where the
+ * structure contains no padding.  Since it can't tell the difference between
+ * padding and a missing member, @padbytes can be used to assert that
+ * there isn't any, or how many we expect.  -1 means "expect some", since
+ * it can be platform dependent.
  */
-#define structeq(a, b) \
-	(memcmp((a), (b), sizeof(*(a)) + 0 * sizeof((a) == (b))) == 0)
+#define STRUCTEQ_DEF(sname, padbytes, ...)				\
+static inline bool CPPMAGIC_GLUE2(sname, _eq)(const struct sname *_a, \
+					      const struct sname *_b) \
+{									\
+	BUILD_ASSERT(((padbytes) < 0 &&					\
+		      CPPMAGIC_JOIN(+, CPPMAGIC_MAP(STRUCTEQ_MEMBER_SIZE_, \
+						    __VA_ARGS__))	\
+		      > sizeof(*_a))					\
+		     || CPPMAGIC_JOIN(+, CPPMAGIC_MAP(STRUCTEQ_MEMBER_SIZE_, \
+						      __VA_ARGS__))	\
+		     + (padbytes) == sizeof(*_a));			\
+	if (CPPMAGIC_JOIN(+, CPPMAGIC_MAP(STRUCTEQ_MEMBER_SIZE_, __VA_ARGS__)) \
+	    == sizeof(*_a))						\
+		return memcmp(_a, _b, sizeof(*_a)) == 0;		\
+	else								\
+		return CPPMAGIC_JOIN(&&,				\
+				     CPPMAGIC_MAP(STRUCTEQ_MEMBER_CMP_, \
+						  __VA_ARGS__));	\
+}
+
+/* Helpers */
+#define STRUCTEQ_MEMBER_SIZE_(m) sizeof((_a)->m)
+#define STRUCTEQ_MEMBER_CMP_(m) memcmp(&_a->m, &_b->m, sizeof(_a->m)) == 0
+
 #endif /* CCAN_STRUCTEQ_H */
diff --git a/ccan/structeq/test/compile_fail-different.c b/ccan/structeq/test/compile_fail-different.c
index 9a08503f..f09a4454 100644
--- a/ccan/structeq/test/compile_fail-different.c
+++ b/ccan/structeq/test/compile_fail-different.c
@@ -8,6 +8,8 @@ struct mydata2 {
 	int start, end;
 };
 
+STRUCTEQ_DEF(mydata1, 0, start, end);
+
 int main(void)
 {
 	struct mydata1 a = { 0, 100 };
@@ -18,5 +20,5 @@ int main(void)
 #endif
 		b = { 0, 100 };
 
-	return structeq(&a, &b);
+	return mydata1_eq(&a, &b);
 }
diff --git a/ccan/structeq/test/compile_fail-expect-any-padding.c b/ccan/structeq/test/compile_fail-expect-any-padding.c
new file mode 100644
index 00000000..321aef3a
--- /dev/null
+++ b/ccan/structeq/test/compile_fail-expect-any-padding.c
@@ -0,0 +1,19 @@
+#include <ccan/structeq/structeq.h>
+
+struct mydata {
+	int start, end;
+};
+#ifdef FAIL
+#define PADDING -1
+#else
+#define PADDING 0
+#endif
+
+STRUCTEQ_DEF(mydata, PADDING, start, end);
+
+int main(void)
+{
+	struct mydata a = { 0, 100 };
+
+	return mydata_eq(&a, &a);
+}
diff --git a/ccan/structeq/test/compile_fail-expect-padding.c b/ccan/structeq/test/compile_fail-expect-padding.c
new file mode 100644
index 00000000..cec9f846
--- /dev/null
+++ b/ccan/structeq/test/compile_fail-expect-padding.c
@@ -0,0 +1,19 @@
+#include <ccan/structeq/structeq.h>
+
+struct mydata {
+	int start, end;
+};
+#ifdef FAIL
+#define PADDING 1
+#else
+#define PADDING 0
+#endif
+
+STRUCTEQ_DEF(mydata, PADDING, start, end);
+
+int main(void)
+{
+	struct mydata a = { 0, 100 };
+
+	return mydata_eq(&a, &a);
+}
diff --git a/ccan/structeq/test/compile_fail-unexpceted-padding.c b/ccan/structeq/test/compile_fail-unexpceted-padding.c
new file mode 100644
index 00000000..af926ce1
--- /dev/null
+++ b/ccan/structeq/test/compile_fail-unexpceted-padding.c
@@ -0,0 +1,20 @@
+#include <ccan/structeq/structeq.h>
+
+struct mydata {
+	int start, end;
+	int pad;
+};
+#ifdef FAIL
+#define PADDING 0
+#else
+#define PADDING sizeof(int)
+#endif
+
+STRUCTEQ_DEF(mydata, PADDING, start, end);
+
+int main(void)
+{
+	struct mydata a = { 0, 100 };
+
+	return mydata_eq(&a, &a);
+}
diff --git a/ccan/structeq/test/run-with-padding.c b/ccan/structeq/test/run-with-padding.c
new file mode 100644
index 00000000..d18b3e55
--- /dev/null
+++ b/ccan/structeq/test/run-with-padding.c
@@ -0,0 +1,32 @@
+#include <ccan/structeq/structeq.h>
+#include <ccan/tap/tap.h>
+
+/* In theory, this could be generated without padding, if alignof(int) were 0,
+ * and test would fail.  Call me when that happens. */
+struct mydata {
+	char start;
+	int end;
+};
+
+STRUCTEQ_DEF(mydata, sizeof(int) - sizeof(char), start, end);
+
+int main(void)
+{
+	struct mydata a, b;
+
+	/* This is how many tests you plan to run */
+	plan_tests(3);
+
+	a.start = 0;
+	a.end = 100;
+	ok1(mydata_eq(&a, &a));
+
+	b = a;
+	ok1(mydata_eq(&a, &b));
+
+	b.end++;
+	ok1(!mydata_eq(&a, &b));
+
+	/* This exits depending on whether all tests passed */
+	return exit_status();
+}
diff --git a/ccan/structeq/test/run.c b/ccan/structeq/test/run.c
index 9ecb4b7d..9efab338 100644
--- a/ccan/structeq/test/run.c
+++ b/ccan/structeq/test/run.c
@@ -5,6 +5,8 @@ struct mydata {
 	int start, end;
 };
 
+STRUCTEQ_DEF(mydata, 0, start, end);
+
 int main(void)
 {
 	struct mydata a, b;
@@ -14,13 +16,13 @@ int main(void)
 
 	a.start = 0;
 	a.end = 100;
-	ok1(structeq(&a, &a));
+	ok1(mydata_eq(&a, &a));
 
 	b = a;
-	ok1(structeq(&a, &b));
+	ok1(mydata_eq(&a, &b));
 
 	b.end++;
-	ok1(!structeq(&a, &b));
+	ok1(!mydata_eq(&a, &b));
 
 	/* This exits depending on whether all tests passed */
 	return exit_status();
-- 
2.17.1
