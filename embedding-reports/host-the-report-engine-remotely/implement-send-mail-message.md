---
title: Implement Send Mail Message
page_title: Implementing the Send Mail Message Tutorial
description: "Learn how to Implement Send Mail Message in Telerik Reporting Report Viewers that work with REST Service."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/implement-send-mail-message
tags: implement,send,mail,message
published: True
position: 7
previous_url: /telerik-reporting-rest-implement-send-mail-message,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/implement-send-mail-message
reportingArea: General
---

# Implementing Send Mail Message

This tutorial elaborates how to implement the `SendMailMessage` method required for [sending email messages](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message) through report viewers that are connected to a Reporting REST Service.

### Controllers Setup

When the Reporting REST Service has been implemented using controllers, [override](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/override) the `SendMailMessage` method of the of the [ReportsController](/api/telerik.reporting.services.webapi.reportscontrollerbase).

{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=SendMailMessage_Implementation}}
{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=SendMailMessage_Implementation}}

### Minimal API Setup

When the Reporting REST Service has been implemented using [Minimal API](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api), first implement a method, which will send the [MailMessage](https://learn.microsoft.com/en-us/dotnet/api/system.net.mail.mailmessage) object via the [SmtpClient](https://learn.microsoft.com/en-us/dotnet/api/system.net.mail.smtpclient):

```C#
public static HttpStatusCode MyMailSender(MailMessage message)
{
    try
    {
        using (var smtpClient = new SmtpClient("tests.com", 26))
        {
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Credentials = new NetworkCredential("user", "pass");
            smtpClient.EnableSsl = true;
            smtpClient.Send(message);
        }
        return HttpStatusCode.OK;
    }
    catch
    {
        return HttpStatusCode.InternalServerError;
    }
}
```

Then, this method can be given alongside the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration) of the Reporting REST Service when adding it in `Program.cs`:

```C#
var mailContext = new MailContext(MyMailSender);
var reportServiceConfiguration = new ReportServiceConfiguration
{
    ReportingEngineConfiguration = builder.Configuration,
    HostAppId = "Reporting",
    Storage = new FileStorage(),
    ReportSourceResolver = new TypeReportSourceResolver()
                                .AddFallbackResolver(
                                    new UriReportSourceResolver("C:\\Reports"))
};

builder.Services.AddRazorPages().AddTelerikReporting(reportServiceConfiguration, mailContext);
```

## See Also

- [Send Mail Message](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message)
