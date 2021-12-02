---
title: cache Element
page_title: cache Element | for Telerik Reporting Documentation
description: cache Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/cache-element
tags: cache,element
published: True
position: 2
---

# cache Element



The Cache element specifies the configuration settings for the cache management system which is utilized by         the viewers to store and cache rendered pages and resources.       

## Attributes and Elements

__```<cache>``` element__ 



|   |   |
| ------ | ------ |
Attributes| __provider__ – required string attribute. Specifies the name of the current active cache provider used by the viewers. There are<br/>              several preconfigured providers, although additional ones can be registered in this part of the configuration section. The following<br/>              cache providers are available by default:<br/>*  __Auto__ - the actual provider is chosen automatically according to the characteristics of the stored resource and the<br/>                  permissions granted to the application;<br/>*  __Memory__ – specifies that the rendered pages and resources are stored in memory;<br/>*  __File__ – specifies that the rendered pages and resources are stored as temporary files in the file system;<br/>*  __IsolatedStorage__ – specifies that the rendered pages and resources are stored as temporary files in the isolated storage.|
|Child elements| __providers__ – specifies a collection of cache providers to register for use in the application. Only one Provider child<br/>              element can be used inside the Cache parent element.|
|Parent element| __Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only one Cache child element can be used inside<br/>              the Telerik.Reporting root element|




__```<Providers>``` element__ 

The Providers element specifies a collection of cache providers to register for use in the application.



|   |   |
| ------ | ------ |
Attributes|No attributes are defined for this element.|
|Child elements| __provider__ – specifies a cache provider to register for use in the application. Multiple Provider child elements can be used inside a single Providers parent element.|
|Parent element| __cache__ – specifies the configuration settings for the cache used by the viewers. Only one Provider child element can be used inside the Cache parent element|




__```<provider>``` element__ 

The Provider element specifies a cache provider to register for use in the application.



|   |   |
| ------ | ------ |
Attributes| __name__ – required string attribute. Specifies a unique name to identify the cache provider in<br/>              the configuration section. The active cache provider specified by the provider attribute of the Cache element should<br/>              match one of the names specified by this attribute.|
|Child elements| __parameters__ – specifies a collection of parameters for the current cache provider. Only one parameters child element can be<br/>              used in the provider parent element.|
|Parent element| __providers__ – specifies a collection of cache providers to register for use in the application. Multiple provider child<br/>              elements can be used inside a single providers parent element|




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



# See Also

