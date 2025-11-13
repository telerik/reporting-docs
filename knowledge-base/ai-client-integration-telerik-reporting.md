---
title: Resolving Issues with AI-Powered Insights Integration in Telerik Reporting
description: Troubleshoot problems with integrating the built-in AI Client for AI-Powered Insights in Telerik Reporting, including handling assembly binding redirects and first-chance exceptions.
type: troubleshooting
page_title: AI Client Integration Troubleshooting in Telerik Reporting
meta_title: AI Client Integration Troubleshooting in Telerik Reporting
slug: ai-client-integration-telerik-reporting
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

I want to use the built-in AI Client in Telerik Reporting. After configuring the `<AIClient>` element in the `web.config` file, the AI client is not functioning as expected.

## Cause

The issue may be related to assembly binding conflicts in the .NET Framework project. First-chance exceptions occur due to mismatched assembly versions or missing assemblies in the Global Assembly Cache (GAC). Visual Studio may fail to add the required binding redirects automatically, causing runtime errors.

## Solution

To resolve the issue, follow these steps:

1. Ensure the `<configSections>` element includes the `Telerik.Reporting` section at the top of the `web.config` file:

   ````xml
   <configuration>
       <configSections>
           <section name="Telerik.Reporting"
                   type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
                   allowLocation="true" allowDefinition="Everywhere"/>
       </configSections>
   </configuration>
   ````

1. Verify that the NuGet package `Telerik.Reporting.AI.Microsoft.Extensions.OpenAI` is referenced in your project. This package includes dependencies for the built-in AI Client.

1. Add or update binding redirects for conflicting assemblies in the `web.config`:

   ````xml
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

1. Enable first-chance exceptions in Visual Studio to identify specific assembly loading issues during runtime. Refer to [Understanding Exceptions while debugging with Visual Studio](https://devblogs.microsoft.com/devops/understanding-exceptions-while-debugging-with-visual-studio/) for instructions.

1. Check the versions of the required assemblies installed in the GAC. Ensure that the binding redirects match the versions loaded in your project. If a redirected version does not exist in the GAC, either update the binding redirect or remove it.

1. Debug the project, and observe the first-chance exceptions. Continue adjusting the binding redirects or removing them until the exceptions are resolved.

1. Compare your project with a working example. Use the linked muted video and reference project shared by the support team for troubleshooting.

## See Also

- [Using AI-Powered Insights with a REST Service](https://docs.telerik.com/reporting/interactivity/built-in-client-integration-ai-insights#using-ai-powered-insights-with-a-rest-service)
- [Understanding Exceptions while debugging with Visual Studio](https://devblogs.microsoft.com/devops/understanding-exceptions-while-debugging-with-visual-studio/)
