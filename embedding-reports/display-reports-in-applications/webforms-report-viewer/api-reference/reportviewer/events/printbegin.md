---
title: PrintBegin
page_title: PrintBegin event
description: "Gets or sets the name of the JavaScript function that will be called prior to starting the print report command. The print begin event is triggered before the HTML5 ReportViewer starts generating the print document."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/printbegin
published: True
reportingArea: WebForms
---

# The `PrintBegin` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called prior to starting the print report command. The print begin event is triggered before the HTML5 ReportViewer starts generating the print document.

## Example

````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
  <script type="text/javascript">
    // JavaScript function to be called before print command begins
    function onPrintBegin(e) {
        // Custom logic before print starts
        alert("Printing will begin.");
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

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/overview%})
* [PrintEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/printend%})
* [Ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/ready%})

