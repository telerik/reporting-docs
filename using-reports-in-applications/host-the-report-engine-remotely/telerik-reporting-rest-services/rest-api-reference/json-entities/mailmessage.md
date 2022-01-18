---
title: MailMessage
page_title: MailMessage | for Telerik Reporting Documentation
description: MailMessage
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/mailmessage
tags: mailmessage
published: True
position: 8
---

# MailMessage



Mail message        

    
          {
          'from': 'john.doe@mycompany.com',
          'to': 'jane.doe@mycompany.com',
          'cc': 'john.doe.jr@mycompany.com',
          'subject': 'my mail subject',
          'body': 'my mail body',
          }
        

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`from`|`string`|`true`||
|`to`|`string`|`true`||
|`cc`|`string`|`false`||
|`subject`|`string`|`false`||
|`body`|`string`|`false`||

