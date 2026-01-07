---
title: InitialPageAreaImageUrl
page_title: InitialPageAreaImageUrl property
description: "Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid. Provides visual feedback to users when the HTML5 viewer cannot display report content due to missing or invalid parameter values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl
published: True
reportingArea: WebForms
---

# The `InitialPageAreaImageUrl` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid. Provides visual feedback to users when the HTML5 viewer cannot display report content due to missing or invalid parameter values.

## Type

`System.String`

## Examples

````XML
<!-- Example demonstrating the use of InitialPageAreaImageUrl property in Telerik ReportViewer -->


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
</head>
<body>
    <form runat="server">
        <!-- Set InitialPageAreaImageUrl to display a custom image when parameter values are missing or invalid -->
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
               InitialPageAreaImageUrl="~/images/no-params-image.png">
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

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/overview%})
* [KeepClientAlive]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/keepclientalive%})
* [PageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/pagemode%})

