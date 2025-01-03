---
title: The Reporting REST API hosted in ASPNetZero Projects returns an incorrect Version response
description: "Learn how to host Reporting REST API in ASPNetZero(based on BoilerPlate) Projects without returning an incorrect Version response."
type: how-to
page_title: How to host Reporting REST API in ASPNetZero Projects without returning an incorrect Version response
slug: reporting-rest-api-hosted-aspnetzero-projects-returns-incorrect-version-response
tags: progress® telerik® reporting, report viewer, reporting rest service, aspnetzero, version mismatch, boilerplate
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

When using the Report Viewer in an ASPNetZero-based project, an error stating that the version of the Report Viewer does not match the version of the Reporting REST Service _'[object Object]'_ may appear. This issue arises because ASPNetZero, which is based on BoilerPlate, wraps every API response, altering the expected result format for the Report Viewer.

This knowledge-base article also answers the following questions:
* How to fix the Report Viewer version mismatch error in ASPNetZero projects?
* How to prevent BoilerPlate from wrapping API responses?
* What is the correct way to configure the ReportsController in ASPNetZero for Telerik Reporting?

## Solution

To resolve the version mismatch error between the Report Viewer and the Reporting REST Service in ASPNetZero projects, apply the `[DontWrapResult]` attribute to the `ReportsController` on the server-side REST API. This approach prevents BoilerPlate from modifying the result structure, allowing the Report Viewer component to receive the response in the expected format.

1. Locate the `ReportsController` in your ASPNetZero project.
1. Apply the `[DontWrapResult]` attribute to either the entire controller or the specific action that returns the version information.
1. Rebuild and rerun your application.

By applying the `[DontWrapResult]` attribute, the REST API will return the version information as a plain string (e.g., "18.3.24.1218") instead of a wrapped object, matching the expected format by the Report Viewer.

## See Also

* [How to Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})
* [Telerik Reporting REST Service Documentation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})
