---
title: Configuring the CSV Rendering Extension
description: "Learn how to modify the CSV rendering extension device settings via the configuration file of the application."
type: how-to
page_title: Setting the CSV Rendering Extension Device Info Settings
slug: configuring-the-csv-rendering-extension
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>CSV</td>
	</tr>
</table>

## Description 

By default, the **CSV rendering extension** generates plain text files, without any formatting, and the first row contains the headers for all columns. You may choose whether to have this header row or not.   

In Telerik Reporting, **device information settings** are used to pass rendering parameters to a rendering extension. You can specify device information settings in a variety of ways. You can use the `Telerik.Reporting` configuration section to specify the rendering parameters globally. Programmatically, you can use the [ReportProcessor.RenderReport()](/api/telerik.reporting.processing.reportprocessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method. 

For more information about specifying rendering parameters globally, see [Configuring Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}).  
   
## Solution
   
 The example below shows a sample application [configuration file](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/) (`App.config`/`Web.config`/`appsettings.json`) in which we modify the original CSV rendering extension settings to generate a CSV file without the header row (`NoHeader = True`) and all TextBox items that contain **static text** (not an expression) skipped (`NoStaticText = True`):  
   
 ````XML
 <?xml version="1.0"?> 
<configuration> 
  <!-- The configSectins element should be the first child element of configuration --> 
  <configSections> 
   <!-- Substitute Version=X.X.X.X with the assembly version you are using! --> 
   <section 
      name="Telerik.Reporting" 
      type="Telerik.Reporting.Processing.Config.ReportingConfigurationSection, Telerik.Reporting, Version=X.X.X.X, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
      allowLocation="true" 
      allowDefinition="Everywhere"/> 
  </configSections> 
       
  <Telerik.Reporting> 
    <Extensions> 
      <Render> 
        <Extension name="CSV"> 
          <Parameters> 
            <Parameter name="NoHeader" value="true"/> 
            <Parameter name="NoStaticText" value="true"/>
          </Parameters> 
        </Extension> 
      </Render> 
    </Extensions> 
  </Telerik.Reporting> 
</configuration> 
````
````JSON
{
  "telerikReporting": {
    "extensions": [
      {
        "name": "CSV",
        "parameters": [
          {
            "Name": "NoHeader",
            "Value": true
          },
          {
            "Name": "NoStaticText",
            "Value": true
          }

        ]
      }
    ],
}
````


If the report exported with default settings looked like this:  
   
````CSV
addressIDCaptionTextBox1,cityCaptionTextBox1,postalCodeCaptionTextBox1,textBox1,cityDataTextBox,postalCodeDataTextBox  
AddressID,City,PostalCode,20,Bothell,98011  
AddressID,City,PostalCode,21,Bothell,98011  
AddressID,City,PostalCode,22,Portland,97205  
AddressID,City,PostalCode,23,Seattle,98104  
AddressID,City,PostalCode,24,Duluth,55802  
AddressID,City,PostalCode,25,Dallas,75201  
AddressID,City,PostalCode,26,San Francisco,94109  
AddressID,City,PostalCode,27,Nevada,84407  
AddressID,City,PostalCode,28,Phoenix,85004  
AddressID,City,PostalCode,29,Memphis,38103  
AddressID,City,PostalCode,30,Orlando,32804  
AddressID,City,PostalCode,31,Ottawa,K4B 1T7  
AddressID,City,PostalCode,32,Montreal,H1Y 2H5  
````

With the given device information settings, the result will be:  
   
````CSV
20,Bothell,98011  
21,Bothell,98011  
22,Portland,97205  
23,Seattle,98104  
24,Duluth,55802  
25,Dallas,75201  
26,San Francisco,94109  
27,Nevada,84407  
28,Phoenix,85004  
29,Memphis,38103  
30,Orlando,32804  
31,Ottawa,K4B 1T7  
32,Montreal,H1Y 2H5  
````

## See Also  
* [Configuring Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Configuration Files](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/)
