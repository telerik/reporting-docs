---
title: Configuration Sections
page_title: Standalone Report Designer Configuration Sections Explained
description: "Learn which are the configuration sections related to the Telerik Reporting Engine and Report Designer and what settings may be provided there."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration
tags: report,designer,configuration
published: True
position: 1
previous_url: /standalone-report-designer-default-configuration
reportingArea: General
---

# Standalone Report Designer Configuration Sections

The settings of the Telerik Reporting engine are defined in a custom configuration section called `Telerik.Reporting`. This section should be added to the Report Designer configuration file `Telerik.ReportDesigner.exe.config`: 

{{source=CodeSnippets\MvcCS\XmlConfiguration\ReportDesignerReportingSectionConfiguration.xml region=ReportDesignerReportingSectionConfiguration}}
Using this section, you can control particular aspects of the engine such as the available rendering extensions and the cache management system which is utilized by the viewers. For more information, see [Telerik Reporting Configuration Section](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview).

The Telerik Report Designer offers additional configuration through its own custom configuration section, called `Telerik.ReportDesigner`:

{{source=CodeSnippets\MvcCS\XmlConfiguration\ReportDesignerDesignerSectionConfiguration.xml region=ReportDesignerDesignerSectionConfiguration}}
This section lets you specify the working directory of the Report Designer via a single attribute:

{{source=CodeSnippets\MvcCS\XmlConfiguration\ReportDesignerElementConfiguration.xml region=ReportDesignerElementConfiguration}}
## See Also

* [Configuration](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview)
* [Extending Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer)
