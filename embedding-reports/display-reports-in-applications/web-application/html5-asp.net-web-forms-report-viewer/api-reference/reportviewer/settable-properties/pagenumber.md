---
title: PageNumber
page_title: PageNumber property
description: "Gets or sets the current page number of the report displayed in the HTML5 viewer. <remarks>Determines which page is initially displayed when the report loads in the HTML5 viewer interface.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/pagenumber
published: True
reportingArea: WebFormsWrapper
---

# PageNumber

Gets or sets the current page number of the report displayed in the HTML5 viewer. <remarks>Determines which page is initially displayed when the report loads in the HTML5 viewer interface.</remarks>

## Type

`System.Int32`

## Examples

````JavaScript
<!-- Example: Setting the PageNumber property of the Telerik HTML5 ReportViewer in Web Forms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer PageNumber Property Example</title>
</head>
<body>
    <form runat="server">
        <%-- Set initial page number to 2 --%>
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PageNumber="1">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
