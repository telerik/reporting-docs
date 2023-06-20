---
title: Using Reporting Service API with HttpClient
description: "Learn how the Telerik Reporting REST Service can be used to render reports without the report viewers."
type: how-to
page_title: Rendering Reports through the Reporting REST Service without Report Viewer
slug: how-to-use-reporting-rest-service-api-with-csharp-client
tags: 
ticketid: 1381883
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description

Sometimes it is sufficient to generate and download reports in certain formats without displaying them in a report viewer.

One way to achieve this is by creating a custom class that internally uses the [HttpClient](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclient) to perform the necessary requests to the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to get the desired reports rendered on the server. 

## Solutions

### .NET Framework

1. First, we will need to create the models for the response data. We may use Newtonsoft.Json.JsonProperty to annotate the properties:

	````CSharp
public class ClientIDModel
	{
		[Newtonsoft.Json.JsonProperty("clientId")]
		public string ClientId { get; set; }
	}
	
	public class ReportSourceModel
	{
		[Newtonsoft.Json.JsonProperty("Report")]
		public string Report { get; set; }
		[Newtonsoft.Json.JsonProperty("ParameterValues")]
		public IDictionary<string, object> ParameterValues { get; set; }
	}
		
	public class InstanceIdModel
	{
		[Newtonsoft.Json.JsonProperty("instanceId")]
		public string InstanceId { get; set; }
	}
	
	public class DocumentIdModel
	{
		[Newtonsoft.Json.JsonProperty("documentId")]
		public string DocumentId { get; set; }
	}
	
	public class DocumentInfoModel
	{
		[Newtonsoft.Json.JsonProperty("documentReady")]
		public bool DocumentReady { get; set; }

		[Newtonsoft.Json.JsonProperty("PageCount")]
		public int PageCount { get; set; }

		[Newtonsoft.Json.JsonProperty("DocumentMapAvailable")]
		public bool DocumentMapAvailable { get; set; }
	}
	
	public class ErrorModel
	{
		[Newtonsoft.Json.JsonProperty("error")]
		public string Error { get; set; }

		[Newtonsoft.Json.JsonProperty("error_description")]
		public string Description { get; set; }
	}
````


1. Then, we can create a `ReportClient` class that internally uses the [HttpClient](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclient) to perform all necessary requests to the server such as registering a new client, creating a new instance, etc.

	````CSharp
public class ReportClient : IDisposable
	{
		public string BaseAddress { get; set; }
		public HttpClient client;
		public string ClientId;

		public ReportClient(string uri)
		{
			this.client = new HttpClient();
			this.BaseAddress = uri;

			this.client.BaseAddress = new Uri(this.BaseAddress);
		}

		public void Dispose()
		{
			using (this.client) { }
		}

		public void RegisterClient()
		{
			var headers = new List<KeyValuePair<string, string>>();
			var content = new FormUrlEncodedContent(headers);

			var registerClientTask = this.client.PostAsync(this.BaseAddress + "/clients", content);
			var response = registerClientTask.Result;

			if (response.IsSuccessStatusCode)
			{
				var clientIdTask = response.Content.ReadAsAsync<ClientIDModel>();
				var clientId = clientIdTask.Result;
				this.ClientId = clientId.ClientId;
			}
			else
			{
				var error = response.Content.ReadAsAsync<ErrorModel>().Result;
				throw new Exception(error.Description);
			}
		}

		public string CreateInstance(string reportSource)
		{
			HttpContent content = new StringContent(reportSource, Encoding.UTF8, "application/json");

			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances";
			var instanceTask = this.client.PostAsync(route, content);

			InstanceIdModel instanceId = null;
			var response = instanceTask.Result;
			if (response.IsSuccessStatusCode)
			{
				instanceId = response.Content.ReadAsAsync<InstanceIdModel>().Result;
			}
			else
			{
				var error = response.Content.ReadAsAsync<ErrorModel>().Result;
				throw new Exception(error.Description);
			}

			return instanceId.InstanceId;
		}

		public string CreateDocument(string instanceId, string format, string deviceInfo = null, string useCache = "true")
		{
			string contentBody = $"{{ \"useCache\": {useCache}, \"format\": \"{format}\" }}";
			HttpContent content = new StringContent(contentBody, Encoding.UTF8, "application/json");

			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents";
			var documentTask = this.client.PostAsync(route, content);

			DocumentIdModel documentId = null;
			var response = documentTask.Result;
			if (response.IsSuccessStatusCode)
			{
				documentId = response.Content.ReadAsAsync<DocumentIdModel>().Result;
			}
			else
			{
				var error = response.Content.ReadAsAsync<ErrorModel>().Result;
				throw new Exception(error.Description);
			}

			return documentId.DocumentId;
		}

		public bool DocumentIsProcessing(string instanceId, string documentId)
		{
			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents/{documentId}/Info";

			var documentInfoTask = this.client.GetAsync(route);

			DocumentInfoModel documentInfo = null;
			var response = documentInfoTask.Result;
			if (response.IsSuccessStatusCode)
			{
				documentInfo = response.Content.ReadAsAsync<DocumentInfoModel>().Result;
			}
			else
			{
				var error = response.Content.ReadAsAsync<ErrorModel>().Result;
				throw new Exception(error.Description);
			}

			return !documentInfo.DocumentReady;
		}

		public byte[] GetDocument(string instanceId, string documentId)
		{
			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents/{documentId}";

			var getDocumentTask = this.client.GetAsync(route);

			byte[] documentBytes = null;
			var response = getDocumentTask.Result;
			if (response.IsSuccessStatusCode)
			{
				documentBytes = response.Content.ReadAsByteArrayAsync().Result;
			}
			else
			{
				var error = response.Content.ReadAsAsync<ErrorModel>().Result;
				throw new Exception(error.Description);
			}

			return documentBytes;
		}

		private static void EnsureSuccessStatusCode(HttpResponseMessage response)
		{
			if (!response.IsSuccessStatusCode)
			{
				throw
					new Exception(
						response.ReasonPhrase +
						Environment.NewLine +
						response.RequestMessage.RequestUri);
			}
		}
	}
