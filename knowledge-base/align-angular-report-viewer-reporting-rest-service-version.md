---
title: Aligning Angular Report Viewer and Reporting REST Service Versions in ASPNetZero Projects
description: Learn how to ensure the Angular Report Viewer and Reporting REST Service versions match in projects using ASPNetZero, addressing the '[object Object]' error.
type: how-to
page_title: How to Align Angular Report Viewer with Reporting REST Service Version in ASPNetZero
slug: align-angular-report-viewer-reporting-rest-service-version
tags: progress® telerik® reporting, angular report viewer, reporting rest service, aspnetzero, version mismatch
res_type: kb
ticketid: 1674041
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.3.24.1218</td>
</tr>
</tbody>
</table>

## Description

When using the Angular Report Viewer in an ASPNetZero based project, an error stating that the version of the Report Viewer does not match the version of the Reporting REST Service '[object Object]' may appear. This issue arises because ASPNetZero, which is based on BoilerPlate, wraps every API response, altering the expected result format for the Report Viewer.

This knowledge base article also answers the following questions:
- How to fix the Angular Report Viewer version mismatch error in ASPNetZero projects?
- How to prevent BoilerPlate from wrapping API responses?
- What is the correct way to configure the ReportsController in ASPNetZero for Telerik Reporting?

## Solution

To resolve the version mismatch error between the Angular Report Viewer and the Reporting REST Service in ASPNetZero projects, apply the `[DontWrapResult]` attribute to the `ReportsController` on the server-side REST API. This approach prevents BoilerPlate from modifying the result structure, allowing the Report Viewer component to receive the response in the expected format.

1. Locate the `ReportsController` in your ASPNetZero project.
2. Apply the `[DontWrapResult]` attribute to either the entire controller or the specific action that returns the version information.
3. Rebuild and rerun your application.

By applying the `[DontWrapResult]` attribute, the REST API will return the version information as a plain string (e.g., "18.3.24.1218") instead of a wrapped object, matching the expected format by the Angular Report Viewer.

## See Also

- [How to Use Angular Report Viewer with Angular CLI](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli)
- [Telerik Reporting REST Service Documentation](https://docs.telerik.com/reporting/t-telerik-reporting-services-webapi-reportingservice)
- [ASP.NET Boilerplate Documentation](https://aspnetboilerplate.com/Pages/Documents)
