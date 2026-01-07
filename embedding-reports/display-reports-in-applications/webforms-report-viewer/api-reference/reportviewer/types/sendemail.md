---
title: Telerik.ReportViewer.Html5.WebForms.SendEmail
page_title: Telerik.ReportViewer.Html5.WebForms.SendEmail Type
description: "Provides configuration options for the send email functionality within the HTML5 WebForms ReportViewer. Used to configure email settings including enabled state, preselected rendering format, and default email addresses for report sharing via email. Contains email message configuration properties that enable users to send reports directly from the HTML5 viewer toolbar with customizable default values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/sendemail
published: True
reportingArea: WebForms
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `SendEmail` type of the HTML5 ASP.NET WebForms Report Viewer

Provides configuration options for the send email functionality within the HTML5 WebForms ReportViewer. Used to configure email settings including enabled state, preselected rendering format, and default email addresses for report sharing via email. Contains email message configuration properties that enable users to send reports directly from the HTML5 viewer toolbar with customizable default values.

## Constructors

| Constructor | Description |
| ------ | ------ |
| SendEmail() | Initializes a new instance of the SendEmail class with default settings. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | A string used for the MailMessage Body value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail body.<br>Provides an optional default message body that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified email body. |
| CC | `System.String` | A valid e-mail for the e-mail message CC address.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified CC e-mail addresses.<br>Provides an optional default CC address that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified CC email addresses. |
| Enabled | `System.Boolean` | Gets or sets a value indicating whether the send email button is visible and enabled in the HTML5 viewer toolbar.<br>When enabled, displays the send email button in the HTML5 viewer toolbar allowing users to email reports directly from the viewer interface. |
| Format | `System.String` | The preselected rendering format. <br>The users can modify this value in the Send Mail Message dialog.<br>Specifies the default document format for email attachments that users can modify in the Send Mail Message dialog before sending the report. |
| From | `System.String` | A valid e-mail for the e-mail message FROM address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified FROM e-mail address.<br>Provides a default sender address that users can modify in the Send Mail Message dialog. If empty, users must specify the FROM address before sending. The SendMailMessage implementation must accept the specified FROM email address. |
| Subject | `System.String` | A string used for the MailMessage Subject value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail subject.<br>Provides an optional default subject that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified email subject. |
| To | `System.String` | A valid e-mail for the e-mail message TO address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified TO e-mail address.<br>Provides a default recipient address that users can modify in the Send Mail Message dialog. If empty, users must specify the TO address before sending. The SendMailMessage implementation must accept the specified TO email address. |

## Example

````C#
<!--
    Example: How to use the SendEmail class to enable the Send Mail toolbar button in <telerik:ReportViewer>.
-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
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
            <SendEmail Enabled="true"/>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/overview%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/getreportparameters%})
* [RenderDesignTimeHtml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/renderdesigntimehtml%})
* [ToString]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/tostring%})

