---
title: Localization
page_title: Localization of the HTML5 ReportViewer Explained
description: "Learn how to localize the HTML5 ReportViewer for use with multiple languages in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization
tags: localization
published: True
reporting_area: HTML5
position: 2
previous_url: /html5-report-viewer-localization
---

# Localization of the HTML5 ReportViewer

The article elaborates on how to localize the messages displayed by the HTML5 Report Viewer. This feature is available since version [R2 2018 SP1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620).

1. To localize the report viewer messages, create a new JavaScript file with the required string resources. You may use the resource file that gets deployed with the installation of the product in the subfolder `Html5\ReportViewer\js\telerikReportViewer.stringResources-{{site.buildversion}}.js` or the following code snippet:

	{{source=CodeSnippets\js\telerikReportViewer.stringResources}}

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\HardCodedStringResources.js}}

1. Specify the name of the file using the following convention: `stringResources.[culture].js` where *[culture]* is the name of the culture for the specified localization resource. For example, to provide a localization resource for the French-Belgian culture, the corresponding resource file could be named as follows: `stringResources.fr-BE.js`.
1. Translate the texts for the specified culture
1. Load the `JS` file with the translated text before loading the report viewer:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\AddTranslatedStringResources.html}}

> To modify the HTML5 Viewer's HTML template that contains the toolbar, Preview, Parameters, and DocumentMap areas, you will have to set the viewer's `templateUrl`. For more details on this, please check [Providing Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%})
* [Localizing the Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization%})
