---
title: parameterEditors
page_title: parameterEditors property
description: "Allows defining custom editors for report parameters. Array of parameter editor configurations. Each object in the array represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration. Each factory object contains two methods:  `match`  and  `createEditor` .  The  `match`  method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter. The parameter argument exposes the following properties of the report parameter: - availableValues (array of name-value pairs): represents a list of predefined parameter values and their labels. - multivalue	(boolean): specifies whether the parameter can hold more than one value. - allowBlank (boolean): specifies whether the parameter allows an empty string to be passed (only for parameters of type string). - allowNull (boolean): specifies whether the parameter allows a null value to be passed from its editor - autoRefresh (boolean): specifies whether the report viewer should auto-update the report when its value has changed. - hasChildParameters (boolean): specifies whether the parameter is a cascading one (has dependencies). - id (string): represents the parameter’s unique identifier. - isVisible (boolean): determines whether the parameter editor is visible or not. - label (string): specifies the label for the parameter editor. - name (string): specifies the name of the parameter editor. - text (string): specifies the text for the parameter editor. - type (string): specifies the type of the parameter editor. Possible values: \"INTEGER\", \"FLOAT\", \"STRING\", \"DATETIME\", \"BOOLEAN\". - value (object): specifies the value of the parameter.  The main work for creating and utilizing the parameter editor is done in the  `createEditor`  method. Its purpose is to create the parameter editor UI and wire it to the  `parameterChanged`  callback when a new value is selected. The return result is a new object containing the  `beginEdit`  method which is the entry point for creating the editor from the viewer. The 'createEditor' method accepts two arguments -  `placeholder`  and  `options` . The 'placeholder' argument is the HTML element which the parameter editor UI is appended to, and the 'options' arrgument is an object containing the  `parameterChanged(parameter, value)`  callback function which should be called when the parameter value is changed. The 'createEditor' method should return a parameter editor object with the following properties: - 'beginEdit(parameter)' - a method which accepts a report parameter object and initializes the editor with the parameter's settings. The parameter object has the same properties as described above. - 'addAccessibility(parameter)' - an optional method which accepts a report parameter object and adds accessibility features to the editor and populates its string resources. - 'setAccessibilityErrorState(parameter)' - an optional method which accepts a report parameter object and sets the error state of the parameter editor's accessibility functionality and its error attributes. - 'enable(enable)' - an optional method which accepts a boolean value and enables or disables the parameter editor. - 'clearPendingChange' - a method that would be invoked when the parameter changes. - 'destroy' - a method invoked to destroy the parameter editor."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parametereditors
published: True
reportingArea: AngularWrapper
---

# The `parameterEditors` option of the Angular Report Viewer

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

## Type

`Array<any>`

## Examples

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

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/overview%})
* [parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parameters%})
* [parametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parametersareaposition%})

