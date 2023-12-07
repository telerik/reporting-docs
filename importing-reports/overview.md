---
title: Overview 
page_title: Importing Reports at a glance
description: "Learn how to convert and import existing reports from other reporting solutions such as 'Crystal Reports', 'Active Reports', and 'XtraReports' to Telerik Reporting."
slug: telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/overview
tags: telerik, reporting, importing, reports, converting, overview
published: True
position: 0
previous_url: /faq-available-converters, /importing-reports/
---

# Importing Reports Overview


## Converting reports from other reporting solutions

Telerik Reporting is currently able to convert reports from:

* __Crystal Reports__ - requires build 13.0.2000.0 or later

* __Active Reports__ - requires build 5.2.1013.2 or later

* __XtraReports__ - requires build 8.1.6.0

To convert reports, start the [Import Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard%}).

The converters are compiled against the 3rd party product version specified above. If you have upgraded to a newer version of Crystal or Active Reports, you will need to add an assembly binding redirect statement to your Visual Studio configuration file. More info on this process is available in the following articles:

* [Converting reports from Crystal Reports]({%slug telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/crystal-reports-converter%})

* [Converting reports from Active Reports]({%slug converting-reports-from-activereports%})  

Converting from XtraReports does not require any additional steps. It is built against the version described in the right-hand panel of the information panel of the "Report Choice Page" of the "Report Wizard".

>caution The converters are just a helper utility we did out of goodwill to save some time. They do not guarantee a one-to-one complete conversion and are provided as is. Please keep in mind that there are some parts (items/sections) that have no analog on our end and vice versa, thus you would need to review and fix the converted reports manually. Complex expressions will not be converted and should also be edited manually.


The conversion depends on the 3rd party products' object model to create Telerik Reports and often there are additional adjustments that need to be carried out by the developer. Parsing the code is far more complicated since you may use any .NET programming language which makes the task almost impossible, and that is why only the report definition is inspected and all events and custom logic is skipped i.e. it should be added manually by the developer. The same goes for parts that have no counterpart on our end.
