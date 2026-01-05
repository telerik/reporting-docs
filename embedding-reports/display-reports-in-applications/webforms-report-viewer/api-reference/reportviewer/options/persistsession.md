---
title: PersistSession
page_title: PersistSession property
description: "Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks. When enabled, the viewer state is stored in the browser's sessionStorage and maintained for the duration of the page session, preserving user settings and navigation state."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: WebForms
---

# The `PersistSession` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks. When enabled, the viewer state is stored in the browser's sessionStorage and maintained for the duration of the page session, preserving user settings and navigation state.

## Type

`System.Boolean`

## Examples

````XML
<!-- Example demonstrating the use of the PersistSession property on Telerik.ReportViewer.Html5.WebForms.ReportViewer. When set to true, the viewer's client state is persisted between page refreshes and postbacks. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - PersistSession Example</title>
</head>
<body>
    <form runat="server">
        <!-- The PersistSession property enables persistence of viewer's client state across postbacks -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PersistSession="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

