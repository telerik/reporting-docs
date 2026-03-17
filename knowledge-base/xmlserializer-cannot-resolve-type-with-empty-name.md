---
title: SerializerException - The XML Serializer Cannot Resolve Type with Empty Name During TRDX Deserialization
page_title: ReportXmlSerializer Throws "Cannot Resolve Type with Name" When Deserializing a TRDX Report
description: "Learn how to fix the Telerik.Reporting.Serialization.SerializerException that occurs when deserializing a TRDX report with a custom XmlReader that does not have IgnoreWhitespace enabled."
slug: xmlserializer-cannot-resolve-type-with-empty-name
tags: serialization, deserialization, trdx, xmlreader, xmlreadersettings, ignorewhitespace, serializerexception
published: True
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

When deserializing a TRDX report definition using `ReportXmlSerializer.Deserialize(XmlReader)` with a custom `XmlReader`, the following exception is thrown:

```
Telerik.Reporting.Serialization.SerializerException
Message=An error has occurred during serialization. The xml serializer cannot resolve type with name:
```

Note that the type name in the error message is blank — the serializer fails to resolve a type, but no type name is printed.

## Cause

The issue occurs when the `XmlReader` passed to `ReportXmlSerializer.Deserialize` is created without setting `IgnoreWhitespace = true` in the `XmlReaderSettings`.

Without this setting, the `XmlReader` returns whitespace-only text nodes between XML elements. The report serializer interprets these whitespace nodes as elements with an empty name and attempts to resolve a type from that empty string, which fails with the exception shown above.

When `ReportXmlSerializer` creates its own `XmlReader` internally (e.g. when deserializing from a `Stream`, `TextReader`, or file path), it automatically configures `IgnoreWhitespace = true`. However, when a pre-created `XmlReader` is passed directly, the serializer uses it as-is and relies on the caller to configure it correctly.

## Solution

Set `IgnoreWhitespace = true` in the `XmlReaderSettings` before creating the `XmlReader`:

```C#
System.Xml.XmlReaderSettings settings = new System.Xml.XmlReaderSettings();
settings.IgnoreWhitespace = true;

using (System.Xml.XmlReader xmlReader = System.Xml.XmlReader.Create("MyReport.trdx", settings))
{
    Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
        new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

    Telerik.Reporting.Report report = (Telerik.Reporting.Report)
        xmlSerializer.Deserialize(xmlReader);
}
```

Alternatively, use one of the `ReportXmlSerializer` overloads that accepts a `Stream`, `TextReader`, or file path directly, as these handle the `XmlReaderSettings` internally:

```C#
Telerik.Reporting.XmlSerialization.ReportXmlSerializer xmlSerializer =
    new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();

// Deserialize directly from a file path - no XmlReaderSettings needed
Telerik.Reporting.Report report = (Telerik.Reporting.Report)
    xmlSerializer.Deserialize("MyReport.trdx");
```

## See Also

- [Serialize Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%})
- [ReportXmlSerializer API Reference](/api/telerik.reporting.xmlserialization.reportxmlserializer)
