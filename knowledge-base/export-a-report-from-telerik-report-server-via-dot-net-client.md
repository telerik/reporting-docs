---
title: Export Report from Report Server via .NET Client
description: "Learn how to render a report from the Telerik Report Server via .NET Client using only the Web API exposed by the Report Server."
type: how-to
page_title: Download a report from Telerik Report Server through .NET Client
slug: export-a-report-from-telerik-report-server-via-dot-net-client
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Products</td>
			<td>Progress® Telerik® Reporting, Report Server</td>
		</tr>
	</tbody>
</table>

## Description

[Telerik Report Server](https://www.telerik.com/report-server) has its Web API exposed, allowing you to consume resources from third-party applications as an administrator, after logging in. You can find examples with JavaScript client in the REST API section of the online documentation:

* [Login and saving the access token for further usage](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/examples/javascript/login)
* [Resources - listing resources like reports available on the Report Server](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/examples/javascript/get-resources)
* [Export a report by getting its ID first](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/examples/javascript/export) 

The same JavaScript client can be written as a .NET client that executes requests and handles their response in code.

## Solution

1. Use the [Report Server API Client](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/report-server-api-client) for the .NET Framework we distribute with the installation of the Telerik Reporting product. The client's API reference can be found in [Telerik.ReportServer.HttpClient](/api/telerik.reportserver.httpclient).
1. Create a custom .NET Framework, .NET Core or .NET client. The following solution demonstrates:

	* How to Login to the Report Server through the .NET client;
	* How to get a collection of all reports available on the report serve through the .NET client;
	* How to export a report available on the report server through the .NET client;
	* How to download the exported document through the .NET client;

	````C#
class Program
	{
		static HttpClient client = new HttpClient();
		static string reportServerAddress = "http://localhost:83/";
		static string serverREStAPI = reportServerAddress + "api/reportserver/";
		static void Main(string[] args)
		{
			Console.WriteLine("Demo started");
			RunAsync().Wait();

			Console.WriteLine("Demo ended");
			Console.ReadLine();
		}

		static async Task RunAsync()
		{
			// Our .NET Client
			client.BaseAddress = new Uri(serverREStAPI);
			client.DefaultRequestHeaders.Accept.Clear();
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

			//log the user to allow further operations
			var userToken = LogIn("admin", "admin123");

			//authorize further requests
			client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userToken);

			//list all reports
			var reports = await GetReportsAsync(serverREStAPI + "reports");

			//get document id for first report
			var firstReportId = reports[0]["Id"];
			var documentID = await ExportReportAsync(serverREStAPI + "documents", "PDF", firstReportId, "");

			//download PDF from documentID
			DownloadPDF(serverREStAPI + "documents/", documentID, false);
		}

		//log user
		static string LogIn(string usernameInput, string passwordInput)
		{
			var data = new FormUrlEncodedContent(new[]{
			new KeyValuePair<string, string>( "grant_type" ,"password" ),
				new KeyValuePair<string, string>( "username" , usernameInput ),
				new KeyValuePair<string, string>( "password" , passwordInput )
			});
			// "grant_type=password&username=" + usernameInput + "&password=" + passwordInput;

			HttpResponseMessage response = client.PostAsync(reportServerAddress + "Token", data).Result;
			response.EnsureSuccessStatusCode();

			var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
			dynamic result = serializer.DeserializeObject(response.Content.ReadAsStringAsync().Result);
			return result["access_token"];
		}

		//list categories
		static async Task<List<Dictionary<string, string>>> GetReportsAsync(string path)
		{
			List<Dictionary<string, string>> reports = null;

			HttpResponseMessage response = await client.GetAsync(path);
			if (response.IsSuccessStatusCode)
			{
				reports = await response.Content.ReadAsAsync<List<Dictionary<string, string>>>();
			}
			return reports;
		}

		//export in PDF a report
		static async Task<string> ExportReportAsync(string path, string format, string reportId, string parameterValuesJSONSerieliazed)
		{
			var data = new { ReportId = reportId, Format = format, ParameterValues = parameterValuesJSONSerieliazed };
			HttpResponseMessage response = await client.PostAsJsonAsync(path, data);
			response.EnsureSuccessStatusCode();

			var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
			dynamic result = serializer.DeserializeObject(response.Content.ReadAsStringAsync().Result);
			return result["DocumentId"];
		}

		//download PDF
		static void DownloadPDF(string path, string documentID, bool asAttachment)
		{
			var queryString = "";

			if (asAttachment)
			{
				queryString += "?content-disposition=attachment";
			}

			string fileName = "test1.pdf";
			string folderName = System.IO.Path.GetTempPath();
			string filePath = System.IO.Path.Combine(folderName, fileName);
			using (System.Net.WebClient myWebClient = new System.Net.WebClient())
			{
				myWebClient.DownloadFile(path + documentID + queryString, filePath);
			}

			System.Diagnostics.Process.Start(filePath);
		}
	}
````


## Notes

Please note that this is not an end solution, but an example illustrating how to format a request to the Report Server and the type of information returned in responses. You can use any other client to submit requests and get responses by the Report Server.

## See Also

* [REST API Reference](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/api-reference)
* [Displaying Reports From Report Server Through Custom Report Source Resolver]({%slug displaying-reports-from-report-server-through-custom-report-source-resolver%})
* [Displaying Complex Report Documents from Report Server through Custom ReportSource Resolver]({%slug displaying-reportbooks-and-reports-with-subreports-from-report-server-using-custom-report-source-resolver%})
