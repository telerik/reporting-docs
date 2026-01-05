---
title: PageMode
page_title: PageMode property
description: "Gets or sets the viewer's page mode. SinglePage - Displays only one report page in PageArea container. ContinuousScroll - Displays large amount of report pages by appending additional pages on demand. ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/pagemode
published: True
reportingArea: WebForms
---

# The `PageMode` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the viewer's page mode.

- SinglePage - Displays only one report page in PageArea container.
- ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.
- ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing.

## Type

[`Telerik.ReportViewer.Html5.WebForms.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/pagemode%})

## Examples

````XML
<!-- Example demonstrating the use of the PageMode property for the Telerik ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PageMode Property Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set PageMode to SinglePage-->
          <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PageMode="SinglePage">
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

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
* [PageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/pagemode%})
