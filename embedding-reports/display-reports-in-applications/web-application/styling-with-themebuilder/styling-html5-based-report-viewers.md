---
title: Styling HTML5-Based Viewers
page_title: Styling HTML5-Based Viewers with ThemeBuilder
description: "Learn how to style your HTML5-based report viewers using ThemeBuilder, a tool created by Progress Telerik and designed for customizing Telerik and Kendo UI components."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/styling-html5-viewers
tags: styling,html5,viewer,themebuilder
published: True
position: 1
---

# Styling HTML5-Based Report Viewers with ThemeBuilder

ThemeBuilder is a powerful web-based tool designed to help you style Telerik and Kendo UI components effectively. It offers a user-friendly visual interface to customize colors, fonts, and various styling properties. Since the web report viewers rely on such components internally, you can use ThemeBuilder to create a cohesive theme that extends to them.

The current article applies to the HTML5-based report viewers, including:

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [HTML5 MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})
- [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})
- [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
- [ReactJS Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
- [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

## Creating a Theme

To create a theme using ThemeBuilder, follow these steps:

1. Navigate to the [ThemeBuilder website](https://themebuilderapp.telerik.com/).
1. Sign in with your Telerik account.
1. Click **Create New Project** to open the project creation dialog.
1. Enter a project name, choose **Font Icons** as the icon type, select a version and a base theme (e.g., Default), and click **Create New Project** to finalize your selections.

> The HTML5-based report viewers use SVG icons instead of font icons, so it is essential to select the correct icon type. This ensures that your changes are correctly applied in the application later on.

## Customizing the Theme

You can further customize your theme through one of the following approaches:

### Modify Theme Variables

Adjust predefined variables to effect global changes across colors, fonts, and other styling aspects. This approach is ideal for maintaining consistency and quickly applying broad changes. Some key variables to consider include:

- `kendo-color-base`: This variable defines the primary accent color for the viewer. It influences the action buttons of the modals and the parameter editors.

- `kendo-color-on-app-surface`: This variable specifies the color of the text and icons of the toolbar buttons.

- `kendo-color-surface`: This variable sets the surface color used as the background for the toolbar as well as for the splitter that divides the viewed report from the parameter editors.

- `kendo-default-typography`: This variable configures the default typography settings for the report viewer.

### Customize Component Properties

For more granular control, you can directly tweak the styling properties of specific components in the HTML5-based report viewers. This approach allows for precise design adjustments without altering the overall theme. For example, you can customize parameter editors, which use Kendo components like ComboBox, ListView, MultiSelect, and DatePicker, directly in ThemeBuilder. 

Additionally, you may want to modify other components, including the main Toolbar of the report viewer, the modal dialogs (which are essentially Window components), or the flat base [variant](https://docs.telerik.com/themebuilder/working-with-kendo/component-variants) of the Button component, which is used to define the toolbar buttons.

For more details on the properties customizations, check [Exploring the Component Properties](https://docs.telerik.com/themebuilder/building-visual-styles/component-properties).

## Using the Theme

After finalizing your customizations, you can export your theme. Click **Export All** in the upper-right corner of the ThemeBuilder app. This action will download a ZIP package containing the CSS and Sass files, which you can reference in your project with the report viewer. 

For example, copy the CSS file from the `css` folder in the exported package and add it to your project. In the report viewer file, replace the existing reference to the Telerik and Kendo UI theme with the ThemeBuilder-exported theme:

````HTML
<!--<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" id="theme-css" />-->
<link rel="stylesheet" href="/css/tb-theme.css" />
````

> In JavaScript-based projects, if preferred, you can instead utilize the files from the `scss` folder as an NPM package. Further information on this approach can be found at [Using the ThemeBuilder Output as an NPM Package](https://docs.telerik.com/themebuilder/using-exported-styles/exported-package#using-the-themebuilder-output-as-an-npm-package).

## Next Steps

- [ThemeBuilder Documentation](https://docs.telerik.com/themebuilder/)