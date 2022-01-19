---
title: SearchInfo
page_title: SearchInfo | for Telerik Reporting Documentation
description: SearchInfo
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchinfo
tags: searchinfo
published: True
position: 9
---

# SearchInfo



The info object passed to the report engine to perform a search.       


    
          {
            "searchToken": "foo",
            "matchCase": false,
            "matchWholeWord": false,
            "useRegularExpressions": true
          }
        


>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`searchToken`|`String`|`true`|The text to be searched for.|
|`matchCase`|`boolean`|`true`|Determines if the search is case-sensitive.|
|`matchWholeWord`|`boolean`|`true`|Determines if the search will consider only words. Internally uses the following regular expression:`(?<=\W|^)(token)(?=\W|$).`|
|`useRegularExpressions`|`boolean`|`true`|Determines if the search should be performed using regular expressions to match the passed token.|

