---
title: Native Blazor Report Viewer Options
page_title: Native Blazor Report Viewer Options 
description: Native Blazor Report Viewer Options
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options
tags: options,blazor,native,report,viewer,api,initialization
published: True
position: 0
---
<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# Overview

Below is a list of all options available during initialization of the native Blazor Report Viewer.

## Options

<body>
	<table>
		<tr>
			<th>Property</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>ServiceType</td>
			<td>
				<p><i>enum, required;</i>
				Specifies the type of service that the report viewer will connect to. Available options are:</p>
				<ul>
					<li><strong>ReportViewerServiceType.REST</strong> - Telerik Reporting REST Service</li>
					<li><strong>ReportViewerServiceType.ReportServer</strong> - Telerik Report Server</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>ServiceUrl</td>
			<td>
				<i>string, required if ServiceType is REST;</i>
				Sets the address of the Report REST Service;
			</td>
		</tr>
		<tr>
			<td>ReportSource</td>
			<td>
				<i>ReportSourceOptions, required;</i>
				Specifies the report and initial report parameter values to be displayed in the report viewer.
				</br>
				The <strong>ReportSourceOptions</strong> object is made up of the following properties:
				</br>
				<ul>
					<li><strong>Report(string)</strong> - Gets or sets a string that uniquely identifies a report from
						the Reporting REST service or the Telerik Report Server. </li>
					<li><strong>Parameters(IDictionary&lt;string, object&gt;)</strong> - Gets or sets an object with
						properties name/value equal to the report parameters names and values used in the report
						definition.</li>
				</ul> </br>
				<pre>
				<code>
public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdp", new Dictionary&lt;string, object&gt;
{
	// Add parameters if applicable
});
				</code>
				</pre>
			</td>
		</tr>
		<tr>
			<td>ReportViewerSettings</td>
			<td>
				<i><a href="https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.components.renderfragment?view=aspnetcore-6.0"
						target="_blank">RenderFragment</a>, optional</i>
				</br>
				Defines a renderfragment that contains all settings for the Report Viewer.</br>The currently available
				settings are:
				<ul>
					<li>
						<strong>ReportServerSettings</strong> - Represents the settings that the report viewer will use
						to connect to the Telerik Report Server. </br>
						<ul>
							<li><strong>Url</strong> - (string, required) Defines the Url of the report server.</li>
							<li><strong>Username</strong> - (string, required) Defines the Username to be used for
								authenticating with the report server.</li>
							<li><strong>Password</strong> - (string, required) Defines the Password to be used for
								authenticating with the report server.</li>
						</ul>
					</li>
					<li><strong>SendEmailDialogSettings</strong> - Represents the predefined settings for the Send Email
						dialog. </br>
						<ul>
							<li><strong>From</strong> - (string, optional) E-mail address used for the MailMessage FROM
								value.</li>
							<li><strong>To</strong> - (string, optional) E-mail address used for the MailMessage TO
								value.</li>
							<li><strong>Cc</strong> - (string, optional) E-mail address used for the MailMessage Carbon
								Copy value.</li>
							<li><strong>Subject</strong> - (string, optional) A string used for the MailMessage Subject
								value.</li>
							<li><strong>Body</strong> - (string, optional) Sentences used for the MailMessage Content
								value.</li>
							<li><strong>Format</strong> - (string, optional) The preselected report document format.
							</li>
						</ul>
					</li>
				</ul>
				<pre><code>
&lt;ReportViewerSettings&gt;
	&lt;ReportServerSettings Url="http://reportinghost:83" Username="user" Password="pass"&gt;&lt;/ReportServerSettings&gt;
	&lt;SendEmailDialogSettings From="from@mail.com" To="to@mail.com" Format="CSV"&gt;&lt;/SendEmailDialogSettings&gt;
