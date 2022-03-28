---
title: MailMessage
page_title: MailMessage 
description: MailMessage
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/mailmessage
tags: mailmessage
published: True
position: 8
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

# MailMessage

Mail message 

````JSON 
{
	'from': 'john.doe@mycompany.com',
	'to': 'jane.doe@mycompany.com',
	'cc': 'john.doe.jr@mycompany.com',
	'subject': 'my mail subject',
	'body': 'my mail body',
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`from`|`string`|`true`||
|`to`|`string`|`true`||
|`cc`|`string`|`false`||
|`subject`|`string`|`false`||
|`body`|`string`|`false`||
