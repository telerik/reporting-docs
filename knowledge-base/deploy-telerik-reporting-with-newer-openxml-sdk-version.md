---
title: Deploy Telerik Reporting with newer OpenXML SDK version
description: How to use a newer OpenXML SDK version for your Telerik Reporting solution.
type: how-to
page_title: Use Telerik Reporting with newer OpenXML SDK version
slug: deploy-telerik-reporting-with-newer-openxml-sdk-version
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

In this article, we will explain how to deploy Telerik Reporting with a newer OpenXML SDK version.

## Solution 
 
Telerik Reporting OpenXML rendering extensions (XLSX, DOCX and PPTX) are build with [Open XML SDK 2.0 for Microsoft Office](https://learn.microsoft.com/en-us/previous-versions/office/developer/office-2010/bb456487(v=office.14)) (DocumentFormat.OpenXml.dll v.2.0.5022.0). 

Still, if needed, you can use *newer* Open XML SDK version. Add a binding redirect into your configuration file to point that you are using a newer version: 

````XML
<configuration>
	<runtime>
	<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
		<dependentAssembly>
		<assemblyIdentity name="DocumentFormat.OpenXml"
						publicKeyToken="31bf3856ad364e35"
						culture="neutral" />
		<bindingRedirect oldVersion="2.0.5022.0"
						newVersion="2.5.5631.0"/>
		</dependentAssembly>
	</assemblyBinding>
	</runtime>
...
````

In newer versions, the DocumentFormat.OpenXml assembly the **PublicKeyToken** is changed. Thus, if you are using DocumentFormat.OpenXml of version **2.7.2.0** or later, you have to reference **Telerik.Reporting.OpenXmlRendering.2.7.2.** or **Telerik.Reporting.OpenXmlRendering.3.0.1.**

For even newer versions add the required binding redirect as shown in the following example configuration for DocumentFormat.OpenXml 2.8.1.0: 

````XML
<configuration>
	<runtime>
	<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
		<dependentAssembly>
			<assemblyIdentity name="DocumentFormat.OpenXml" publicKeyToken="8fb06cb64d019a17" culture="neutral" />
			<bindingRedirect oldVersion="2.7.2.0" newVersion="2.8.1.0" />
		</dependentAssembly>
	</assemblyBinding>
	</runtime>
...
````

