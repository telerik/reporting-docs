---
title: VS Code Configuration and Reference
page_title: VS Code Extension Configuration and Commands | Telerik Reporting
description: Configure data connections, report folders, and licensing for the Telerik Reporting VS Code extension, and find its commands and settings.
slug: reporting-vs-code-configuration-and-reference
tags: reporting, vscode, configuration, commands, settings
published: True
position: 2
reportingArea: General
components: [general]
---

# VS Code Configuration and Reference

An existing report can open in the VS Code designer but fail to preview because its database connection is unavailable on your machine. Configure that connection in the extension rather than embedding machine-specific credentials in the report.

This article explains that scenario, then covers report folders, licensing, and recovery. The command and settings tables at the end provide a lookup for the complete extension surface. For a first report without external data, start with [the authoring walkthrough](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code); it does not need connection or directory configuration.

## Configuring a Data Connection

Suppose a report's SQL data source refers to a connection named `ReportingDemo`. That name identifies configuration; it is not the database server address. The extension must supply a connection with the same name before the report can execute its query.

For this example, assume you already have access to a SQL Server database. The sample uses Windows integrated authentication. Replace the server, database, and authentication options with those required by your environment; the extension does not create the database.

To configure the named connection:

1. Open the report's folder as a trusted workspace in VS Code.
2. Run **Telerik Reporting: Add Config** and choose **Workspace Configuration**. In a multi-folder workspace, select the folder that contains the report.
3. In the generated `.vscode/telerik-reporting.json` file, replace the sample connection entries with the configuration below.
4. Save the configuration. Save any pending report edits, then run **Telerik Reporting: Restart** if a designer is already open. Otherwise, open the report to start the backend with the configuration.

The following configuration supplies one named connection:

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

When you reopen the SQL Data Source Wizard, the configured connection is available in its connection list. Select it for a new data source, or keep the matching connection name in an existing one. To check access independently of application tables, test this query in the wizard:

```sql
SELECT 'Configured connection' AS Message;
```

A successful test returns one row with a `Message` column. It confirms that the backend can reach the database and authenticate. It does not confirm that your report's own query is valid or that its tables are accessible.

Use the [Web Report Designer data-source guidance](slug:web-report-designer-user-guide-components-data-sources) to bind report items to the query results.

## Choosing the Configuration Location

Choose a configuration location based on who needs the values. **Telerik Reporting: Add Config** creates a documented template when the target file is missing, or opens the existing file without replacing it.

The command offers these locations:

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

The extension uses the first Reporting configuration file it finds; it does not merge a workspace file with a user file. An existing workspace file therefore takes precedence over a global one. To use a particular file, set an absolute `telerik-reporting.configFile` path.

Automatic discovery checks the explicit configuration path first, then the reports root and open workspace folders. Within each folder, it checks `.vscode/telerik-reporting.json`, `telerik-reporting.json`, and `telerik-reporting.config.json`, in that order. It then checks user-profile locations and `~/.telerik/telerik-reporting.json`.

Configuration beside a loose report outside the workspace is not trusted automatically. Open a trusted workspace or use an explicit absolute configuration path instead. The extension does not support virtual or untrusted workspaces.

### Keeping Credentials Out of Source Control

Do not commit passwords, tokens, or license files. A user configuration file stays outside the workspace, but it is still a file on disk. A VS Code user setting is not an encrypted credential store either.

You can provide connection strings in the machine-scoped `telerik-reporting.connectionStrings` VS Code setting. A non-empty value takes precedence over the connection map in the Reporting configuration file; the extension does not combine the two maps.

Values supplied by these settings are passed to the backend without copying them into the machine-wide `WebReportDesignerSettings.json` file. This behavior does not remove credentials from any configuration file or VS Code settings file where you stored them.

### Reusing Application Configuration

If the effective reports root contains `appsettings.json` or `appsettings.Development.json`, the backend can also read that configuration in a trusted workspace. This can let reports use connections already defined for an application.

Only the effective reports root is checked for those application files. If you change the root from the workspace folder to its `Reports` subfolder, do not assume the backend still reads the parent's `appsettings.json`. Use an explicit Reporting configuration or VS Code connection setting when needed.

## Organizing Reports and Resources

The reports root determines how the backend resolves report names. For an open workspace report, the default is its workspace folder. A configured reports directory applies when it exists and contains that report. A loose report otherwise uses its own folder.

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

VS Code settings use the `telerik-reporting.` prefix. Properties inside `telerik-reporting.json` do not. Keep these files distinct: the first configures the extension, while the second supplies Reporting configuration to the backend.

The Reporting configuration also accepts `reportsDirectory`. In a workspace configuration, a relative value is resolved from the workspace folder, not from `.vscode`. Use an absolute value for this property in a global user configuration.

Report-path validation is enabled by default. Keep `processing.validateReportPaths` enabled rather than disabling it to work around an incorrect reports root.

## Configuring a License

You can supply a license without installing the product MSI. Follow [the manual license-key download instructions](slug:license-key#downloading-manually) to obtain your trial or subscription key.

Set `telerik-reporting.licensePath` in VS Code Settings to the absolute path of your local `telerik-license.txt`. An absolute path avoids ambiguity when you open reports from different folders. If a backend is running, accept the restart prompt after you save report changes.

Alternatively, supply `licensing.licensePath` in your Reporting configuration file. Relative license paths resolve from the effective reports root. The VS Code license-path setting takes precedence over that file property.

The extension also honors `TELERIK_LICENSE` and `TELERIK_LICENSE_PATH` environment variables and searches standard user license locations when no path is configured. Do not copy a personal license key into a shared workspace file.

## Recovering from Errors

Use **Telerik Reporting: Show Logs** to open the **Telerik Reporting** output channel. It contains backend startup messages, configuration errors, and generated-project build output. Read the underlying error before changing unrelated settings.

Common symptoms call for different checks:

| Symptom | Next action |
|---|---|
| A report opens, but its connection is missing or preview fails. | Check the selected configuration file and matching connection name. Test the connection in the SQL Data Source Wizard, then save and restart after configuration changes. |
| A report or asset cannot be found. | Check the effective reports root and the relative paths in the configuration. Keep report-path validation enabled. |
| The designer is blank or cannot start. | Check workspace trust and the output channel. If the packaged backend is missing, reinstall a package for your platform rather than treating an SDK installation as a normal designer prerequisite. |
| Open views cannot connect after **Stop**. | Save reports before stopping the backend. Run **Restart** while those views are open to reconnect them. |
| A generated project cannot build. | Verify the .NET 10 SDK and Telerik NuGet feed access. Correct the error and build the existing generated project again. |
| AI generation has no model available. | Enable and sign in to a VS Code chat-model provider, then run **Select AI Language Model** again. Manual report design does not require a model. |

**Stop** and **Restart** affect the extension's backends, not an application you started with `dotnet run`. Save all open reports first. If you continue past an unsaved-changes warning, you can lose pending designer edits.

## Command Reference

Open the **Command Palette** and search for `Telerik Reporting:`. The commands below cover the extension's file, application, AI, and backend operations:

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

Use this reference after you choose the configuration required by your scenario:

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

For task-based examples, see:

* [Trying Reporting in VS Code](slug:integration-with-vs-code)
* [Creating and Previewing a Report in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [Downloading and Setting Up a License Key](slug:license-key)