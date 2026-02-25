---
title: Options
page_title: Options of the Angular Report Viewer
description: Complete list of options available in the Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: AngularWrapper
position: 2
---

# Options of the Angular Report Viewer

## authenticationToken

If provided, a Bearer token will be set in the Authorization header for every request to the REST service.

### Type

`string`

### Example

````html
<tr-viewer
  [authenticationToken]="authenticationToken">
</tr-viewer>
````

````typescript
authenticationToken: string = "your-authentication-token";
````


## checkedButtonClass

CSS class added to buttons when a command is in a checked state. Used with data attributes for external command buttons.

### Type

`string`

### Example

````html
<tr-viewer
  [checkedButtonClass]="checkedButtonClass">
</tr-viewer>
````

````typescript
checkedButtonClass: string = "my-checked-button-class";
````


## containerStyle

CSS styles object for the report viewer's container element.

### Type

`any`

### Example

````html
<tr-viewer
  [containerStyle]="containerStyle">
</tr-viewer>
````

````typescript
containerStyle: any = {
  position: 'absolute',
  left: '5px',
  right: '5px',
  top: '40px',
  bottom: '5px',
  overflow: 'hidden'
}
````


## disabledButtonClass

CSS class added to buttons when a command is in a disabled state. Used with data attributes for external command buttons.

### Type

`string`

### Example

````html
<tr-viewer
  [disabledButtonClass]="disabledButtonClass">
</tr-viewer>
````

````typescript
disabledButtonClass: string = "my-disabled-button-class";
````


## documentMapAreaPosition

Specifies where the Document Map should be displayed. Available values: "RIGHT", "LEFT".

### Type

`string`

### Example

````html
<tr-viewer
  [documentMapAreaPosition]="documentMapAreaPosition">
</tr-viewer>
````

````typescript
documentMapAreaPosition: string = "RIGHT";
````


## documentMapVisible

Determines whether the viewer's document map is displayed when bookmarks are defined.

### Type

`boolean`

### Example

````html
<tr-viewer
  [documentMapVisible]="documentMapVisible">
</tr-viewer>
````

````typescript
documentMapVisible: boolean = false;
````


## enableAccessibility

Determines whether the viewer should provide accessibility features support.

### Type

`boolean`

### Example

````html
<tr-viewer
  [enableAccessibility]="enableAccessibility">
</tr-viewer>
````

````typescript
enableAccessibility: boolean = true;
````


## id

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used. The id is used to identify the client session when persistSession is enabled.

### Type

`string`

### Example

````html
<tr-viewer #viewerId>
</tr-viewer>
````


## initialPageAreaImageUrl

The image URL for the PageArea background image. Used only when parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.

### Type

`string`

### Example

````html
<tr-viewer
  [initialPageAreaImageUrl]="initialPageAreaImageUrl">
</tr-viewer>
````

````typescript
initialPageAreaImageUrl: string = "https://site.com/path/initialPageAreaImage.png";
````


## keepClientAlive

Determines whether the client will be kept alive. When true, prevents client expiration by continually sending requests to the server.

### Type

`boolean`

### Example

````html
<tr-viewer
  [keepClientAlive]="keepClientAlive">
</tr-viewer>
````

````typescript
keepClientAlive: boolean = false;
````


## pageMode

Sets if the report is displayed in single page or continuous scroll mode.

- "SINGLE_PAGE" - Only one page loaded in viewport. Pages are changed using the page navigation buttons in the viewer's toolbar.
- "CONTINUOUS_SCROLL" - Multiple pages can be loaded in viewport. Pages can be changed using the scroll wheel, by dragging the scroll bar, or by clicking the page navigation buttons in the viewer's toolbar.

### Type

`string`

### Example

````html
<tr-viewer
  [pageMode]="pageMode">
</tr-viewer>
````

````typescript
pageMode: string = "SINGLE_PAGE";
````


## parameterEditors

Allows defining custom editors for report parameters.
Array of parameter editor configurations.
Each object in the array represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration.
Each factory object contains two methods: `match` and `createEditor` .
The `match` method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter.
The parameter argument exposes the following properties of the report parameter:

- availableValues (array of name-value pairs): represents a list of predefined parameter values and their labels.
- multivalue	(boolean): specifies whether the parameter can hold more than one value.
- allowBlank (boolean): specifies whether the parameter allows an empty string to be passed (only for parameters of type string).
- allowNull (boolean): specifies whether the parameter allows a null value to be passed from its editor
- autoRefresh (boolean): specifies whether the report viewer should auto-update the report when its value has changed.
- hasChildParameters (boolean): specifies whether the parameter is a cascading one (has dependencies).
- id (string): represents the parameter’s unique identifier.
- isVisible (boolean): determines whether the parameter editor is visible or not.
- label (string): specifies the label for the parameter editor.
- name (string): specifies the name of the parameter editor.
- text (string): specifies the text for the parameter editor.
- type (string): specifies the type of the parameter editor. Possible values: "INTEGER", "FLOAT", "STRING", "DATETIME", "BOOLEAN".
- value (object): specifies the value of the parameter.

