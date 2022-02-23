---
title: DocumentInfo
page_title: DocumentInfo 
description: DocumentInfo
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo
tags: documentinfo
published: True
position: 1
---

# DocumentInfo



Document info indicating the status of the document resource.       


    
          {
            ‘documentReady’: true,
            ‘pageCount’: 10,
            ‘documentMapAvailable’: false,
            ‘BookmarkNodes’: [
                {
                  ‘id’: ‘Bikes’,
                  ‘text’: ‘Bikes’,
                  ‘page’: 3,
                  ‘items’: [
                    {
                      ‘id’: ‘Bikes’,
                      ‘text’: ‘Bikes’,
                      ‘page’: 3,
                    }
               ]
                },
                {
                  ‘id’: ‘Bikes’,
                  ‘text’: ‘Bikes’,
                  ‘page’: 3,
                },
           ],
          }

        


>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`documentReady`|`Boolean`|`true`|Indicates whether the document processing is done|
|`pageCount`|`Number`|`true`|An integer representing the count of the physical pages that are currently available|
|`documentMapAvailable`|`Boolean`|`false`|Indicates whether document map is available to be displayed|
|`bookmarkNodes`|`Array`|`false`|An array of[BookmarkNode]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/bookmarknode%})objects supporting the document map and the NavigateToBookmark interactive action|

