---
title: extensions Element
page_title: extensions Element Configuration 
description: "Learn how to configure the device info settings for all report rendering formats through the extensions configuration element."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element
tags: extensions,element
published: True
position: 1
previous_url: /configuring-telerik-reporting-extensions
reportingArea: General
---
<style>
table th:first-of-type {
    width: 10%;
}
table th:nth-of-type(2) {
    width: 90%;
}
</style>

# extensions Element Overview

Extensions XML element specifies a collection of extension types, for which configuration is applied.

## Attributes and Elements

__`<extensions>` element__ 

|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element|
|Child elements|__render__ – specifies a collection of render extensions, for which the configuration settings are applied.|
|Parent element|__Telerik.Reporting__ - specifies the root element of the Telerik Reporting configuration settings. Only one Extensions element can be used in the Telerik.Reporting element.|

__`<render>` element__ 

Render XML element specifies a collection of extensions, for which configuration is applied.

|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element|
|Child elements|__extension__ – specifies an extension, for which the configuration settings are applied. Multiple Extension elements can be applied in the Render element|
|Parent element|__extensions__ - specifies a collection of extension types, for which configuration is applied. Only one Render element can be used in the Extensions element.|

__`<extension>` element__ 

Extension XML element specifies an extension, for which the configuration settings are applied.

|   |   |
| ------ | ------ |
|Attributes| __name__ – required string attribute. Name is the key attribute that determines on which extension the configuration is to be applied. The name for every extension is defined in the class definition of the extension, in the ExtensionNameAttribute attribute. The list of all available extension names can be found in [Rendering Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) help article.<ul><li>__type__ – optional string attribute. It is used when new extension is added or a core<br/> extension is overridden with a new one. Specifies the name of the extension class to be used when an extension<br/> with the name specified in the __name__ attribute is needed. Use the following format:<br/>`type="*Fully qualified class name*, *assembly file name*, *version*, *culture*, *public key token*"`<br/>For example: `type="MyAssembly.MyExtension, MyAssembly, Version=1.0.0.0, Culture=neutral,PublicKeyToken=null"`</li><li>__description__ - optional string attribute. Defines a description for the extension.It is<br/> used to override the default description of the extension. The reporting engine uses the description in places<br/> where the extensions are listed. For example in the Win and Web ReportViewer controls descriptions are used as<br/> labels in the dropdownwith available export formats. The default value of the description of every extension is<br/> defined in the class definition of the extension, by the ExtansionDescriptionAttribute attribute.</li><li>__visible__ – Optional boolean attribute(the valid values are `visible="true"` or `visible="false"`).<br/> The value is used to determine if the extension must be populated in the lists of available extensions. The default<br/> value is true. You can use it to hide the export format from the list of the available render extensions.</li><li>__order__ – Optional integer attribute. The value is used to order the extensions in the available extensions list. You can use it to order the extensions in the viewers formats dropdown. For example if you set the DOCX rendering extension an order value of `1`, it will be listed first in the rendering extensions list. If two extensions have the same order number, they are ordered by their description (ascending).By default all extensions have order value of `int.MaxValue`.</li></ul>|
|Child elements| __parameters__ – specifies a collection of parameters for the extension in the extension element. Only one parameters element can be used in the extension element.|
|Parent element| __render__ - specifies a collection of extensions, for which the configuration is applied. Multiple Extension elements can be applied in the Render element.|

__`<parameters>` element__ 

Parameters XML element specifies a collection of parameters for the extension defined in the parent extension element.

|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element|
|Child elements|__parameter__ – specifies a parameter for the extension in the Extension element. Multiple Parameter elements can be used in the Parameters element.|
|Parent element|<ul><li>__extension__ - specifies an extension, for which the configuration is applied. Only one Parameters element can be applied in the Extension element. The default value is true. You can use it to hide the export format from the list of the available render extensions.</li><li>__provider__ - specifies a cache provider to register for use in the application.</li></ul>|

__`<parameter>` element__ 

Parameter XML element specifies a parameter for the extension defined in the ancestor Extension element. The parameter is supplied as name/value pairs. The list of all parameters available for each extension can be found in [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}) section. 

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__name__ – the name of the parameter that is supplied. Required attribute.</li><li>__value__ – the value of the parameter with the name specified. As the value can be only a _string_, the parameter Type must have an _associatedTypeConverter_ that handles conversions from _string_. Built-in .NET value types and enums have type converters defined.</li></ul>|
|Child elements|No child elements are defined for this element.|
|Parent element|__parameters__ - specifies a collection of parameters for the extension defined in the parent extension element. Multiple parameter elements can be used in the parameters element.|

## Example

XML-based configuration file:
    
````XML
<configuration>
    …
    <Telerik.Reporting>
        <extensions>
            <render>
                <extension name="PDF" description="PDF Description">
                    <parameters>
                        <parameter name="DocumentAuthor" value="John Doe"/>
                    </parameters>
                </extension>
            </render>
        </extensions>
    </Telerik.Reporting>
    …
</configuration>
````

JSON-based configuration file:
    
````JSON
"telerikReporting": {
	"extensions": [
		{
			"name": "PDF",
			"description":  "PDF Description",
			"parameters": [
				{
					"Name": "DocumentAuthor",
					"Value": "John Doe"
				}
			]
		}
	]
}
````

## Configuring Multiple Entries for a Rendering Extension

You can specify multiple instances of a single rendering extension to vary rendering behavior. If you configure multiple instances, make sure that each extension `name` is unique. Then, you can edit the rendering extension programmatically by using the extension name to identify which particular instance to use for a particular rendering operation. 

You should also specify the `description` attribute of the Extension element. The string you specify for `description` will be visible to users in the list of export options for the report. If you are configuring multiple versions of the same extension, be sure to provide a value for the `description`. Otherwise, all versions of the extension will have the same export option name. 

The following example illustrates how to use the default Image rendering extension (which produces `TIFF` output) alongside a second instance that outputs reports in `EMF`. Notice that the extension name distinguishes one instance from the other: 

XML-based configuration file:
    
````XML
<Telerik.Reporting>
    <extensions>
        <render>
            <extension name="TIFF_CCITT4"
                                 type="Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
                                 description="TIFF file (CCITT Group 4)">
                <parameters>
                    <parameter name="TiffCompression" value="ccitt4" />
                </parameters>
            </extension>
        </render>
    </extensions>
</Telerik.Reporting>
````

JSON-based configuration file:
    
````JSON
"telerikReporting": {
	"extensions": [
		{
			"name": "TIFF_CCITT4",
			"type": "Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
			"description":  "TIFF file (CCITT Group 4)",
			"parameters": [
				{
					"Name": "TiffCompression",
					"Value": "ccitt4"
				}
			]
		}
	]
}
````

> The code samples have the version listed as Version=x.x.x.x, and you should change that with the exact assembly version you use before proceeding. 

## Set rendering parameters programmatically

To define device rendering parameters programmatically, we need a key/value pair, and what better than a [HashTable](https://learn.microsoft.com/en-us/dotnet/api/system.collections.hashtable) which represents collection of key/value pairs. If the collection contains rendering parameters that are not supported by the specified rendering extension, they would be ignored. 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Add_Device_Settings_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Add_Device_Settings_Snippet}}