The main work for creating and utilizing the parameter editor is done in the 
`createEditor`
 method. Its purpose is to create the parameter editor UI and wire it to the 
`parameterChanged`
 callback when a new value is selected. The return result is a new object containing the 
`beginEdit`
 method which is the entry point for creating the editor from the viewer.
The 'createEditor' method accepts two arguments - 
`placeholder`
 and 
`options`
. The 'placeholder' argument is the HTML element which the parameter editor UI is appended to, and the 'options' arrgument is an object containing the 
`parameterChanged(parameter, value)`
 callback function which should be called when the parameter value is changed.
The 'createEditor' method should return a parameter editor object with the following properties:
- 'beginEdit(parameter)' - a method which accepts a report parameter object and initializes the editor with the parameter's settings. The parameter object has the same properties as described above.
- 'addAccessibility(parameter)' - an optional method which accepts a report parameter object and adds accessibility features to the editor and populates its string resources.
- 'setAccessibilityErrorState(parameter)' - an optional method which accepts a report parameter object and sets the error state of the parameter editor's accessibility functionality and its error attributes.
- 'enable(enable)' - an optional method which accepts a boolean value and enables or disables the parameter editor.
- 'clearPendingChange' - a method that would be invoked when the parameter changes.
- 'destroy' - a method invoked to destroy the parameter editor.

### Type

`Array<any>`

### Example

````html
<tr-viewer
  [parameterEditors]="parameterEditors">
</tr-viewer>
````

````typescript
  parameterEditors: any = [
  {
      match: function (parameter: any) {
          console.log('match');
          return Boolean(parameter.availableValues) && !parameter.multivalue;
      },
      createEditor: function (placeholder: any, options: any) {
          //@ts-ignore
          var dropDownElement = $(placeholder).html('<div></div>'),
              parameter : any,
              valueChangedCallback = options.parameterChanged,
              dropDownList : any;
          function onChange() {
              console.log('onChange');
              var val = dropDownList.value();
              valueChangedCallback(parameter, val);
          }
          return {
              beginEdit: function (param : any) {
                  parameter = param;
                  //@ts-ignore
                  $(dropDownElement).kendoDropDownList({
                      dataTextField: "name",
                      dataValueField: "value",
                      value: parameter.value,
                      dataSource: parameter.availableValues,
                      change: onChange
                  });
                  //@ts-ignore
                  dropDownList = $(dropDownElement).data("kendoDropDownList");
              }
          };
      }
  }
];
````


## parameters

Allows defining parameter options for report parameters.
Available properties:

- editors (object, optional) - Defines the editor type for single and multi-select parameters.
The 'editors' object has two properties for the two parameter types:
 - singleSelect (string, optional) - Editor type for single-select parameters. Possible values: "COMBO_BOX" (Kendo UI ComboBox) or "LIST_VIEW" (Kendo UI ListView). Default: "LIST_VIEW".
 - multiSelect (string, optional) - Editor type for multi-select parameters. Possible values: "COMBO_BOX" (Kendo UI ComboBox) or "LIST_VIEW" (Kendo UI ListView). Default: "LIST_VIEW".

### Type

`any`

### Example

````html
<tr-viewer
  [parameters]="parameters">
</tr-viewer>
````

````typescript
parameters: any = {
  editors: {
    singleSelect: 'COMBO_BOX',
    multiSelect: 'COMBO_BOX'
  }
}
````


## parametersAreaPosition

Specifies where the Parameters Area should be displayed. Available values: "RIGHT", "TOP", "LEFT", "BOTTOM".

### Type

`string`

### Example

````html
<tr-viewer
  [parametersAreaPosition]="parametersAreaPosition">
</tr-viewer>
````

````typescript
parametersAreaPosition: string = "LEFT";
````


## parametersAreaVisible

Determines whether the viewer's parameters area is displayed by default when parameter editors exist.

### Type

`boolean`

### Example

````html
<tr-viewer
  [parametersAreaVisible]="parametersAreaVisible">
</tr-viewer>
````

````typescript
parametersAreaVisible: boolean = false;
````


## persistSession

Sets whether the viewer's client session should be persisted between page refreshes. Session is stored in browser's sessionStorage and lasts for the page session duration.

### Type

`boolean`

### Example

````html
<tr-viewer
  [persistSession]="persistSession">
</tr-viewer>
````

````typescript
persistSession: boolean = true;
````


## printMode

Specifies how the viewer should print reports.

- "AUTO_SELECT" - automatically decide based on browser and PDF plugin availability.
- "FORCE_PDF_FILE" - download document as PDF file with print script.
- "FORCE_PDF_PLUGIN" - always use PDF plugin.

### Type

`string`

### Example

````html
<tr-viewer
  [printMode]="printMode">
</tr-viewer>
````

````typescript
printMode: string = "FORCE_PDF_FILE";
````


## reportServer

Sets the configuration details for connecting to a Telerik Report Server.
The authentication method depends on the Report Server version:

- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).

Has the following properties:
- url (string, required) - The URL to the Telerik Report Server instance.
- getPersonalAccessToken (function, optional) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET.
- username (string, optional) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.
- password (string, optional) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.

