---
title: Types
page_title: Types of the React Report Viewer
description: Object types and interfaces used by the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: React
position: 6
---

# Types of the React Report Viewer

## InteractiveAction

Describes an interactive action triggered by the user in the report viewer. The shape of the `Value` property depends on the action `Type`.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Id | `string` | The identifier of the action (a GUID). |
| Type | `string` | The type of the action. One of:<br>  "sorting", "toggleVisibility", "navigateToUrl", "navigateToBookmark", "navigateToReport", "customAction". |
| ReportItemName | `string` | The name of the report item associated with the action. |
| Value | `Object` | Additional data for the action, depending on the Type:<br>  - For "navigateToUrl": { Url: string, Target: "NewWindow"|"SameWindow" }<br>  - For "navigateToBookmark": string (the target bookmark)<br>  - For "navigateToReport": { report: string, parameters: Object }<br>  - For "customAction": { Parameters: Object } |


## ParameterEditor

Describes a parameter editor for the Telerik Report Viewer parameters area.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| match | `function` | Determines if the editor is suitable for the parameter. |
| createEditor | `function` | Creates the editor UI and returns an editor instance. |

### Example

```JavaScript
// Custom match function for single-select parameters
function match(parameter) {
  return Boolean(parameter.availableValues) && !parameter.multivalue;
}
```

```JavaScript
// Custom createEditor function using Kendo DateTimePicker
function match(parameter) {
    return parameter.type === "System.DateTime";
}

function createEditor(placeholder, options) {
    const container = $(placeholder).html('<input type="datetime"/>');
    let parameter;
    const valueChangedCallback = options.parameterChanged;
    let picker;

    function onChange() {
        const val = picker.value();
        valueChangedCallback(parameter, val);
    }

    return {
        beginEdit: function (param) {
            parameter = param;
            $(container).find("input").kendoDateTimePicker({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
            picker = $(container).find("input").data("kendoDateTimePicker");
        },

        addAccessibility: function (accessibilityOptions) {
            // Apply ARIA attributes, labels, etc. to the editor input.
        },

        setAccessibilityErrorState: function (hasError) {
            // Update ARIA error attributes on the editor input.
        }
    };
}
```

{% raw %}
```JavaScript
// Registering a custom parameter editor
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parameterEditors={[{ match, createEditor }]}
/>
```
{% endraw %}


## ParameterEditorInstance

Represents the API of a parameter editor instance returned by createEditor.

Implementations must provide `beginEdit`, `addAccessibility`, and `setAccessibilityErrorState`. The viewer calls `addAccessibility` / `setAccessibilityErrorState` when `enableAccessibility` is true. Optional members like `clearPendingChange` and `destroy` are lifecycle hooks for editors that manage external widgets or pending async updates.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| beginEdit | `function` | Creates the editor UI and populates it with the parameter settings. |
| addAccessibility | `function` | Adds accessibility to the parameter editor and populates its string resources. Called by the viewer when `enableAccessibility` is true. |
| setAccessibilityErrorState | `function` | Sets the error state of the parameter editor's accessibility functionality and its error attributes. Called by the viewer when `enableAccessibility` is true and the user changes  value. |
| enable | `function` | Enables or disables the parameter editor (e.g., when the "use default value" checkbox is toggled). |
| clearPendingChange | `function` | Invoked when parameter changes. |
| destroy | `function` | Invoked to destroy the parameter editor. |


## ParametersOptions

Defines options for configuring report parameter editors in the React Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| editors | `Object` | Allows you to specify the editor type for single-value and multi-value report parameters. |
| editors.singleSelect | `string` | Editor type for single-value parameters.<br>  - "COMBO_BOX": Uses a ComboBox widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |
| editors.multiSelect | `string` | Editor type for multi-value parameters.<br>  - "COMBO_BOX": Uses a MultiSelect widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |

### Example

