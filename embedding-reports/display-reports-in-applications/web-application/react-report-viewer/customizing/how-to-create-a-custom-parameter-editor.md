---
title: Custom Parameter Editor
page_title: Creating a Custom Parameter Editor
description: "Understand how to change the default editors for visible parameters in the React Report Viewer's Parameters Area, using the provided steps and sample code snippets."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: react, report, viewer, how, to, create, custom, parameter, editor
published: True
reportingArea: React
position: 1
previous_url: /react-report-viewer-custom-parameter-editor, /embedding-reports/display-reports-in-applications/web-application/react-report-viewer/customizing/
---

# How to Create a Custom Parameter Editor

The article elaborates on how to change the default editors for visible parameters in the React Report Viewer's Parameters Area.

Custom parameter editors are defined through the **parameterEditors** array passed as an option when creating the report viewer widget. Each object represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration.

## Setting the Custom Parameter Editor

The following example illustrates how to use the [Kendo DateTimePicker](https://demos.telerik.com/kendo-ui/datetimepicker/index) widget for a DateTime parameter:

1.  Each editor is an object which contains two methods: match and createEditor.

    The `createEditor` method returns an object with the following methods:

    * `beginEdit(param)` - *(Required)* The entry point for creating the editor.
    * `addAccessibility(param)` - *(Required when `enableAccessibility` is `true`)* Called after `beginEdit` to configure accessibility attributes on the editor element.
    * `setAccessibilityErrorState(param)` - *(Required when `enableAccessibility` is `true`)* Called when the parameter value changes to update the accessibility error state.

	{{source=CodeSnippets\Blazor\Docs\JavaScript\ReactViewerCustomParameterEditors.js region=ReactCustomDateTimePicker}}

1.  The React Report Viewer is using a special [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) subset that contains only the required widgets and the Kendo DateTimePicker widget is not part of the subset.

    For that reason, we need to load the Kendo All script. Note that currently, we need this special loading logic because jQuery has to be loaded before Kendo All:

	{{source=CodeSnippets\Blazor\Docs\jsx\ReactViewerCustomParameterEditors.jsx region=ReactViewerCustomParameterEditors}}

## See Also

- [How to Create a Custom Parameter Editor in the Html5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor)
