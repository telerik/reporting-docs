---
title: Implement Send Mail Message
page_title: Implement Send Mail Message | for Telerik Reporting Documentation
description: Implement Send Mail Message
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/implement-send-mail-message
tags: implement,send,mail,message
published: True
position: 7
---

# Implement Send Mail Message



This tutorial elaborates how to implement the SendMailMessage method of the [ReportsController]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%}).         This is required to enable the send document endpoint used for [HTML5 Report Viewer Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%}) functionality.       

## To send e-mail use the MailMessage with SMTP client as shown in the following code snippet:

{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=SendMailMessage_Implementation}}
````C#
protected override HttpStatusCode SendMailMessage(MailMessage mailMessage)
{
    using (var smtpClient = new SmtpClient("smtp.companyname.com", 25))
    {
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.EnableSsl = true;
        smtpClient.Send(mailMessage);
    }

    return HttpStatusCode.OK;
}
````
{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=SendMailMessage_Implementation}}
````VB
Protected Overrides Function SendMailMessage(ByVal mailMessage As MailMessage) As HttpStatusCode
    Using smtpClient = New SmtpClient("smtp.companyname.com", 25)
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network
        smtpClient.EnableSsl = True
        smtpClient.Send(mailMessage)
    End Using

    Return HttpStatusCode.OK
End Function
````

# See Also

 * [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%})
