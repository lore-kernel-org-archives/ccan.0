Return-Path: <ccan-bounces+ccan=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926CC10F1A
	for <ccan@archiver.kernel.org>; Tue,  7 May 2024 19:54:29 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvKK9Qx6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYprg2h0qz3cQX
	for <ccan@archiver.kernel.org>; Wed,  8 May 2024 05:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvKK9Qx6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ashok.raj@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYprW0SF8z3cHH
	for <ccan@lists.ozlabs.org>; Wed,  8 May 2024 05:54:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715111660; x=1746647660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dtOxhjc54rt0x2pidQJbtvkMo7WbWR3ItIm3pV0tEs=;
  b=hvKK9Qx6RcXCaCZCkwJgFzimt1jQm29JP3TSH4bXVHLz5xB9QgtShPsy
   xb7PmvKmVe/EyeWKbIHbHO6k+r6I4eOrP1CdFgYARd4/pZSJHpB+UeaCU
   eQyIsEQKFvc982SxU/q2qxLp/TXDukou/vJc+LT1Xr8G/aq1vV8QHU2su
   2oowqUYUBtb34d5UebJN+GQQRa7LawJtHTUrU0W7zyOtWqlpsoGWtmv1h
   Wi5dN8GlrvW9PVID2knuUcjXhO0N3mKcle0kRJGD40SFzlmfzvs3ZXGPt
   0UWoSbIAtF9TsjFWWF07/meMk5B4ohSBDx/0g787BEaULG0GEkNdGjxFl
   A==;
X-CSE-ConnectionGUID: y6Ct8UlhREGaJSODDKURJA==
X-CSE-MsgGUID: GLW9pix9S+iTFKZhBUDAuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14756225"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="14756225"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 12:54:14 -0700
X-CSE-ConnectionGUID: 9HcUvqBxROmvKZcMEmTRtQ==
X-CSE-MsgGUID: wz02R636Q+KOwL2bH2HnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33441552"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 May 2024 12:54:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 12:54:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 12:54:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 12:54:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 12:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko68DEF1U6Bdtjnuhm67HKTQYM1Ke6nChqhcHvbtGDnE67KrvYjbZSV1RB1EAl8XcnSj0NgptMoYcWDR5CPDvWbejTxt1RVITh8alAx2aYe9MQtWrudKvRcCf/F7jpjT6F5EjySxHhoKWejsJczQkmD3GYmOjJvaA4Zz45IGJQLdO2niAE65RvOKOgGf9xh2cUXjFHqEMSs3QX2lavAsR0mR2zepMoGWbcpqItHb52grx+K0LTl5q+HlmwwQlnYcZuu6PZnfYtSPYrm1N8hamVzmjhvslt4hc2XtRIDLNI/CFNEZm+erDnEB82229vVX54gX0I9l6d1+k2iDwaZ+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsJETajyZgEN/j3jJmrbehQG1M+SjcYDUStqvjFCBsg=;
 b=KrjGi110Mb4bzm2awkphc5J+jx8zCwEAmCpKVXLIbCIPFwNh5KzpBRvmqxgUIdLYVmYANgLMgWHvp1OXFTNHq0TKNLwZgLhvjx0njnGppONjTPWaho3YTL8+uMFEriFd8R7MO0U/bup1VN8v4EUfBgDiChqMyp/z9zatRzI7uT+1ScVnDTb+5oVtzRXdbWYa6dCRypCPae8SpAEOMab1JFFGr1J5aHHNd8xpWYcPUvDcKXNtZba0+X1b78+mSPUZGh1Y9bMfGEmh4ZVaELrwZu88yJ3tDr4FjVWecE1N7aRCf7jMlUR3lmSIqQSg8e5Lm4vKQoMm2Fg76BAmnLmP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 19:54:10 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::d8c3:32a9:ee81:b6e0]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::d8c3:32a9:ee81:b6e0%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 19:54:10 +0000
