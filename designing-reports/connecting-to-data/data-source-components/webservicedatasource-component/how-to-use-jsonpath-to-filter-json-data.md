---
title: Using JSONPath
page_title: Using JSONPath to Filter JSON data
description: "JSONPath filters JSON data by allowing you to select specific elements based on conditions."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data
tags: how,use,jsonpath,to,filter,json,data,web,service,source
published: True
position: 1
previous_url: /how-to-use-jsonpath
---

# Using JSONPath to Filter JSON data

In this article, we discuss using JSONPath expressions in the Data Selector to query and filter JSON data returned from the web service. For a complete overview of the JSONPath filter syntax please refer to [JSONPath - XPath for JSON](https://goessner.net/articles/JsonPath/).

## Bind to Inner Objects

Very often the JSON data returned from a web service contains a single parent object that wraps child objects and/or arrays. If the parent object is used directly the report will not display any detail records. Therefore it is more convenient to return an array of the child objects or a particular nested array using a JSONPath expression.

>caption Example

````JSON
{
	"store": {
		"book": [
			{
				"category": "reference",
				"author": "Nigel Rees",
				"title": "Sayings of the Century",
				"price": 8.95
			},
			{
				"category": "fiction",
				"author": "Evelyn Waugh",
				"title": "Sword of Honour",
				"price": 12.99
			}
		]
	}
}
````

>caption JSONPath

`$.store.book`

>caption Result

````JSON
[
	{
		"category": "reference",
		"author": "Nigel Rees",
		"title": "Sayings of the Century",
		"price": 8.95
	},
	{
		"category": "fiction",
		"author": "Evelyn Waugh",
		"title": "Sword of Honour",
		"price": 12.99
	}
]
````

## JSONPath Filter Arrays

In other scenarios, it might be useful to filter the JSON data to display only objects matching specific criteria.

>caption Example

````JSON
{
	"store": {
		"book": [
			{
				"category": "reference",
				"author": "Nigel Rees",
				"title": "Sayings of the Century",
				"price": 8.95
			},
			{
				"category": "fiction",
				"author": "Evelyn Waugh",
				"title": "Sword of Honour",
				"price": 12.99
			}
		]
	}
}
````

>caption JSONPath

`$.store.book[?(@.price<10)]`

>caption Result

````JSON
[
	{
		"category": "reference",
		"author": "Nigel Rees",
		"title": "Sayings of the Century",
		"price": 8.95
	}
]
````

>tip When testing for equality in JSONPath filter, use `==` for equality and `!=` for inequality.
