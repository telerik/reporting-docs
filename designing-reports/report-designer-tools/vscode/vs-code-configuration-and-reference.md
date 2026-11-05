---
title: VS Code Configuration and Reference
page_title: VS Code Extension Configuration and Commands | Telerik Reporting
description: Configure data connections, report folders, and licensing for the Telerik Reporting VS Code extension, and find its commands and settings.
slug: reporting-vs-code-configuration-and-reference
tags: reporting, vscode, configuration, commands, settings
published: True
position: 4
reportingArea: General
components: [general]
---

# VS Code Configuration and Reference

Use this article to configure existing report dependencies, licensing, and the local backend. It also contains the complete command and setting reference for the Telerik Reporting extension for Visual Studio Code.

For a first report without a database or existing application, start with [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). To work with an existing report, see [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).

## Configuring a Data Connection

A named connection lets a report refer to a stable connection name instead of embedding environment-specific connection details in the report definition.

For example, a report can refer to `ReportingDemo`. The local configuration maps that name to the connection string on the current machine. The name in the configuration must match the name in the report.

For this example, use a SQL Server database that you can already access. The sample uses Windows integrated authentication. Replace the server, database, and authentication options with the values for your environment. The extension does not create the database.

To configure the named connection:

1. Open the report's folder as a trusted workspace in VS Code.
2. Run **Telerik Reporting: Add Config** and choose **Workspace Configuration**. In a multi-folder workspace, select the folder that contains the report.
3. In the generated `.vscode/telerik-reporting.json` file, replace the sample connection entries with the configuration below.
4. Save the configuration. Save any pending report edits, then run **Telerik Reporting: Restart** if a designer is already open. Otherwise, open the report to start the backend with the configuration.

The following configuration maps `ReportingDemo` to a SQL Server connection:

```json
{
  "connectionStrings": {
    "ReportingDemo": {
      "connectionString": "Server=localhost;Database=ReportingDemo;Integrated Security=True;",
      "providerName": "Microsoft.Data.SqlClient"
    }
  }
}
```

The outer `ReportingDemo` key must match the connection name in the report. The `Database=ReportingDemo` value identifies a database; it can differ from the connection name. `providerName` selects the SQL client provider.

Reopen the SQL Data Source Wizard and select `ReportingDemo` for a new data source, or keep the matching name in an existing one. To check the connection without a query against your application tables, test the following SQL statement in the wizard:

```sql
SELECT 'Configured connection' AS Message;
```

A successful test returns one row with a `Message` column. This result confirms that the local Reporting service can reach the database and authenticate. It does not confirm that your report's own query is valid or that its tables are accessible.

To display data in the report, follow [the Web Report Designer data-source guidance](slug:web-report-designer-user-guide-components-data-sources). Preview the report to verify its query results.

## Choosing the Configuration Location

The extension reads Reporting configuration from a workspace file, a user-profile file, or an explicit file path. Choose a location based on who needs the values.

**Telerik Reporting: Add Config** creates a configuration file from a template if the target file is missing, or opens the existing file without replacing it. The command offers the following locations:

| Location | Use case | File location |
|---|---|---|
| Workspace configuration | Share non-secret report configuration with a project. | `.vscode/telerik-reporting.json` in the selected workspace folder. If only a root-level `telerik-reporting.json` exists, the command opens that file instead. |
| Global user profile configuration | Keep machine-specific connection or license information outside a repository. | `telerik-reporting.json` in the VS Code user directory, shown below. |
| Choose Folder | Store configuration in a separate location. | `.vscode/telerik-reporting.json` inside the chosen folder. Set `telerik-reporting.configFile` to its absolute path if automatic discovery does not find it. |

The global configuration uses these platform-specific paths:

| Platform | Path |
|---|---|
| Windows | `%APPDATA%/Code/User/telerik-reporting.json` |
| macOS | `~/Library/Application Support/Code/User/telerik-reporting.json` |
| Linux | `~/.config/Code/User/telerik-reporting.json` |

The extension uses the first Reporting configuration file it finds. It does not merge workspace and user configuration files. An existing workspace file therefore takes precedence over a global one. To select a particular file, set `telerik-reporting.configFile` to its absolute path.

Automatic discovery checks the explicit configuration path first, then the reports root and open workspace folders. Within each folder, it checks `.vscode/telerik-reporting.json`, `telerik-reporting.json`, and `telerik-reporting.config.json`, in that order. It then checks user-profile locations and `~/.telerik/telerik-reporting.json`.

