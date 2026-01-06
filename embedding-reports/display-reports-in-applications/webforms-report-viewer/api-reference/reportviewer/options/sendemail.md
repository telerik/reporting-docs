---
title: SendEmail
page_title: SendEmail property
description: "Gets or sets the email functionality configuration including enabled state, format selection, and default recipients. Configures the send email feature within the HTML5 viewer toolbar, including preselected rendering formats and default email addresses for enhanced user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/sendemail
published: True
reportingArea: WebForms
---

# The `SendEmail` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the email functionality configuration including enabled state, format selection, and default recipients. Configures the send email feature within the HTML5 viewer toolbar, including preselected rendering formats and default email addresses for enhanced user experience.

## Type

[`Telerik.ReportViewer.Html5.WebForms.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/sendemail%})

## Examples

````XML
<!-- Example: Set the SendEmail property to enable the Send Email functionality in the HTML5 WebForms ReportViewer. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SendEmail Example</title>
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
            </ReportSource>
             <SendEmail  />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [SendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/sendemail%})


