---
title: PrintEnd
page_title: PrintEnd event
description: "Gets or sets the name of the JavaScript function that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/printend
published: True
reportingArea: WebForms
---

# The `PrintEnd` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs.

## Example

    ````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
<script type="text/javascript">
    // This function will be called when the print document is ready for download
    function onPrintEnd(e) {
        // Add custom logic here, e.g. show a message to the user
        alert("Your PDF report is ready for download!");
    }
</script>
</head>
<body>
    <form runat="server">
        <!-- Example of setting the PrintBegin client event property -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents PrintBegin="onPrintBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


