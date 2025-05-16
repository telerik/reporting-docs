---
title: Styling Native Blazor Report Viewer
page_title: Styling the Native Blazor Report Viewer with ThemeBuilder
description: "Learn how to style your Native Blazor Report Viewer using ThemeBuilder, a tool  created by Progress Telerik and designed for customizing Telerik and Kendo UI components."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/styling-native-blazor-viewer
tags: styling,native,blazor,viewer,themebuilder
published: True
position: 5
---

# Styling the Native Blazor Report Viewer with ThemeBuilder

ThemeBuilder is a powerful web-based tool designed to help you style Telerik and Kendo UI components effectively. It offers a user-friendly visual interface to customize colors, fonts, and various styling properties. Since the Native Blazor Report Viewer relies on such components internally, you can use ThemeBuilder to create a cohesive theme that extends to it.

## Creating a Theme

To create a theme using ThemeBuilder, follow these steps:

1. Navigate to the [ThemeBuilder website](https://themebuilderapp.telerik.com/).
1. Sign in with your Telerik account.
1. Click **Create New Project** to open the project creation dialog.
1. Enter a project name, choose **SVG Icons** as the icon type, select a version and a base theme (e.g., Default), and click **Create New Project** to finalize your selections.

> The Native Blazor Report Viewer uses SVG icons instead of font icons, so it is essential to select the correct icon type. This ensures that your changes are correctly applied in the application later on.

You can further customize your theme through one of the following approaches:

### Modify Theme Variables

Adjust predefined variables to effect global changes across colors, fonts, and other styling aspects. This approach is ideal for maintaining consistency and quickly applying broad changes. Some key variables to consider include:

- `kendo-color-primary`: This variable defines the primary accent color for the viewer. It influences the action buttons of the modals and the parameter editors.

- `kendo-color-on-app-surface`: This variable specifies the color of the text and icons of the toolbar buttons.

- `kendo-color-surface`: This variable sets the surface color used as the background for the toolbar as well as for the splitter that divides the viewed report from the parameter editors.

- `kendo-default-typography`: This variable configures the default typography settings for the report viewer.

### Customize Component Properties

For more granular control, you can directly tweak the styling properties of specific components in the HTML5-based report viewers. This approach allows for precise design adjustments without altering the overall theme. For example, you can customize parameter editors, which use Kendo components like ComboBox, ListView, MultiSelect, and DatePicker, directly in ThemeBuilder. 

Additionally, you may want to modify other components, including the main Toolbar of the report viewer, the modal dialogs (which are essentially Window components), or the flat base [variant](https://docs.telerik.com/themebuilder/working-with-kendo/component-variants) of the Button component, which is used to define the toolbar buttons.

For more details on the properties customizations, check [Exploring the Component Properties](https://docs.telerik.com/themebuilder/building-visual-styles/component-properties).

## Using the Theme

After finalizing your customizations, you can export your theme. Click **Export All** in the upper-right corner of the ThemeBuilder app. This action will download a ZIP package containing the CSS and Sass files, which you can reference in your project with the report viewer. 

For example, copy the CSS file from the `css` folder in the exported package and add it to your project. In the report viewer file, replace the existing references to Telerik and Kendo UI themes with the ThemeBuilder-exported theme:

````HTML
@* <link rel="stylesheet" href="https://unpkg.com/@@progress/kendo-theme-utils@@10.0.1/dist/all.css"  /> *@
<link rel="stylesheet" href="/css/tb-theme.css" />
````

## Next Steps

- [ThemeBuilder Documentation](https://docs.telerik.com/themebuilder/)