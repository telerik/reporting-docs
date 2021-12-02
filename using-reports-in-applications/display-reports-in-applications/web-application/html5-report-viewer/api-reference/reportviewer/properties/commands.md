---
title: commands
page_title: commands | for Telerik Reporting Documentation
description: commands
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/properties/commands
tags: commands
published: True
position: 0
---

# commands



## commands

The report viewer exposes all its available commands through the __commands__  collection:         

Each [command]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/command%}) is an object with the                __exec()__  method being the one that actually triggers the command. The other two methods,                __enabled()__  and __checked()__  return a bool value and can be used                prior to executing a command or to find in what state the UI for the command should be.           

	
````js
        $('#printButton').click(function () {
            var rv = $("#reportViewer1").data("telerik_ReportViewer");
            rv.commands.print.exec();
        });
````



The example above selects an HTML element with the __printButton__  id using jQuery and in the click event           handler invokes report viewer __print__  command. Note that the __exec()__  method of the command needs to be           called. For more information please check the command article.         

The following table is a list of all commands:         


| Command name | Parameters | Description |
| ------ | ------ | ------ |
|historyBack|none|Goes back to the previously rendered report from history.|
|historyForward|none|Goes forward to the previously rendered report from history.|
|stopRendering|none|Stop the rendering of the current report at the first possible moment.|
|refresh|none|Refreshes the report.|
|goToFirstPage|none|Goes to the first page of the report.|
|goToPrevPage|none|Goes to the previous page of the report.|
|goToPage|page number|Goes to a specific page of the report.|
|goToNextPage|none|Goes to the next page of the report.|
|goToLastPage|none|Goes to the last page of the report.|
|togglePrintPreview|none|Toggles between Print Preview and Interactive view modes.|
|export|rendering extension name|Exports the report, using the respective rendering extension name.|
|print|none|Triggers the report printing.|
|toggleDocumentMap|none|Shows or hides the document map.|
|toggleParametersArea|none|Shows or hides the parameters area.|
|zoomIn|none|Zoom-in the report.|
|zoomOut|none|Zoom-out the report.|
|zoom|zoom ratio|Zoom with a specified ratio.|
|toggleZoomMode|none|Changes the zoom mode of the report.|
|toggleSideMenu|none|Shows or hides the side menu.|
|toggleSearchDialog|none|Shows or hides the search dialog|



