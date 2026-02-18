---
title: Resolving Greyed-Out "Create New REST Service" While Adding Native ReportViewer
description: Learn how to address the issue where the "Create new REST service" option is unavailable in a Blazor WebAssembly project when adding the Native ReportViewer.
type: how-to
page_title: Fixing Greyed-Out REST Service Option in Blazor ReportViewer
meta_title: Fixing Greyed-Out REST Service Option in Blazor ReportViewer
slug: fixing-greyed-out-rest-service-option-blazor-reportviewer
tags: reporting, reportviewer, rest-service, blazor-webassembly, asp.net-core
res_type: kb
ticketid: 1693265
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td>
                Reporting, <br/>
                ReportViewer
            </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.1.25.716 </td>
        </tr>
    </tbody>
</table>

## Description

While adding the native ReportViewer to a Blazor WebAssembly project, the "Create new REST service" option is unavailable. This happens because Blazor WebAssembly operates strictly as a client-side application, running directly on the browser UI thread. As a result, the Reports Web Service cannot be hosted within the same project.

![The "Create new REST service" option is greyed](images/CreateNewRESTServiceOptionGreyed.png)

## Solution

To resolve this issue, host the Reporting REST Service in a separate project. Follow these steps:

1. Create a new ASP.NET Core project for the Reports Web Service.
1. Implement the Reporting REST Service in the new project using Minimal API. Refer to the article [Hosting the Reporting REST Service in ASP.NET Core with Minimal API]({%slug how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api%}).
1. Integrate the separately hosted Reporting REST Service with your Blazor WebAssembly project.

## See Also

- [Hosting the Reporting REST Service in ASP.NET Core with Minimal API]({%slug how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api%})
- [Blazor WebAssembly vs. Server](https://docs.telerik.com/blazor-ui/introduction#blazor-webassembly-vs-server)
- [Embedding Reports in Applications]({%slug telerikreporting/using-reports-in-applications/overview%})
