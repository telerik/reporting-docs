---
title: Types
page_title: Types of the HTML5 Report Viewer
description: Object types and interfaces used by the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: HTML5
position: 6
---

# Types of the HTML5 Report Viewer

## DataAttributeSet

Describes the available data attributes that can be used to control the Report Viewer from HTML elements. They are executed by adding data-command and data-target-report-viewer attributes to HTML elements.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| historyBack | `Object` | Go back to the previously rendered report |
| historyForward | `Object` | Go forward to the next rendered report |
| stopRendering | `Object` | Stop the report rendering |
| refresh | `Object` | Refresh the report |
| goToFirstPage | `Object` | Go to the first page of the report |
| goToPrevPage | `Object` | Go to the previous page of the report |
| goToNextPage | `Object` | Go to the next page of the report |
| goToLastPage | `Object` | Go to the last page of the report |
| togglePrintPreview | `Object` | Toggle between Print Preview and Interactive modes |
| export | `Object` | Export the report (requires data-command-parameter for format) requires a data-command-parameter specifying the export format (e.g., PDF, XLSX, DOCX, etc.). |
| print | `Object` | Print the report |
| toggleDocumentMap | `Object` | Show or hide the document map |
| toggleParametersArea | `Object` | Show or hide the parameters area |
| zoomIn | `Object` | Zoom in the report |
| zoomOut | `Object` | Zoom out the report |
| toggleZoomMode | `Object` | Change the zoom mode of the report |
| toggleSearchDialog | `Object` | Show or hide the search dialog |
| toggleSendEmailDialog | `Object` | Show or hide the send email dialog |
| toggleAiPromptDialog | `Object` | Show or hide the AI prompt dialog |


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
// Example: Custom createEditor function using Kendo DropDownList
var createEditor = function(placeholder, options) {
  var dropDownElement = $(placeholder).html('<div></div>');
  var parameter;
  var valueChangedCallback = options.parameterChanged;
  var dropDownList;
  function onChange() {
    var val = dropDownList.value();
    valueChangedCallback(parameter, val);
  }
  return {
    beginEdit: function(param) {
      parameter = param;
      $(dropDownElement).kendoDropDownList({
        dataTextField: "name",
        dataValueField: "value",
        value: parameter.value,
        dataSource: parameter.availableValues,
        change: onChange
      });
      dropDownList = $(dropDownElement).data("kendoDropDownList");
    }
  };
};
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

Configuration options for report parameter editors and behavior.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| editors | `Object` | Allows the user to define editor types for report parameters. |
| editors.singleSelect | [`ParameterEditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#parametereditortypes) | Editor type for single-value parameters.<br>  - "COMBO_BOX": Uses a ComboBox widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |
| editors.multiSelect | [`ParameterEditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#parametereditortypes) | Editor type for multi-value parameters.<br>  - "COMBO_BOX": Uses a MultiSelect widget as the editor.<br>  - "LIST_VIEW": Uses a ListView widget as the editor.<br>  - Default: "LIST_VIEW" |

### Example

````JavaScript
// Specify editor types for parameters
{
  editors: {
    singleSelect: "COMBO_BOX",
    multiSelect: "LIST_VIEW"
  }
}
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
Required if serviceUrl is not provided.
Authentication options:

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
// Example: Report Server for .NET - Token authentication (recommended)
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return Promise.resolve("<personal-access-token>");
  }
};
````

````JavaScript
// Example: Report Server for .NET - Token authentication with a secure endpoint
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return fetch('/rs-token')
      .then(response => response.text());
  }
};
````

````JavaScript
// Example: Report Server for .NET - Token authentication with Guest user token
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return Promise.resolve("<guest-user-token>");
  }
};
````

````JavaScript
// Example: Report Server for .NET - Username/password authentication
var reportServer = {
  url: "https://my-report-server-net/",
  username: "myUser",
  password: "myPassword"
};
````

````JavaScript
// Example: Report Server for .NET Framework 4.6.2 - Username/password authentication
var reportServer = {
  url: "https://my-report-server-framework/",
  username: "myUser",
  password: "myPassword"
};
````

````JavaScript
// Example: Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server)
var reportServer = {
  url: "https://my-report-server-framework/"
};
````

````JavaScript
// Example: Complete Report Viewer initialization with Report Server for .NET using Token authentication
$("#reportViewer").telerik_ReportViewer({
  reportServer: {
    url: "https://my-report-server-net/",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  },
  reportSource: {
    report: "Samples/Dashboard",
    parameters: {
      ReportYear: 2004
    }
  }
});
````


## ReportSource

Defines the report source for the viewer, specifying which report to load and any parameters to pass to it.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| report | `string` | The report name or path. When the viewer is connected to a Report Server, the name should follow the '{Category}/{ReportName}' pattern. |
| parameters | [`ReportParameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#reportparameters) | Report parameters. |

### Example

````JavaScript
// Example: Minimal report source with only the report name
var reportSource = {
  report: "MyReport"
};
````

````JavaScript
// Example: Report source with parameters
var reportSource = {
  report: "SalesReport",
  parameters: {
    StartDate: "2024-01-01",
    EndDate: "2024-12-31",
    Region: "North America"
  }
};
````

````JavaScript
// Example: Using ReportSource with the Report Viewer initialization
$("#reportViewer").telerik_ReportViewer({
  reportSource: {
    report: "InventoryReport",
    parameters: {
      Category: "Electronics",
      InStock: true
    }
  }
});
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
| exec | `function` | Executes the command. Some commands accept parameters (e.g., export format). |
| enabled | `function` | Returns true if the command can currently be executed. |
| checked | `function` | Returns true if the command is in a checked/active state. |


## SendEmail

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
var sendEmailOptions = {
  enabled: true,
  from: "reports@company.com",
  to: "recipient@domain.com",
  cc: "manager@domain.com",
  subject: "Monthly Sales Report",
  body: "Please find the attached monthly sales report.",
  format: "PDF"
};
````

