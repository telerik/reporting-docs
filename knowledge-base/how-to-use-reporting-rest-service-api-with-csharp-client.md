---
title: Use Telerik Reporting REST Service API with C Sharp HttpClient
description: Sample implementation of C# client for REST Service API
type: how-to
page_title: How to request reports from the Reporting REST Service without Report Viewer in C#
slug: how-to-use-reporting-rest-service-api-with-csharp-client
position: 
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
	<tr>
		<td>Preferred Language</td>
		<td>C Sharp</td>
	</tr>
</table>


## Description
Sometimes it is sufficient to generate and download reports in certain formats without displaying them in a viewer.

## Solution
You may create a custom _HttpClient_ that performs the necessary requests to the _Reporting REST Service_ to get the desired reports. Attached is a sample solution demonstrating how to use _Telerik Reporting REST Service_ with a simple C\# _HttpClient_. The solution includes the REST Service (_RestService1_ project) and the client in a separate Console application (_ConsoleApplication2_ project). The application exports the report in PDF format in _c:\\temp_ folder. The sample report uses the sample _AdventureWorks_ database. To run the report successfully it is required to have the database installed and to modify the named connection string in the _Web.config_ file of the _RestService1_ project according to your local settings.


[CSharpRestServiceClient.zip](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/csharprestserviceclient.zip?sfvrsn=6a528bf6_2)


The code of the HttpClient :
{% raw  %}
```CSharp
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
```
{% endraw %}    
    
Here are also the Models used :
    
    
    
```CSharp
    
    public class ClientIDModel
    {
        [JsonProperty("clientId")]
        public string ClientId { get; set; }
    }
    
    public class ReportSourceModel
    {
        [JsonProperty("Report")]
        public string Report { get; set; }
        [JsonProperty("ParameterValues")]
        public IDictionary<string, object> ParameterValues { get; set; }
    }
        
    public class InstanceIdModel
    {
        [JsonProperty("instanceId")]
        public string InstanceId { get; set; }
    }
    
    public class DocumentIdModel
    {
        [JsonProperty("documentId")]
        public string DocumentId { get; set; }
    }
    
    public class DocumentInfoModel
    {
        [JsonProperty("documentReady")]
        public bool DocumentReady { get; set; }

        [JsonProperty("PageCount")]
        public int PageCount { get; set; }

        [JsonProperty("DocumentMapAvailable")]
        public bool DocumentMapAvailable { get; set; }
    }
    
    public class ErrorModel
    {
        [JsonProperty("error")]
        public string Error { get; set; }

        [JsonProperty("error_description")]
        public string Description { get; set; }
    }    
```
