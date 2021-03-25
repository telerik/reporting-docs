---
title: How to Hide the Option for Adding a New SQL Connection in the SQL DataSource Wizard in Web Report Desgner
description: Explains how to hide the option for adding a new SQL connection in the Web Report Desginer
type: how-to
page_title: Hide the Option for Adding a New SQL Connection in the Web Report Desgner
slug: how-to-hide-the-option-for-adding-a-new-sql-connection-in-sql-datasource-wizard-in-web-report-desgner
position: 
tags: WebReportDesigner, SQL DataSource
ticketid: 1511406
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
This article demonstrates how to hide the option for adding a new SQL connection in the SQL DataSource Wizard in the Web Report Designer.


## Suggested Workarounds
Currently, such functionality can be achieved through a workaround. You can add some extra JS and Jquery code that hides the option to create a new SQL connection. 
It does not hide the step entirely, but the only option showing is to use existing SQL Connections:

```JavaScript
<script type="text/javascript">
    // JS function to set click-listener on the SQL-data-source button
    function setSqlDsListener() {
        // selecting the div for the SQL DataSource button and adding a listener
        $('div[component-name="SqlDataSource"]').click(function () {
            // timeout to wait for the wizard to load in
            setTimeout(function () {
                // Selects the radio button within the New Sql Connection DIV
                // The Radio button is selected as it has a unique ID to it, the div does not
                var radio = $('#newSQLConnection');
                // Selects the div tag that contains the radio button
                var el = radio.closest('div[class^="editor__content"]');
                el.attr("style", "display:none");
                // Recalls itself because the click-listener gets removed after the wizards opens
                setSqlDsListener();
            }, 200)
        })
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#webReportDesigner").telerik_WebReportDesigner({
            toolboxArea: {
                layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
            },
            serviceUrl: "api/reportdesigner/",
            report: "Product Catalog.trdp"
        }).data("telerik_WebDesigner");
      // 500 ms timeout to wait for the designer to load in
    setTimeout(function () {
        // selecting the Components tab and adding a click listener
        $('span[class^="k-link"]').click(function () {
            // a timeout to wait for the components tab to load in
            setTimeout(function () {
                //Calls the function to set the click listener for SQL DataSource
                setSqlDsListener();
            }, 400)
        })
    }, 500)
    });
 </script>
```

Note that experienced users can look through the raw HTML and find the hidden DIV tag. But until the Web Designer gets the added features of customizing the UI, this is the closest solution.