Configuration beside a loose report outside the workspace is not trusted automatically. Open a trusted workspace or use an explicit absolute configuration path instead. The extension does not support virtual or untrusted workspaces.

### Keeping Credentials Out of Source Control

Do not commit credentials in a report definition or a repository configuration file. Keep machine-specific connection details in a user configuration file or VS Code user settings, and keep personal license files outside the repository. Neither a user configuration file nor a VS Code user setting is an encrypted credential store.

You can provide connection strings in the machine-scoped `telerik-reporting.connectionStrings` VS Code setting. A non-empty value takes precedence over the connection map in the Reporting configuration file; the extension does not combine the two maps.

The extension passes these settings to the local Reporting service without copying them into the machine-wide `WebReportDesignerSettings.json` file. Credentials remain in the configuration file or VS Code settings file where you stored them.

To replace a connection, edit its entry in that configuration file or setting. Save pending report changes and run **Telerik Reporting: Restart** to use the updated values.

### Reusing Application Configuration

If the effective reports root contains `appsettings.json` or `appsettings.Development.json`, the backend can also read that configuration in a trusted workspace. This can let reports use connections already defined for an application.

Only the effective reports root is checked for those application files. If you change the root from the workspace folder to its `Reports` subfolder, do not assume the backend still reads the parent's `appsettings.json`. Use an explicit Reporting configuration or VS Code connection setting when needed.

## Organizing Reports and Resources

The reports root determines how the local Reporting service resolves report names and relative asset paths. For an open workspace report, the default is its workspace folder. A configured reports directory applies when it exists and contains that report. A loose report otherwise uses its own folder.

For example, keep report definitions and their assets under a dedicated `Reports` folder:

```text
ReportingPlayground/
  .vscode/
    settings.json
    telerik-reporting.json
  Reports/
    HelloReporting.trdx
    Shared Data Sources/
    Resources/
```

Set the root in the workspace's `.vscode/settings.json` file:

```json
{
  "telerik-reporting.reportsDirectory": "Reports"
}
```

In this example, `Reports` resolves relative to the workspace folder. The shared-data-source and resource folders default to `Shared Data Sources` and `Resources` inside that root. The backend creates its default storage folders when you first save content to them, rather than when you open a report.

To choose different asset folders, add these properties alongside `connectionStrings` in `.vscode/telerik-reporting.json`:

```json
{
  "sharedDataSourcesDirectory": "Shared Data Sources",
  "resourcesDirectory": "Resources"
}
```

These two paths resolve relative to the effective reports root, not the `.vscode` folder. With the example layout, `resourcesDirectory` resolves to `ReportingPlayground/Reports/Resources`.

VS Code settings use the `telerik-reporting.` prefix. Properties inside `telerik-reporting.json` do not. VS Code settings configure the extension; the Reporting configuration file supplies values to the local Reporting service.

The Reporting configuration also accepts `reportsDirectory`. In a workspace configuration, a relative value is resolved from the workspace folder, not from `.vscode`. Use an absolute value for this property in a global user configuration.

Report-path validation is enabled by default. Keep `processing.validateReportPaths` enabled rather than disabling it to work around an incorrect reports root.

## Configuring a License

