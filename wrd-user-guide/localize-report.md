---
title: Localizing Reports
page_title: Localize Report Definitions in Web Report Designer
description: "Learn how to localize Telerik Reports for multiple languages in the Web Report Designer."
slug: wrd-localizing-reports
tags: localizing,reports,web,designer
published: True
position: 15
reportingArea: General
components: [wrdhtml5, wrdblazorwrapper, general]
---

# Localizing Reports in Web Report Designer

Localization is used to display the reports in the language of a specific culture. The article elaborates how to localize reports in the Web Report Designer.

> The Web Report Designers support three report formats: XML report format (TRDX); JSON report format (TRDJ) and ZIPPED format (TRDP). The localization mechanism described here is supported only in the TRDP report format. For more details see [Localizing Reports Overview](slug telerikreporting/designing-reports/localizing-reports).

To localize a report:

1. In the designer set the Report `Localizable` property to true. If at any point the `Localizable` property is set to false all the resource files are deleted and the report property values are filled with the currently selected language values.
1. Select a `Language` property value from the drop-down list in the properties window.
1. Set the target component Name property. Keeping the default auto generated name can result in new items inheriting deleted items localized values.
1. Translate the static text into the desired language indicated by the `Language` property.

> important Items cannot be added in localization mode. After localizing the report set the Language property to (Default) to add new items.

The report's runtime localization depends on the current thread's culture UI setting and must be already set in order the report to be processed with the correct resources.

The current thread's culture UI setting depends on the OS or the browser language settings.

To run the localized report in a specific language that is different from the thread's current culture UI setting:

1. Add Threading and Globalization namespaces to your application.
1. Set the current thread `CurrentUICulture` to a new instance of `CultureInfo`. The `CultureInfo` constructor takes the culture code of the language you want to display. For example "en-US" for United States English or "es-MX" for Mexican Spanish.
1. Optionally you can set the `CurrentCulture` for the current thread to the culture code of the language you wish to display. `CurrentCulture` affects dynamic data such as date, time and money formats. The "Birth Date" column date format in the figure above shows Month/Day/Year in English, but in Day/Month/Year format in the Spanish example.
1. Create a [report source object](slug:telerikreporting/designing-reports/report-sources/overview) to specify the report, and assign it to the `ReportViewer.ReportSource` property. If you are using a `ReportViewer` in a Windows application, call the `ReportViewer.RefreshReport()` method. If you are using a web viewer, let the page send the request for getting the rendered report.

> important Note that the culture settings must be applied before creating an instance of the report. This ensures the correct report's resource file will be used on processing the document.

{{source=CodeSnippets\CS\API\Telerik\Reporting\LocalizationSnippets.cs region=SetThreadCulture}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\LocalizationSnippets.vb region=SetThreadCulture}}

