---
title: ClientEvents
page_title: ClientEvents property
description: "Gets or sets the client-side event handlers configuration for the HTML5 report viewer. <remarks>Provides a comprehensive way to attach JavaScript functions to various HTML5 viewer events including rendering, printing, exporting, and user interactions.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/clientevents
published: True
reportingArea: WebFormsWrapper
---

# ClientEvents

Gets or sets the client-side event handlers configuration for the HTML5 report viewer. <remarks>Provides a comprehensive way to attach JavaScript functions to various HTML5 viewer events including rendering, printing, exporting, and user interactions.</remarks>

## Type

`Telerik.ReportViewer.Html5.WebForms.ClientEvents`

## Examples

````JavaScript
<!-- Example of setting the report viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Report Viewer CheckedButtonClass Example</title>
</head>
<body>
    <form runat="server">
  <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
                <Parameters></Parameters>
            </ReportSource>
            <ClientEvents ExportBegin="" Error="" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
