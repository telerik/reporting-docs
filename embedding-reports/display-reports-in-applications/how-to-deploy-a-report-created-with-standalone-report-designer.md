---
title: Deploying Declarative Reports
page_title: Deploying Declarative Reports Created with Standalone or Web Report Designers
description: "Learn How to Deploy Declarative Report definitions Created with Standalone or Web Report Designers in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-deploy-a-report-created-with-standalone-report-designer
tags: how,to,deploy,a,report,created,with,standalone,report,designer
published: True
position: 3
previous_url: /standalone-report-designer-display-report-viewer
---

# Deploying Reports Created with the Standalone and Web Report Designers

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) supports Telerik Reporting XML report definitions (.TRDP) in a zip package and in a plain XML format (.TRDX legacy option).

## Display TRDP or TRDX file in a Report Viewer

To show a report created with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), you have the following options:

* __Use [UriReportSource](/api/Telerik.Reporting.UriReportSource)__ and a path to the TRDX|TRDP file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateUriReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateUriReportSourceSnippet}}

* __Use [XmlReportSource](/api/Telerik.Reporting.XmlReportSource)__ and read the plain XML of a TRDX file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateXmlReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateXmlReportSourceSnippet}}

* __Deserialize the XML report definition from a TRDX file__ : If working with CLR types and objects is your thing, you can deserialize the XML report definition and proceed following the basic concepts of the programming language and the.NET platform. For example you can create an InstanceReportSource and and set its ReportDocument property to the deserialized report object. See [Serialize Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) for more information.
* __Unpackaging the XML report definition from a TRDP file__ : If you need to obtain a Telerik Report instance in code from a TRDP file, you can unpackage the content in code. Then create an InstanceReportSource and set its ReportDocument property to the unpackaged report object. See [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) for more information.

The only thing left to do is assign the resulting report sources to the report viewer's ReportSource property.

## See Also

* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Reference Report Definitions in Applications]({%slug telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications%})
* [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})
* [Previewing a report definition that uses an external assembly]({%slug deploying-trdx-(xml-report-definition)-that-uses-external-assembly%})
