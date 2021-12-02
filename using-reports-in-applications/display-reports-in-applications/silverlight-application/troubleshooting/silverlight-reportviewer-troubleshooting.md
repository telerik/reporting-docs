---
title: Silverlight ReportViewer Troubleshooting
page_title: Silverlight ReportViewer Troubleshooting | for Telerik Reporting Documentation
description: Silverlight ReportViewer Troubleshooting
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/troubleshooting/silverlight-reportviewer-troubleshooting
tags: silverlight,reportviewer,troubleshooting
published: True
position: 0
---

# Silverlight ReportViewer Troubleshooting



The article provides troubleshooting for commonly met issues with the Silverlight ReportViewer control.

The Silverlight ReportViewer displays content rendered through the Reporting Silverlight XAML Rendering nmechanism         that produces XAML delivered by the [Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}) and loaded by the control.       

## The Silverlight ReportViewer is not visible on running the application.

As of Telerik Reporting Q1 2014, the Silverlight ReportViewer control uses implict styles.           When the viewer's template (__Telerik.ReportViewer.Silverlight.xaml__ ) file is not loaded correctly,           the viewer is not displayed. Double-check if XAML resources are loaded in the application.         

More details about the settings required by the Silverlight ReportViewer are available in           [How to: Add report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).         

## Errors on building an application that uses the Silverlight ReportViewer control related to XAML resources e.g. "The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml ".

As of Telerik Reporting Q1 2014, the Silverlight ReportViewer control uses implict styles.           When the viewer's template (__Telerik.ReportViewer.Silverlight.xaml__ ) file is not loaded correctly,           the viewer is not displayed. Also if the additionally required XAML files           are not loaded or they are not of a version synchronized with Telerik Reporting, you may receive such errors.           Double-check if XAML resources are loaded in the application and if dependencies between Telerik Reporting and Telerik UI for Silverlight           are considered - [Silverlight Dependenices per release]({%slug telerikreporting/upgrade/overview%}).         

More details about the settings required by the Silverlight ReportViewer are available in           [How to: Add report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).         

## Errors after upgrading an application that uses the Silverlight ReportViewer control related to XAML resources e.g. "The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml ".

As of Telerik Reporting Q1 2014, the Silverlight ReportViewer control uses implict styles.           When the viewer's template (__Telerik.ReportViewer.Silverlight.xaml__ ) file is not loaded correctly,           the viewer is not displayed. Also if the additionally required XAML files           are not loaded or they are not of a version synchronized with Telerik Reporting, you may receive such errors.           Double-check if XAML resources are loaded in the application and if dependencies between Telerik Reporting and Telerik UI for Silverlight           are considered - [Silverlight Dependenices per release]({%slug telerikreporting/upgrade/overview%}).         

More details about the settings required by the Silverlight ReportViewer are available in           [How to: Add report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).         

>important [Telerik Reporting Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) will update only references             to Telerik Reporting assemblies and configuration settings.             You will have to manually update the related  __Telerik.ReportViewer.Silverlight.xaml__  files, and Telerik UI             for Silverlight XAML files distributed by Telerik Reporting. This includes manual update of Telerik UI for Silverlight assemblies             distributed by Telerik Reporting.           If you use Telerik UI for Silverlight as a separate product, you can run  [Telerik UI for Silverlight Upgrade Wizard](http://docs.telerik.com/devtools/silverlight/visual-studio-extensions/for-silverlight-vs-extensions-upgrading)  which will update Telerik UI for Silverlight assembly references and XAML resources automatically.           


## The report in the Silverlight ReportViewer is messed or different than the design-time preview.

The Silverlight ReportViewer displays teh report rendered in XAML format. External styles may affect the produced XAML that contains           standard elements like Canvas, TextBlock and etc. Test excluding styles to check if they change the displayed content, or test exporting in a format like PDF.         

# See Also

