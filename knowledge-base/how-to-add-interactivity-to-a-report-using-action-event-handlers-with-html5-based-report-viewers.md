---
title: How to add interactivity to a report using action event handlers in HTML5-based report viewers.
description: Implementing interactivity in the report through action event handlers in HTML5-based report viewers.
type: how-to
page_title: Using action event handlers in HTML5-based report viewers to implement interactivity in the report.
slug: how-to-add-interactivity-to-a-report-using-action-event-handlers-with-html5-based-report-viewers
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
		<tbody>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 Report Viewers</td>
		</tr>
	</tbody>
</table>

## Desciption

The report viewers provide handlers for three types of events that are associated with interactive actions – **Executing**, **Enter** and **Leave**. In this article, we will show how to use these events to add more interactivity and allow further customization for your reports. We will use the demo projects that are shipped with your Telerik Reporting installation and is part of the CSharp.ReportExamples.VSxxxx  solution that can be found in %PROGRAMFILES(X86)%\ Telerik\Reporting lt&;Versiongt&;\Examples\{CSharp or VB}\ folder.

The report we chose for the demo is part of our **ReportingLibrary** and is called [ProductSales](../product-sales). It shows a crosstab, grouped by *product categories* for rows and *years* for columns. We will show how to change the look of the HTML element under the mouse cursor and how to cancel a [NavigateToReport](../designing-reports-interactivity-drill-through-report-links) action before it is executed, depending on a confirmation dialog.

## Solution

### HTML5 Report Viewer

Open the project and navigate to the **Index.html** file. Add the following code snippet to the [report viewer initialization script](../html5-report-viewer-jquery-fn-telerik-reportviewer):


```js
interactiveActionExecuting: function (e, args) {
    if (args.action.Type === 'navigateToReport') {
        args.cancel = !confirm("You are about to navigate to report " + args.action.Value.Report + ".\r\n\nContinue?");
    }
},
interactiveActionEnter: function (e, args) {
    if (args.action.Type === 'navigateToReport') {
        $(args.element).css({ 'font-weight': 'bolder', 'background-color': 'darkSeaGreen' });
    }
},
interactiveActionLeave: function (e, args) {
    if (args.action.Type === 'navigateToReport') {
        $(args.element).css({ 'font-weight': 'normal', 'background-color': 'white' });
    }
}
```

This code block adds three handlers to the interactive action events. 

 1. [interactiveActionExecuting](../html5-report-viewer-reportviewer-events-interactiveactionexecuting) - is triggered when the mouse cursor is over the HTML element, associated with an interactive action. In this case we check the type of the action and if it equals "*navigateToReport*", a confirmation message is displayed, asking if you want to leave the page, navigating to another report. The dialog result is assigned to the cancel argument and will be processed by the engine, determining if we decided to cancel navigation or not.

 2. The other two handlers - [interactiveActionEnter](../html5-report-viewer-reportviewer-events-interactiveactionenter) and [interactiveActionLeave](../html5-report-viewer-reportviewer-events-interactiveactionleave) are raised when the mouse cursor enters or leaves the bounds of the HTML element, associated with an interactive action. We check the type of the action again (which could be unnecessary in case you only have one type of actions in your report) and change or restore the CSS style, applied on the element.

The same approach can be used in all the HTML5-based report viewers with slight modifications, as shown below.

### HTML5 ASP.NET MVC Report Viewer

When using MVC Report Viewer, you need to add the handler using the [ClientEvents](../html5-mvc-report-viewer-customizing-client-events) tag. For example:

```cs
.ClientEvents(e =>
{
    e.InteractiveActionExecuting("function (e, args) {"+
                    "if (args.action.Type === 'navigateToReport') {" +
                        "args.cancel = !confirm('You are about to navigate to report ' + args.action.Value.Report + '.\r\n\nContinue?');"+
                        "}"+
                    "}");
    e.InteractiveActionEnter("function (e, args) {" +
                    "if (args.action.Type === 'navigateToReport') {" +
                        "$(args.element).css({ 'font-weight': 'bolder', 'background-color': 'darkSeaGreen' });" +
                        "}" +
                    "}");
    e.InteractiveActionLeave("function (e, args) {" +
                    "if (args.action.Type === 'navigateToReport') {" +
                        "$(args.element).css({ 'font-weight': 'normal', 'background-color': 'white' });" +
                        "}" +
                    "}");
}
```

The JavaScript code here is written directly in method bodies for brevity - however, it is recommended to separate it in a script block or consider using external files depending on your client logic.

### HTML5 ASP.NET WebForms Report Viewer

Here we will use the same approach - attach the event handlers using [ClientEvents](../html5-webforms-report-viewer-customizing-client-api) section of the web forms viewer:

```html
<telerik:ReportViewer
    ID="reportViewer1"
    runat="server">
    <ReportSource
        IdentifierType="TypeReportSource"
        Identifier="Telerik.Reporting.Examples.CSharp.ProductSales, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
    </ReportSource>
    <ClientEvents
        InteractiveActionExecuting="onInteractiveActionExecuting"
        InteractiveActionEnter="onInteractiveActionEnter"
        InteractiveActionLeave="onInteractiveActionLeave">
    </ClientEvents>
</telerik:ReportViewer>
<script>
    function onInteractiveActionExecuting(e, args) {
        if (args.action.Type === 'navigateToReport') {
            args.cancel = !confirm('You are about to navigate to report ' + args.action.Value.Report + '.\r\n\nContinue?');
        }
    }
    function onInteractiveActionEnter(e, args) {
        if (args.action.Type === 'navigateToReport') {
            $(args.element).css({ 'font-weight': 'bolder', 'background-color': 'darkSeaGreen' });
        }
    }
    function onInteractiveActionLeave(e, args) {
        if (args.action.Type === 'navigateToReport') {
            $(args.element).css({ 'font-weight': 'normal', 'background-color': 'white' });
        }
    }
</script>
```

When you're done, start the project and hover your mouse over the crosstab detail cells. You will see how the HTML-element under the mouse cursor has its background color changed as shown below:

![Custom Actions in HTML5 Report Viewers](resources/customactionshtml5viewer_productsales.png)

## See Also

[Design Report - Actions](../designing-reports-interactivity-actions)

[How to add interactivity to a report using action event handlers in WPF report viewer](./how-to-add-interactivity-to-a-report-using-action-event-handlers-in-wpf-report-viewer)

[How to add interactivity to a report using action event handlers in WinForms report viewer](./how-to-add-interactivity-to-a-report-using-action-event-handlers-in-winforms-report-viewer)

