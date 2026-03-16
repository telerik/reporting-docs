---
title: Localization
page_title: Localization of the HTML5 ReportViewer Explained
description: "Learn how to localize the HTML5-based Report Viewers for use with multiple languages in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization
tags: localization
published: True
reportingArea: HTML5
position: 2
previous_url: /html5-report-viewer-localization
---

# Localization of the HTML5 ReportViewer

The article elaborates on how to localize the messages displayed by the HTML5 Report Viewer.

> important This feature is available since version [R2 2018 SP1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620).

## Setup

1. Create a new `.js` file with the required string resources. Those resources will be stored in an object named `sr`. This object will be used to make those resources globally available for the report viewer.

   You may use the resource file that comes with the installation of the product in:

   `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\js\telerikReportViewer.stringResources-{{site.buildversion}}.js`

   Or the following code snippet:

   {{source=Source\Code\Telerik.ReportViewer.Web\jquery-viewer\src\sr.js}}

2. Wrap the code from the previous step in an **[IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)** (Immediately Invoked Function Expression), which will help avoid polluting the global namespace with the intermediate `sr` variable:

   ```JavaScript
   (function () {
     var sr = { ... };

     window.telerikReportViewer ||= {};
     window.telerikReportViewer.sr ||= sr;
   })();
   ```

3. Specify the name of the file using the following convention:

   `stringResources.[culture].js` where _[culture]_ is the name of the culture for the specified localization resource.

   For example, to provide a localization resource for the French-Belgian culture, the corresponding resource file could be named as follows:

   `stringResources.fr-BE.js`.

4. Translate the texts for the specified culture
5. Load the `JS` file with the translated text before loading the report viewer:

   ```HTML
   <script src="/Scripts/stringResources.fr-BE.js"></script>
   <script src="/api/reports/resources/js/telerikReportViewer"></script>
   ```

> To modify the HTML5 Viewer's HTML template that contains the toolbar, preview, parameters, and document map areas, and so on, you will need to create a custom template, which you can provide to the viewer through its `templateUrl` property.
> <br/>  
> For more details on this, please check [Providing Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%}).

## See Also

- [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [Localizing Reports](slug:telerikreporting/designing-reports/localizing-reports)
- [Localizing the Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization)
