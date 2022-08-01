---
title: Accessibility
page_title: Accessibility 
description: Accessibility
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/accessibility
tags: accessibility
published: True
position: 6
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>

# Accessibility

Telerik Reporting aims to provide a reporting solution accessible to a wider user audience. This includes users with motor control restrictions and ones working with assistive technologies. In our product we follow the recommended practices in [Section 508 of the Rehabilitation Act](http://www.section508.gov/) adding accessibility features to our WinForms report viewer. 

## Setting up accessibility features in WinForms viewer

The accessibility features are enabled or disabled using a Boolean property named __EnableAccessibility__. When the property is set to __true__, additional meta-information is added to the report content and the report viewer controls’ behavior is changed so they respond differently to the user’s input. The default value of this property is __false__. This option also affects the accessibility of the exported PDF documents, i.e. if __enableAccessibility__ is set to __true__, the exported PDF will be created according to [PDF/UA (ISO standard 14289-1)](https://en.wikipedia.org/wiki/PDF/UA) specification. 

The accessibility routines capture the keyboard events to provide shortcut key access to the viewer areas. It is possible some of these shortcuts to interfere with the designed application behavior. In this case the keys mapping can be changed through the property [AccessibilityKeyMap](/reporting/api/Telerik.ReportViewer.WinForms#Telerik_ReportViewer_WinForms_AccessibilityKeyMap), which provides access to the internal dictionary of keycodes and shortcut definitions. The code snippets below demonstrate how to change the default shortcut for navigating to the menu area: 

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=WinFormsViewerAccessibilityKeyMapSnippet}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=WinFormsViewerAccessibilityKeyMapSnippet}}

All the accessibility messages and labels support localization. You can modify them, following the procedure, described in the article [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%}). 

> Please note that the meta-information, added to the report content when the accessibility is enabled, might result in a small performance penalty, especially on machines with outdated hardware. For best experience we recommend to enable the accessibility features conditionally according to your user's needs. 


## Supported accessibility features in WinForms report viewer

The WinForms report viewer supports the following important accessibility features:         

|   |   |
| ------ | ------ |
|__Comprehensive keyboard support__|Includes navigation between and into report viewer areas (menu/toolbar, parameters, document map, contents) using shortcut keys, TAB or arrow keys where possible. The toolbar commands and expandable items are toggled on ENTER. The same key mapping is applied to document map and parameters areas.<br />The default shortcut keys for navigation between the viewer areas are:<ul><li>__Ctrl+Alt+M__ - menu/toolbar area</li><li>__Ctrl+Alt+P__ - parameters area (if visible)</li><li>__Ctrl+Alt+D__ - document map area (if visible)</li><li>__Ctrl+Alt+C__ - report viewer contents area (the report currently rendered in the viewer)</li></ul> If needed, the default key mapping can be changed, using the report viewer's API method [AccessibilityKeyMap](/reporting/api/Telerik.ReportViewer.WinForms#Telerik_ReportViewer_WinForms_AccessibilityKeyMap). The key, assigned for navigation between the areas, is always used together with CTRL and ALT key modifiers.|
|__Dynamically generated descriptions for report viewer areas__|The report viewer areas provide additional textual details that reflect the currently presented information. This applies to the state of the menu buttons (enabled, disabled, expandable, etc.), the parameters state and their selected values, the currently selected node from document map and the rendered report. This information refreshes dynamically with every change that occurs in the viewer - for example when a new page is loaded or when an exception is thrown while processing the report.|
|__Textual description to non-textual items__|In a rendered report all graphic items like images, maps and charts provide additional information about their contents. Tables and crosstabs provide such information about the currently focused cell, marking the current row, column and value. These details are visible and recognizable by the most popular screen readers to help users with visual disabilities better understand the presented report. A comprehensive list with the supported report items features can be found in the next section.|

## Supported accessibility features in rendered report contents

All the report items have a property called [AccessibleDescription](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_AccessibleDescription). The property value is an expression and it determines what will be the accessibility label when the report is rendered. Its value is set as a meta-information label that is output to the screen readers through the standard [WinForms Accessibility API](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.accessibleobject). 

The value of this label is created using the following pattern: `{type} {additional information} {description} `: 

* __{type}__ is a placeholder that contains the type name of the currently rendered element - "Details section", "Text box", "Table", etc. The report item names are localizable and can be substituted with any appropriate strings, even with empty values, if there is no need to include the report item name in the label. 

* __{additional information}__ is intended to give some meaningful information about the context where the current item is in, or about its additional properties. The cases where it is most useful, are: 

   + if the current item has some interactive action set, this token will contain the type of the action. 

   + if the current item is __Table__ or __Crosstab__, the token will contain information about the row and column count. 

   + if the current item is nested in a __Table__ or __Crosstab__, the token will contain information about the current cell's row and column __zero-based index__. Additionally, if the cell is used as a header, this information will be also included in the label. 

   + if the current item is a __CheckBox__, the token will contain information about the current checkbox status (checked/unchecked). 

* __{description}__ provides relevant information about the current item contents. Its value is evaluated using the item's *AccessibleDescription* property and if it is empty, falls back to the item's *Value* or *Text* property, whichever is available. 

For example, if a report contains a __TextBox__ with `Value = "Sorts by Category"`, that performs a sorting action and is nested in a table's first (header) row and third column, the generated *accessibility label* value will be: *Text box. Performs a sorting action. Column header. Column 2 Row 0. Sorts by Category.* 

## Known issues

* When a disabled toolbar button is selected, its accessible properties are not output to the screen reader. 

* When the focus is within a multiselect parameter, the current item state (checked/unchecked) is not output to the screen reader.