&lt;/ReportViewerSettings&gt;
				</code></pre>
			</td>
		</tr>
		<tr>
			<td>ScaleMode</td>
			<td>
				<i>enum, optional;</i>
				Sets how the report pages to be scaled. Available options are: <ul>
					<li> <strong>ScaleMode.FitPageWidth</strong> - the pages are scaled proportional to fit the entire
						width in the viewer's view port;</li>
					<li><strong>ScaleMode.FitPage</strong>- the pages are scaled proportional to fit the entire page in
						the view port;</li>
					<li><strong>ScaleMode.Specific</strong> - the pages are scaled with the <i>Scale</i> value;
						<br />
						Default value is: <strong>ScaleMode.FitPage</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>Scale</td>
			<td>
				<i>double, optional;</i>
				Sets the scale factor for the report pages. The scale takes effect when the <strong>ScaleMode</strong>
				is set to <i>Specific</i>.
				<br />
				Default value is <strong>1.0 (100%); the original size of the report</strong>
			</td>
		</tr>
		<tr>
			<td>ViewMode</td>
			<td>
				Sets if the report is displayed in interactive mode or in print preview. <br />
				The available values are:
				<ul>
					<li><strong>ViewMode.Interactive</strong> - enables drill-down interactivity, etc;</li>
					<li><strong>ViewMode.PrintPreview</strong> - the report is paged according to the page settings;
						For more information please see [Interactive vs. Print Layout]({%slug
						telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).
						<br />
						Default value is: <strong>ViewMode.Interactive</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>PageMode</td>
			<td>
				Sets if the report is displayed in Single page or Continuous scroll mode. <br />
				The available values are:
				<ul>
					<li><strong>PageMode.SinglePage</strong> - only one page is loaded in the view port;</li>
					<li><strong>PageMode.ContinuousScroll</strong> - more than one page could be loaded in the view
						port;
						<br />Default value is: <strong>PageMode.ContinuousScroll</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>PrintMode</td>
			<td>
				Specifies how the viewer should [print reports]({%slug
				telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}).
				<br />
				The available values are:
				<ul>
					<li><strong>PrintMode.AutoSelect</strong> - specifies that the viewer should automatically decide
						which option for printing to use depending on browser's version and whether the PDF plug-in is
						available or not. This is the default value;</li>
					<li><strong>PrintMode.ForcePDFFile</strong> - specifies that the document for printing will be
						downloaded as a file (in PDF format with a special 'print' script enabled);</li>
					<li><strong>PrintMode.ForcePDFPlugin</strong> - specifies that the viewer should always use the PDF
						plug-in;</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>ParametersAreaVisible</td>
			<td>
				<i>boolean, optional;</i>
				Determines whether the viewer's parameters area is displayed if any parameter editor exists.
				<br />
				Default value: <strong>false</strong>
			</td>
		</tr>
		<tr>
			<td>DocumentMapVisible</td>
			<td>
				<i>boolean, optional;</i>
				Determines whether the viewer's document map is displayed if any bookmark is defined.
				<br />
				Default value: <strong>false</strong>
			</td>
		</tr>
		<tr>
			<td>KeepClientAlive</td>
			<td>
				<i>boolean, optional;</i>
				Determines whether the client will be kept alive. When set to <i>true</i>, expiration of the client will
				be prevented by continually sending a request to the server, determined by the Reporting REST service's
				<strong>ClientSessionTimeout</strong>.
				<br />
				Default value: <strong>true</strong>
			</td>
		</tr>
		<tr>
			<td>EnableSendEmail</td>
			<td>
				<i>boolean, optional;</i>
				Determines whether the Send Email functionality is enabled. If set to <i>false</i> the Send Email button
				will not be displayed in the toolbar.
				<br />
				Default value: <strong>true</strong>
			</td>
		</tr>
		<tr>
			<td>Width</td>
			<td>
				<i>string, optional;</i>
				The width of the component.
				<br />
				Default value: <strong>100%</strong>
			</td>
		</tr>
		<tr>
			<td>Height</td>
			<td>
				<i>string, optional;</i>
				The height of the component.
				<br />
				Default value: <strong>700px</strong>
			</td>
		</tr>
	</table>
</body>
