---
title: Using Custom Parameter Editors
page_title: Implementing a Custom Parameter Editor 
description: "Learn how to create and use a custom Parameter Editor in the Telerik Reporting Blazor Report Viewer for all types of report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-create-a-custom-parameter-editor
tags: how,create,custom,parameter,editor,blazor,html5,report,viewer
published: True
reporting_area: BlazorWrapper
position: 4
---

# Using Custom Parameter Editor in the Blazor Report Viewer

The article elaborates on how to change the default editors for visible parameters in the Blazor Report Viewer's Parameters Area.

Custom parameter editors are defined through the `ParameterEditors` ([Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})) array of `ParameterEditor` objects passed as an option when creating the report viewer widget.
Each object represents a parameter editor factory for creating editors suitable for editing a specific report parameter configuration.

Each editor is a `ParameterEditor` instance, which contains two string properties: `Match` and `CreateEditor`. These strings should point to a global JS variable defined on the [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window) object. This variable should have a _match_ and _createEditor_ JavaScript methods.

The `match` method accepts a report parameter to be edited as an argument and returns a boolean value that indicates whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like name, *allowNull*, *availableValues*, *multiValue*, *type*, etc.

The main work for creating and utilizing the parameter editor is done in the `createEditor` method. Its purpose is to create the parameter editor UI and wire it to the `parameterChanged` callback when a new value is selected. The returned result is a new object containing the `beginEdit` method, which is the entry point for creating the editor from the viewer.

This global variable with the _match_ and _createEditor_ methods can be initialized in `\_Host.cshtml/\_Layout.cshtml` for the Blazor Server project, and for Blazor WebAssembly, can be used in the `wwwroot/index.html` file.

The following example uses the **Dashboard** example report that we ship with the installation of Telerik Reporting and illustrates how to use the [Kendo DropDownList](https://demos.telerik.com/kendo-ui/dropdownlist/index) widget for a single parameter value parameter editor, which also has available values:

- In the shared `HTML`/`CSHTML` file:

{{source=CodeSnippets\BlazorAppSnippets\Components\Shared\_CustomParameterEditor_Host.cshtml}}

- Then in the Blazor Report Viewer Initialization:

{{source=CodeSnippets\BlazorAppSnippets\Components\Shared\_CustomParameterEditor_Viewer.cshtml}}


## See Also

* [Blazor Report Viewer Event Binding]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding%})
