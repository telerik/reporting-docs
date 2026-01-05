---
title: Telerik.ReportViewer.Mvc.SendEmail
page_title: Telerik.ReportViewer.Mvc.SendEmail Type
description: "Provides a class for the send e-mail message options. Contains the enabled property, the preselected rendering Format, from and to e-mail addresses."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/sendemail
published: True
reportingArea: MVCWrapper
---

# The `SendEmail` type of the HTML5 ASP.NET MVC Report Viewer

Provides a class for the send e-mail message options. Contains the enabled property, the preselected rendering Format, from and to e-mail addresses.

## Constructors

| Constructor | Description |
| ------ | ------ |
| SendEmail() | The default constructor. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | A string used for the MailMessage Body value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail body. |
| CC | `System.String` | A valid e-mail for the e-mail message CC address.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified CC e-mail addresses. |
| Enabled | `System.Boolean` | Indicates whether to show the send e-mail button |
| Format | `System.String` | The preselected rendering format. <br>The users can modify this value in the Send Mail Message dialog. |
| From | `System.String` | A valid e-mail for the e-mail message FROM address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified FROM e-mail address. |
| Subject | `System.String` | A string used for the MailMessage Subject value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail subject. |
| To | `System.String` | A valid e-mail for the e-mail message TO address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified TO e-mail address. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer SendEmail Example";
}

<!-- Example demonstrating how to configure the SendEmail options of the report viewer -->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .SendEmail(new SendEmail
    {
        Enabled = true, // Enables the Send Email button
        Subject = "Monthly Report", // Sets the default subject
        Body = "Please find the attached report.", // Sets the default email body
        To = "recipient@example.com", // Sets default recipient
        From = "sender@example.com", // Sets default sender
        CC = "cc@example.com", // Sets default CC recipient
        Format = "PDF" // Sets default format (e.g. PDF, XLSX)
    })
)
````

