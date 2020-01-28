---
title: How to display Preview button of Html5 Viewer's parameters area at the top of the area
description: Display the Preview button at the top of the parameters area
type: how-to
page_title: Move Preview button at the top of parameters area
slug: how-to-move-preview-button-at-the-top-of-parameters-area
position: 
tags: 
ticketid: 1448864
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
The Preview button of the Html5 Viewer's Parameters area is displayed when at least one of the Report paramters is Visible. By design, the button is displayed at the bottom of the area. The article elaborates on how to move the Preview button at the top of the parameter editors.

## Solution
You need to add CSS styles that modify the default position of the button and the content in the viewer's Parameters area. The Preview button is positioned in the footer of the area and can be selected by '.trv-parameters-area.preview .trv-parameters-area-footer'. The parameter editors themselves are located in the content part of the area and can be selected by '.trv-report-viewer .trv-parameters-area.preview .trv-parameters-area-content'. Here is sample code for the page hosting the Html5 Viewer with Preview button at the top of the Parameter's area:
```HTML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    ...
    <style>
		...
        #reportViewer1 {
            ...
        }

        .trv-parameters-area.preview .trv-parameters-area-footer {
            top: 0;
        }

        .trv-report-viewer .trv-parameters-area.preview .trv-parameters-area-content {
            top: 3em;
            bottom: 0;
        }
		...
    </style>
</head>
<body>
	...
    <div id="reportViewer1">
        loading...
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#reportViewer1")
                .telerik_ReportViewer({
                  ...
				 });
        });
    </script>
</body>
</html>
```
