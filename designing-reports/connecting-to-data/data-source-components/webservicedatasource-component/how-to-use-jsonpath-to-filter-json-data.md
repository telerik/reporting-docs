---
title: How to Use JSONPath to filter JSON data
page_title: How to Use JSONPath to filter JSON data | for Telerik Reporting Documentation
description: How to Use JSONPath to filter JSON data
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data
tags: how,to,use,jsonpath,to,filter,json,data
published: True
position: 1
---

# How to Use JSONPath to filter JSON data



In this article we are going to discuss how to use JSONPath expressions in the Data Selector in order to query and filter JSON data returned from the web service.         For a complete overview of the JSONPath syntax please refer to           [JSONPath - XPath for JSON](http://goessner.net/articles/JsonPath/) .       

## Bind to Inner Objects

Very often the JSON data returned from a web service contains a single parent object which wraps child objects and/or arrays. If the           parent object is used directly the report would not display any detail records. Therefore it is more convenient to return an array of the child objects           or a particular nested array using a JSONPath expression.         

Example:         

	
````js
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



JSONPath: __$.store.book__ 

Result:         

	
````js
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



## Filter Arrays

In other scenarios it might be useful to filter the JSON data in order to display only objects matching specific criteria.         

Example:         

	
````js
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



JSONPath: __$.store.book[?(@.price<10)]__ 

Result:         

	
````js
[ 
  { 
    "category": "reference",
    "author": "Nigel Rees",
    "title": "Sayings of the Century",
    "price": 8.95
  }
]
````

