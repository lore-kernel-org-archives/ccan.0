From: Dan Good <dan@dancancode.com>
Subject: Re: [PATCH 5/5] altstack: Don't log internal calls in test
 cases
Date: Sun, 12 Jun 2016 02:10:18 +0000
Message-ID: <CACNkOJPSMffBBHiS=ti6-TdQRrvvoTGqENX1hqgpJAxYxGYnQQ@mail.gmail.com>
References: <1464943323-8225-1-git-send-email-david@gibson.dropbear.id.au>
 <1464943323-8225-6-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1300370833253090450=="
Return-path: <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRzs60JHxzDqGs
 for <ccan@lists.ozlabs.org>; Sun, 12 Jun 2016 12:10:33 +1000 (AEST)
Received: from mail-yw0-f176.google.com ([209.85.161.176]) by
 mrelay.perfora.net (mreueus002) with ESMTPSA (Nemesis) id
 0LhuDc-1bpylz2sGA-00nAyp for <ccan@lists.ozlabs.org>; Sun, 12 Jun 2016
 04:10:29 +0200
Received: by mail-yw0-f176.google.com with SMTP id g20so99616044ywb.0
 for <ccan@lists.ozlabs.org>; Sat, 11 Jun 2016 19:10:29 -0700 (PDT)
In-Reply-To: <1464943323-8225-6-git-send-email-david@gibson.dropbear.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Errors-To: ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+gclcc-ccan=m.gmane.org@lists.ozlabs.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: ccan@lists.ozlabs.org
List-Id: ccan@lists.ozlabs.org

--===============1300370833253090450==
Content-Type: multipart/alternative; boundary=001a11c04d6c90979d05350b46d7

--001a11c04d6c90979d05350b46d7
Content-Type: text/plain; charset=UTF-8

Hairy macros?  From the author of the cppmagic module, I shall take that as
a compliment.

The purpose of the setcall macro and related checks is ensure the
correctness of the error path, i.e. if setrlimit ran before a failure, it
must run again to undo the first; if mmap ran before a failure, munmap must
run after.  I find it very reassuring to know these tests exist and pass.
Do you see no value in that?

I don't really see a need to optimize for changing altstack's
implementation.  It's less than a hundred lines of code, and only ten tests
using setcall.  Can you tell me why you think it's important?

