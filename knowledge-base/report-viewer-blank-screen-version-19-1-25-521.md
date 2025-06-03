---
title: Report Viewer Blank Screen in Progress Telerik Reporting Version 19.1.25.521  
description: Resolving the issue of a blank report viewer screen after updating to version 19.1.25.521 in Progress Telerik Reporting.  
type: troubleshooting  
page_title: Blank Report Viewer Screen in Version 19.1.25.521 of Telerik Reporting  
slug: report-viewer-blank-screen-version-19-1-25-521  
tags: reporting, report viewer, blank screen, css selectors, sass themes  
res_type: kb  
ticketid: 1689024
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress Telerik Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

After upgrading to version 19.1.25.521 of Progress Telerik Reporting, the report viewer screen appears blank, displaying only the toolbar. The data exists and operations like downloading work, but the report visualization is missing. Previous versions of the reporting packages worked as expected.

## Cause

The issue arises due to changes in the rendering of the report viewer in version 19.1.25.521. These changes ensure compatibility with [Kendo UI Sass-based themes](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/overview), which results in some classes, such as `.trv-report-viewer`, no longer being available in the HTML output of the viewer. Consequently, styles meant to control the height or other properties of the report viewer using such classes as CSS selectors are no longer effective.

## Solution

To resolve the issue, use an appropriate CSS selector to apply the necessary styles, and ensure the required Sass-based theme is available. Follow the steps below:

### Step 1: Update the CSS Selector

Replace the `.trv-report-viewer` selector with the ID of your report viewer element (e.g., `#rv1`). Update your CSS as follows:

````html
<style>
    #rv1 {
        width: 100%;
        height: 1000px;
        padding-right: 50px;
    }
</style>
````

### Step 2: Include a Sass-Based Kendo UI Theme

Ensure that a Sass-based Kendo UI theme is referenced in your project. For example, include the Default Ocean Blue theme with the following tag:

````html
    <link rel="stylesheet" href ="https://unpkg.com/@@progress/kendo-theme-default@10.2.0/dist/default-ocean-blue.css"/>
````

### Additional Workaround

If you make calls to set the report source or refresh the report right after initializing the report viewer, a `TypeError` might occur in the browser. To resolve this issue, use the `ready` event to add such logic, as it ensures the viewer is fully initialized before making these calls. For more information on this topic, check {{ slug telerik-reportviewer-typeerror-undefined-is-not-iterable }}

## See Also

- [Kendo UI Sass-Based Themes Overview](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/overview)
