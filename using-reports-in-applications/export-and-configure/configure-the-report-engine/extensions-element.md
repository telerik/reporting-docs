---
title: extensions Element
page_title: extensions Element | for Telerik Reporting Documentation
description: extensions Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element
tags: extensions,element
published: True
position: 1
---

# extensions Element



Extensions XML element specifies a collection of extension types, for which configuration is applied.

## Attributes and Elements

__```<extensions>``` element__ 



|   |   |
| ------ | ------ |
Attributes|No attributes are defined for this element|
|Child elements| __render__ – specifies a collection of render extensions, for which the configuration settings 								are applied.|
|Parent element| __Telerik.Reporting__ - specifies the root element of the Telerik Reporting configuration settings. 								Only one 								Extensions element can be used in the Telerik.Reporting element|




__```<render>``` element__ 

Render XML element specifies a collection of extensions, for which configuration is applied.



|   |   |
| ------ | ------ |
Attributes|No attributes are defined for this element|
|Child elements| __extension__ – specifies an extension, for which the configuration settings are applied. 								Multiple Extension elements can be applied in the Render element|
|Parent element| __extensions__ - specifies a collection of extension types, for which configuration is applied. 								Only one Render element can be used in the Extensions element|




__```<extension>``` element__ 

Extension XML element specifies an extension, for which the configuration settings are applied.



|   |   |
| ------ | ------ |
Attributes| __name__ – required string attribute. Name is the key attribute that determines on which extension 									the configuration is to be applied. The name for every extension is defined in the class definition of the extension, 									in the ExtensionNameAttribute attribute. The list of all available extension names can be found in [Rendering Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})help article.<br/>*  __type__ – optional string attribute. It is used when new extension is added or a core<br/>										extension is overridden with a new one. Specifies the name of the extension class to be used when an extension<br/>										with the name specified in the __name__ attribute is needed. Use the following format:type=" *Fully qualified class name* , *assembly file name* , *version* , *culture* , *public key token* "For example : type="MyAssembly.MyExtension, MyAssembly, Version=1.0.0.0, Culture=neutral,PublicKeyToken=null"<br/>*  __description__ - optional string attribute. Defines a description for the extension.It is<br/>										used to override the default description of the extension. The reporting engine uses the description in places<br/>										where the extensions are listed. For example in the Win and Web ReportViewer controls descriptions are used as<br/>										labels in the dropdownwith available export formats. The default value of the description of every extension is<br/>										defined in the class definition of the extension, by the ExtansionDescriptionAttribute attribute.<br/>*  __visible__ – Optional boolean attribute(the valid values are visible=”true” or visible=”false”).<br/>										The value is used to determine if the extension must be populated in the lists of available extensions. The default<br/>										value is true. You can use it to hide the export format from the list of the available render extensions.<br/>*  __order__ – Optional integer attribute. <br/>										The value is used to order the extensions in the available extensions list. <br/>										You can use it to order the extensions in the viewers formats dropdown. <br/>										For example if you set the DOCX rendering extension an order value of 1, it will be listed first in the rendering extensions list. <br/>										If two extensions have the same order number, they are ordered by their description (ascending).<br/>										By default all extensions have order value of int.MaxValue.|
|Child elements| __parameters__ – specifies a collection of parameters for the extension in the extension element. 								Only one parameters element can be used in the extension element.|
|Parent element| __render__ - specifies a collection of extensions, for which the configuration is applied. Multiple 								Extension elements can be applied in the Render element|




__```<parameters>``` element__ 

Parameters XML element specifies a collection of parameters for the extension defined in the parent extension element.



|   |   |
| ------ | ------ |
Attributes|No attributes are defined for this element|
|Child elements| __parameter__ – specifies a parameter for the extension in the Extension element. Multiple Parameter 								elements can be used in the Parameters element.|
|Parent element|*  __extension__ - specifies an extension, for which the configuration is applied. Only one<br/>										Parameters element can be applied in the Extension element. The default value is true.<br/>										You can use it to hide the export format from the list of the available render extensions.<br/>*  __provider__ - specifies a cache provider to register for use in the application|




__```<parameter>``` element__ 

Parameter XML element specifies a parameter for the extension defined in the ancestor Extension element. The parameter is supplied           as name/value pairs. The list of all parameters available for each extension can be found in            [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}) section.         



|   |   |
| ------ | ------ |
Attributes|*  __name__ – the name of the parameter that is supplied. Required attribute.<br/>*  __value__ – the value of the parameter with the name specified. As the value can be only<br/>										a string, the parameter Type must have an associatedTypeConverter that handles conversions from string. Built-in<br/>										.NET value types and enums have type converters defined.|
|Child elements|No child elements are defined for this element.|
|Parent element| __parameters__ - specifies a collection of parameters for the extension defined in the parent 								extension element. Multiple parameter 								elements can be used in the parameters element|






## Example

XML-based configuration file:

	
````xml
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

	
````js
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

You can specify multiple instances of a single rendering extension to vary rendering behavior. If you configure multiple instances, 					make sure that each extension __name__  is unique. Then you can use the rendering extension programmatically by 					using the extension name to identify which particular instance to use for a particular rendering operation. 				

You should also specify the __description__  attribute of the Extension element. The string you specify for 					__description__  will be visible to users in the list of export options for the report. If you are configuring 					multiple versions of the same extension, be sure to provide a value for the __description__ . Otherwise, all 					versions of the extension will have the same export option name. 				

The following example illustrates how to use the default Image rendering extension (which produces TIFF output) alongside a second 					instance that outputs reports in EMF. Notice that the extension name distinguishes one instance from the other: 				

XML-based configuration file:

	
````xml
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

	
````js
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



>caution The code samples have the version listed as Version=x.x.x.x, and you should change that with the exact assembly version you 						use before proceeding. 					


## Set rendering parameters programmatically

To define device rendering parameters programmatically, we need a key/value pair, and what better than a 					 [HashTable](http://msdn.microsoft.com/en-us/library/system.collections.hashtable.aspx)  					which represents collection of key/value pairs. If the collection contains rendering parameters that are not supported by 					the specified rendering extension, they would be ignored. 				

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Add_Device_Settings_Snippet}}
````C#
	
	            Telerik.Reporting.Processing.ReportProcessor reportProcessor =
	                new Telerik.Reporting.Processing.ReportProcessor();
	
	            System.Collections.Hashtable deviceInfo =
	                new System.Collections.Hashtable();
	
	            deviceInfo.Add("DocumentAuthor", "John Doe");
	            deviceInfo.Add("DocumentTitle", "My Doc title");
	
	            Telerik.Reporting.TypeReportSource typeReportSource =
	                         new Telerik.Reporting.TypeReportSource();
	
	            // reportName is the Assembly Qualified Name of the report
	            typeReportSource.TypeName = reportName;
	
	            Telerik.Reporting.Processing.RenderingResult result =
	                reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo);
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Add_Device_Settings_Snippet}}
````VB
	
	        Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
	        Dim deviceInfo As New System.Collections.Hashtable()
	        deviceInfo.Add("DocumentAuthor", "John Doe")
	        deviceInfo.Add("DocumentTitle", "My Doc title")
	
	        Dim typeReportSource As New Telerik.Reporting.TypeReportSource()
	
	        ' reportName is the Assembly Qualified Name of the report
	        typeReportSource.TypeName = reportName
	
	        Dim result As Telerik.Reporting.Processing.RenderingResult = reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo)
	
````



# See Also

