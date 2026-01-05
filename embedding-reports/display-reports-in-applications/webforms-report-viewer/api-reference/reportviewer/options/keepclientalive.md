---
title: KeepClientAlive
page_title: KeepClientAlive property
description: "Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests. When enabled, prevents client session expiration by sending keep-alive requests to the server based on the ClientSessionTimeout configuration. When disabled, the client session may expire naturally."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: WebForms
---

# The `KeepClientAlive` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests. When enabled, prevents client session expiration by sending keep-alive requests to the server based on the ClientSessionTimeout configuration. When disabled, the client session may expire naturally.

## Type

`System.Boolean`

## Examples

````XML
<!-- Example demonstrating the use of the KeepClientAlive property for the Telerik HTML5 ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KeepClientAlive Property Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set KeepClientAlive to true to keep HTML5 viewer client session alive -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              KeepClientAlive="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

