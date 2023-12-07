---
title: Overview
page_title: Configuring the available Export Formats at a glance
description: "Find detailed information about how to configure the available export formats either on the application level or on the report level."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview
tags: overview, exporting
published: True
position: 0
previous_url: /device-information-settings, /doc-output/configure-the-export-formats/
---

# Configure the Export Formats Overview

In Telerik Reporting, the export formats take predefined parameters called *device information settings* that are used to configure a rendering extension.

You can specify device information settings in a variety of ways. Firstly, you can specify application-wide settings using the `<Telerik.Reporting>` configuration section. For more information about specifying rendering parameters globally, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

Alternatively, you can specify device information settings per particular report as part of its definition, configuring the [RuntimeSettings](/reporting/api/Telerik.Reporting.Report#Telerik_Reporting_Report_RuntimeSettings) report property. Besides setting the export parameters for a particular extension it allows hiding it and changing its description when listed to the end-user. The property in question can be set up from the report designer tools as well. In the case of a report book document the settings of the first report in the book get respected. 

When exporting a report programmatically, the respective method takes a [HashTable](https://learn.microsoft.com/en-us/dotnet/api/system.collections.hashtable?view=net-7.0) argument representing the desired export parameters for this particular rendering operation: [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_).
