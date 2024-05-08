Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71096C04FFE
	for <ccan@archiver.kernel.org>; Wed,  8 May 2024 23:34:31 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EA9QBcbe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZWh56rHzz30TB
	for <ccan@archiver.kernel.org>; Thu,  9 May 2024 09:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EA9QBcbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ashok.raj@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZWgy3rBGz2y71
	for <ccan@lists.ozlabs.org>; Thu,  9 May 2024 09:34:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715211262; x=1746747262;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=F2kRREV39j+Xe31thzyaz/uvJ7p1fWbyTSrDu2QjyOA=;
  b=EA9QBcbedgUFf9YBEacJzcX7ia/0AvlabPIAegL5qzgxrqMcEGCvpsuE
   n/HJ8cdvM05ZeZYsFYDFGaYyOMGpKvIw5x8mnAVK6WYK9XoCLfErEQYl7
   q9UTak+nuA6ry5ieTk/wdkmw4xEO5Mhy1MUU2/nm9uEx+PzCc2aZNjYi/
   zyjlkaBjfOkHd8x1WTQkGOuFedCnwwdzsA6Xu82BbQb7H/FstldfjZ100
   wqGiQMdWBY/lOUQX8KTgcvbBXtm73rjSQxVZLcraG0JFCBBrP9Upt78HD
   CogI4ISi1lD2bHI9dxXWTvNUJOfRLiYN/38RLe1+wpMumMM92WRwBeqe+
   Q==;
X-CSE-ConnectionGUID: UYjHqjhJSOuNPpVvbTpI7w==
X-CSE-MsgGUID: c0NX3yiCSBCH5d8ZYWpK2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28582841"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="28582841"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 16:34:16 -0700
X-CSE-ConnectionGUID: y450JAhkSz+XJ6pYJOiMOg==
X-CSE-MsgGUID: 7TmEdLNQQOCZP8jVLB6wdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="33521805"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 May 2024 16:34:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 16:34:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 16:34:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 16:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXZWlfqbXU4nLyD5pGnPzc4WzDOcpx/xvKlB/b5zqzrvfp3wjfKNv+8gtkijsf/mGccQLabiatWjlUT8Yli8eL2g+NKBXVhr15fBghe3GGCjQWXrNpZqdBZ74j0L/3kbZR6TbTrbIQdWGA7qWzJlvnFkyq68zPXfP0Hm33Whh1U0ZLBzIRoXE67jx62h8NcrfnTPnVvFPTeuf7ES7dbAZs4HcTyQpfvMxsoy5qZ+G9c2hJasupp19U7oXSn8FZ9Cwe+E5EVij9Bf4YJdeNJHd3UD9Soq5SY805ZV2sf0KFDPIX080GDO/0LoqjGiDFKnFl5gvrSRZSAf0HoLj/q5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsFGUwyibVYWEtnN27iUkazor4g6cAEMHZqF+MqeaiE=;
 b=QI9lbB9zi4vZnUvLfGmAOieRMCfFOztbDS3Ma3/Zbmned6cA9zOuXazFsGQI5k84HCLwOFQLbAVF1OSUr6yqyNBUGPHr/+8aDO/GqG7nRiszyj7YsYioZH+EbwOlwUesIMREW9E8NMcDr90WzlMoMNYvDi+kCdfa0YcwZEDZv0z6I+1da052T9TH8SCB9UX6dkxTO2z1K2lBNSE9qT4d4MavirPe2MgaZNpgW/skMYIls/sLk9WCHczYtCWSoTqRErsoLR3JEiLy/6GI8aPqpEGGY8JWk7Whi8AOsiiXaN21LcoGJ9S6jOPfxQKWd0nyUxBpww07DHiVlaKVFCDtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 23:34:13 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::d8c3:32a9:ee81:b6e0]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::d8c3:32a9:ee81:b6e0%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 23:34:13 +0000
