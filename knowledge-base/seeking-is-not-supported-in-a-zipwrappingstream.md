---
title: Seeking is not supported in a System.IO.Packaging.ZipWrappingStream
description: "Learn why the 'Seeking is not supported in a System.IO.Packaging.ZipWrappingStream' error message occurs and how to resolve it in Telerik Reporting."
type: troubleshooting
page_title: Seeking is not supported in a System.IO.Packaging.ZipWrappingStream when Unpackaging Report
slug: seeking-is-not-supported-in-a-zipwrappingstream
position: 
tags: .NET Core, .NET
ticketid: 1608604
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

I am using the [ReportPackager](/api/telerik.reporting.reportpackager) class to [unpackage]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}#unpackaging) and modify my `TRDP` report in code, however, the errors listed below are thrown upon doing so.

## Steps to Reproduce

1. The project targets `.NET` or `.NET Core`.
1. The `Telerik.Reporting.dll` built for `.NET Framework` is referenced in the project.
1. A `TRDP` file is being unpackaged in code as shown in the [Packaging and Unpackaging Report Definitions]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) article.

## Error Message

````
Unhandled exception. System.NotSupportedException: Seeking is not supported in a System.IO.Packaging.ZipWrappingStream
	at Telerik.Reporting.Utils.StreamExtensions.ToArray(Stream input)
	at Telerik.Reporting.ReportSerialization.Current.ImageContainerHelper.ResolveValue(String image, IResourceHandler handler)
	at Telerik.Reporting.ReportSerialization.Current.ImageContainerHelper.GetDeserializedValue(IImageContainerSerializable source, IResourceHandler handler)
	at Telerik.Reporting.ReportSerialization.Current.PictureBoxSurrogate.GetDeserializedObject(PictureBoxSerializable surrogate, IResourceHandler handler)
	at Telerik.Reporting.ReportSerialization.SerializationSurrogate`2.Telerik.Reporting.Serialization.ISerializationSurrogate.GetDeserializedObject(Object o, IResourceHandler handler)
	at Telerik.Reporting.Serialization.SurrogateSelectorHierarchy.GetDeserializedObject(Object o, IResourceHandler handler)
	at Telerik.Reporting.Serialization.ObjectReader.ReadObject(Type type)
	at Telerik.Reporting.Serialization.ObjectReader.ReadXmlElement(String name)
	at Telerik.Reporting.Serialization.ObjectReader.ReadCollection(Object collection)
	at Telerik.Reporting.Serialization.ObjectReader.ReadProperties(Object obj)
	at Telerik.Reporting.Serialization.ObjectReader.ReadObject(Type type)
	at Telerik.Reporting.Serialization.ObjectReader.ReadXmlElement(String name)
	at Telerik.Reporting.Serialization.ObjectReader.ReadCollection(Object collection)
	at Telerik.Reporting.Serialization.ObjectReader.ReadProperties(Object obj)
	at Telerik.Reporting.Serialization.ObjectReader.ReadObject(Type type)
	at Telerik.Reporting.Serialization.ObjectReader.ReadXmlElement(String name)
	at Telerik.Reporting.Serialization.ObjectReader.ReadCollection(Object collection)
	at Telerik.Reporting.Serialization.ObjectReader.ReadProperties(Object obj)
	at Telerik.Reporting.Serialization.ObjectReader.ReadObject(Type type)
	at Telerik.Reporting.Serialization.ObjectReader.ReadXmlElement(String name)
	at Telerik.Reporting.XmlSerialization.XmlSerializerBase.Deserialize(Stream stream, IResourceHandler resourceHandler)
	at Telerik.Reporting.XmlSerialization.ReportXmlSerializer.Telerik.Reporting.ReportSerialization.IXmlSerializer.Deserialize(Stream stream, IResourceHandler resourceHandler)
	at Telerik.Reporting.ReportPackager.UnpackageDocument(Stream packageStream)
````

## Cause

The `.NET` or `.NET Core` project references the `Telerk.Reporting.dll` assembly built for `.NET Framework`. The [`ZipWrappingStream`](https://github.com/dotnet/corefx/blob/master/src/System.IO.Packaging/src/System/IO/Packaging/ZipWrappingStream.cs) is a class that does not exist in the full `.NET Framework`.

## Solution

Use the `Telerik.Reporting` NuGet package. The package manager will automatically determine which `Telerik.Reporting.dll` assembly to use in your project based on the target framework.

Alternatively, if assembly references must be used, use the `Telerik.Reporting.dll` located in the `Bin\netstandard2.0` subdirectory of where Telerik Reporting is installed. For example:

`C:\Program Files (x86)\Progress\Telerik Reporting {{suiteversion}}\Bin\netstandard2.0`

## See Also

* [Adding the Telerik Private NuGet Feed to VS]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%})
* [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
