---
title: Resolving Issues with AI-Powered Insights Integration in .NET Framework
description: Troubleshoot problems with integrating the built-in AI Client for AI-Powered Insights in Telerik Reporting for .NET Framework, including handling assembly binding redirects and first-chance exceptions.
type: troubleshooting
page_title: AI Client Integration Troubleshooting in .NET Framework
meta_title: AI Client Integration Troubleshooting in .NET Framework
slug: troubleshoot-ai-client-integration-net-framework
tags: reporting, ai-client, integration, binding-redirects, system, troubleshooting
res_type: kb
ticketid: 1703027
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Telerik Reporting</td>
</tr>
<tr>
<td>target framework</td>
<td>.NET Framework 4.6.2+</td>
</tr>
</tbody>
</table>

## Description

I want to use the built-in _MicrosoftExtensionsOpenAI_ AI Client in Telerik Reporting as explained in the article [Using AI-Powered Insights with a REST Service]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-builtin-client%}).

After configuring the `<AIClient>` element in the `web.config` file and adding the required dependencies as NuGet packages, the AI client is not functioning as expected.

* I ensured the `<configSections>` element includes the `Telerik.Reporting` section at the top of the `web.config` file:

	````XML
<configuration>
		<configSections>
			<section
				name="Telerik.Reporting"
				type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
				allowLocation="true"
				allowDefinition="Everywhere"/>
		</configSections>
		<Telerik.Reporting>
			<AIClient
				friendlyName="MicrosoftExtensionsOpenAI"
				model="gpt-4o-mini"
				credential="MY_API_KEY">
			</AIClient>
		</Telerik.Reporting>
	</configuration>
````


* I ensured the following packages are referenced in my Reporting project with the correct versions:

	- Telerik.Reporting.AI.Microsoft.Extensions.OpenAI
	- Telerik.Reporting.AI.Microsoft.Extensions.Abstractions
	- Microsoft.Extensions.AI.OpenAI
	- Microsoft.Extensions.AI.Abstractions
	- OpenAI

## Cause

The issue may be related to assembly binding conflicts in the .NET Framework project. The above packages have inner dependencies that would be added by the NuGet Package Manager of Visual Studio automatically to the project. The package manager may fail to add the required binding-redirects when you use NuGet packages in the .NET Framework projects, causing runtime errors.

## Solution

Here are the suggested approaches for troubleshooting:

* Attach a [Trace Listener](https://learn.microsoft.com/en-us/dotnet/framework/debug-trace-profile/how-to-create-and-initialize-trace-listeners) to the project hosting the Reporting Engine. Fix the AI-related errors if any.

The Telerik Reporting code handles some of the errors, and they may not appear in the trace log. The errors handled in the code appear as First-chance exceptions in the Visual Studio output. Such errors may occur due to mismatched assembly versions or missing assemblies in the Global Assembly Cache (GAC).

* Enable first-chance exceptions in Visual Studio to identify specific assembly loading issues during runtime. Refer to [Understanding Exceptions while debugging with Visual Studio](https://devblogs.microsoft.com/devops/understanding-exceptions-while-debugging-with-visual-studio/) for instructions.

	If you see errors related to Visual Studio not being able to load specific assembly versions:
	- Find out which version is installed in your project or in the GAC. It must be equal or greater than the required one.
	- Add or update binding-redirects for conflicting assemblies in the `web.config`. Here is an example with assemblies binding-redirects I had to add to my ASP.NET MVC project to get the _MicrosoftExtensionsOpenAI_ AI Client work. In the general case, they may be different for your project:

		````XML
<dependentAssembly>
			<assemblyIdentity name="System.Memory" publicKeyToken="cc7b13ffcd2ddd51" />
			<bindingRedirect oldVersion="1.0.0.0-4.0.1.2" newVersion="4.0.1.2" />
		</dependentAssembly>
		<dependentAssembly>
			<assemblyIdentity name="System.Text.Json" publicKeyToken="cc7b13ffcd2ddd51" />
			<bindingRedirect oldVersion="1.0.0.0-8.0.0.5" newVersion="8.0.0.5" />
		</dependentAssembly>
		<dependentAssembly>
			<assemblyIdentity name="System.Memory.Data" publicKeyToken="cc7b13ffcd2ddd51" />
			<bindingRedirect oldVersion="1.0.0.0-8.0.0.1" newVersion="8.0.0.1" />
		</dependentAssembly>
````


	Continue adjusting the binding-redirects or removing them until the exceptions are resolved.

## See Also

* [Using AI-Powered Insights with a REST Service]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-builtin-client%})
* [Understanding Exceptions while debugging with Visual Studio](https://devblogs.microsoft.com/devops/understanding-exceptions-while-debugging-with-visual-studio/)
