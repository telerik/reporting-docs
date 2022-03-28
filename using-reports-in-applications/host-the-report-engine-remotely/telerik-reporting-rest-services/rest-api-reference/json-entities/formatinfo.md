---
title: FormatInfo
page_title: FormatInfo 
description: FormatInfo
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatinfo
tags: formatinfo
published: True
position: 2
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

# FormatInfo

Format info object representing a document format that can be used for document creation. 

````JSON 
{
  "name":"PDF",
  "localizedName":"Acrobat (PDF) file"
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`name`|`String`|`true`|ID of the document format|
|`localizedName`|`String`|`true`|Display name for the document format|
