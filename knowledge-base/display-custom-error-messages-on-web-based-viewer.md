---
title: Display custom error messages on web-based viewer
description: This article elaborates on how to replace any error message output by the report with a custom error message.
type: how-to
page_title: Display custom error messages on web-based viewer
slug: display-custom-error-messages-on-web-based-viewer
position: 
tags: HTML5Viewer, Localization
ticketid: 1410107
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
	    <tr>
	    	<td>Report Viewer</td>
	    	<td>All web-based viewers</td>
	    </tr>
    </tbody>
</table>


## Description
How do I change the default error messages displayed by the HTML5-based Report Viewers with my custom ones? Example of such a message is the following:

```
Unable to get report parameters.
An error has occurred.
An error has occurred while resolving X data source: An error occurred while invoking data retrieval method.
```

## Solution
Messages displayed by the HTML5-based Report Viewers are separated into two "categories". While the string "Unable to get report parameters." is a client-side message, the rest of the message is server-side one.

To change the client side text, use the approach demonstrated in the [Localization](../html5-report-viewer-localization) article and change the corresponding value. However, this won't remove the server-side message. To change the entire message, use the following code snippet:

``` JavaScript
// Use this logic if you want to change the error message content. Based on the browser culture, you can change the text to different languages.
<script type="text/javascript">
    function onError(e, args) {
        if (args.indexOf("Unable to get report parameters.")) {
            $(".trv-pages-area .trv-error-pane .trv-error-message").html("Custom message here!")
        }
        ...
    }
</script>
```