On Fri, Jun 3, 2016 at 4:40 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> altstack/test/run.c uses some hairy macros to intercept the standard
> library functions that altstack uses.  This has two purposes: 1) to
> conditionally cause those functions to fail, and thereby test altstack's
> error paths, and 2) log which of the library functions was called in each
> testcase.
>
> The second function isn't actually useful - for the purposes of testing the
> module, we want to check the actual behaviour, not what calls it made in
> what order to accomplish it.  Explicitly checking the calls makes it much
> harder to change altstack's implementation without breaking the tests.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  ccan/altstack/test/run.c | 73
> ++++++++++++++----------------------------------
>  1 file changed, 21 insertions(+), 52 deletions(-)
>
> diff --git a/ccan/altstack/test/run.c b/ccan/altstack/test/run.c
> index e109ccb..091d1f5 100644
> --- a/ccan/altstack/test/run.c
> +++ b/ccan/altstack/test/run.c
> @@ -20,18 +20,17 @@ enum {
>         sigaction_      = 1<<4,
>         munmap_         = 1<<5,
>  };
> -int fail, call1, call2;
> +int fail;
>  char *m_;
>  rlim_t msz_;
>  #define e(x) (900+(x))
>  #define seterr(x) (errno = e(x))
> -#define setcall(x) ((call1 |= !errno ? (x) : 0), (call2 |= errno ||
> state.out ? (x) : 0))
> -#define getrlimit(...)         (fail&getrlimit_        ?
> (seterr(getrlimit_),          -1) : (setcall(getrlimit_),
>  getrlimit(__VA_ARGS__)))
> -#define mmap(...)              (fail&mmap_             ? (seterr(mmap_),
>      (void *)-1) : (setcall(mmap_),          mmap(__VA_ARGS__)))
> -#define munmap(a, b)           (fail&munmap_           ?
> (seterr(munmap_),             -1) : (setcall(munmap_),
> munmap(m_=(a), msz_=(b))))
> -#define setrlimit(...)         (fail&setrlimit_        ?
> (seterr(setrlimit_),          -1) : (setcall(setrlimit_),
>  setrlimit(__VA_ARGS__)))
> -#define sigaltstack(...)       (fail&sigaltstack_      ?
> (seterr(sigaltstack_),        -1) : (setcall(sigaltstack_),
>  sigaltstack(__VA_ARGS__)))
> -#define sigaction(...)         (fail&sigaction_        ?
> (seterr(sigaction_),          -1) : (setcall(sigaction_),
>  sigaction(__VA_ARGS__)))
> +#define getrlimit(...)         (fail&getrlimit_        ?
> (seterr(getrlimit_),          -1) : getrlimit(__VA_ARGS__))
> +#define mmap(...)              (fail&mmap_             ? (seterr(mmap_),
>      (void *)-1) : mmap(__VA_ARGS__))
> +#define munmap(a, b)           (fail&munmap_           ?
> (seterr(munmap_),             -1) : munmap(m_=(a), msz_=(b)))
> +#define setrlimit(...)         (fail&setrlimit_        ?
> (seterr(setrlimit_),          -1) : setrlimit(__VA_ARGS__))
> +#define sigaltstack(...)       (fail&sigaltstack_      ?
> (seterr(sigaltstack_),        -1) : sigaltstack(__VA_ARGS__))
> +#define sigaction(...)         (fail&sigaction_        ?
> (seterr(sigaction_),          -1) : sigaction(__VA_ARGS__))
>
>  #define KiB (1024UL)
>  #define MiB (KiB*KiB)
> @@ -58,74 +57,48 @@ static void *wrap(void *i)
>         return wrap;
>  }
>
> -#define chkfail(x, y, z, c1, c2)                                       \
> +#define chkfail(x, y, z)                                               \
>         do {                                                            \
> -               call1 = 0;                                              \
> -               call2 = 0;                                              \
>                 errno = 0;                                              \
>                 ok1((fail = x) && (y));                                 \
>                 ok1(errno == (z));                                      \
> -               ok1(call1 == (c1));                                     \
> -               ok1(call2 == (c2));                                     \
>         } while (0);
>
> -#define chkok(y, z, c1, c2)                                            \
> +#define chkok(y, z)                                                    \
>         do {                                                            \
> -               call1 = 0;                                              \
> -               call2 = 0;                                              \
>                 errno = 0;                                              \
>                 fail = 0;                                               \
>                 ok1((y));                                               \
>                 ok1(errno == (z));                                      \
> -               ok1(call1 == (c1));                                     \
> -               ok1(call2 == (c2));                                     \
>         } while (0)
>
>  int main(void)
>  {
>         long pgsz = sysconf(_SC_PAGESIZE);
>
> -       plan_tests(50);
> +       plan_tests(28);
>
> -       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(getrlimit_),
> -               0,
> -               0);
> +       chkfail(getrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(getrlimit_));
>
> -       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(setrlimit_),
> -               getrlimit_,
> -               0);
> +       chkfail(setrlimit_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(setrlimit_));
>
> -       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(mmap_),
> -               getrlimit_|setrlimit_,
> -               setrlimit_);
> +       chkfail(mmap_,          altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(mmap_));
>
> -       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaltstack_),
> -               getrlimit_|setrlimit_|mmap_,
> -               setrlimit_|munmap_);
> +       chkfail(sigaltstack_,   altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaltstack_));
>
> -       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaction_),
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_,
> -               setrlimit_|munmap_|sigaltstack_);
> +       chkfail(sigaction_,     altstack(8*MiB, wrap, int2ptr(0), NULL) ==
> -1, e(sigaction_));
>
> -       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NULL)
> ==  1, e(munmap_),
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> -               setrlimit_|sigaltstack_|sigaction_);
> +       chkfail(munmap_,        altstack(8*MiB, wrap, int2ptr(0), NULL)
> ==  1, e(munmap_));
>         if (fail = 0, munmap(m_, msz_) == -1)
>                 err(1, "munmap");
>
> -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW);
>
>         // be sure segv catch is repeatable (SA_NODEFER)
> -       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> +       chkok(                  altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW);
>
>         used = 1;
> -       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> -               setrlimit_|sigaltstack_|sigaction_);
> +       chkfail(munmap_,        altstack(1*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW);
>         if (fail = 0, munmap(m_, msz_) == -1)
>                 err(1, "munmap");
>
> @@ -150,17 +123,13 @@ int main(void)
>         ok1(strcmp(buf, estr "\n") == 0);
>
>         used = 1;
> -       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW,
> -               getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_,
> -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> +       chkok(                  altstack(8*MiB, wrap, int2ptr(1000000),
> NULL) == -1, EOVERFLOW);
>
>         diag("used: %lu", used);
>         ok1(used >= 8*MiB - pgsz && used <= 8*MiB + pgsz);
>
>         used = 0;
> -       chkok(                  altstack(8*MiB, wrap, int2ptr(100000),
> NULL) == 0, 0,
> -
>  getrlimit_|setrlimit_|mmap_|sigaltstack_|sigaction_|munmap_,
> -               setrlimit_|munmap_|sigaltstack_|sigaction_);
> +       chkok(                  altstack(8*MiB, wrap, int2ptr(100000),
> NULL) == 0, 0);
>
>         used = 1;
>         altstack_rsp_save();
> --
> 2.5.5
>
>

--001a11c04d6c90979d05350b46d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGFpcnkgbWFjcm9zP8KgIEZyb20gdGhlIGF1dGhvciBvZiB0aGUgY3Bw
bWFnaWMgbW9kdWxlLCBJIHNoYWxsIHRha2UgdGhhdCBhcyBhIGNvbXBsaW1lbnQuPGRpdj48YnI+
PC9kaXY+PGRpdj5UaGUgcHVycG9zZSBvZiB0aGUgc2V0Y2FsbCBtYWNybyBhbmQgcmVsYXRlZCBj
aGVja3MgaXMgZW5zdXJlIHRoZSBjb3JyZWN0bmVzcyBvZiB0aGUgZXJyb3IgcGF0aCwgaS5lLiBp
ZiBzZXRybGltaXQgcmFuIGJlZm9yZSBhIGZhaWx1cmUsIGl0IG11c3QgcnVuIGFnYWluIHRvIHVu
ZG8gdGhlIGZpcnN0OyBpZiBtbWFwIHJhbiBiZWZvcmUgYSBmYWlsdXJlLCBtdW5tYXAgbXVzdCBy
dW4gYWZ0ZXIuwqAgSSBmaW5kIGl0IHZlcnkgcmVhc3N1cmluZyB0byBrbm93IHRoZXNlIHRlc3Rz
IGV4aXN0IGFuZCBwYXNzLsKgIERvIHlvdSBzZWUgbm8gdmFsdWUgaW4gdGhhdD88L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkkgZG9uJiMzOTt0IHJlYWxseSBzZWUgYSBuZWVkIHRvIG9wdGltaXpl
IGZvciBjaGFuZ2luZyBhbHRzdGFjayYjMzk7cyBpbXBsZW1lbnRhdGlvbi7CoCBJdCYjMzk7cyBs
ZXNzIHRoYW4gYSBodW5kcmVkIGxpbmVzIG9mIGNvZGUsIGFuZCBvbmx5IHRlbiB0ZXN0cyB1c2lu
ZyBzZXRjYWxsLsKgIENhbiB5b3UgdGVsbCBtZSB3aHkgeW91IHRoaW5rIGl0JiMzOTtzIGltcG9y
dGFudD88L2Rpdj48ZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0
ciI+T24gRnJpLCBKdW4gMywgMjAxNiBhdCA0OjQwIEFNIERhdmlkIEdpYnNvbiAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdSI+ZGF2aWRAZ2lic29uLmRyb3Bi
ZWFyLmlkLmF1PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPmFsdHN0YWNrL3Rlc3QvcnVuLmMgdXNlcyBzb21lIGhhaXJ5
IG1hY3JvcyB0byBpbnRlcmNlcHQgdGhlIHN0YW5kYXJkPGJyPg0KbGlicmFyeSBmdW5jdGlvbnMg
dGhhdCBhbHRzdGFjayB1c2VzLsKgIFRoaXMgaGFzIHR3byBwdXJwb3NlczogMSkgdG88YnI+DQpj
b25kaXRpb25hbGx5IGNhdXNlIHRob3NlIGZ1bmN0aW9ucyB0byBmYWlsLCBhbmQgdGhlcmVieSB0
ZXN0IGFsdHN0YWNrJiMzOTtzPGJyPg0KZXJyb3IgcGF0aHMsIGFuZCAyKSBsb2cgd2hpY2ggb2Yg
dGhlIGxpYnJhcnkgZnVuY3Rpb25zIHdhcyBjYWxsZWQgaW4gZWFjaDxicj4NCnRlc3RjYXNlLjxi
cj4NCjxicj4NClRoZSBzZWNvbmQgZnVuY3Rpb24gaXNuJiMzOTt0IGFjdHVhbGx5IHVzZWZ1bCAt
IGZvciB0aGUgcHVycG9zZXMgb2YgdGVzdGluZyB0aGU8YnI+DQptb2R1bGUsIHdlIHdhbnQgdG8g
Y2hlY2sgdGhlIGFjdHVhbCBiZWhhdmlvdXIsIG5vdCB3aGF0IGNhbGxzIGl0IG1hZGUgaW48YnI+
DQp3aGF0IG9yZGVyIHRvIGFjY29tcGxpc2ggaXQuwqAgRXhwbGljaXRseSBjaGVja2luZyB0aGUg
Y2FsbHMgbWFrZXMgaXQgbXVjaDxicj4NCmhhcmRlciB0byBjaGFuZ2UgYWx0c3RhY2smIzM5O3Mg
aW1wbGVtZW50YXRpb24gd2l0aG91dCBicmVha2luZyB0aGUgdGVzdHMuPGJyPg0KPGJyPg0KU2ln
bmVkLW9mZi1ieTogRGF2aWQgR2lic29uICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2aWRAZ2lic29u
LmRyb3BiZWFyLmlkLmF1IiB0YXJnZXQ9Il9ibGFuayI+ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlk
LmF1PC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGNjYW4vYWx0c3RhY2svdGVzdC9ydW4uYyB8IDcz
ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4NCsKg
MSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKTxicj4NCjxi
cj4NCmRpZmYgLS1naXQgYS9jY2FuL2FsdHN0YWNrL3Rlc3QvcnVuLmMgYi9jY2FuL2FsdHN0YWNr
L3Rlc3QvcnVuLmM8YnI+DQppbmRleCBlMTA5Y2NiLi4wOTFkMWY1IDEwMDY0NDxicj4NCi0tLSBh
L2NjYW4vYWx0c3RhY2svdGVzdC9ydW4uYzxicj4NCisrKyBiL2NjYW4vYWx0c3RhY2svdGVzdC9y
dW4uYzxicj4NCkBAIC0yMCwxOCArMjAsMTcgQEAgZW51bSB7PGJyPg0KwqAgwqAgwqAgwqAgc2ln
YWN0aW9uX8KgIMKgIMKgID0gMSZsdDsmbHQ7NCw8YnI+DQrCoCDCoCDCoCDCoCBtdW5tYXBfwqAg
wqAgwqAgwqAgwqA9IDEmbHQ7Jmx0OzUsPGJyPg0KwqB9Ozxicj4NCi1pbnQgZmFpbCwgY2FsbDEs
IGNhbGwyOzxicj4NCitpbnQgZmFpbDs8YnI+DQrCoGNoYXIgKm1fOzxicj4NCsKgcmxpbV90IG1z
el87PGJyPg0KwqAjZGVmaW5lIGUoeCkgKDkwMCsoeCkpPGJyPg0KwqAjZGVmaW5lIHNldGVycih4
KSAoZXJybm8gPSBlKHgpKTxicj4NCi0jZGVmaW5lIHNldGNhbGwoeCkgKChjYWxsMSB8PSAhZXJy
bm8gPyAoeCkgOiAwKSwgKGNhbGwyIHw9IGVycm5vIHx8IHN0YXRlLm91dCA/ICh4KSA6IDApKTxi
cj4NCi0jZGVmaW5lIGdldHJsaW1pdCguLi4pwqAgwqAgwqAgwqAgwqAoZmFpbCZhbXA7Z2V0cmxp
bWl0X8KgIMKgIMKgIMKgID8gKHNldGVycihnZXRybGltaXRfKSzCoCDCoCDCoCDCoCDCoCAtMSkg
OiAoc2V0Y2FsbChnZXRybGltaXRfKSzCoCDCoCDCoGdldHJsaW1pdChfX1ZBX0FSR1NfXykpKTxi
cj4NCi0jZGVmaW5lIG1tYXAoLi4uKcKgIMKgIMKgIMKgIMKgIMKgIMKgIChmYWlsJmFtcDttbWFw
X8KgIMKgIMKgIMKgIMKgIMKgIMKgPyAoc2V0ZXJyKG1tYXBfKSzCoCDCoCDCoCDCoCh2b2lkICop
LTEpIDogKHNldGNhbGwobW1hcF8pLMKgIMKgIMKgIMKgIMKgIG1tYXAoX19WQV9BUkdTX18pKSk8
YnI+DQotI2RlZmluZSBtdW5tYXAoYSwgYinCoCDCoCDCoCDCoCDCoCDCoChmYWlsJmFtcDttdW5t
YXBfwqAgwqAgwqAgwqAgwqAgwqA/IChzZXRlcnIobXVubWFwXykswqAgwqAgwqAgwqAgwqAgwqAg
wqAtMSkgOiAoc2V0Y2FsbChtdW5tYXBfKSzCoCDCoCDCoCDCoCBtdW5tYXAobV89KGEpLCBtc3pf
PShiKSkpKTxicj4NCi0jZGVmaW5lIHNldHJsaW1pdCguLi4pwqAgwqAgwqAgwqAgwqAoZmFpbCZh
bXA7c2V0cmxpbWl0X8KgIMKgIMKgIMKgID8gKHNldGVycihzZXRybGltaXRfKSzCoCDCoCDCoCDC
oCDCoCAtMSkgOiAoc2V0Y2FsbChzZXRybGltaXRfKSzCoCDCoCDCoHNldHJsaW1pdChfX1ZBX0FS
R1NfXykpKTxicj4NCi0jZGVmaW5lIHNpZ2FsdHN0YWNrKC4uLinCoCDCoCDCoCDCoChmYWlsJmFt
cDtzaWdhbHRzdGFja1/CoCDCoCDCoCA/IChzZXRlcnIoc2lnYWx0c3RhY2tfKSzCoCDCoCDCoCDC
oCAtMSkgOiAoc2V0Y2FsbChzaWdhbHRzdGFja18pLMKgIMKgc2lnYWx0c3RhY2soX19WQV9BUkdT
X18pKSk8YnI+DQotI2RlZmluZSBzaWdhY3Rpb24oLi4uKcKgIMKgIMKgIMKgIMKgKGZhaWwmYW1w
O3NpZ2FjdGlvbl/CoCDCoCDCoCDCoCA/IChzZXRlcnIoc2lnYWN0aW9uXykswqAgwqAgwqAgwqAg
wqAgLTEpIDogKHNldGNhbGwoc2lnYWN0aW9uXykswqAgwqAgwqBzaWdhY3Rpb24oX19WQV9BUkdT
X18pKSk8YnI+DQorI2RlZmluZSBnZXRybGltaXQoLi4uKcKgIMKgIMKgIMKgIMKgKGZhaWwmYW1w
O2dldHJsaW1pdF/CoCDCoCDCoCDCoCA/IChzZXRlcnIoZ2V0cmxpbWl0XykswqAgwqAgwqAgwqAg
wqAgLTEpIDogZ2V0cmxpbWl0KF9fVkFfQVJHU19fKSk8YnI+DQorI2RlZmluZSBtbWFwKC4uLinC
oCDCoCDCoCDCoCDCoCDCoCDCoCAoZmFpbCZhbXA7bW1hcF/CoCDCoCDCoCDCoCDCoCDCoCDCoD8g
KHNldGVycihtbWFwXykswqAgwqAgwqAgwqAodm9pZCAqKS0xKSA6IG1tYXAoX19WQV9BUkdTX18p
KTxicj4NCisjZGVmaW5lIG11bm1hcChhLCBiKcKgIMKgIMKgIMKgIMKgIMKgKGZhaWwmYW1wO211
bm1hcF/CoCDCoCDCoCDCoCDCoCDCoD8gKHNldGVycihtdW5tYXBfKSzCoCDCoCDCoCDCoCDCoCDC
oCDCoC0xKSA6IG11bm1hcChtXz0oYSksIG1zel89KGIpKSk8YnI+DQorI2RlZmluZSBzZXRybGlt
aXQoLi4uKcKgIMKgIMKgIMKgIMKgKGZhaWwmYW1wO3NldHJsaW1pdF/CoCDCoCDCoCDCoCA/IChz
ZXRlcnIoc2V0cmxpbWl0XykswqAgwqAgwqAgwqAgwqAgLTEpIDogc2V0cmxpbWl0KF9fVkFfQVJH
U19fKSk8YnI+DQorI2RlZmluZSBzaWdhbHRzdGFjayguLi4pwqAgwqAgwqAgwqAoZmFpbCZhbXA7
c2lnYWx0c3RhY2tfwqAgwqAgwqAgPyAoc2V0ZXJyKHNpZ2FsdHN0YWNrXykswqAgwqAgwqAgwqAg
LTEpIDogc2lnYWx0c3RhY2soX19WQV9BUkdTX18pKTxicj4NCisjZGVmaW5lIHNpZ2FjdGlvbigu
Li4pwqAgwqAgwqAgwqAgwqAoZmFpbCZhbXA7c2lnYWN0aW9uX8KgIMKgIMKgIMKgID8gKHNldGVy
cihzaWdhY3Rpb25fKSzCoCDCoCDCoCDCoCDCoCAtMSkgOiBzaWdhY3Rpb24oX19WQV9BUkdTX18p
KTxicj4NCjxicj4NCsKgI2RlZmluZSBLaUIgKDEwMjRVTCk8YnI+DQrCoCNkZWZpbmUgTWlCIChL
aUIqS2lCKTxicj4NCkBAIC01OCw3NCArNTcsNDggQEAgc3RhdGljIHZvaWQgKndyYXAodm9pZCAq
aSk8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gd3JhcDs8YnI+DQrCoH08YnI+DQo8YnI+DQotI2Rl
ZmluZSBjaGtmYWlsKHgsIHksIHosIGMxLCBjMinCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorI2RlZmluZSBjaGtmYWlsKHgs
IHksIHopwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAgZG8ge8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYWxsMSA9
IDA7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhbGwyID0gMDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZXJybm8gPSAwO8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvazEoKGZhaWwgPSB4KSAmYW1w
OyZhbXA7ICh5KSk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb2sxKGVycm5vID09ICh6KSk7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9rMShjYWxsMSA9PSAoYzEpKTvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBvazEoY2FsbDIgPT0gKGMyKSk7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAg
fSB3aGlsZSAoMCk7PGJyPg0KPGJyPg0KLSNkZWZpbmUgY2hrb2soeSwgeiwgYzEsIGMyKcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQorI2RlZmluZSBjaGtvayh5LCB6KcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+
DQrCoCDCoCDCoCDCoCBkbyB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhbGwxID0gMDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FsbDIgPSAwO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBlcnJubyA9IDA7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGZhaWwgPSAwO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIG9rMSgoeSkpO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIG9rMShlcnJubyA9PSAoeikpO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBv
azEoY2FsbDEgPT0gKGMxKSk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2sxKGNhbGwy
ID09IChjMikpO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIH0gd2hpbGUgKDApPGJyPg0KPGJyPg0KwqBpbnQg
bWFpbih2b2lkKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIGxvbmcgcGdzeiA9IHN5c2NvbmYo
X1NDX1BBR0VTSVpFKTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBwbGFuX3Rlc3RzKDUwKTs8YnI+
DQorwqAgwqAgwqAgwqBwbGFuX3Rlc3RzKDI4KTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBjaGtm
YWlsKGdldHJsaW1pdF8swqAgwqAgwqBhbHRzdGFjayg4Kk1pQiwgd3JhcCwgaW50MnB0cigwKSwg
TlVMTCkgPT0gLTEsIGUoZ2V0cmxpbWl0XyksPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
MCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwKTs8YnI+DQorwqAgwqAgwqAgwqBjaGtm
YWlsKGdldHJsaW1pdF8swqAgwqAgwqBhbHRzdGFjayg4Kk1pQiwgd3JhcCwgaW50MnB0cigwKSwg
TlVMTCkgPT0gLTEsIGUoZ2V0cmxpbWl0XykpOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGNoa2Zh
aWwoc2V0cmxpbWl0XyzCoCDCoCDCoGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQycHRyKDApLCBO
VUxMKSA9PSAtMSwgZShzZXRybGltaXRfKSw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
ZXRybGltaXRfLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDApOzxicj4NCivCoCDCoCDC
oCDCoGNoa2ZhaWwoc2V0cmxpbWl0XyzCoCDCoCDCoGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQy
cHRyKDApLCBOVUxMKSA9PSAtMSwgZShzZXRybGltaXRfKSk7PGJyPg0KPGJyPg0KLcKgIMKgIMKg
IMKgY2hrZmFpbChtbWFwXyzCoCDCoCDCoCDCoCDCoCBhbHRzdGFjayg4Kk1pQiwgd3JhcCwgaW50
MnB0cigwKSwgTlVMTCkgPT0gLTEsIGUobW1hcF8pLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdldHJsaW1pdF98c2V0cmxpbWl0Xyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
ZXRybGltaXRfKTs8YnI+DQorwqAgwqAgwqAgwqBjaGtmYWlsKG1tYXBfLMKgIMKgIMKgIMKgIMKg
IGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQycHRyKDApLCBOVUxMKSA9PSAtMSwgZShtbWFwXykp
Ozxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGNoa2ZhaWwoc2lnYWx0c3RhY2tfLMKgIMKgYWx0c3Rh
Y2soOCpNaUIsIHdyYXAsIGludDJwdHIoMCksIE5VTEwpID09IC0xLCBlKHNpZ2FsdHN0YWNrXyks
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ2V0cmxpbWl0X3xzZXRybGltaXRffG1tYXBf
LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNldHJsaW1pdF98bXVubWFwXyk7PGJyPg0K
K8KgIMKgIMKgIMKgY2hrZmFpbChzaWdhbHRzdGFja18swqAgwqBhbHRzdGFjayg4Kk1pQiwgd3Jh
cCwgaW50MnB0cigwKSwgTlVMTCkgPT0gLTEsIGUoc2lnYWx0c3RhY2tfKSk7PGJyPg0KPGJyPg0K
LcKgIMKgIMKgIMKgY2hrZmFpbChzaWdhY3Rpb25fLMKgIMKgIMKgYWx0c3RhY2soOCpNaUIsIHdy
YXAsIGludDJwdHIoMCksIE5VTEwpID09IC0xLCBlKHNpZ2FjdGlvbl8pLDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdldHJsaW1pdF98c2V0cmxpbWl0X3xtbWFwX3xzaWdhbHRzdGFja18s
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0cmxpbWl0X3xtdW5tYXBffHNpZ2FsdHN0
YWNrXyk7PGJyPg0KK8KgIMKgIMKgIMKgY2hrZmFpbChzaWdhY3Rpb25fLMKgIMKgIMKgYWx0c3Rh
Y2soOCpNaUIsIHdyYXAsIGludDJwdHIoMCksIE5VTEwpID09IC0xLCBlKHNpZ2FjdGlvbl8pKTs8
YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBjaGtmYWlsKG11bm1hcF8swqAgwqAgwqAgwqAgYWx0c3Rh
Y2soOCpNaUIsIHdyYXAsIGludDJwdHIoMCksIE5VTEwpID09wqAgMSwgZShtdW5tYXBfKSw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnZXRybGltaXRffHNldHJsaW1pdF98bW1hcF98c2ln
YWx0c3RhY2tffHNpZ2FjdGlvbl8sPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0cmxp
bWl0X3xzaWdhbHRzdGFja198c2lnYWN0aW9uXyk7PGJyPg0KK8KgIMKgIMKgIMKgY2hrZmFpbCht
dW5tYXBfLMKgIMKgIMKgIMKgIGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQycHRyKDApLCBOVUxM
KSA9PcKgIDEsIGUobXVubWFwXykpOzxicj4NCsKgIMKgIMKgIMKgIGlmIChmYWlsID0gMCwgbXVu
bWFwKG1fLCBtc3pfKSA9PSAtMSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlcnIoMSwg
JnF1b3Q7bXVubWFwJnF1b3Q7KTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBjaGtvayjCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBhbHRzdGFjaygxKk1pQiwgd3JhcCwgaW50MnB0cigxMDAwMDAw
KSwgTlVMTCkgPT0gLTEsIEVPVkVSRkxPVyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
ZXRybGltaXRffHNldHJsaW1pdF98bW1hcF98c2lnYWx0c3RhY2tffHNpZ2FjdGlvbl8sPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0cmxpbWl0X3xtdW5tYXBffHNpZ2FsdHN0YWNrX3xz
aWdhY3Rpb25fKTs8YnI+DQorwqAgwqAgwqAgwqBjaGtvayjCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBhbHRzdGFjaygxKk1pQiwgd3JhcCwgaW50MnB0cigxMDAwMDAwKSwgTlVMTCkgPT0gLTEs
IEVPVkVSRkxPVyk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLy8gYmUgc3VyZSBzZWd2IGNhdGNo
IGlzIHJlcGVhdGFibGUgKFNBX05PREVGRVIpPGJyPg0KLcKgIMKgIMKgIMKgY2hrb2sowqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgYWx0c3RhY2soMSpNaUIsIHdyYXAsIGludDJwdHIoMTAwMDAw
MCksIE5VTEwpID09IC0xLCBFT1ZFUkZMT1csPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z2V0cmxpbWl0X3xzZXRybGltaXRffG1tYXBffHNpZ2FsdHN0YWNrX3xzaWdhY3Rpb25fLDxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNldHJsaW1pdF98bXVubWFwX3xzaWdhbHRzdGFja198
c2lnYWN0aW9uXyk7PGJyPg0KK8KgIMKgIMKgIMKgY2hrb2sowqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgYWx0c3RhY2soMSpNaUIsIHdyYXAsIGludDJwdHIoMTAwMDAwMCksIE5VTEwpID09IC0x
LCBFT1ZFUkZMT1cpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHVzZWQgPSAxOzxicj4NCi3CoCDC
oCDCoCDCoGNoa2ZhaWwobXVubWFwXyzCoCDCoCDCoCDCoCBhbHRzdGFjaygxKk1pQiwgd3JhcCwg
aW50MnB0cigxMDAwMDAwKSwgTlVMTCkgPT0gLTEsIEVPVkVSRkxPVyw8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBnZXRybGltaXRffHNldHJsaW1pdF98bW1hcF98c2lnYWx0c3RhY2tffHNp
Z2FjdGlvbl8sPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0cmxpbWl0X3xzaWdhbHRz
dGFja198c2lnYWN0aW9uXyk7PGJyPg0KK8KgIMKgIMKgIMKgY2hrZmFpbChtdW5tYXBfLMKgIMKg
IMKgIMKgIGFsdHN0YWNrKDEqTWlCLCB3cmFwLCBpbnQycHRyKDEwMDAwMDApLCBOVUxMKSA9PSAt
MSwgRU9WRVJGTE9XKTs8YnI+DQrCoCDCoCDCoCDCoCBpZiAoZmFpbCA9IDAsIG11bm1hcChtXywg
bXN6XykgPT0gLTEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZXJyKDEsICZxdW90O211
bm1hcCZxdW90Oyk7PGJyPg0KPGJyPg0KQEAgLTE1MCwxNyArMTIzLDEzIEBAIGludCBtYWluKHZv
aWQpPGJyPg0KwqAgwqAgwqAgwqAgb2sxKHN0cmNtcChidWYsIGVzdHIgJnF1b3Q7XG4mcXVvdDsp
ID09IDApOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHVzZWQgPSAxOzxicj4NCi3CoCDCoCDCoCDC
oGNoa29rKMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBp
bnQycHRyKDEwMDAwMDApLCBOVUxMKSA9PSAtMSwgRU9WRVJGTE9XLDxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdldHJsaW1pdF98c2V0cmxpbWl0X3xtbWFwX3xzaWdhbHRzdGFja198c2ln
YWN0aW9uXyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXRybGltaXRffG11bm1hcF98
c2lnYWx0c3RhY2tffHNpZ2FjdGlvbl8pOzxicj4NCivCoCDCoCDCoCDCoGNoa29rKMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQycHRyKDEwMDAwMDAp
LCBOVUxMKSA9PSAtMSwgRU9WRVJGTE9XKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBkaWFnKCZx
dW90O3VzZWQ6ICVsdSZxdW90OywgdXNlZCk7PGJyPg0KwqAgwqAgwqAgwqAgb2sxKHVzZWQgJmd0
Oz0gOCpNaUIgLSBwZ3N6ICZhbXA7JmFtcDsgdXNlZCAmbHQ7PSA4Kk1pQiArIHBnc3opOzxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgIHVzZWQgPSAwOzxicj4NCi3CoCDCoCDCoCDCoGNoa29rKMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFsdHN0YWNrKDgqTWlCLCB3cmFwLCBpbnQycHRyKDEwMDAw
MCksIE5VTEwpID09IDAsIDAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ2V0cmxpbWl0
X3xzZXRybGltaXRffG1tYXBffHNpZ2FsdHN0YWNrX3xzaWdhY3Rpb25ffG11bm1hcF8sPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0cmxpbWl0X3xtdW5tYXBffHNpZ2FsdHN0YWNrX3xz
aWdhY3Rpb25fKTs8YnI+DQorwqAgwqAgwqAgwqBjaGtvayjCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBhbHRzdGFjayg4Kk1pQiwgd3JhcCwgaW50MnB0cigxMDAwMDApLCBOVUxMKSA9PSAwLCAw
KTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCB1c2VkID0gMTs8YnI+DQrCoCDCoCDCoCDCoCBhbHRz
dGFja19yc3Bfc2F2ZSgpOzxicj4NCi0tPGJyPg0KMi41LjU8YnI+DQo8YnI+DQo8L2Jsb2NrcXVv
dGU+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--001a11c04d6c90979d05350b46d7--

--===============1300370833253090450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KY2NhbiBtYWls
aW5nIGxpc3QKY2NhbkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9jY2FuCg==

--===============1300370833253090450==--
