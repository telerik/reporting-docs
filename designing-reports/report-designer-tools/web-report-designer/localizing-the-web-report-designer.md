---
title: Localization
page_title: Localizing the Web Report Designer
description: "Learn how to Localize the Telerik Web Report Designer menus, buttons, messages, etc to make it comprehensible for users from different cultures."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/localizing-the-web-report-designer
tags: localizing,web,report,designer
published: True
reportingArea: WRDHTML5
position: 7
previous_url: /web-report-designer-localization
---

# Web Report Designer Localization

This article elaborates on how to localize the strings used and displayed by the Web Report Designer.

### Setup

1. **Include script containing strings**

   Create a JavaScript file in your application, in a location where it can be referenced by the HTML page/view containing the Web Report Designer initialization script. This can for example be inside the `Scripts` folder of your website.

   You may use the resource file that gets deployed with the installation of the product in the subfolder, for example:

   ```PATH
   C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js\WebReportDesignerStringsBase-{{site.buildversion}}.js
   ```

   Or the following code snippet:

   `replace-wrd-strings-base`

1. **Reference the file containing the strings**.

   On the page containing the Web Report Designer and its initialization script, add in the following snippet of JavaScript to load in the strings.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\WebReportDesignerLocalizingTheWebReportDesigner.html region=WebReportDesignerSetup}}

   > note The localization file must be loaded on the page after the **jQuery** and **Web Report Designer** scripts have been loaded.

1. **Translate the strings**.

> tip The Web Report Designer is in active development and new strings might be added in new releases. The JavaScript code snippet in _Step 1_ above is updated on each release.

## See Also

- [Localizing Reports](slug:telerikreporting/designing-reports/localizing-reports)
- [Localizing the HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization)
