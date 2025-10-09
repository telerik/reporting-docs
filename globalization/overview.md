---
title: Report Globalization
page_title: Globalizing Reports for Different Cultures
description: "Learn how the Reports and individual Report Items are globalized, which properties depend on the selected culture and how the Culture is inherited across the Report and its Items."
slug: telerikreporting/designing-reports/report-globalization
previous_url: /designing-reports/report-globalization, /globalization/
tags: report,globalization,culture
published: True
position: 11
---

# Report Globalization Overview

Telerik Reporting offers the possibility to control the way numbers, dates, and currencies are displayed and to layout text in different directions. A report is globalized with the help of a [System.Globalization.CultureInfo](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo?view=net-7.0) object.

You can specify a Culture for the entire [Telerik.Reporting.Report](/api/Telerik.Reporting.Report) by setting its [Telerik.Reporting.Report.Culture](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_Culture) property.
This will force all [Telerik.Reporting.TextBox](/api/Telerik.Reporting.TextBox) items to respect the assigned Culture. But you are not limited by one culture per report.

You can mix an unlimited number of cultures, by setting the [Telerik.Reporting.TextItemBase.Culture](/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_Culture) property of a specific [Telerik.Reporting.TextBox](/api/Telerik.Reporting.TextBox). This will override the Report's Culture.

## Culture Inheritance

When determining what Culture to use for formatting strings and text direction, the rendering engine will inspect those objects in the following order:

1. The Culture of the **TextBox**.
1. If the TextBox has no Culture defined, the Culture of the **Report** is used.
1. If the Report has no Culture defined, the Culture of the **CurrentThread** is used.

> tip The Culture of the CurrentThread is determined by the Regional Settings of the machine the application is running on. (Control Panel->Regional Settings->Regional Options->Standards And Formats)

## Culture Dependant Properties

- **String Formatting**

Culture affects the way strings are formatted in Telerik Reporting. For example, if you set the British Culture (en-GB) for a TextBox and set it [Telerik.Reporting.Processing.TextItemBase.Format](/api/Telerik.Reporting.Processing.TextItemBase#Telerik_Reporting_Processing_TextItemBase_Format) to Currency ({0:C2}) you will see values like `£43.21`. The same applies to dates, times, and numbers.

- **Text Direction (LTR/RTL)**

Middle Eastern languages such as Hebrew and Arabic are generally written from right to left. If your TextBox will contain text written using an RTL script, then you simply need to specify the appropriate Culture, for example, "he" for Hebrew and "ar" for Arabic.

> important As of **Q3 2024 (18.2.24.806)** culture properties, such as the [**CurrencyNegativePattern**](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.numberformatinfo.currencynegativepattern?view=net-8.0) property, are resolved based on the machine's local settings instead of the default globalization settings of the current culture.

## See Also

- [HTML5 Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%})
- [Angular Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization%})
- [React Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/localization%})
- [HTML5 ASP.NET MVC Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/localization%})
- [HTML5 ASP.NET Web Forms Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/localization%})
- [Windows Forms Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%})
- [WPF Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/report-viewer-localization%})
- [(legacy) ASP.NET Web Forms Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})
