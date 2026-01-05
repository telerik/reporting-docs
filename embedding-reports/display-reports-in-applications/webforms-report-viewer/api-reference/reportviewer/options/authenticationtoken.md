---
title: AuthenticationToken
page_title: AuthenticationToken property
description: "Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service. Provides security for report access and ensures that only authorized users can view reports through the HTML5 viewer interface."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/authenticationtoken
published: True
reportingArea: WebForms
---

# The `AuthenticationToken` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service. Provides security for report access and ensures that only authorized users can view reports through the HTML5 viewer interface.

## Type

`System.String`

## Examples

````XML
<!-- Example of setting the report viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Report Viewer AuthenticationToken Example</title>
</head>
<body>
    <form runat="server">
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              AuthenticationToken="your_encoded_authentication_token_here">
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
