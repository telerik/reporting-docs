---
title: Serialize Report Definition
page_title: Serializing and Deserializing Report Definitions Explained
description: "Learn how to serialize and deserialize a Telerik Reporting report definition to and from XML, using the ReportXmlSerializer class."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml
tags: serialize, deserialize, report, definition, xml, ReportXmlSerializer, json, trdx, trdj
published: True
position: 7
previous_url: /programmatic-xml-serialization
reportingArea: General
components: [general]
---

# Serializing and Deserializing Report Definitions

__Telerik Reporting__ supports serialization/deserialization of the report definition as plain __XML__ or __JSON__. The `TRDX`, `TRDJ`, and `TRDP` files are declarative report definitions:

* `TRDX` is a self-contained XML report definition. All embedded images are serialized in the XML file.
* `TRDJ` is a self-contained JSON report definition. All embedded images are serialized in the JSON file.
* `TRDP` is a ZIP archive containing the report definition as XML by default, but it can hold it as JSON too. It may also contain resources like image and localization files packed in the archive.

The report serialization/deserialization is useful in various scenarios and opens many possibilities that are not easily accomplished otherwise. For example, this allows adding or modifying reports in your application without recompiling or redeploying it. Another typical scenario is saving/loading dynamically generated report definitions or transferring them over the network.

> To better handle report definition resources, we also provide a [ReportPackager](/api/Telerik.Reporting.ReportPackager) that serializes the report definition in XML or JSON and packages it together with its resources in a file with zip compression. For more information, see [Package Report Definition](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition).

## Class Report Definition

The __XML__ serialization/deserialization of report definitions is achieved through the dedicated [ReportXmlSerializer](/api/Telerik.Reporting.XmlSerialization.ReportXmlSerializer) class.

The __JSON__ serialization/deserialization of report definitions is achieved through the dedicated [ReportJsonSerializer](/api/Telerik.Reporting.JsonSerialization.ReportJsonSerializer) class.

To illustrate how a report is serialized and deserialized, let us start with a simple dynamically generated class report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=ReportDefinitionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=ReportDefinitionSnippet}}

>note **Report1** is a derivative of the basic [Report class](/api/telerik.reporting.report). A similar implementation can be found in the installation folder of the Telerik Reporting product, usually located at the following path: _Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\ReportLibrary_. You can refer to the **ProductCatalog** implementation. However, the code is valid for the basic **Report** implementation as well. It will contain a more simplified design with just the text boxes added to the report.

## Serialize to XML

The following sample code snippet demonstrates how to serialize the above report definition to an XML file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlWriterSerializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlWriterSerializationSnippet}}

## Deserialize from XML

The corresponding code that can be used to deserialize the report definition from the file is shown below:

{{source=CodeSnippets\CS\API\Telerik\Reporting\XmlSerializationSnippets.cs region=XmlReaderDeserializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\XmlSerializationSnippets.vb region=XmlReaderDeserializationSnippet}}

and the resulting XML file would look like this:

## XML Report Definition

{{source=CodeSnippets\CS\Report1.xml}}

## Serialize to JSON

>note Serializing and deserializing JSON report definitions requires the 'Telerik.Reporting.JsonSerialization' assembly, which is not part of the 'Telerik.Reporting' assembly. To do this, install the 'Telerik.Reporting.JsonSerialization' NuGet package (or add a reference to 'Telerik.Reporting.JsonSerialization.dll') and make sure it is deployed next to 'Telerik.Reporting.dll'.

The following sample code snippet demonstrates how to serialize the above report definition to a JSON file:

{{source=CodeSnippets\CS\API\Telerik\Reporting\JsonSerializationSnippets.cs region=StreamSerializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\JsonSerializationSnippets.vb region=StreamSerializationSnippet}}

## Deserialize from JSON

The corresponding code that can be used to deserialize the report definition from the file is shown below:

{{source=CodeSnippets\CS\API\Telerik\Reporting\JsonSerializationSnippets.cs region=StreamDeserializationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\JsonSerializationSnippets.vb region=StreamDeserializationSnippet}}

## JSON Report Definition

The resulting JSON file would look like this, if unminified:

{{source=CodeSnippets\CS\Report1.json}}
