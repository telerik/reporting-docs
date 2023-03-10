---
title: MailMessage
page_title: MailMessage JSON Entity at a Glance
description: "Learn more about the MailMessage JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/mailmessage
tags: mailmessage
published: True
position: 8
previous_url: /telerik-reporting-rest-json-entities-mailmessage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/mailmessage
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

# MailMessage Overview

Mail message

````JSON
{
	"from": "john.doe@mycompany.com",
	"to": "jane.doe@mycompany.com",
	"cc": "john.doe.jr@mycompany.com",
	"subject": "my mail subject",
	"body": "my mail body",
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`from`|`string`|`true`| Email sender |
|`to`|`string`|`true`| Email primary recipient |
|`cc`|`string`|`false`| The additional (CC) email recipients |
|`subject`|`string`|`false`| The subject of the email |
|`body`|`string`|`false`| The content of the email |
