---
title: Serialize Report Definition in XML
page_title: Serialize Report Definition in XML 
description: Serialize Report Definition in XML
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml
tags: serialize,report,definition,in,xml
published: True
position: 7
previous_url: /programmatic-xml-serialization
---

# Serialize Report Definition in XML

__Telerik Reporting__ supports serialization/deserialization of the report definition as plain __XML__. This is useful in various different scenarios and opens many possibilities that are not easily accomplished otherwise. For example, this allows adding or modifying reports in your application without recompiling or redeploying it. Another typical scenario is saving/loading of dynamically generated report definitions or transferring them over the network. 

> In order to better handle report definition resources we also provide a [ReportPackager](/reporting/api/Telerik.Reporting.ReportPackager) that serializes the report definition in XML and packages it together with its resources in a file with zip compression. For more information see: [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}). 

## Class Report Definition

The __XML__ serialization/deserialization of report definitions is achieved through the dedicated [ReportXmlSerializer](/reporting/api/Telerik.Reporting.XmlSerialization.ReportXmlSerializer) class. To illustrate how a report is serialized and deserialized, let us start with a simple dynamically generated class report definition: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=ReportDefinitionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=ReportDefinitionSnippet}}

## Serialize to XML

The following sample code snipped demonstrates how to serialize the above report definition to an XML file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlWriterSerializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlWriterSerializationSnippet}}

## Deserialize from XML

The corresponding code that can be used to deserialize the report definition from the file is shown below:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlReaderDeserializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlReaderDeserializationSnippet}}

and the resulting XML file would look like this:

## XML Report Definition

{{source=CodeSnippets\CS\Report1.xml}}