{% raw %}
```JavaScript
// Specify editor types for report parameters
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parameters={{
    editors: {
      singleSelect: "COMBO_BOX",
      multiSelect: "LIST_VIEW"
    }
  }}
/>
```
{% endraw %}


## ReportParameters

An object where each property name corresponds to a report parameter's name, and the value is the value assigned to that parameter as used in the report definition.

### Example

```JavaScript
{
  "StartDate": "2024-01-01",
  "EndDate": "2024-12-31",
  "Category": "Books"
}
```


## ReportServer

Configuration for connecting to a Telerik Report Server instance.
The authentication method depends on the Report Server version:

- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| url | `string` | The URL of the Telerik Report Server instance. |
| getPersonalAccessToken | `function` | A callback that returns a Promise resolving to a Personal Access Token for authentication. Recommended for Report Server for .NET. The token can be from any user account, including the Guest user. |
| username | `string` | A registered username for Report Server authentication. Supported by both Report Server for .NET and Report Server for .NET Framework. When omitted with Report Server for .NET Framework and Guest enabled, the built-in Guest account is used. |
| password | `string` | The password for the provided username. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework. |

### Example

{% raw %}
```JavaScript
// Complete initialization with Report Server for .NET using Token authentication
<TelerikReportViewer
  reportServer={{
    url: "https://my-report-server-net/",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  }}
  reportSource={{
    report: "Samples/Dashboard",
    parameters: {
      ReportYear: 2004
    }
  }}
/>
```
{% endraw %}


## ReportSource

Configuration object that identifies the report to be displayed and provides initial parameter values.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| report | `string` | A string identifying the report to display. This can be a path to a report definition file (e.g., 'Dashboard.trdp' or 'Dashboard.trdx'), a type name, or a custom identifier resolved by the server-side report source resolver. For Report Server, use the format '{Category}/{ReportName}'. |
| parameters | [`ReportParameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportparameters) | An object whose keys are report parameter names and values are the corresponding parameter values. |

### Example

{% raw %}
```JavaScript
// Using ReportSource with the React Report Viewer
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{
    report: "InventoryReport",
    parameters: {
      Category: "Electronics",
      InStock: true
    }
  }}
/>
```
{% endraw %}


## ReportViewerCommand

Represents a command that can be executed on the report viewer.
Each command is an object with the following methods:

- exec(): Executes the command (optionally with parameters).
- enabled(): Returns a boolean indicating if the command is currently enabled.
- checked(): Returns a boolean indicating if the command is in a checked state (for toggle commands).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| exec | `function` | Executes the command. Some commands accept parameters (see each command's exec example). |
| enabled | `function` | Returns whether the command is currently enabled. |
| checked | `function` | Returns whether the command is in a checked state (for toggle commands). |


## SendEmailOptions

Configuration options for the Send Email feature in the Report Viewer. Allows customization of the email dialog, default values, and available document formats when sending a report via email.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| enabled | `boolean` | Indicates whether to show the Send Mail Message toolbar button. Default value: false. |
| from | `string` | E-mail address used for the MailMessage FROM value. |
| to | `string` | E-mail address used for the MailMessage TO value. |
| cc | `string` | E-mail address used for the MailMessage Carbon Copy value. |
| subject | `string` | A string used for the MailMessage Subject value. |
| body | `string` | Text content for the email body. |
| format | `string` | The preselected document format for the report attachment (e.g., 'PDF', 'XLSX'). |

### Example

{% raw %}
```JavaScript
// Enable Send Email with default values and PDF as the default format
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "reports@company.com",
    to: "recipient@domain.com",
    cc: "manager@domain.com",
    subject: "Monthly Sales Report",
    body: "Please find the attached monthly sales report.",
    format: "PDF"
  }}
/>
```
{% endraw %}

{% raw %}
```JavaScript
// Basic email configuration with minimal options
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "noreply@company.com"
  }}
/>
```
{% endraw %}