Date: Tue, 7 May 2024 12:54:07 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: <ccan@lists.ozlabs.org>
Message-ID: <ZjqG3+l2c0MgkL5x@a4bf019067fa.jf.intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: b89a441d-d4d3-4927-b988-08dc6ecf7660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u3nDLYRR89vbAjeHx1mo+cFSsmWxNycp6l5fH8rmNGxznQgg3mUb0qaYEAzP?=
 =?us-ascii?Q?Ga1ftcGP6iyD2zwBfgTkGDIaB6FfWk4laEqBCo9uDGjZjQCYq2JtsuRB73uq?=
 =?us-ascii?Q?mBktOGrWSkqmX8d0WXrJ9wU/Km5dzP44ELEpFZQw9Hm04UBtKqM0q4b/3+su?=
 =?us-ascii?Q?zrU9VqszM4XeigPOcvBp/0zuuoQ4EvEgmMSpUl9MBMOA3O4eorshifWJPuqZ?=
 =?us-ascii?Q?8ZEO6L9VtJg5gHqwNynqOx2Pcc4Kk+RWm5vOQSTRQVm1nq+I6sI7scpo1y1I?=
 =?us-ascii?Q?COG1tDYMWxT8roIOJrHiPkL5gPTGo/Q2WtfUsOPPvXIfz80l0t5A6CI71+kL?=
 =?us-ascii?Q?UxT1qjFLvQFfjgiQUBdv4D9cPmGk95JXqAUaKMP0Azf6OSlxzxBObyixalRQ?=
 =?us-ascii?Q?2VMeMQO2U1WUwAaJGekXy1dxhRNMRLbap3qMKJQIvKdVI86tX11NbKXb0HQz?=
 =?us-ascii?Q?WhgMd+qgnK5vZ3jHBxoT5HSo9h+lJUZ8TKV1JDDPsdlHty4naBHo6gGKRatq?=
 =?us-ascii?Q?xuoUw2qSiMfKf9Gl/cvMJTgGKOoX9lir1jkYpXmDZTonJ2Et1xC9sExIL1kU?=
 =?us-ascii?Q?P0lYQ+GB3eJtK0eeilwvWNMjkYPwyoOHS07O+tT42PgAXadYwUM+SV+4runL?=
 =?us-ascii?Q?Vjg0qoe5drFkG5g3qYke51LBDmbrfyNFX44K4OiBJnXJoEFSGK+KxgXAZIca?=
 =?us-ascii?Q?mW6fFduH6/w2HR19ZKFIdxnZBSRMRT/IfLK0hqBTceT2JzSomW6M4+o8jfLU?=
 =?us-ascii?Q?UqhD9Vbk209YShz9vI8K+zNQn8YSuLFqGNnyluQBynISVecX86apDVYL0PuD?=
 =?us-ascii?Q?RF35fn6Mm2QjgHZBfUmig+D8ojLoiaQOkB/SYExkEcmH0G5yjf0y0FgEQEU8?=
 =?us-ascii?Q?9Wj4uFT8F8CkwZhP1oVAhDF3REiQFw/VOMQfTxveR073uUzD86Ab9hXVQABs?=
 =?us-ascii?Q?RKSDw/HkO30o5lbDsIVQ12czRjLyy1wNsDXRVdWqkZpk37cywQbaGm/M8/5n?=
 =?us-ascii?Q?QsKlKmSPdslkCaDGWr+aSfDOkKn5XWoQ92I6ufshFHBzohA8ek1aC7adzUaa?=
 =?us-ascii?Q?NS8FmSIHqOAPvlUzRuuzkP4uqp4V59eaarr8x74tTGfnBX4tFERYFNHJ3wsj?=
 =?us-ascii?Q?mq3eh81gdxnXkAUZGfVT906QTPWPjV4VAmbsn1MNdwM9cLqP2JJgjaVMGTLR?=
 =?us-ascii?Q?7Q/JTwf9J5NIPVWnmtu9Yzwh0qlSlryhDcpKc9fdo+3yEWwKERdgH2ylifI/?=
 =?us-ascii?Q?LrXVfxmQlNH+qu1LdovYpuUVjjEr6Y6erzZ4vIMPGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u/lp92MBY8WCXuMrd088Z2wT1fyxJpM7FYS7/t334JSozTVdvLkVPkY97bN8?=
 =?us-ascii?Q?su5mj16wL5De3T8QWE2zFJj4C7ITN9RtuY4GTBtIPycwF+kGH7Qq1WSkS4C+?=
 =?us-ascii?Q?oGcBAZonMBJO118V1Q1qqvs6Y1hOhvnUcAiItHMfYPa5WQnxyai74ftBarOM?=
 =?us-ascii?Q?4xLLRTgVlUDG8axhSLHstfmKq0mzqL0oyZNjhDf/h3tOGZm6u2lYHrbo3G4G?=
 =?us-ascii?Q?zQYc9HSmfYT838vohdci2v44JCjUCKWS0fYZ/aC7X7mtPSPYef3dIn65V6dB?=
 =?us-ascii?Q?29xb+k0SC/TxBmc6pf0MV9/YWwC1n9UiN6rtAURD/QuMBS1OP44dfwlSTQhh?=
 =?us-ascii?Q?lDPkreLJ/ZOBnvWTOe1XQGhvRxkgrcAh1l9JgaCVuFREgHJCa8/D2pooh82g?=
 =?us-ascii?Q?SKrTskeU7Jmm75G345ZBxPf1uFwfZE8hg6PFuVz+Eexiju1wIXpqqNW1Uj6N?=
 =?us-ascii?Q?ZswaRdJsZTY5XRLCC9V4lGpPb08wpvlWnX5JRI4VbBHBOJUoVggUv8WmZovi?=
 =?us-ascii?Q?7xolPhfOXA+P51KpaZVT0MmcX11YAjswL1G9Jk10nbhjNJMzSF9Y7kEbs/S2?=
 =?us-ascii?Q?2twX/kEPnVKwOfHyTqLh4v1bApPM9YeKNab4NmpJnnaIvD5uMOB5ed2hbeeT?=
 =?us-ascii?Q?UXIp5EM+Vl0Gdv+dLCwDcb2K5XY8Os4PWK9H570K2FRexmKxCjPf36JJlDEm?=
 =?us-ascii?Q?YCKLiV1C61SrrZpfl+XydKzLslGNmGLilCB9rDTAFwdGgoppASjy+ODGTcol?=
 =?us-ascii?Q?L0YTBK87fh+5Yu7nylt38O/F25pz/T/+IaSSRCjjpME6/Lbe9TJRTXMrGAS9?=
 =?us-ascii?Q?j60Y1Ic5P8iN8FhiES7Y6IYkyuv27QqIBnmNHsI95g8gqJRQ3mErupop1tuX?=
 =?us-ascii?Q?CerCH3pHnldAXzk64o+EwVXFBKNTDAs2e/g9yKDF+Q3ZnTYHbRxFF7W5xr17?=
 =?us-ascii?Q?6fFu2JtNWSIukAvwL0rxc9kzf7+Y4vOl+xElPzDKSihGt+6HQSK70LKvSK7p?=
 =?us-ascii?Q?WV/jaTUKCKavsIYuKY9qAASK7dRqb8sJEbaZ5Qc52kSS9Qu26yaeGX8LO8jq?=
 =?us-ascii?Q?EaOqsemN9JpYZxgxaE+55AiZurujRvUu/AyTwfstE3dp7PZQq7M5YYIt/lp3?=
 =?us-ascii?Q?UxYVENlBMqU1DDnEt9fvOSxC+i6LikzdLza5Vtpf9EJpaMO/cf2n9IZG7iEI?=
 =?us-ascii?Q?2JU8CA9Qwgskgmq7n4Ayk5L7jRrZ6czP2qLJrGhsS9r6dBfuMhJf0honBWyc?=
 =?us-ascii?Q?TrKFVgRz6IgaOGV2mrE5WkurCDkGigRLE52wQ2PnFY2P0SauchTpC1qSvNR+?=
 =?us-ascii?Q?Q2H3jSWswi/XZc2LoePTiMg8txLbc0cuDNdPG0J6QpervWgt1kLWY4i3RYtc?=
 =?us-ascii?Q?6y6RzKweNzkBrlkEHkLP+84HSEqoghYIuMSiguVEOA3+t9WL1TrTFtDvAiyr?=
 =?us-ascii?Q?yRZN9juOsrz8XxjU+IeyuB6VTZaWK/B4eHLInZbKGOvzuEx12f3AEY7gSLY4?=
 =?us-ascii?Q?h68+TVvqhm2J2d3iJIcDrYirTlxnRUYx0ieKV9M0SFa0NzqAXHk6Hw3sE7YR?=
 =?us-ascii?Q?Fm/lPYsMsEcxRrPFts8TjX4Bdzp/coELQBMQCgoV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b89a441d-d4d3-4927-b988-08dc6ecf7660
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 19:54:10.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHV1F9S+y8CIx1DE/CyonkcIdXWbfmV3s4aNEPs5+DVN5yGUfn7Gtc1ycBYwNQuXBrkoNGTMfpwveWRqDPzEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
X-OriginatorOrg: intel.com
Subject: [ccan] New to ccan
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

Hi

I'm new to ccan. I'm trying to use just part of the project (just one
module) in another tool. 

I didn't catch the exact method to replicate a single module.

I did take a look at tools/create-ccan-tree. Its not obvious on how to
replicate just bitmap and bitops into my project and generate Makefiles
etc automatically.

If someone has done it and can help please pass the recipe along. 


-- 
Cheers,
Ashok
_______________________________________________
ccan mailing list
ccan@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/ccan
