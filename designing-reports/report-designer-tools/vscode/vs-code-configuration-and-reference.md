---
title: VS Code Configuration and Reference
page_title: VS Code Extension Configuration and Commands | Telerik Reporting
description: Configure connections and licensing in the Telerik Reporting VS Code extension, and continue in an application for advanced configuration.
slug: reporting-vs-code-configuration-and-reference
tags: reporting, vscode, configuration, commands, settings
published: True
position: 4
reportingArea: General
components: [general]
---

# VS Code Configuration and Reference

The Telerik Reporting extension provides settings for the configuration used by the Web Report Designer and its local Reporting service. Use this article to configure named database connections and licensing, troubleshoot the local service, and reference the extension's commands and settings.

Reports that require application-level configuration, such as custom resource locations, assemblies with custom user functions, or additional control over the Reporting service, are better handled in a Web Report Designer application. See [Continuing in a Web Report Designer Application](slug:reporting-vs-code-configuration-and-reference#continuing-in-a-web-report-designer-application).

## Configuring a Data Connection

A named connection lets a report use the same connection name across environments while the connection details remain specific to the machine where you design the report. For example, if a report refers to `ReportingDemo`, configure a connection with the same name in the `telerik-reporting.connectionStrings` VS Code setting.

To configure the named connection:

1. Run **Preferences: Open User Settings (JSON)** from the **Command Palette**.
2. Add the `telerik-reporting.connectionStrings` setting shown below, or update its existing entry.
3. Save the settings and any pending report edits. If the designer is already open, run **Telerik Reporting: Restart Designer**. Otherwise, open the report to start the local Reporting service.

The following setting maps `ReportingDemo` to a SQL Server connection:

```json
{
  "telerik-reporting.connectionStrings": {
    "ReportingDemo": {
      "connectionString": "Server=localhost;Database=ReportingDemo;Integrated Security=True;",
      "providerName": "Microsoft.Data.SqlClient"
    }
  }
}
```

The `ReportingDemo` key must match the connection name used by the report.

## Configuring a License

You can design and preview reports before configuring a license, but exported documents display a licensing watermark. To remove it, make a valid Telerik Reporting license available to the extension's local Reporting service.

To configure the license:

1. If you do not have a Telerik Reporting license, [start a free trial](https://www.telerik.com/try/reporting).
2. Follow [the manual license-key download instructions](slug:license-key#downloading-manually) to download your `telerik-license.txt` file.
3. Run **Telerik Reporting: Set License** and select the downloaded file. The extension stores its absolute path in the `telerik-reporting.licensePath` VS Code setting.
4. Save any pending report edits. If the designer is already open, run **Telerik Reporting: Restart Designer**.
5. Export the report again and verify that the licensing watermark no longer appears.

AI-assisted authoring also requires an eligible Telerik Reporting Subscription or Trial license and access to a language model through VS Code. For the remaining setup and the editing workflow, see [Using AI-Assisted Authoring](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports#using-ai-assisted-authoring).

## Command Reference

The Telerik Reporting extension provides commands for common report-authoring tasks and for managing the local Reporting service. Open the **Command Palette** and search for `Telerik Reporting:` to find them.

| Command | Purpose |
|---|---|
| **Telerik Reporting: Open Report** | Select a `.trdp`, `.trdx`, or `.trdj` report and open it in the Telerik Report Designer. |
| **Telerik Reporting: Create Report** | Create an empty `.trdx` report in a location you choose and open it in the designer. |
| **Telerik Reporting: Preview Report** | Open the report in a separate live-preview viewer beside the designer. |
| **Telerik Reporting: Export To Application** | Generate an ASP.NET Core application with the Web Report Designer and selected reports and assets. |
| **Telerik Reporting: Show Runtime Logs** | Open the **Telerik Reporting Designer** output channel to inspect local-service, configuration, and generated-project messages. |
| **Telerik Reporting: Restart Designer** | Restart the local Reporting service and reconnect open designers and viewers. Save pending report edits before restarting. |
| **Telerik Reporting: Set License** | Select a Telerik license file and store its path in the `telerik-reporting.licensePath` VS Code setting. |

## Settings Reference

Search for `telerik-reporting` in VS Code Settings to find the options provided by the extension. The table shows each setting's default value and VS Code scope so that you can see whether it applies to a report folder, the current window, your VS Code profile, or the local machine.

| Setting | Default | Scope | Purpose |
|---|---|---|---|
| `telerik-reporting.reportsDirectory` | `""` | Resource | Set the folder that the local Reporting service uses as the reports root. When empty, the extension uses the open folder or, for a report opened outside a folder, the report's own location. |
| `telerik-reporting.connectionStrings` | `{}` | Machine | Provide named database connections to the local Reporting service. Store machine-specific connection details here rather than in the report or repository. |
| `telerik-reporting.licensePath` | `""` | Machine | Set the path to `telerik-license.txt`. Use an absolute path to a license file stored outside the repository. |
| `telerik-reporting.dotnetPath` | `""` | Machine | Set the absolute path to `dotnet`, or leave empty to use `PATH`. This setting is used for generated-application builds and is not required for report design or preview in VS Code. |
| `telerik-reporting.ai.model` | `""` | Application | Store the language model selected for the AI Report Generator. When empty or when the selected model is unavailable, the next AI request prompts you to choose a model. |
| `telerik-reporting.theme` | `auto` | Window | Choose `auto`, `light`, `dark`, `classic-light`, or `classic-dark`. With `auto`, the designer and viewer follow the VS Code color theme. |
| `telerik-reporting.liveViewerRefresh` | `true` | Resource | Refresh an open report viewer after you save the corresponding report in the designer. Set to `false` when you want to refresh the viewer manually. |

## See Also

For related setup and report workflows, see:

* [Creating and Previewing a Report in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [Downloading and Setting Up a License Key](slug:license-key)