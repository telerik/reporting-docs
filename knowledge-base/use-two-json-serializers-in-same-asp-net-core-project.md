---
title: Use Both 'System.Text.Json' and 'Newtonsoft.Json' for Serialization in ASP.NET Core
description: "Learn how you may use both 'System.Text.Json' and 'Newtonsoft.Json' for serialization in ASP.NET Core project with Telerik Reporting REST Service."
type: how-to
page_title: Serializing with both 'System.Text.Json' and 'Newtonsoft.Json' in the same ASP.NET Core project
slug: use-two-json-serializers-in-same-asp-net-core-project
tags: telerik,reporting,serialize,json,newtonsoft
ticketid: 1626724
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

A common requirement is to use [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/api/system.text.json?view=net-7.0) for serialization, instead of the required by the [Reporting REST SErvice]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) serialization package [Newtonsoft.Json](https://www.nuget.org/packages/Newtonsoft.Json/).

## Suggested Workarounds

The most suitable workarounds are explained in the feature request [Migrate to System.Text.Json for serialization, instead of using Newtonsoft.Json](https://feedback.telerik.com/reporting/1506593-migrate-to-system-text-json-for-serialization-instead-of-using-newtonsoft-json).

In this article you may find a link to a sample with the implementation suggested in the Stackoverflow thread [How to configure two JSON serializers and select the correct one based on the route](https://stackoverflow.com/questions/59650907/how-to-configure-two-json-serializers-and-select-the-correct-one-based-on-the-ro).

The sample project may be downloaded from our reporting-samples Github repository [Two Json Serializers](https://github.com/telerik/reporting-samples/tree/master/TwoJsonSerializers).

To ensure that the approach works you may put break points in the conditional statements for the two formatters in the method `ReadRequestBodyAsync` or `WriteResponseBodyAsync` of the `Controllers\CustomJsonFormatters.cs` file. The `Newtonsoft.Json` formatter should be hit when the Reporting REST Service is called by the viewer or by calling manually the service, for example, at the `~/api/reports/version`. The `System.Text.Json` formatter should be used when calling the Values controller, for example, at the end-point `~/api/values`.

Here is the code of the class that is not implemented in the Stackoverflow thread:

````CSharp
internal class MySuperJsonOutputFormatter : TextOutputFormatter
{
	public MySuperJsonOutputFormatter()
	{
		SupportedEncodings.Add(Encoding.UTF8);
		SupportedEncodings.Add(Encoding.Unicode);
		SupportedMediaTypes.Add("application/json");
	}

	public override async Task WriteResponseBodyAsync(OutputFormatterWriteContext context, Encoding selectedEncoding)
	{
		var httpContext = context.HttpContext;
		var mvcOpt = httpContext.RequestServices.GetRequiredService<IOptions<MvcOptions>>().Value;
		var formatters = mvcOpt.OutputFormatters;
		TextOutputFormatter formatter = null;

		Endpoint endpoint = httpContext.GetEndpoint();
		if (endpoint.Metadata.GetMetadata<UseSystemTextJsonAttribute>() != null)
		{
			formatter = formatters.OfType<SystemTextJsonOutputFormatter>().FirstOrDefault();
		}
		else if (endpoint.Metadata.GetMetadata<UseNewtonsoftJsonAttribute>() != null)
		{
			// don't use `Of<NewtonsoftJsonInputFormatter>` here because there's a NewtonsoftJsonPatchInputFormatter
			formatter = (NewtonsoftJsonOutputFormatter)(formatters
				.Where(f => typeof(NewtonsoftJsonOutputFormatter) == f.GetType())
				.FirstOrDefault());
		}
		else
		{
			throw new Exception("This formatter is only used for System.Text.Json InputFormatter or NewtonsoftJson InputFormatter");
		}

		await formatter.WriteResponseBodyAsync(context, selectedEncoding);
	}
}
````

## See Also

* [Migrate to System.Text.Json for serialization, instead of using Newtonsoft.Json](https://feedback.telerik.com/reporting/1506593-migrate-to-system-text-json-for-serialization-instead-of-using-newtonsoft-json)
* [How to configure two JSON serializers and select the correct one based on the route](https://stackoverflow.com/questions/59650907/how-to-configure-two-json-serializers-and-select-the-correct-one-based-on-the-ro)
* [Two Json Serializers](https://github.com/telerik/reporting-samples/tree/master/TwoJsonSerializers)
