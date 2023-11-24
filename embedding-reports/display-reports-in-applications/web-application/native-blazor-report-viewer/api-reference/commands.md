---
title: Commands
page_title: Native Blazor Report Viewer Commands
description: "Learn about the commands exposed by the Native Blazor Report Viewer and how they can be used to perform certain operations from code."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/commands
tags: command,commands,method,methods,blazor,native,report,viewer,api
published: True
position: 1
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 20%;
}

table th:nth-of-type(3) {
	width: 60%;
}
</style>

# Native Blazor Report Viewer Commands Overview

The Native Blazor Report Viewer exposes **commands** that allow it to control its behavior from application code.

## Executing A Command

To execute a command, it is required to first get a reference to the report viewer object using the `@ref` attribute. Then, the referenced property/field can be used to invoke the `ExecuteCommand` method. The `ExecuteCommand` method has the following signature:

````C#
void ExecuteCommand(string commandName, string commandValue(optional))
````

All commands, except for the `Export` command, require a single argument for this method, which is the `commandName`. The `commandValue` is used only by the `Export` command to specify the exporting format.

For example, the `Refresh` and `Export` commands of the current report can be triggered like this:

````C#
<button type="button" class="btn btn-light btn-sm" @onclick="RefreshReport">Refresh Report</button>
<button type="button" class="btn btn-light btn-sm" @onclick="Export">Export Report to PDF</button>
<button type="button" class="btn btn-light btn-sm" @onclick="UpdateToken">Update Authentication Token</button>

<ReportViewer
	ServiceUrl="/api/reports"
	@ref="@ViewerInstance"
</ReportViewer>

@code {
	public ReportViewer ViewerInstance { get; set; }

	void RefreshReport()
	{
		ViewerInstance.ExecuteCommand("Refresh");
	}
	void Export()
	{
		ViewerInstance.ExecuteCommand("Export", "PDF");
	}

	void SetToken()
	{
		ViewerInstance.ExecuteCommand("SetAuthenticationToken", "SAMPLE_TOKEN");
	}
}
````

## Commands List

<body>
	<table>
		<tr>
			<th>Command Name</th>
			<th>Arguments</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>NavigateBackward</td>
			<td>
				None
			</td>
			<td>
				Goes back to the previously rendered report from history.
			</td>
		</tr>
		<tr>
			<td>NavigateForward</td>
			<td>
				None
			</td>
			<td>
				Goes forward to the previously rendered report from history.
			</td>
		</tr>
		<tr>
			<td>StopRendering</td>
			<td>
				None
			</td>
			<td>
				Stop the rendering of the current report at the first possible moment.
			</td>
		</tr>
		<tr>
			<td>Refresh</td>
			<td>
				None
			</td>
			<td>
				Refreshes the report viewer.
			</td>
		</tr>
		<tr>
			<td>Print</td>
			<td>
				None
			</td>
			<td>
				Triggers the report viewer printing operation.
			</td>
		</tr>
		<tr>
			<td>SendMail</td>
			<td>
				None
			</td>
			<td>
				Triggers the Email-sending functionality if implemented.
			</td>
		</tr>
		<tr>
			<td>Search</td>
			<td>
				None
			</td>
			<td>
				Shows or hides the search dialog.
			</td>
		</tr>
		<tr>
			<td>SetAuthenticationToken</td>
			<td>
				The token string
			</td>
			<td>
				Sets the token that will be used in the Authorization header of the requests made by the viewer.
			</td>
		</tr>
		<tr>
			<td>Export</td>
			<td>
				The rendering extension name, e.g. "PDF"
			</td>
			<td>
				Exports the report, using the respective rendering extension name.
			</td>
		</tr>
		<tr>
			<td>FirstPage</td>
			<td>
				None
			</td>
			<td>
				Goes to the first page of the report.
			</td>
		</tr>
		<tr>
			<td>LastPage</td>
			<td>
				None
			</td>
			<td>
				Goes to the last page of the report
			</td>
		</tr>
		<tr>
			<td>NextPage</td>
			<td>
				None
			</td>
			<td>
				Goes to the next page of the report.
			</td>
		</tr>
		<tr>
			<td>PreviousPage</td>
			<td>
				None
			</td>
			<td>
				Goes to the previous page of the report.
			</td>
		</tr>
		<tr>
			<td>ZoomIn</td>
			<td>
				None
			</td>
			<td>
				Zoom in the report.
			</td>
		</tr>
			<tr>
			<td>ZoomOut</td>
			<td>
				None
			</td>
			<td>
				Zoom out the report.
			</td>
		</tr>
		<tr>
			<td>TogglePrintPreview</td>
			<td>
				None
			</td>
			<td>
				Toggles between <strong>Print Preview</strong> and <strong>Interactive<strong> view modes - <a href="{%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}" target="_blank">Interactive vs Print Layout</a>
			</td>
		</tr>
		<tr>
			<td>ToggleScaleMode</td>
			<td>
				None
			</td>
			<td>
				Changes the scale mode of the report.
			</td>
		</tr>
		<tr>
			<td>ToggleDocumentMap</td>
			<td>
				None
			</td>
			<td>
				Shows or hides the document map.
			</td>
		</tr>
		<tr>
			<td>ToggleParametersArea</td>
			<td>
				None
			</td>
			<td>
				Shows or hides the parameters area.
			</td>
		</tr>
	</table>
</body>

## See Also

* [Native Blazor Report Viewer Options]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options%})
