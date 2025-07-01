---
title: Custom Parameter Editors Stopped Working in Progress Telerik Reporting Version 19.1.25.521
description: Resolve the issue with custom parameter editors not displaying in Telerik HTML5 Report Viewer version 19.1.25.521.
type: troubleshooting
page_title: HTML5 Report Viewer Custom Parameter Editor Issue
meta_title: HTML5 Report Viewer Custom Parameter Editor Issue
slug: custom-parameter-editor-stopped-working
tags: telerik reporting, html5 report viewer, custom parameter editor, parameter editors, javascript
res_type: kb
---

## Environment

<table>
   <tbody>
      <tr>
         <td>Product</td>
         <td>Progress® Telerik® Reporting</td>
      </tr>
      <tr>
         <td>Version</td>
         <td>19.1.25.521</td>
      </tr>
   </tbody>
</table>

## Description

After upgrading to version 19.1.25.521, parameter editors implemented for the HTML5 Report Viewer no longer appear as intended. The underlying code is not executed, causing the parameter editors to revert to the default implementation.

## Cause

The issue is caused by changes introduced in version 19.1.25.521 of Telerik Reporting. These changes were made to ensure compatibility with [Kendo UI Sass themes](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/overview), but they inadvertently affected the rendering of custom parameter editors.

## Solution

To resolve this issue, modify the `telerikReportViewer-19.1.25.521.js` file to include your custom parameter editor implementation. Follow these steps:

1. **Locate and copy the JavaScript file**

   Find the `telerikReportViewer-19.1.25.521.js` file in the installation directory:

   `C:\Program Files (x86)\Progress\Telerik Reporting R3 2025\Html5\ReportViewer\js\telerikReportViewer-19.1.25.521.js`

   Copy this file to your project's directory.

1. **Find the ParameterEditors array**

   Open the copied file and search for the `ParameterEditors` array definition.

1. **Customize the editor logic**

   Choose one of the following approaches based on your requirements:

   **Option A: Override an existing editor type**

   If you want to override the editor for a specific type (e.g., DateTime), locate the existing entry (for example, the entry with `match: parameterEditorsMatch.DateTime`) and replace the `createEditor` function with your own implementation:

   ````javascript
var ParameterEditors = [
       // ...existing editors...
       {
           match: parameterEditorsMatch.DateTime,
           createEditor: createCustomEditor
       },
       // ...remaining editors...
   ];
````

   **Option B: Add a new custom editor**

   If you want to use your own matching logic, add a new entry to the end of the `ParameterEditors` array:

   ````javascript
var ParameterEditors = [
       // ...existing editors...
       {
           match: customMatch,
           createEditor: createCustomEditor
       }
   ];
````


1. **Update your project references**

   Replace the reference to the original `telerikReportViewer-19.1.25.521.js`/`telerikReportViewer-19.1.25.521.min.js` file with the path to your modified version.

1. **Test the implementation**

   Test the implementation to verify that the custom parameter editor renders correctly and functions as expected.
