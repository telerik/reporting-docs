---
title: cacheDefinitionProperties
page_title: cacheDefinitionProperties | for Telerik Reporting Documentation
description: cacheDefinitionProperties
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/cachedefinitionproperties
tags: cachedefinitionproperties
published: True
position: 3
---

# cacheDefinitionProperties



We provide a mechanism for caching the report definition properties that boosts the performance. Naturally it prevents modifying the report during processing stage.       The default value of the property is True.     

## General Information

Basically, the [Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}) are not intended to be used to modify the report definition, as explained in the [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) article.           For that reason, in R3 2016 for performance reasons, we introduced a change- cacheDefinitionProperties which caches the report definition properties, so such modifications are not respected.           Setting the cacheDefinitionProperties to false will skip the definition item properties caching, which will allow the report definition to be changed in the report events. This may result in parformance penalty though.           

## Example

Changing the the value of the cacheDefinitionProperties can be done in the application's configuration file:       

XML-based configuration file:

	
````xml
	      <Telerik.Reporting>
            <processing cacheDefinitionProperties="false" />
        </Telerik.Reporting>
````



JSON-based configuration file:

	
````js
  "telerikReporting": {
      "processing": [
        {
          "cacheDefinitionProperties": "false"
        }
      ]
    }
  }
````