Required when not using serviceUrl.

### Type

`any`

### Example

````html
<!-- Report Server for .NET - Token authentication (recommended) -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Report Server for .NET - Token authentication (recommended)
getPersonalAccessToken() {
  return Promise.resolve('<personal-access-token>');
}
````

````html
<!-- Report Server for .NET - Token authentication with secure endpoint -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Report Server for .NET - Token authentication with secure endpoint
getPersonalAccessToken() {
  return fetch('/rs-token')
    .then(response => response.text());
}
````

````html
<!-- Report Server for .NET - Token authentication with Guest user token -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Report Server for .NET - Token authentication with Guest user token
getPersonalAccessToken() {
  return Promise.resolve('<guest-user-token>');
}
````

````html
<!-- Report Server for .NET - Username/password authentication -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Username/password authentication -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Complete example with Report Server for .NET using Token authentication
export class AppComponent {
  reportServer = {
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: this.getPersonalAccessToken
  };

  reportSource = {
    report: 'Samples/Dashboard',
    parameters: {
      ReportYear: 2004
    }
  };

  getPersonalAccessToken() {
    return Promise.resolve('<personal-access-token>');
  }
}
````


## reportSource

Sets the report and initial report parameter values to be displayed.
Available properties:

- report (string) - A string that represents a report on the back end.
- parameters (JSON object) - An object with name/value properties equal to the report parameters’ names and values used in the report definition.

### Type

`any`

### Example

````html
<tr-viewer
  [reportSource]="reportSource">
</tr-viewer>
````

````typescript
reportSource: any ={
  report: 'Report1.trdp', // or '{Category}/{ReportName}' when connected to a Report Server
  parameters: {
    param1: 'value1',
    param2: 3,
    param3: true
  }
}
````


## scale

Sets the scale factor for the report pages. Takes effect when scaleMode is set to "SPECIFIC".

### Type

`number`

### Example

````html
<tr-viewer
  [scale]="scale">
</tr-viewer>
````

````typescript
scale: number = 1.5;
````


## scaleMode

Sets how the report pages should be scaled.

- "FIT_PAGE_WIDTH" - pages scaled to fit entire width in viewport.
- "FIT_PAGE" - pages scaled to fit entire page in viewport.
- "SPECIFIC" - pages scaled with the scale value.

### Type

`string`

### Example

````html
<tr-viewer
  [scaleMode]="scaleMode">
</tr-viewer>
````

````typescript
scaleMode: string = "SPECIFIC";
````


## searchMetadataOnDemand

Determines whether search metadata will be delivered on demand (true) or by default (false).

### Type

`boolean`

### Example

````html
<tr-viewer
  [searchMetadataOnDemand]="searchMetadataOnDemand">
</tr-viewer>
````

````typescript
searchMetadataOnDemand: boolean = true;
````


## selector

A selector used in conjunction with the data attributes. Required when commands are attached to elements outside the viewer via data attributes.

### Type

`string`

### Example

````html
<tr-viewer
  [selector]="selector">
</tr-viewer>
````

````typescript
selector: string = ".my-custom-selector";
````


## sendEmail

Configuration for the Send Email functionality.
Available properties:

- enabled (bool, required) - Indicates whether to show the Send Mail Message toolbar button. Default value: false;
- from (string, optional) - E-mail address used for the MailMessage FROM value;
- to (string, optional) - E-mail address used for the MailMessage TO value;
- cc (string, optional) - E-mail address used for the MailMessage Carbon Copy value;
- subject (string, optional) - A string used for the MailMessage Subject value;
- body (string, optional) - Sentences used for the MailMessage Content value;
- format (string, optional) - The preselected report document format.

### Type

`any`

### Example

````html
<tr-viewer
  [sendEmail]="sendEmail">
</tr-viewer>
````

````typescript
sendEmail: any = {
  enabled: true,
  from: 'sender@company.com',
  to: 'recipient@company.com',
  cc: 'copy@company.com',
  subject: 'Report',
  body: 'Please find the report attached.',
  format: 'PDF'
}
````


## serviceUrl

Sets the address of the Report REST Service. Required when not using reportServer configuration.

### Type

`string`

### Example

````html
<tr-viewer
  [serviceUrl]="serviceUrl">
</tr-viewer>
````

````typescript
serviceUrl: string = 'https://demos.telerik.com/reporting/api/reports';
````


## templateUrl

Sets the address of the HTML page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service.

### Type

`string`

### Example

````html
<tr-viewer
  [templateUrl]="templateUrl">
</tr-viewer>
````

````typescript
templateUrl: string = "https://site.com/path/reportViewerTemplate.html";
````


## viewMode

Sets if the report is displayed in interactive mode or print preview.

- "INTERACTIVE" - enables drill-down interactivity.
- "PRINT_PREVIEW" - report paged according to page settings.

### Type

`string`

### Example

````html
<tr-viewer
  [viewMode]="viewMode">
</tr-viewer>
````

````typescript
viewMode: string = "PRINT_PREVIEW";
````

