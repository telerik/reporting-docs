---
title: ExportEnd
page_title: ExportEnd event
description: "Gets or sets the name of the JavaScript function that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/exportend
published: True
reportingArea: WebForms
---

# The `ExportEnd` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts.

## Example

````XML
<!-- Example: Setting the ExportEnd client event in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
   <script type="text/javascript">
    // This function will be called when the export is ready for download
    function onExportEnd(e) {
        // Custom logic here
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
            <ClientEvents ExportEnd="onExportEnd" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````



