---
title: Report Designer Configuration
page_title: Report Designer Configuration | for Telerik Reporting Documentation
description: Report Designer Configuration
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration
tags: report,designer,configuration
published: True
position: 1
---

# Report Designer Configuration



The settings of the Telerik Reporting engine are defined in a custom configuration section called Telerik.Reporting. This section should be added         to the Report Designer configuration file (Telerik.ReportDesigner.exe.config):       

	
````xml
    <configuration>
    <configSections>
      <section
          name="Telerik.Reporting"
          type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
          allowLocation="true"
          allowDefinition="Everywhere"/>
      </configSections>
      …
    </configuration>
````



Using this section, you can control concrete aspects of the engine such as the available rendering extensions and the cache management system which is         utilized by the viewers. For more information, see [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}).       

The Telerik Report Designer offers additional configuration through its own custom configuration section, called Telerik.ReportDesigner:

	
````xml
    <configuration>
    <configSections>
      <section
                  name="Telerik.ReportDesigner"
                  type="Telerik.ReportDesigner.Configuration.ReportDesignerConfigurationSection, Telerik.ReportDesigner.Configuration"
                  allowLocation="true"
                  allowDefinition="Everywhere"/>
      </configSections>
      …
    </configuration>
````



This section lets you specify the working directory of the Report Designer via a single attribute:

	
````xml
    <Telerik.ReportDesigner DefaultWorkingDir="Examples">
    </Telerik.ReportDesigner>
````



## 

# See Also


 * [Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview%})

 * [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