````


1. In the end, the `ReportClient` may be used as follows for rendering the report:

	````CSharp
// 1. Register client
	ReportClient restServiceClient = InitializeReportClient(restServiceUrl);


	// 2. Create Report Instance

	ReportSourceModel reportSourceModel = new ReportSourceModel()
	{
		Report = "Barcodes Report.trdp"
	};

	string reportSource = JsonConvert.SerializeObject(reportSourceModel);
	string reportInstanceId = CreateReportInstance(restServiceClient, reportSource);


	// 3. Create Document
	string reportDocumentId = CreateDocument(restServiceClient, reportInstanceId, "PDF");


	// 4. Get Document
	byte[] result = GetDocument(restServiceClient, reportInstanceId, reportDocumentId);
	File.WriteAllBytes("c:\\temp\\Barcodes Report.pdf", result);
````


### .NET Core/ .NET

1. In .NET Core/.NET the models will be mostly the same expect that we may use the [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/api/system.text.json) namespace instead, for example:

	````CSharp
public class ClientIDModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("clientId")]
		public string ClientId { get; set; }
	}

	public class ReportSourceModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("Report")]
		public string Report { get; set; }
		[System.Text.Json.Serialization.JsonPropertyName("ParameterValues")]
		public IDictionary<string, object> ParameterValues { get; set; }
	}

	public class InstanceIdModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("instanceId")]
		public string InstanceId { get; set; }
	}

	public class DocumentIdModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("documentId")]
		public string DocumentId { get; set; }
	}

	public class DocumentInfoModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("documentReady")]
		public bool DocumentReady { get; set; }

		[System.Text.Json.Serialization.JsonPropertyName("PageCount")]
		public int PageCount { get; set; }

		[System.Text.Json.Serialization.JsonPropertyName("DocumentMapAvailable")]
		public bool DocumentMapAvailable { get; set; }
	}

	public class ErrorModel
	{
		[System.Text.Json.Serialization.JsonPropertyName("error")]
		public string Error { get; set; }

		[System.Text.Json.Serialization.JsonPropertyName("error_description")]
		public string Description { get; set; }
	}
````

