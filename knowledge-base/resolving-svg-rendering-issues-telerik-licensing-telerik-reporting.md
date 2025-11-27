---
title: Resolving SVG Rendering Issues with Telerik.Licensing NuGet Package
description: Learn how to troubleshoot SVG rendering issues in PDF files when using Telerik.Licensing NuGet package.
type: how-to
page_title: Fixing SVG Rendering Problems with Telerik.Licensing in Telerik Reporting
meta_title: Fixing SVG Rendering Problems with Telerik.Licensing in Telerik Reporting
slug: resolving-svg-rendering-issues-telerik-licensing-telerik-reporting
tags: licensing, svg, rendering, pdf, telerik.reporting, nuget
res_type: kb
ticketid: 1697957
---

## Environment
<table>
   <tbody>
      <tr>
         <td> Product </td>
         <td> Telerik Reporting </td>
      </tr>
      <tr>
         <td> Version </td>
         <td> 19.1.25.521 </td>
      </tr>
   </tbody>
</table>

## Description

When using [Telerik Reporting 2025 Q2 (19.1.25.521)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q2-19-1-25-521) to generate PDF files, upgrading the [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing/1.6.16) NuGet package to version **1.6.16** or later causes SVG files to stop rendering in the output. 

## Solution

To address the issue:

1. Confirm the licensing status of Telerik Reporting in your environment.
   * Ensure your account or your employer's account has a valid license for Telerik Reporting.
   * Refer to the official guide on [Fixing License Errors in Telerik Reporting Runtime]({%slug resolving-invalid-license-telerik-reporting%}) for additional steps to resolve licensing issues.

1. If licensing validation is not the issue, roll back to the last working version (e.g., **1.6.15**) of the Telerik.Licensing NuGet package as a temporary workaround.
   * Test the report generation process with the older version to confirm SVG rendering works correctly.
     
1. Ensure that SVG files are correctly included in the report definition and no changes have been made to their configuration.

1. Monitor updates on the public bug-tracking portal for progress on resolving the issue. Subscribe to notifications for bug fixes related to this problem.

## See Also

* [Telerik Reporting Documentation]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [Telerik.Licensing NuGet Package](https://www.nuget.org/packages/Telerik.Licensing)
* [Fixing License Errors in Telerik Reporting Runtime]({%slug resolving-invalid-license-telerik-reporting%})
