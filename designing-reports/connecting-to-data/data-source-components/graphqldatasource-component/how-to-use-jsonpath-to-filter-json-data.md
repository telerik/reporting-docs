---
title: Using JSONPath
page_title: Using JSONPath to Filter JSON data
description: "JSONPath filters JSON data by allowing you to select specific elements based on conditions."
slug: graphqldatasource-filter-json-data
published: True
position: 1
reportingArea: General
---

# Using JSONPath to Filter JSON data

In this article, we discuss using JSONPath expressions in the Data Selector to query and filter JSON data returned from the GraphQL service. For a complete overview of the JSONPath filter syntax please refer to [JSONPath - XPath for JSON](https://goessner.net/articles/JsonPath/).

## Bind to Inner Objects

Very often the JSON data returned from a GraphQL service contains a single parent object that wraps child objects and/or arrays. If the parent object is used directly the report will not display any detail records. Therefore it is more convenient to return an array of the child objects or a particular nested array using a JSONPath expression.

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

## See Also

* [GraphQLDataSource Component Overview]({%slug graphqldatasource%})
* [GraphQLDataSource Wizard]({%slug desktop-graphqldatasource-wizard%})
* [Using Parameters with GraphQLDataSource]({%slug graphqldatasource-parameters%})