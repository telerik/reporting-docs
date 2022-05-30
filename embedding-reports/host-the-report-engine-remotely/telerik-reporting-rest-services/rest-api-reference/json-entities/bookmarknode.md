---
title: BookmarkNode
page_title: BookmarkNode 
description: BookmarkNode
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/bookmarknode
tags: bookmarknode
published: True
position: 0
---
<style>
table th:first-of-type {
    width: 10%;
}
table th:nth-of-type(2) {
    width: 10%;
}
table th:nth-of-type(3) {
    width: 10%;
}
table th:nth-of-type(4) {
    width: 70%;
}
</style>

# BookmarkNode

Bookmark node representing a node in a document map.       

````JSON 
{
  ‘id’: ‘Bikes’,
  ‘text’: ‘Bikes’,
  ‘page’: 3,
  ‘items’: [{ ‘id’: ‘Bikes’, ‘text’: ‘Bikes’, ‘page’: 3 }]
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`id`|`String`|`true`|ID of the node|
|`text`|`String`|`false`|The text to be displayed|
|`page`|`Number`|`true`|An integer representing the number of the target page|
|`items`|`Array`|`false`|An array of String elements representing the IDs of the child bookmark nodes in the document map|
