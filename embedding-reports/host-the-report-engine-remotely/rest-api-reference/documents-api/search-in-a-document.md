---
title: Search in a Document
page_title: Search in a Document Request Revealed
description: "Learn how to make the Search in a Document request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/search-in-a-document
tags: search,in,a,document
published: True
position: 7
previous_url: /telerik-reporting-rest-documents-api-search-in-document,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/search-in-a-document
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 25%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# `Search in a Document` Overview

## Request

	POST /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/search

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned by [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|

__Request Body__

[SearchInfo]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchinfo%}) describing the search arguments.

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Search is performed successfully and returns at least one result.|
|`204 No Content`|The search returned no results.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId cannot be found.|

__Response Body__

When the return status is `OK` the response body contains a JSON array of [SearchResultsInfo]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchresultsinfo%}) objects representing the search results.

## Sample

* Request

		POST /api/reports/clients/f3c380da635/instances/c71aeb824cf/documents/495ff8766803332209ef12/search HTTP/1.1

		{
			"searchToken": "foo",
			"matchCase": false,
			"matchWholeWord": false,
			"useRegularExpressions": true
		}

* Response

		HTTP/1.1 200 Ok

		{
			"description": "Quarterly Sales Dashboard for 2003",
			"id": "a082030a03fa4e349abe183d161a35ea",
			"page": 1
		}
