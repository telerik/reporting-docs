---
title: Configuring the CSV Rendering Extension
description: Modifying the CSV Rendering Extension.
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

In Telerik Reporting, **device information settings** are used to pass rendering parameters to a rendering extension. You can specify device information settings in a variety of ways. You can use the &lt;Telerik.Reporting&gt; configuration section to specify the rendering parameters globally. Programmatically, you can use the [ReportProcessor.RenderReport()](../m-telerik-reporting-processing-reportprocessor-renderreport) method. For more information about specifying rendering parameters globally, see [Configuring Telerik Reporting](../configuring-telerik-reporting).  
   
## Solution
   
 The example below shows a sample application [configuration file](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/) (App.config or Web.config depending on whether it is a desktop or a web application) in which we modify the original CSV rendering extension settings to generate a CSV file without the header row (**NoHeader = True**) and all TextBox items that contain **static text** (not an expression) skipped (**NoStaticText = True**):  
   
 ```XML
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
 ```
   
- If the report exported with default settings looked like this:  
   
```csv
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
```
   
- With the given device information settings, the result will be:  
   
```csv
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
```

> JSON-based configuration files can also be configured, see [extensions Element](../configuring-telerik-reporting-extensions).

## See Also  
 
- [Configuring Telerik Reporting](../configuring-telerik-reporting)

- [Device Information Settings](../device-information-settings)

- [Configuration Files](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/)