Date: Wed, 8 May 2024 16:34:10 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: <ccan@lists.ozlabs.org>
Message-ID: <ZjwL8iUYUeJQZl8m@a4bf019067fa.jf.intel.com>
References: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
Content-Disposition: inline
In-Reply-To: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: f9757152-7554-462b-0ce6-08dc6fb75e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?usQVh4bXksW6bES6Hkf9fz4YLEyR9jdfYs1a2V4AbV5f1R9JIwasINdO8Utg?=
 =?us-ascii?Q?sGV8TLTxE2L3hzj4nBeUUFfPUUzAlEzAeK/CXVrYQl19Xb0rwadQ1f/v5fbE?=
 =?us-ascii?Q?MTBFbOVBiVJtSCv6tghvhrePmNRCRxq3mCBibYTEseI1Obp0BpajX4qfI6gU?=
 =?us-ascii?Q?wfEbxdEXjWdg/YZKSs3bYAI2sZn4fgKCLPQSnYMLki6znHO4uBP0djjeW0Wk?=
 =?us-ascii?Q?FzQqBnhFD9zKNRje+I96Povj88kPokCIYjYLOHXyBXZeagbpQf2nB0HAFK4c?=
 =?us-ascii?Q?qhp04ELvaZYEMburFtA/2rFYtODZpfaHOF76wvCZDlA4rM0+hVtvYlVH1n5A?=
 =?us-ascii?Q?ikqWoOIr97FHT0GJ541JSN+FGVncvAc3mpgZZKgc6pRHdqYyVLtfTsksiOXp?=
 =?us-ascii?Q?AQWVGsHV0EBVu+RuJxyqV6vjAvEBj6PKFFgPW23vIrGhQUN0kqrKQxX17veG?=
 =?us-ascii?Q?k1uMtW6LTSBuGbfZZ+13Al3DhIDtUDIvoyZUL9JBFBa1nWjo+v0OUGUEWCoU?=
 =?us-ascii?Q?HVLNAWsPvgiXT/9qYe7Dg2XWhvd+BEh9I7wbjeLgkqjjbHBPNGFjoLQaRVvf?=
 =?us-ascii?Q?iZz/x2PuAVC/qVG3VmOFeiYKYlzTTC2PCdnG88ZeNeQY3Eb9QrOEVVkAmwX4?=
 =?us-ascii?Q?KoJ80qFJO6P0fzTMFDXij3/Iie+ZQUTWrT04LPRMJUeH84zREGfElOpabtYL?=
 =?us-ascii?Q?zMU15yJeQ7XJ8HN2ob1fvecQ7SmhmpgCITi/LCiPaGqFUvWhfNBKmnRK5hDB?=
 =?us-ascii?Q?lFwwRB60SFef3AxEPFlCNyE6gZ/VQm11Wx0SpIiu/QE7DOcHi4uo6XvnWO/D?=
 =?us-ascii?Q?qmxO2cRybg8COtcBd6ab9plpCDHbH6U6ie/RTwytYSowcKLkSyG/hxpsdAyo?=
 =?us-ascii?Q?A1/HERvBs15wF9LB6LGBj01zmcJFvcPFfrp1gaGCnzF5vXaQ1tryjxE1ws6U?=
 =?us-ascii?Q?BCgYsvVls/NlTZtJdrUVZrQl3i/tP6iKjjbx1e363zS88X3HiESjppMN242h?=
 =?us-ascii?Q?3kjqXdrbVXKbviJc+6bOd4Depp6BuxEo5GyR0ncRPAfQDSxKiHP/OG8N+r7D?=
 =?us-ascii?Q?FQ/fazlI4bw9iiX/JxlzQxd2mLsJkmUr7PAp88tJ1531EILUHBy74xae3v/8?=
 =?us-ascii?Q?2+BFMeaN4BCeiMMLeoZa8PTg1uks0PC+FOh+Lcua9+BwYxVcudFKCJmmmUH4?=
 =?us-ascii?Q?xStJEEuh+VZCGwJ9dMRiLgv1Lsa/a9E27tW/wJIQ4+LJnDEwHVTQsqw2ZqhD?=
 =?us-ascii?Q?WZaKHmFO1CEMk3qD+KUzrXjQ21kuOqSBYDwJrfxjwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1TPpLP/H4N19vZZO0M5UejnGJ0X5y/478cdbq/v1C6ZBat0nbnTpiHpOENV?=
 =?us-ascii?Q?FjWmrvupRbplpdc9ueOiOIhezrgzXu+98mqnitUW2MIt3h6uHtyxwhIZ/3F3?=
 =?us-ascii?Q?Buhy2RioN5xiXTdxrCCAtBv1suLR8GT66FCbFJ0D/Brl97GO+17mFLdjip4f?=
 =?us-ascii?Q?USek/xpsqDPKMwUTP3XiIoKjMrboIprndj8eG73Hm/S8QIWW+FziM4dtkVXe?=
 =?us-ascii?Q?igYnxxtyeygmBSbgTL4Nf0UsDHp+SzCQxXQNcJ+efLMlD3m3DIa6YglJI7P0?=
 =?us-ascii?Q?xSfpdA+71l820ojQAb7wzF0BHDYJAwEGWfNyXK4sQVdF74S4PSfTZixJfwUj?=
 =?us-ascii?Q?4LzpFqCdv6jVC5t1MP+UI2X5sVV7jJZj/xxwSyDX9MfMSP4Y7UMYAqWAH0kO?=
 =?us-ascii?Q?wssvzPcigT49Q54D2Iq2AqktAnDFra2n5h+OcR3fbxu+g7PrzXdm6EK3l0Y8?=
 =?us-ascii?Q?qEeO7LZqk7PP+PrGL8rSdeXCb5/yh/mO7vbtxha7kqBd2+JchSW8P/+X/+af?=
 =?us-ascii?Q?VBMYAcdcj3W1KcYQhjM+ivSBoHptb790mirCf5m7hfvq5amXVenthj2+mBnP?=
 =?us-ascii?Q?0fSS8ey/aNYMfNzKNwzz81nFzhyncqYzhmdi/W04X1xMTDL1YaEHWR5O/qnV?=
 =?us-ascii?Q?HuiC7KELvkTsz8HQNMjIgTW0N0RBn4gfIWP/cJUW8dVMTLSsyvKCAfF8Et0t?=
 =?us-ascii?Q?nQBwBerBvcWa0KPynCIfjOtyuovykdst/SQ1Q8CtQlM9yUJQT5WgeBPxYrS7?=
 =?us-ascii?Q?RYZXb+Wt3uOIc3hx/olBPiw/vNfmxd5rUKFGiP3pE4wNX76o3zy639Z5EFoh?=
 =?us-ascii?Q?9X5NHNNwLTSRpHZWMOTHoPJR6Y2aeD2R8QElqjC69P97wWJLt4Wy+HxvS55c?=
 =?us-ascii?Q?Slu+KJhtStm0EioTFDOWwwVfZmYEcbZOzlV+E6QtLfdlH3ohRo8v+wuv7mcq?=
 =?us-ascii?Q?rmmmDSl/453KH1nFC/kN+d0Zwycp1BMhETGrNupdYvS/hvNw6ZrAD/qMeinW?=
 =?us-ascii?Q?Ij2L/lyJCuN8xXQUOIfCtCc9ubj8XZHxcLn6Ke4rnZgWCCOqslH3UNMcRGrC?=
 =?us-ascii?Q?3r/aNqaGZvAmtd2HCwWdyE5AJk6Dt8iLG/xffQz9x7oHtAShTUDKr69MtsOY?=
 =?us-ascii?Q?q0risvyA1dhSD//j1yLktBNXoC030fjgP3p158eJKTqjpgiuoQtK9qUZ9nBY?=
 =?us-ascii?Q?BZNzJeRhz3g1MBXbNXQE+vgVlN8H+lmJNqsMLenZn6z4Q8Oyur1Tgi3K6nsU?=
 =?us-ascii?Q?Z8v/F+toGE8cN39xL43CJQ4NQf01pt4/iqAJGppqvtPwzTH3reu52jMoM6Zz?=
 =?us-ascii?Q?GiscXA/LuF2vysh7c+OKqcjbsujvOColKwiw4umXUqpeYJF6kdIGWjloYasT?=
 =?us-ascii?Q?9Xyd7tQ/3A1U4+usN+gqLenPm5ry+TA/+Vy8bkfH4c+8GAmmKT968kOmXBse?=
 =?us-ascii?Q?p9Ew7Kq/ax1ZEct2uvLGh33etCYQsEiuzH0Bq2OdFKbHRKebLAGXHDiXfGCL?=
 =?us-ascii?Q?JLnuN0PCZ6QaJyCW4BFtF0DHWj7qApUUMjyatW141cjsLom+Y4pZZaYEtQhZ?=
 =?us-ascii?Q?GL1ms+aHSbd/AbUo+QJMBewI8wAe8a+tsKTUk/59?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9757152-7554-462b-0ce6-08dc6fb75e1b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 23:34:12.9803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYjPA0ukg6OIscsmrT7U0s5XkHWpHda321VoTgo1sYP9LbYw1mpm6dDM2uaV5IGnDR81KvEpx3wKoqToa3zK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