1. The [ReadAsAsync](https://learn.microsoft.com/en-us/previous-versions/aspnet/hh835763(v=vs.118)) method utilized in `.NET Framework` example above is a `.NET Standard` extension that is shared between ASP.NET Core and ASP.NET Web Api (via a NuGet library). However, it uses `JSON.NET` to do the deserialization, and as of .NET Core 3.0, ASP.NET Core now uses [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/api/system.text.json) instead. As such, this library (and the extension it contains) is not included in the `.NET Core 3.0+` framework because doing so would require including the JSON.NET library in addition to System.Text.Json. Thus, instead of adding the `Microsoft.AspNet.WebApi.Client` (and `Newtonsoft.Json` along with it), we can implement the extension method ourselves using:

	````CSharp
public static class HttpContentExtensions
	{
		public static async Task<T> ReadAsAsync<T>(this HttpContent content) =>
			await System.Text.Json.JsonSerializer.DeserializeAsync<T>(await content.ReadAsStreamAsync());
	}
````


1. The `ReportClient` class will be mostly the same as in the `.NET Framework` with the addition of the [async/await](https://learn.microsoft.com/en-us/dotnet/csharp/asynchronous-programming/) syntax.

	````CSharp
public class ReportClient : IDisposable
	{
		public string BaseAddress { get; set; }
		public HttpClient client;
		public string ClientId;

		public ReportClient(string uri)
		{
			this.client = HttpClientFactory.Create();
			this.BaseAddress = uri;

			this.client.BaseAddress = new Uri(this.BaseAddress);
		}

		public void Dispose()
		{
			using (this.client) { }
		}

		public async Task RegisterClient()
		{
			var headers = new List<KeyValuePair<string, string>>();
			var content = new FormUrlEncodedContent(headers);

			var response = await this.client.PostAsync(this.BaseAddress + "/clients", content);

			if (response.IsSuccessStatusCode)
			{
				var clientIdTask = await response.Content.ReadAsAsync<ClientIDModel>();
				this.ClientId = clientIdTask.ClientId;
			}
			else
			{
				var error = await response.Content.ReadAsAsync<ErrorModel>();
				throw new Exception(error.Description);
			}
		}

		public async Task<string> CreateInstance(string reportSource)
		{
			HttpContent content = new StringContent(reportSource, Encoding.UTF8, "application/json");

			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances";
			var response = await this.client.PostAsync(route, content);

			InstanceIdModel instanceId = null;
			if (response.IsSuccessStatusCode)
			{
				instanceId = await response.Content.ReadAsAsync<InstanceIdModel>();
			}
			else
			{
				var error = await response.Content.ReadAsAsync<ErrorModel>();
				throw new Exception(error.Description);
			}

			return instanceId.InstanceId;
		}

		public async Task<string> CreateDocument(string instanceId, string format, string deviceInfo = null, string useCache = "true")
		{
			string contentBody = $"{{ \"useCache\": {useCache}, \"format\": \"{format}\" }}";
			HttpContent content = new StringContent(contentBody, Encoding.UTF8, "application/json");

			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents";
			var response = await this.client.PostAsync(route, content);

			DocumentIdModel documentId = null;
			if (response.IsSuccessStatusCode)
			{
				documentId = await response.Content.ReadAsAsync<DocumentIdModel>();
			}
			else
			{
				var error = await response.Content.ReadAsAsync<ErrorModel>();
				throw new Exception(error.Description);
			}

			return documentId.DocumentId;
		}

		public async Task<bool> DocumentIsProcessing(string instanceId, string documentId)
		{
			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents/{documentId}/Info";

			var response = await this.client.GetAsync(route);

			DocumentInfoModel documentInfo = null;
			if (response.IsSuccessStatusCode)
			{
				documentInfo = await response.Content.ReadAsAsync<DocumentInfoModel>();
			}
			else
			{
				var error = await response.Content.ReadAsAsync<ErrorModel>();
				throw new Exception(error.Description);
			}

			return !documentInfo.DocumentReady;
		}

		public async Task<byte[]> GetDocument(string instanceId, string documentId)
		{
			string route = $"{this.BaseAddress}/clients/{this.ClientId}/instances/{instanceId}/documents/{documentId}";

			var response = await this.client.GetAsync(route);
			byte[] documentBytes;

			if (response.IsSuccessStatusCode)
			{
				documentBytes = await response.Content.ReadAsByteArrayAsync();
			}
			else
			{
				var error = await response.Content.ReadAsAsync<ErrorModel>();
				throw new Exception(error.Description);
			}

			return documentBytes;
		}

		private static void EnsureSuccessStatusCode(HttpResponseMessage response)
		{
			if (!response.IsSuccessStatusCode)
			{
				throw
					new Exception(
						response.ReasonPhrase +
						Environment.NewLine +
						response.RequestMessage.RequestUri);
			}
		}
	}
````


1. In the end, executing the code to render the report may look as follows:

	````CSharp
static async Task ExportReportFromServiceAsync(string reportName, string format, string baseUrl)
	{
		// 1. Register client
		ReportClient reportClient = new ReportClient(baseUrl);
		await reportClient.RegisterClient();


		// 2. Create Report Instance
		ReportSourceModel reportSourceModel = new ReportSourceModel()
		{
			Report = reportName
		};

		string reportSource = System.Text.Json.JsonSerializer.Serialize(reportSourceModel);
		string reportInstanceId = await reportClient.CreateInstance(reportSource);


		// 3. Create Document
		string reportDocumentId = await reportClient.CreateDocument(reportInstanceId, format);

		bool documentProcessing;
		do
		{
			Thread.Sleep(500);// wait before next Info request
			documentProcessing = await reportClient.DocumentIsProcessing(reportInstanceId, reportDocumentId);
		} while (documentProcessing);

		// 4. Get Document
		byte[] result = await reportClient.GetDocument(reportInstanceId, reportDocumentId);
		File.WriteAllBytes($"C:\\temp\\{reportName}.{format.ToLower()}", result);
	}
````


## Sample Project

* [Sample Project](https://github.com/telerik/reporting-samples/tree/master/RenderReportFromService)

## See Also

* [Reporting REST Service API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [HttpClient Class](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclient)
* [HttpContent does not contain a definition for "ReadAsAsync"](https://stackoverflow.com/questions/58956527/migrating-net-core-2-to-net-core-3-httpcontent-does-not-contain-a-definition)
