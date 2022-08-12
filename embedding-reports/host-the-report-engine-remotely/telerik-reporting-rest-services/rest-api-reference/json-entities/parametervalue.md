---
title: ParameterValue
page_title: ParameterValue 
description: ParameterValue
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parametervalue
tags: parametervalue
published: True
position: 6
previous_url: /telerik-reporting-rest-json-entities-parametervalue
---
<style>
table th:first-of-type {
    width: 10%;
}
table th:nth-of-type(2) {
    width: 30%;
}
table th:nth-of-type(3) {
    width: 10%;
}
table th:nth-of-type(4) {
    width: 50%;
}
</style>

# ParameterValue

Represents a single value of the parameter available values.       

````JSON 
{
  ‘name’: ‘Sofia’,
  ‘value’: 1
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`name`|`String`|`true`|The name of the parameter name-value pair|
|`value`|`Array / Boolean / Date / Number / String`|`true`|The value of the parameter name-value pair|
