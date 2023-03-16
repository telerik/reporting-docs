---
title: Medium Trust Support
page_title: Medium Trust Support at a Glance
description: "Learn about the limitations and requirements for deploying Web application containing Telerik Reporting on a web host that requires Medium Trust Support."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support
tags: medium,trust,support
published: True
position: 6
previous_url: /asp-net-medium-trust-support
---

# Medium Trust Support Overview

This article describes the limitations and requirements for deploying Web application containing Telerik Reporting on a web host that requires Medium Trust permission level.

If you plan on deploying web application under Medium Trust level, first get acquainted with what Medium Trust is and how to use it - more info in [ASP.NET Trust Levels and Policy Files](https://learn.microsoft.com/en-us/previous-versions/wyts434y(v=vs.140)) Microsoft article.

Telerik Reporting works in Medium Trust environment with the following exceptions:

* The [PDF]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations%}) and [Excel 97- 2003]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%}) rendering extensions require UnmanagedCode permission to operate at all times. If the permission is not present, PDF and __Excel 97- 2003__ extensions are disabled and removed as options from the export dropdown. The Excel rendering extension (i.e. __Excel 2007__) works correctly under medium trust.
* The [XPS]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/xps-rendering-design-considerations%}) rendering extension requires Full Trust and is removed as option from the export dropdown.
* [Creating TIFF images]({%slug configuring-the-image-rendering-extension-to-generate-tiff-files%}) with __CCITT Group 3/Group 4__ or __RLE__ compressions, require UnmanagedCode permission.
* [Picturebox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) item shows images from Web (Value is an URL) - requires WebPermission.
* [Localization of Telerik Web ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/report-viewer-localization%}) through __RESX__  resource files, requires Full Trust.
* Shapes and barcodes with transparent colors are rendered in PNG format, which is not supported by Internet Explorer 6 browser.

> When running Telerik Reports in Medium Trust, one should always set the `ReportViewer.Report` property in code behind. Otherwise the _ReportConverter_ class is used, which requires more permissions than are granted in Medium Trust level.

## See Also

* [legacy ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})
* [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})
* [legacy Web Forms Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})
* [Deploying Web ReportViewer in SharePoint]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-reportviewer-in-sharepoint%})
* [AJAX support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%})