Licensing is separate from MSI installation. An invalid or missing license can produce warnings and watermarks. Follow [the manual license-key download instructions](slug:license-key#downloading-manually) to obtain a key without installing the product MSI.

Set `telerik-reporting.licensePath` in VS Code Settings to the absolute path of your local `telerik-license.txt`. An absolute path avoids ambiguity when you open reports from different folders. If a backend is running, accept the restart prompt after you save report changes.

Alternatively, supply `licensing.licensePath` in your Reporting configuration file. Relative license paths resolve from the effective reports root. The VS Code license-path setting takes precedence over that file property.

The extension also honors `TELERIK_LICENSE` and `TELERIK_LICENSE_PATH` environment variables. When you do not specify a path, it searches standard user license locations and then checks for a license file at the effective reports root. A file in the repository root is discovered only when that folder is the effective reports root. If `telerik-reporting.reportsDirectory` points to a subfolder, use that folder or set an explicit license path.

Do not commit a personal license key to a shared workspace. The AI Report Generator requires a valid Telerik Reporting Subscription or Trial license. The language model provider, such as GitHub Copilot, supplies a separate account and usage entitlement.

## Recovering from Errors

If design, preview, export, or a generated-project build fails, run **Telerik Reporting: Show Logs**. The command opens the **Telerik Reporting** output channel. Use the startup messages, configuration errors, and build output to identify the operation that failed.

Use the following checks for common problems:

| Symptom | Next action |
|---|---|
| A report opens, but its connection is missing or preview fails. | Check the selected configuration file and matching connection name. Test the connection in the SQL Data Source Wizard, then save and restart after configuration changes. |
| A report or asset cannot be found. | Check the effective reports root and the relative paths in the configuration. Keep report-path validation enabled. |
| The designer is blank or cannot start. | Check workspace trust and the output channel. If the packaged backend is missing, reinstall a package for your platform rather than treating an SDK installation as a normal designer prerequisite. |
| Open views cannot connect after **Stop**. | Save reports before stopping the backend. Run **Restart** while those views are open to reconnect them. |
| The report displays licensing information. | Check the configured license path and follow [the license-key setup instructions](slug:license-key). Make the key available to the local Reporting service, not only to a separate application. |
| A generated project cannot build. | Verify the .NET 10 SDK and Telerik NuGet feed access. Correct the error and build the existing generated project again. |
| AI generation has no model available. | Enable and sign in to a VS Code chat-model provider, then run **Select AI Language Model** again. Manual report design does not require a model. |

**Stop** and **Restart** affect the extension's backends, not an application you started with `dotnet run`. Save all open reports first. If you continue past an unsaved-changes warning, you can lose pending designer edits.

## Command Reference

Open the **Command Palette** and search for `Telerik Reporting:`. The following table lists the extension's commands:

| Command | Purpose |
|---|---|
| **Telerik Reporting: Open Report Designer** | Select a `.trdp`, `.trdx`, or `.trdj` file and open its visual designer. |
| **Telerik Reporting: Create New Report** | Choose a destination for an empty `.trdx` report and open it in the designer. |
| **Telerik Reporting: Add Config** | Create or open a workspace, global-user, or custom configuration file. |
| **Telerik Reporting: View Report** | Open a viewer beside the designer. With pending edits, choose to save first or view the saved report. Also available in the Explorer context menu and designer title bar. |
| **Telerik Reporting: Create Project** | Generate a new Web Report Designer application, optionally copy selected reports and assets, and check its build. See [the application-generation example](slug:integration-with-vs-code#creating-a-web-report-designer-application). |
| **Telerik Reporting: Select AI Language Model…** | Choose a model supplied through VS Code for the designer's AI report generator. |
| **Telerik Reporting: Show Logs** | Open the **Telerik Reporting** output channel. |
| **Telerik Reporting: Stop** | Stop the extension's running backends, with a warning if designers have pending changes. |
| **Telerik Reporting: Restart** | Restart existing backends and reconnect their open designers and viewers. Open a report first if no backend exists. |

## Settings Reference

Search for `telerik-reporting` in VS Code Settings. Resource settings can vary by workspace or folder; window settings apply to the window. Application settings apply across profiles, and machine settings hold machine-specific values.

The following table lists the available settings:

| Setting | Default | Scope | Purpose |
|---|---|---|---|
| `telerik-reporting.reportsDirectory` | `""` | Resource | Reports root. An empty value falls back to the workspace folder, or the loose report's folder outside a workspace. |
| `telerik-reporting.configFile` | `""` | Resource | Explicit Reporting configuration path. Prefer an absolute path for files outside the workspace. An empty value uses automatic discovery. |
| `telerik-reporting.connectionStrings` | `{}` | Machine | Named connections supplied to the backend. A non-empty map overrides the configuration file's connection map. |
| `telerik-reporting.licensePath` | `""` | Machine | Local license-file path. Relative paths resolve from the reports root; an absolute path avoids root-dependent behavior. |
| `telerik-reporting.dotnetPath` | `""` | Machine | Absolute path to `dotnet`, or an empty value to use `PATH`. Used for generated-project builds and the source-development fallback, not the packaged backend. |
| `telerik-reporting.ai.model` | `""` | Application | Model identifier in `vendor/id` form. If empty or unavailable, an AI request prompts you to select a model. |
| `telerik-reporting.theme` | `auto` | Window | Set to `auto`, `light`, or `dark`. `auto` follows the VS Code color theme; open designer and viewer views apply the selected theme. |
| `telerik-reporting.liveViewerRefresh` | `true` | Resource | Refresh an open viewer when you save its report in the designer. Disable it if you want to control viewer refresh manually. |

## See Also

For related setup and report workflows, see:

* [Trying Reporting in VS Code](slug:integration-with-vs-code)
* [Creating and Previewing a Report in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [Downloading and Setting Up a License Key](slug:license-key)