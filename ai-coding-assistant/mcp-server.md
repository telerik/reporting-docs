---
title: MCP Server
page_title: Telerik Reporting MCP Server
description: "Learn how to add and use the Telerik Reporting MCP Server as a .NET Telerik Reporting AI coding assistant and code generator for increased developer productivity."
slug: ai-mcp-server
tags: telerik, reporting, ai, server, mcp, dotnet,coding assistant
published: True
position: 2
---

# Telerik Reporting MCP Server

The Telerik Reporting [MCP (Model Context Protocol) Server](https://modelcontextprotocol.io/introduction) enhances your AI-powered development experience by providing specialized context about Telerik Reporting libraries.

This MCP server enables AI-powered IDEs and tools to generate more accurate, tailored code that leverages [Telerik Reporting](https://www.telerik.com/products/reporting.aspx) APIs. You can ask complex questions about Reporting, request specific implementations, and generate comprehensive code solutions.

## Prerequisites for the MCP Server

In addition to the [prerequisites for the AI Coding Assistant]({%slug ai-coding-assistant%}#prerequisites-for-the-ai-coding-assistant), To use the Telerik Reporting MCP server, you need:

* [Node.js](https://nodejs.org/en) 18 or newer.
* An [MCP-compatible client](https://modelcontextprotocol.io/clients) that supports **MCP tools** (latest version recommended).
* A [Telerik user account](https://www.telerik.com/account/).
* An active [DevCraft or Telerik Reporting license](https://www.telerik.com/purchase.aspx?filter=web) or a [Telerik Reporting trial](https://www.telerik.com/reporting).
* An application that uses the [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}).


## Installation

Install the Telerik Reporting MCP server using npm:

````bash
npm i @progress/telerik-reporting-mcp
````

### Configuration

Use these settings when configuring the server in your MCP client:

|Setting|Value|
|----|----|
| Package Name | `@progress/telerik-reporting-mcp` |
| Type | `stdio` (standard input/output transport) |
| Command | `npx` |
| Arguments | `-y` |
| Server Name | `telerikReportingAssistant` (customizable) |

### License Configuration

Add your [Telerik license key]({%slug license-key%}) as an environment parameter in your `mcp.json` file using one of these options:

* Option 1: License File Path (Recommended)

````json
"env": {
	"TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE"
}
````


* Option 2: Direct License Key

````json
"env": {
	"TELERIK_LICENSE": "YOUR_LICENSE_KEY_HERE"
}
````


> **Option** 1 is recommended unless you're sharing settings across different systems. Remember to [update your license key]({%slug license-key%}#updating-your-license-key) when necessary.

## Visual Studio

For complete setup instructions, see [Use MCP servers in Visual Studio](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers).

> Early Visual Studio 17.14 versions require the **Copilot Chat** window to be open when opening a solution for the MCP server to work properly.

### Workspace-Specific Setup:

1. Add `.mcp.json` to your solution folder (mind the leading dot '.'):

	````json
{
	"servers": {
		"telerikReportingAssistant": {
		"type": "stdio",
		"command": "npx",
		"args": ["-y", "@progress/telerik-reporting-mcp@latest"],
		"env": {
			"TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
			// or
			"TELERIK_LICENSE": "YOUR_LICENSE_KEY"
		}
		}
	}
}
````


1. Restart Visual Studio.
1. Enable the `telerikReportingAssistant` tool in the [Copilot Chat window's tool selection dropdown](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers?view=vs-2022#configuration-example-with-github-mcp-server).

### Global Setup:

Add the `.mcp.json` file to your user directory (`%USERPROFILE%`, e.g., `C:\Users\{user}\.mcp.json`).

## Visual Studio Code

For complete setup instructions, see [Use MCP servers in Visual Studio Code](https://code.visualstudio.com/docs/copilot/chat/mcp-servers).

> **Visual Studio Code 1.102.1 or newer** is required to use the Telerik MCP Server

The basic setup in Visual Studio Code follows these steps:

1. Enable [`chat.mcp.enabled`](vscode://settings/chat.mcp.enabled) in Visual Studio Code settings.
2. Create `.vscode/mcp.json` in your workspace root (or user folder for global setup):

	````json
{
	"servers": {
		"telerik-reporting-assistant": {
		"type": "stdio",
		"command": "npx",
		"args": ["-y", "@progress/telerik-reporting-mcp@latest"],
		"env": {
			"TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
			// or
			"TELERIK_LICENSE": "YOUR_LICENSE_KEY"
		}
		}
	}
}
````


	This enables you to call the MCP Server with the `#telerik-reporting-assistant` handle. To use a custom handle, change the server name in the `mcp.json`.

3. For global discovery, enable [`chat.mcp.discovery.enabled`](vscode://settings/chat.mcp.discovery.enabled) in `settings.json`:

	````json
{
	"chat.mcp.discovery.enabled": true
}
````


4. Restart Visual Studio Code.

![Installed Reporting MCP Server in VS Code](images/installed-reporting-mcp-server-in-vs-code.png)

## Cursor

For complete setup instructions, see [Model Context Protocol](https://docs.cursor.com/context/mcp).

Create `.cursor/mcp.json` in your workspace root (or user folder for global setup):

````json
{
	"mcpServers": {
		"telerikReportingAssistant": {
		"type": "stdio",
		"command": "npx",
		"args": ["-y", "@progress/telerik-reporting-mcp@latest"],
		"env": {
			"TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
			// or
			"TELERIK_LICENSE": "YOUR_LICENSE_KEY"
		}
		}
	}
}
````

This enables you to call the MCP Server with the `#telerik-reporting-assistant` handle. To use a custom handle, change the server name in the `mcp.json`.


## Usage

To use the Telerik Reporting MCP Server:

1. Choose your preferred mode and model.<br/>At the time of publishing, **Claude Sonnet 4** and **GPT-5** produce optimal results.

2. Start your prompt with `#telerik-reporting-assistant` (or with '#' followed by your [custom MCP server name](#configuration), if set):

3. Inspect the output and verify that the MCP server is used. Look for messages similar to the ones below:

	- Visual Studio: `Running telerikReportingAssistant`
	- Visual Studio Code: `Running telerik-reporting-assistant`
	- Cursor: `Calling MCP tool telerikReportingAssistant`

4. If the Telerik Reporting MCP server is not used even though it's installed and enabled, double-check the server name in your configuration and try rephrasing your prompt.
5. If requested, grant the Telerik Reporting MCP Server permissions to run for this session, workspace, or always.

6. Start fresh sessions for unrelated prompts to avoid context pollution.

### Improving Server Usage

To increase the likelihood of the Telerik MCP server being used, add custom instructions to your AI tool:

- [GitHub Copilot custom instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot#about-repository-custom-instructions-for-github-copilot-chat)
- [Cursor rules](https://docs.cursor.com/context/rules)

### Sample Prompts

The following examples demonstrate useful prompts for the Telerik Reporting MCP Server:

* "`#telerik-reporting-assistant` Add a Telerik Report Viewer to my native Angular application."
* "`#telerik-reporting-assistant` Connect the Telerik Report Viewer to my Telerik Report Server instance."

>tip Visit the [Telerik Reporting Prompt Library](slug:ai-prompt-library) for more sample prompts.

## Number of Requests

A Telerik [Subscription license](https://www.telerik.com/purchase.aspx?filter=web) is recommended in order to use the Telerik Reporting AI Coding Assistant without restrictions. Perpetual license holders and trial users can make a [limited number of requests per year]({%slug ai-coding-assistant%}#number-of-requests).

## Local AI Model Integration

You can use the Telerik Reporting MCP server with local large language models (LLMs):

1. Run a local model, for example, through [Ollama](https://ollama.com).
1. Use a bridge package like [MCP-LLM Bridge](https://github.com/patruff/ollama-mcp-bridge).
1. Connect your local model to the Telerik MCP server.

This setup allows you to use the Telerik AI Coding Assistant without cloud-based AI models.

## See Also

* [Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%})
* [AI Coding Assistant Overview]({%slug ai-coding-assistant%})
* [Telerik Reporting Prompt Library]({%slug ai-prompt-library%})
* For applications using [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) see the [Kendo UI for Angular MCP Server](https://www.telerik.com/kendo-angular-ui/components/ai-assistant/mcp-server) article.
* For applications using [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) see the [Telerik Blazor MCP Server](https://www.telerik.com/blazor-ui/documentation/ai/mcp-server) article.