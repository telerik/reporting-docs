---
title: cache Element
page_title: cache Element 
description: cache Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/cache-element
tags: cache,element
published: True
position: 2
---
<style>
table th:first-of-type {
    width: 10%;
}
table th:nth-of-type(2) {
    width: 90%;
}
</style>

# cache Element

The Cache element specifies the configuration settings for the cache management system which is utilized by the viewers to store and cache rendered pages and resources. 

## Attributes and Elements

__`<cache>` element__ 

|   |   |
| ------ | ------ |
|Attributes|__provider__ – required string attribute. Specifies the name of the current active cache provider used by the viewers. There are several preconfigured providers, although additional ones can be registered in this part of the configuration section. The following cache providers are available by default:<ul><li>__Auto__ - the actual provider is chosen automatically according to the characteristics of the stored resource and the permissions granted to the application;</li><li>__Memory__ – specifies that the rendered pages and resources are stored in memory;</li><li>__File__ – specifies that the rendered pages and resources are stored as temporary files in the file system;</li><li>__IsolatedStorage__ – specifies that the rendered pages and resources are stored as temporary files in the isolated storage.</li></ul>|
|Child elements|__providers__ – specifies a collection of cache providers to register for use in the application. Only one Provider child element can be used inside the Cache parent element.|
|Parent element|__Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only one Cache child element can be used inside the Telerik.Reporting root element.|

__`<providers>` element__ 

The Providers element specifies a collection of cache providers to register for use in the application.

|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element.|
|Child elements|__provider__ – specifies a cache provider to register for use in the application. Multiple Provider child elements can be used inside a single Providers parent element.|
|Parent element|__cache__ – specifies the configuration settings for the cache used by the viewers. Only one Provider child element can be used inside the Cache parent element.|

__`<provider>` element__ 

The Provider element specifies a cache provider to register for use in the application.

|   |   |
| ------ | ------ |
|Attributes|__name__ – required string attribute. Specifies a unique name to identify the cache provider in the configuration section. The active cache provider specified by the provider attribute of the Cache element should match one of the names specified by this attribute.|
|Child elements|__parameters__ – specifies a collection of parameters for the current cache provider. Only one parameters child element can be used in the provider parent element.|
|Parent element|__providers__ – specifies a collection of cache providers to register for use in the application. Multiple provider child elements can be used inside a single providers parent element.|

## Example

XML-based configuration file:
    
````xml
<configuration>
    …
    <Telerik.Reporting>
        <cache provider="File">
            <providers>
                <provider name="File">
                    <parameters>
                        <parameter name="BasePath" value="C:\MyDataCache" />
                    </parameters>
                </provider>
            </providers>
        </cache>
    </Telerik.Reporting>
    …
</configuration>
````

JSON-based configuration file:
    
````js
"telerikReporting": {
	"cache": {
		"provider": "File",
		"providers": [
			{
				"name": "File",
				"parameters": [
					{
						"name": "BasePath",
						"value": "c:\\MyDataCache"
					}
				]
			}
		]
	}
}
````

