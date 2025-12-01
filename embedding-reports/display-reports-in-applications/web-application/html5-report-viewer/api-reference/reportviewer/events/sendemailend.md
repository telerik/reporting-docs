---
title: sendEmailEnd
page_title: sendEmailEnd event
description: "Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend
published: True
reportingArea: HTML5
---

# sendEmailEnd

Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL)).

