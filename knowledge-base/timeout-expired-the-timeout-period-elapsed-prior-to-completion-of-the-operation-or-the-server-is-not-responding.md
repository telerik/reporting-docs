---
title: Timeout expired. The timeout period elapsed prior to completion of the operation or the server is not responding. The statement has been terminated.
description: "Timeout expired. The timeout period elapsed prior to completion of the operation or the server is not responding. error message."
type: troubleshooting
page_title: Execution Timeout Expired. The Timeout Period Elapsed Error.
slug: timeout-expired-the-timeout-period-elapsed-prior-to-completion-of-the-operation-or-the-server-is-not-responding
tags: DataSources, RESTService
ticketid: 1348174
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>12.2.18.1017</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

The error message _"Execution Timeout Expired. The timeout period elapsed prior to completion of the operation or the server is not responding."_ is returned from the attempt to connect to the SQL server database.

## Error Message

`Timeout expired. The timeout period elapsed prior to completion of the operation or the server is not responding. The statement has been terminated.`

## Solution

The common troubleshooting approach for connectivity issues (timeout issues) is extending the connection timeouts in the [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}). You can try the following suggestions:

1. Test using a larger value for the [CommandTimeout](/api/telerik.reporting.sqldatasource#collapsible-Telerik_Reporting_SqlDataSource_CommandTimeout) property;
1. Test using a larger value in the connection string as well;
1. Extend the execution timeout in the _web.config_ file with an even bigger value than you've set initially, for example:

   ```XML
   <httpRuntime executionTimeout="7200" />
   ```

In case the report retrieves a large amount of data, you might consider filtering the data on the retrieval. We suggest reviewing the information in [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) and [Performance Considerations]({%slug telerikreporting/designing-reports/performance-considerations%}) help articles and see what can be applied to the current project.

## Notes

If this does not help, to proceed we would need the following information:

- Use [Fiddler](https://www.telerik.com/fiddler) to follow the exact requests to/responses from the REST Service. The entire error Stack Trace should be available in the corresponding response when previewed with Fiddler. Save the generated traffic as [SAZ](https://docs.telerik.com/fiddler/Save-And-Load-Traffic/Tasks/CreateSAZ) file.
- Attach a [Trace Listener](https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/how-to-create-and-initialize-trace-listeners) to the REST Service project (add the corresponding section to the project _web.config_ file) to obtain information on where and why the error occurs.

After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed to reproduce the issue.
