---
title: Send Telerik Report in an E-Mail
description: Send Telerik Report in an E-Mail.
type: how-to
page_title: Send Telerik Report in an E-Mail
slug: send-telerik-report-in-an-e-mail
res_type: kb
---


> Note
> <br>
> Since [Progress® Telerik® Reporting R3 2018 (12.2.18.912)](../release-history/progress-telerik-reporting-r3-2018-12-2-18-912) release this feature is supported out of the box. For more information see the [Send Mail Message](../html5-report-viewer-send-mail) help article.
  
  
## Description  

Telerik Reports can be exported in various formats including HTML. The HTML rendering is used by web viewers as well. Browsers handle correctly the HTML and the passed CSS, but to use it in an e-mail the result HTML and CSS have to be adjusted based on the selected mail client.  
  

For more details, please check the following StackOverflow discussion - [How to design a cross-client / browser compatible email](http://stackoverflow.com/questions/1531630/how-to-design-a-cross-client-browser-compatible-email)  
  
  
## Solution  

The approach that we recommend is to export a report in a format like PDF. Then to attach the exported report to the e-mail, instead of placing the content as HTML. An example is available in the [Send Telerik Report as email attachment](https://www.telerik.com/support/code-library/send-telerik-report-as-email-attachment) code library post.  
   

In case using HTML is a requirement, you can [export a report programmatically](../programmatic-exporting-report) in [HTML5 or HTML5Interactive format](../configuring-rendering-extensions), and adjust the HTML/CSS to cover the requirements of the used e-mail client.



