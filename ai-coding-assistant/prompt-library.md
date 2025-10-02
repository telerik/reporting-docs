---
title: Prompt Library
page_title: Telerik Reporting AI Prompt Library Overview
description: "Learn about the Telerik Reporting AI Prompt Library  – a collection of reusable prompts to boost productivity and output quality."
slug: ai-prompt-library
tags: ai, telerik, reporting, prompt, library
published: True
position: 3
---

<style>
	code {
		font-size: 1rem @important;
		font-weight: 700 !important;
	}
	
	th {
		font-weight: 700 !important;
		font-size: large !important;
	}
</style>

# AI Prompt Library

The prompts provided here are intended and optimized for use with Telerik Reporting [AI Coding Assistant]({%slug ai-coding-assistant%}). When you run them in the [GitHub Copilot Extension]({%slug ai-copilot-extension%}) or the [MCP Server]({%slug ai-mcp-server%}), these prompts will help you kick-start your app development, speed up the component configuration process, and troubleshoot your code.

You can use the provided prompts as they are or modify them to fit your use case. Make sure to start your prompt with the required prefix (`@telerikreporting` for the [GitHub Copilot Extension]({%slug ai-copilot-extension%}) or `#telerik-reporting-assistant ` for the [MCP Server]({%slug ai-mcp-server%}) handle).

You can also use the prompts with any AI-powered tool of your choice. However, the Telerik Reporting AI Coding Assistant is developed to provide highly accurate results based extensively on the documentation, APIs, and community knowledge for Telerik Reporting. Running the prompts outside the AI Coding Assistant may not produce as relevant results.

The list of prompts is not exhaustive, and the Telerik Reporting team is constantly working on adding more prompts to the library.

## How to Use This Library

Quick Start Guide:

1. Find a prompt that matches your needs
1. Copy the prompt text
1. Paste it in your IDE with the AI Assistant
1. Customize the prompt for your specific use case.

> caution Always double-check the code and solutions proposed by an AI-powered tool before applying them to your project.

## Report Viewer Prompts

#### Blazor Report Viewers

<table>
	<tr>
		<th>Blazor Report Viewer</th>
		<th>Native Blazor Report Viewer</th>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to connect the Blazor Report Viewer to a Telerik Report Server?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the displayed report on a button click in the Native Blazor Report Viewer?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to pass a bearer token through the Blazor Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the culture of the rendered report in the Native Blazor Report Viewer?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to to show ComboBox editors for the report parameters in the Blazor Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the date format in the displayed report in the Native Blazor Report Viewer?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the displayed report on a button click in the Blazor Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to connect the Native Blazor Report Viewer to a Telerik Report Server?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to move the parameters area inside the Blazor Report Viewer to be on the left side instead of the right?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to hide the export button in the Native Blazor Report Viewer's toolbar?
			</code></pre>
		</td>
	</tr> 	
</table>

#### Angular Report Viewers

<table>
	<tr>
		<th>Angular Report Viewer</th>
		<th>Native Angular Report Viewer</th>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to connect the Angular Report Viewer to a Telerik Report Server?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to use dropdown for the the report parameters of the Native Angular Report Viewer?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to pass a bearer token through the Angular Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to hide the export button from the Native Angular Report Viewer's toolbar?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to to show DateTimePicker editors for report parameters of type DateTime in the Angular Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to print the report from the Native Angular Report Viewer using client-side code?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the displayed report on a button click in the Angular Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to display a custom indicator in the UI when an error is encountered in the Native Angular Report Viewer?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to move the parameters area inside the Angular Report Viewer to be on the left side instead of the right?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to set the reportSource of the Native Angular Report Viewer?
			</code></pre>
		</td>
	</tr> 	
</table>

#### HTML5 & React Report Viewers

<table>
	<tr>
		<th>HTML5 Report Viewer</th>
		<th>React Report Viewer</th>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to connect the HTML5 Report Viewer to a Telerik Report Server?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the displayed report on a button click in the React Report Viewer?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to pass a bearer token through the HTML5 Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to add a custom indicator in the UI when an error is encountered in the React Report Viewer?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to to show ComboBox editors for the report parameters in the HTML5 Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to connect the React Report Viewer to a Telerik Report Server?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to change the displayed report on a button click in the HTML5 Report Viewer?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant How to show ComboBox editors for report parameters in the React Report Viewer?
			</code></pre>
		</td>
	</tr> 
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How to move the parameters area inside the HTML5 Report Viewer to be on the left side instead of the right?
			</code></pre>
		</td>
		<td>
			<pre><code>
#telerik-reporting-assistant The document map panel is missing in the React Report Viewer, how to display it?
			</code></pre>
		</td>
	</tr> 	
</table>

## Reporting Service Prompts

<table>
	<tr>
		<th>Telerik Reporting REST Service</th>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How do I set up the Telerik Reporting REST Srevice in an ASP.NET Core projects that targets .NET 9?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant How do I set up the Telerik Reporting REST Srevice in an ASP.NET Framework projects that targets .NET Framework 4.8?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant I want to email the report as an email attachment, how do I do that? Explain it step-by-step.
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant Can I pass a List object from my Web API controller directly to a report’s DataSource? Explain how and give me an example.
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant In production, the report viewer displays `Client with ID 'xxxxxx' not found. Expired `. In local environment, it loads the reports as expected. How could I resolve this?
			</code></pre>
		</td>
	</tr>
	<tr>  
		<td>
			<pre><code>
#telerik-reporting-assistant Can I use a database as a storage for my report files in the Reporting REST service? Show me an example.
			</code></pre>
		</td>
	</tr>
</table>

## See Also

- [Telerik Reporting AI Tooling Overview]({%slug ai-coding-assistant %})
- [Telerik Reporting MCP Server]({%slug ai-mcp-server %})
- [Telerik Reporting Copilot Extension]({%slug ai-copilot-extension %})
- [Kendo UI for Angular GitHub Copilot Extension](https://www.telerik.com/kendo-angular-ui/components/ai-assistant/copilot-extension)
- [Telerik Blazor GitHub Copilot Extension](https://www.telerik.com/blazor-ui/documentation/ai/copilot-extension)
