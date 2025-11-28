---
title: Get AI Response
page_title: Get AI Response Request Explained
description: "Learn how to use the Get AI Response endpoint of the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/features-api/get-ai-response
tags: get,ai,response
published: True
reportingArea: RESTService, RESTServiceCore
position: 2
---

# `Get AI Response` Overview

The `Get AI Response` endpoint allows you to send a query to the AI assistant for a specific report document and receive a generated response. This enables users to interact with the report using natural language and obtain report insights powered by AI.

## Request

    POST /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/ai/{threadId}/query

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|The ID of the service client that started the AI thread. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance used for the AI thread. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the generated report document that is summarized. Returned by [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|
|`threadId`|String|ID of the AI thread for the current conversation. Returned by [Create AI Thread]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/features-api/create-ai-thread%}).|

__Request Body__

A JSON object containing a query property.

## Response

| HTTP Status Code | Description |
| ----- | ----- |
|`202 Accepted`|The AI response is successfully generated.|

__Response Body__

A JSON object containing the AI-generated response to the user's query.

## Sample

* Request

        POST /api/reports/clients/4476c114dbb/instances/99834da5858/ai/57fc76d2cf8/query HTTP/1.1

        {
            "query": "Generate an executive summary of this report."
        }

* Response

        HTTP/1.1 202 Accepted

        {
          "response": "The \"Employee Sales Summary\" report provides a comprehensive analysis of sales performance for the month of July 2003, specifically highlighting the achievements of employee David Campbell. The report presents data through various visualizations and metrics, including:\n\n1. **Yearly Sales Comparison**: A graphical representation that compares the sales performance across different years (2001 to 2004) on a monthly basis. Key observations include that July 2003 saw significant sales, particularly in comparison to previous years, indicating a positive growth trend.\n\n2. **Category Sales Comparison**: This section highlights sales by product category (Accessories, Bikes, Clothing, Components) for 2001 to 2004. Notably, the category \"Bikes\" exhibited the highest sales figures consistently across these years, which underlines its importance in the overall product strategy.\n\n3. **Order Summary**: A detailed crosstab section providing an order summary for July 2003, which outlines specific sales orders and amounts by category. The total sales amount for the reported month reaches $172,106.68, showcasing the overall success of the sales efforts for the employee during this period.\n\nIn summary, the report illustrates strong sales performance led by David Campbell, with notable metrics indicating year-over-year growth and dominance in specific categories, particularly in bikes. This analysis serves as a valuable tool for strategic planning and identifying opportunities for further growth within the sales department."
        }
        