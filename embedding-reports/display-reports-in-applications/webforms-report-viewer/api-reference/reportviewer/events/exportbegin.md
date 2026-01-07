---
title: ExportBegin
page_title: ExportBegin event
description: "Gets or sets the name of the JavaScript function that will be called prior to starting the report export command. The export begin event is triggered before the HTML5 ReportViewer starts generating the export document."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/exportbegin
published: True
reportingArea: WebForms
---

# The `ExportBegin` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called prior to starting the report export command. The export begin event is triggered before the HTML5 ReportViewer starts generating the export document.

## Example

````XML
<!-- Example: Setting the ExportBegin client event in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // JavaScript function to handle ExportBegin event
        function onExportBegin(sender, args) {
            // Add custom logic before export starts
            alert("Export is about to begin.");
        }
    </script>
</head>
<body>
    <form runat="server">
       <telerik:ReportViewer 
            ID="reportViewer1"
            ServiceUrl="/api/reports/"
            runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents ExportBegin="onExportBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/overview%})
* [ExportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/exportend%})
* [InteractiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionenter%})

