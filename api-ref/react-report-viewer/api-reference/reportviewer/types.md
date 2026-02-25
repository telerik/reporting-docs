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

Describes a parameter editor for the Telerik Report Viewer parameter panel.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| match | `function` | Determines if the editor is suitable for the parameter. |
| createEditor | `function` | Creates the editor UI. |

### Example

````JavaScript
// Example: Custom match function for single-select parameters
var match = function(parameter) {
  // Use parameter properties to determine if this editor should be used
  return Boolean(parameter.availableValues) && !parameter.multivalue;
};
````

````JavaScript
// Example: Custom createEditor function using Kendo DateTimePicker
function match(parameter) {
    return parameter.type === "System.DateTime";
}

function createEditor(placeholder, options) {
    var dateTimePicker = $(placeholder).html('<input type="datetime"/>'),
    parameter,
    valueChangedCallback = options.parameterChanged,
    dropDownList;
    function onChange() {
        var val = dropDownList.value();
        valueChangedCallback(parameter, val);
    }
    return {
        beginEdit: function (param) {
            parameter = param;
            $(dateTimePicker).find("input").kendoDateTimePicker({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
            dropDownList = $(dateTimePicker).find("input").data("kendoDateTimePicker");
        }
    };
}
````

````JavaScript
// Example: Registering the custom ParameterEditor
ParameterEditors.push({
  match: match,
  createEditor: createEditor
});
````


## ParameterEditorInstance

Represents the API of a parameter editor instance returned by createEditor.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| beginEdit | `function` | Creates the editor UI and populates it with the parameter settings. |
| addAccessibility | `function` | Adds accessibility to the parameter editor and populates its string resources. |
| setAccessibilityErrorState | `function` | Sets the error state of the parameter editor's accessibility functionality and its error attributes. |
| enable | `function` | Enables or disables the parameter editor. |
| clearPendingChange | `function` | Invoked when parameter changes (optional, not present on all editors). |
| destroy | `function` | Invoked to destroy the parameter editor (optional, not present on all editors). |


## ParametersOptions

Defines options for configuring report parameter editors in the React Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| editors | `Object` | Allows you to specify the editor type for single-value and multi-value report parameters. |
| editors.singleSelect | `string` | Editor type for single-value parameters.<br>  - "COMBO_BOX": Uses a ComboBox widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |
| editors.multiSelect | `string` | Editor type for multi-value parameters.<br>  - "COMBO_BOX": Uses a MultiSelect widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |

### Example

````JavaScript
// React: Specify editor types for report parameters

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
````


## ReportParameters

An object where each property name corresponds to a report parameter's name, and the value is the value assigned to that parameter as used in the report definition.

### Example

````JavaScript
{
  "StartDate": "2024-01-01",
  "EndDate": "2024-12-31",
  "Category": "Books"
}
````


## ReportServer

Configuration for connecting to a Telerik Report Server instance.
The authentication method depends on the Report Server version:

- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| url | `string` | The URL to the Telerik Report Server instance. (required) |
| getPersonalAccessToken | `function` | A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET. (optional) |
| username | `string` | A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used. (optional) |
| password | `string` | The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2. (optional) |

### Example

````JavaScript
// Example: Complete Report Viewer initialization with Report Server for .NET using Token authentication
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
````


## ReportSource

Configuration object that identifies the report to be displayed and provides initial parameter values.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| report | `string` | A string that represents a report on the server. On the server side, this string will be converted to a ReportSource through an IReportResolver. This may be an assembly qualified type name that can be converted to TypeReportSource, a path to a report definition file (.trdp/.trdx) as in the UriReportSource, or even a report id that a dedicated IReportSourceResolver will use to read the report definition stored in a database. When using the viewer with Report Server, the report should be provided in the format: "{Category}/{ReportName}". |
| parameters | [`ReportParameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportparameters) | A JSON object with properties name/value equal to the report parameters' names and values used in the report definition. |

### Example

````JavaScript
// Example: Using ReportSource with the React Report Viewer
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
````


## ReportViewerCommand

Represents a command that can be executed on the report viewer.
Each command is an object with the following methods:

- exec(): Executes the command (optionally with parameters).
- enabled(): Returns a boolean indicating if the command is currently enabled.
- checked(): Returns a boolean indicating if the command is in a checked state (for toggle commands).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| exec | `function` | Executes the command. Some commands accept parameters (see below). |
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
| body | `string` | Sentences used for the MailMessage Content value. |
| format | `string` | The preselected report document format. |

### Example

````JavaScript
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
````

````JavaScript
// Basic email configuration with minimal options
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "noreply@company.com"
  }}
/>
````

