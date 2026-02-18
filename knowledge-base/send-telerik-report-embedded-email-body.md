---
title: How to Send a Telerik Report Embedded in an Email Body
description: "Learn how to programmatically export a report to images and then embed them into the email when using web report viewers."
type: how-to
page_title: Sending a Telerik Report Embedded in an Email Body
slug: send-telerik-report-embedded-email-body
tags: telerik, reporting, email, embedded, programmatically
res_type: kb
---

## Environment

| Property | Value                        |
| -------- | ---------------------------- |
| Product  | Progress® Telerik® Reporting |

## Description

I want to embed the report document inside the mail message sent by the [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%}) functionality instead of sending it as an attachment.

## Solution

The default method used for sending the email is [CreateMailMessage(SendDocumentArgs, DocumentData)](/api/telerik.reporting.services.webapi.reportscontrollerbase#collapsible-Telerik_Reporting_Services_WebApi_ReportsControllerBase_CreateMailMessage_Telerik_Reporting_Services_WebApi_SendDocumentArgs_Telerik_Reporting_Services_Engine_DocumentData_) which always returns the report document as attachment. A new method needs to be implemented to avoid that.

1. Before implementing a new endpoint, we need to create a helper class for rendering the reports to images since the report will be embedded in the email body using the [img](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) element.

   ```C#
   public class ReportRenderer
   {
   	public List<Stream> streams = new();
   	string ReportsPath { get; set; }

   	public ReportRenderer(string reportsPath)
   	{
   		this.ReportsPath = reportsPath;
   	}

   	void CloseStreams()
   	{
   		foreach (Stream stream in this.streams)
   		{
   			stream.Close();
   		}
   		this.streams.Clear();
   	}

   	public Stream CreateStream(string name, string extension, Encoding encoding, string mimeType)
   	{
   		MemoryStream ms = new();
   		this.streams.Add(ms);
   		return ms;
   	}

   	public List<string> Render(ReportSourceModel reportSourceModel)
   	{
   		var list = new List<string>();
   		var report = Path.Combine(this.ReportsPath, reportSourceModel.Report);

   		var deviceInfo = new Hashtable
   		{
   			{ "OutputFormat", "PNG" }
   		};

   		Telerik.Reporting.Processing.ReportProcessor reportProcessor = new();

   		var reportSource = new Telerik.Reporting.UriReportSource() { Uri = report };
   		foreach (string key in reportSourceModel.Parameters.Keys)
   		{
   			reportSource.Parameters.Add(key, reportSourceModel.Parameters[key]);
   		}

   		bool result = reportProcessor.RenderReport("IMAGEPrintPreview", reportSource, deviceInfo, this.CreateStream, out string documentName);

   		foreach (MemoryStream ms in this.streams)
   		{
   			var str = Convert.ToBase64String(ms.ToArray());
   			list.Add(str);
   		}

   		this.CloseStreams();

   		return list;
   	}
   }
   ```

1. We will also need model classes for sending the relevant email data to our endpoint.

   ```C#
   public class ReportMail
   {
   	[JsonPropertyName("to")]
   	public string To { get; set; }
   	[JsonPropertyName("from")]
   	public string From { get; set; }
   	[JsonPropertyName("cc")]
   	public string CC { get; set; }
   	[JsonPropertyName("subject")]
   	public string Subject { get; set; }
   	[JsonPropertyName("body")]
   	public string Body { get; set; }
   	[JsonPropertyName("reportSource")]
   	public ReportSourceModel ReportSource { get; set; }
   }

   public class ReportSourceModel
   {
   	[JsonPropertyName("report")]
   	public string Report { get; set; }
   	[JsonPropertyName("parameters")]
   	public Dictionary<string, object> Parameters { get; set; }
   }
   ```

1. To add the option for embedding the report in the send mail dialog, we also need to `override` [GetDocumentFormats()](/api/telerik.reporting.services.webapi.reportscontrollerbase#collapsible-Telerik_Reporting_Services_WebApi_ReportsControllerBase_GetDocumentFormats) endpoint and return a separate `ExtensionInfo` entry for the new option which in this example will be named as `Embedded`.

   ```C#
   public override JsonResult GetDocumentFormats()
   {
   	var formats = new Telerik.Reporting.Services.Engine.ExtensionInfo[6] {
   	new()  {
   			Name = "Embedded",
   			LocalizedName = "Embedded" },
   	new() {
   			Name = "PDF",
   			LocalizedName = "PDF Document" },
   	new()  {
   			Name = "CSV",
   			LocalizedName = "CSV (comma delimited)" },
   	new()  {
   			Name = "DOCX",
   			LocalizedName = "Word Document" },
   	new()  {
   			Name = "XLSX",
   			LocalizedName = "Excel Worksheet" },
   	new()  {
   			Name = "PPTX",
   			LocalizedName = "PowerPoint Presentation" },
   	};
   	return Json(formats);
   }
   ```

1. The next step is to create the new endpoint that will handle creating the images using the helper class, embed them in the body of the email, and send it.

   ```C#
   [Route("cmail")]
   public HttpStatusCode CustomEmailMessage([FromBody] ReportMail message)
   {

   	using var smtpClient = new SmtpClient("SMTP_HOST", PORT);
   	smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
   	smtpClient.EnableSsl = false;

   	var mailMessage = GetMailWithImg(message);
   	smtpClient.Send(mailMessage);
   	return HttpStatusCode.OK;
   }

   private MailMessage GetMailWithImg(ReportMail message)
   {
   	MailMessage mail = new()
   	{
   		IsBodyHtml = true,
   		Subject = message.Subject,
   		From = new MailAddress(message.From),
   	};

   	if (!string.IsNullOrEmpty(message.To))
   	{
   		mail.To.Add(message.To);
   	}
   	else throw new Exception("Please provide an email address.");

   	if (!string.IsNullOrEmpty(message.CC)) mail.CC.Add(message.CC);

   	mail.AlternateViews.Add(GetEmbeddedImage(message.Body ?? string.Empty, message.ReportSource));
   	return mail;
   }

   private AlternateView GetEmbeddedImage(string htmlBody, ReportSourceModel reportSource)
   {
   	var reportsPath = "PATH_TO_REPORTS_FOLDER";
   	var reportRenderer = new ReportRenderer(reportsPath);
   	var images = reportRenderer.Render(reportSource);
   	htmlBody += "\r\n";

   	foreach (var image in images)
   	{
   		htmlBody += $"<img src=\"data:image/png;base64, {image}\" />";
   	}

   	AlternateView alternateView = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);
   	return alternateView;
   }
   ```

1. The last step lies in using the [sendEmailBegin(e, args)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailbegin(e,-args)%}) to stop the default handling of the send mail functionality and instead make a [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) request to the new endpoint for the case where the selected option is `Embedded`:

   ```JS
   $("#reportViewer1")
   .telerik_ReportViewer({
   	serviceUrl: "api/reports/",
   	reportSource: {
   		report: "Dashboard.trdp",
   	},
   	sendEmailBegin: function ({ data }, args) {

   		if (args.format === "Embedded") {
   			args.handled = true;

   			const from = $('[aria-label="From email address"]').val();
   			const to = $('[aria-label="Recipient email address"]').val();
   			const cc = $('[aria-label="Carbon Copy email address"]').val();
   			const subject = $('[aria-label="Email subject:"]').val();
   			const body = $('.trv-send-email-editor textarea').data("kendoEditor").value();

   			const reportSource = data.sender.reportSource();

   			try {
   				fetch("/api/reports/cmail", {
   					method: "POST",
   					headers: {
   						"Content-Type": "application/json",
   					},
   					body: JSON.stringify({
   						from,
   						to,
   						cc,
   						subject,
   						body,
   						reportSource
   					}),
   				});
   			} catch (error) {
   				console.error("Error:", error);
   			}
   		}
   	},
   	sendEmail: { enabled: true }
   });
   ```

## See Also

- [Generating Reports Programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%})
- [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%})
- [Implement Send Mail Message]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/implement-send-mail-message%})
