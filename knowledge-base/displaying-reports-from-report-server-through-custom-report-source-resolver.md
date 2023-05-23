---
title: Displaying Reports From Report Server through Custom ReportSource Resolver
description: "Learn how to connect to the Telerik Report Server through Custom ReportSource Resolver and display a report hosted on the server."
type: how-to
page_title: Read Reports from Report Server in Custom ReportSource Resolver
slug: displaying-reports-from-report-server-through-custom-report-source-resolver
position: 
tags: 
ticketid: 1519100
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

Sometimes you want to avoid adding the Report Server's credentials in the initialization of the viewer. This can be done by the usage of [Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}).

## Solution

In this scenario, you need to render the reports in a custom Reporting REST Service rather than in the Report Server. You will need a Custom ReportSource Resolver, in which to download the report definition from the server and return it wrapped in the proper [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}).

1. You need to add references to the `Telerik.ReportServer.Services.Models` and `Telerik.ReportServer.HttpClient` assemblies that are distributed with the Report Server assembly.
1. In the `Resolve` method of the `CustomReportSourceResolver`, firstly, you should create a setting for the Report Server connection. Then based on the passed category and report name from the viewer, you need to get the report from the Report Server and return it as an [InstanceReportSource](/api/telerik.reporting.instancereportsource):

````CSharp
public class CustomReportSourceResolver : IReportSourceResolver
{
	public Telerik.Reporting.ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
	{
		var categoryAndReport = reportId.Split(new char[] { '-' });
		var categoryName = categoryAndReport[0];
		var reportName = categoryAndReport[1];

		var settings = new Telerik.ReportServer.HttpClient.Settings()
		{
			BaseAddress = "http://localhost:83/"
		};
		Telerik.Reporting.Report report = null;

		using (var rsClient = new ReportServerClient(settings))
		{
			rsClient.Login("myusername", "mypass");
			var categories = rsClient.GetCategories();
			var myCategoryId = categories.Where(item => item.Name == categoryName).First().Id;
			var reportInfos = rsClient.GetReportInfosInCategory(myCategoryId);
			var myReportId = reportInfos.Where(item => item.Name == reportName).First().Id;

			var reportDefinition = rsClient.GetLatestReportRevision(myReportId);
			var extension = reportDefinition.Extension;

			using (var sourceStream = new MemoryStream(reportDefinition.Content))
			{
				if (extension == "trdx")
				{
					using (System.Xml.XmlReader xmlReader = System.Xml.XmlReader.Create(sourceStream))
					{
						Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
							new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();
	
						report = (Telerik.Reporting.Report)
						xmlSerializer.Deserialize(xmlReader);
					}
				}
				else
				{
					var reportPackager = new ReportPackager();
					report = (Report)reportPackager.UnpackageDocument(sourceStream);
				}
			}
		}
		InstanceReportSource rs = new InstanceReportSource() { ReportDocument = report };
		return rs;
	}
}
````


## See Also

* [Displaying Complex Report Documents from Report Server through Custom ReportSource Resolver]({%slug displaying-reportbooks-and-reports-with-subreports-from-report-server-using-custom-report-source-resolver%})