X-OriginatorOrg: intel.com
Subject: Re: [ccan] New to ccan
X-BeenThere: ccan@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "If perl can, maybe ccan?" <ccan.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/ccan/>
List-Post: <mailto:ccan@lists.ozlabs.org>
List-Help: <mailto:ccan-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/ccan>,
 <mailto:ccan-request@lists.ozlabs.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org
Sender: "ccan" <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>

On Tue, May 07, 2024 at 12:54:07PM -0700, Ashok Raj wrote:
> Hi
> 
> I'm new to ccan. I'm trying to use just part of the project (just one
> module) in another tool. 
> 
> I didn't catch the exact method to replicate a single module.

So I went past this step and able to include it in my project.

But I see the following warning

[16/247] Compiling C object libccan.a.p/ccan_bitmap_bitmap.c.o
In file included from ../ccan/bitmap/bitmap.c:5:
../ccan/bitmap/bitmap.h: In function bitmap_set_bit:
../ccan/bitmap/bitmap.h:61:43: warning: declaration of bitmap shadows a global declaration [-Wshadow]
   61 | static inline void bitmap_set_bit(bitmap *bitmap, unsigned long n)
      |                                   ~~~~~~~~^~~~~~
../ccan/bitmap/bitmap.h:26:3: note: shadowed declaration is here
   26 | } bitmap;
      |   ^~~~~~


If I were to change the parameter name to _bitmap and in all usages the
warning disappears. Weird the definition its pointing to is this typedewf


/*
 * We wrap each word in a structure for type checking.
 */
typedef struct _bitmap {
	bitmap_word w;
} bitmap;


_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
