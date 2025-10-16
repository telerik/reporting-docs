---
title: Displaying Complex Report Documents from Report Server through Custom ReportSource Resolver
description: "Learn How to display Report Books and Reports containing Sub Reports stored in the Report Server through Custom ReportSource Resolver."
type: how-to
page_title: Read Complex Report Documents from ReportServer in Custom Resolver
slug: displaying-reportbooks-and-reports-with-subreports-from-report-server-using-custom-report-source-resolver
position:
tags:
ticketid: 1586415
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

Sometimes you want to be able to render reports stored in your Report Server in a **custom Reporting REST Service**, rather than in your Report Server's instance. This can be done through the use of a [`Custom IReportSourceResolver`]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}), as shown in the [Displaying Reports From Report Server Through Custom Report Source Resolver]({%slug displaying-reports-from-report-server-through-custom-report-source-resolver%}) KB article.

Even though the aforementioned article covers the base scenario, when you are working with a more complex report, for example a [Report Book]({%slug telerikreporting/designing-reports/report-book/overview%}) or a Report that contains [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) items, you may encounter additional difficulties.

To cover these scenarios we will implement a `Custom Report Source Resolver` that retrieves a ReportBook containing Reports which have Sub Reports in their definitions.

## Solution

The general idea behind this solution is the following:

1. Find all report sources that point to reports, residing in the Report Server instance.
1. Retrieve the report definitions from the Server using the [`ReportServerClient`](/api/telerik.reportserver.httpclient.reportserverclient) class, and wrap them in an [InstanceReportSource](/api/telerik.reporting.instancereportsource).
1. Replace the original report sources _(as they are invalid outside of the Report Server environment)_ with the InstanceReportSources created in the previous step.
1. Repeat the above for every nested report _(SubReport/Report Book member)_.

   ```C#
   public class CustomReportSourceResolver : IReportSourceResolver
   {
   	public Telerik.Reporting.ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
   	{
   		var report = GetReportDocument(reportId);
   		InstanceReportSource rs = new InstanceReportSource() { ReportDocument = report };
   		return rs;
   	}

   	public IReportDocument GetReportDocument(string reportId)
   	{
   		var categoryAndReport = reportId.Split(new char[] { '/' });
   		var categoryName = categoryAndReport[0];
   		var reportName = categoryAndReport[1];

   		var settings = new Telerik.ReportServer.HttpClient.Settings()
   		{
   			BaseAddress = "http://localhost:83/"
   		};
   		Telerik.Reporting.IReportDocument report = null;

   		using (var rsClient = new ReportServerClient(settings))
   		{
   			rsClient.Login("admin", "password");
   			var categories = rsClient.GetCategories();
   			var myCategoryId = categories.Where(item => item.Name == categoryName).First().Id;
   			var reportInfos = rsClient.GetReportInfosInCategory(myCategoryId);
   			var myReportId = reportInfos.Where(item => item.Name == reportName).First().Id;

   			var reportDefinition = rsClient.GetLatestReportRevision(myReportId);
   			var extension = reportDefinition.Extension;

   			using (var sourceStream = new MemoryStream(reportDefinition.Content))
   			{
   				if (extension.Contains("trdx"))
   				{
   					using (System.Xml.XmlReader xmlReader = System.Xml.XmlReader.Create(sourceStream))
   					{
   						ReportXmlSerializer xmlSerializer = new ReportXmlSerializer();

   						report = ResolveSubReports((Report)xmlSerializer.Deserialize(xmlReader));
   					}
   				}
   				else
   				{
   					var reportPackager = new ReportPackager();
   					if (extension.Contains("trbp"))
   					{
   						report = ResolveReportBookMembers((ReportBook)reportPackager.UnpackageDocument(sourceStream));
   					}
   					else
   					{
   						report = ResolveSubReports((Report)reportPackager.UnpackageDocument(sourceStream));
   					}
   				}
   			}
   		}
   		return report;
   	}

   	public ReportBook ResolveReportBookMembers(ReportBook reportBook)
   	{
   		var invalidReportSourceIds = reportBook.ReportSources.Select(x => ((UriReportSource)x).Uri).ToList();
   		reportBook.ReportSources.Clear();
   		foreach (var id in invalidReportSourceIds)
   		{
   			IReportDocument report = GetReportDocument(id);
   			InstanceReportSource reportIRS = new InstanceReportSource() { ReportDocument = report };
   			reportBook.ReportSources.Add(reportIRS);
   		}
   		return reportBook;
   	}

   	public Report ResolveSubReports(Report report)
   	{
   		foreach (ReportItem reportItem in report.Items.Find(typeof(SubReport), true))
   		{
   			var id = ((UriReportSource)((SubReport)reportItem).ReportSource).Uri;
   			var subReport = GetReportDocument(id);
   			var subReportIRS = new InstanceReportSource() { ReportDocument = subReport };

   			((SubReport)reportItem).ReportSource = subReportIRS;
   		}
   		return report;
   	}
   }
   ```

## See Also

- [Displaying Reports From Report Server through Custom ReportSource Resolver]({%slug displaying-reports-from-report-server-through-custom-report-source-resolver%})
