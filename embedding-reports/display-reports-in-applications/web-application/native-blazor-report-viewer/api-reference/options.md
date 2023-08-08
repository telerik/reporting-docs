---
title: Options
page_title: Native Blazor Report Viewer Options
description: "Learn about what are the Telerik Reporting native Blazor Report Viewer initialization options and how they may be configured."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options
tags: options,blazor,native,report,viewer,api,initialization
published: True
position: 0
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
}
</style>

# Native Blazor Report Viewer Options Overview

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
				<p><i>enum, required;</i></p>
				<p>Specifies the type of service that the report viewer will connect to. Available options are:</p>
				<ul>
					<li><strong>ReportViewerServiceType.REST</strong> - Telerik Reporting REST Service</li>
					<li><strong>ReportViewerServiceType.ReportServer</strong> - Telerik Report Server</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>ServiceUrl</td>
			<td>
				<p><i>string, required if ServiceType is REST;</i></p>
				<p>Sets the address of the Report REST Service;</p>
			</td>
		</tr>
		<tr>
			<td>ReportSource</td>
			<td>
				<p><i>ReportSourceOptions, required;</i></p>
				<p>Specifies the report and initial report parameter values to be displayed in the report viewer.</p>
				<p>The <strong>ReportSourceOptions</strong> object is made up of the following properties:</p>
				<ul>
					<li><strong>Report(string)</strong> - Gets or sets a string that uniquely identifies a report from
						the Reporting REST service or the Telerik Report Server. </li>
					<li><strong>Parameters(IDictionary&lt;string, object&gt;)</strong> - Gets or sets an object with
						properties name/value equal to the report parameters names and values used in the report
						definition.</li>
				</ul>
				<p>To set the ReportSource to a physical <i>(TRDP/TRDX/TRBP)</i> file, provide a relative path to the <strong>Report</strong> property of the ReportSourceOptions object.</p>
				<pre><code>
public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdp", new Dictionary&lt;string, object&gt;
{
	// Add parameters if applicable
});
				</code></pre>
				<p>To set the ReportSource to a <a href="/api/Telerik.Reporting.TypeReportSource" target="_blank">type definition</a>:</p>
				<ol>
					<li>Make sure that the <a href="{%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}" target="_blank">Reporting REST Service</a> project references the project containing the type definition.</li>
					<li>Pass the <a href="https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0" target="_blank">assembly qualified name</a> <i>(format: "<strong>{type}, {assembly}</strong>")</i> of the report's type to the <strong>Report</strong> property of the ReportSourceOptions object.</li>
				</ol>
				<pre><code>
public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary", new Dictionary&lt;string, object&gt;
{
	// Add parameters if applicable
});
				</code></pre>
			</td>
		</tr>
		<tr>
			<td>ReportViewerSettings</td>
			<td>
				<p><i><a href="https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.components.renderfragment?view=aspnetcore-6.0" target="_blank">RenderFragment</a>, optional</i></p>
				<p>Defines a renderfragment that contains all settings for the Report Viewer.</p>
				<p>The currently available settings are:</p>
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
	&lt;ReportServerSettings Url="https://reportinghost:83" Username="user" Password="pass"&gt;&lt;/ReportServerSettings&gt;
	&lt;SendEmailDialogSettings From="from@mail.com" To="to@mail.com" Format="CSV"&gt;&lt;/SendEmailDialogSettings&gt;
&lt;/ReportViewerSettings&gt;
				</code></pre>
			</td>
		</tr>
		<tr>
			<td>ScaleMode</td>
			<td>
				<p><i>enum, optional;</i></p>
				<p>Sets how the report pages to be scaled. Available options are:</p>
				<ul>
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
				<p><i>double, optional;</i></p>
				<p>Sets the scale factor for the report pages. The scale takes effect when the <strong>ScaleMode</strong> is set to <i>Specific</i>.</p>
				<p>Default value is <strong>1.0 (100%); the original size of the report</strong></p>
			</td>
		</tr>
		<tr>
			<td>ViewMode</td>
			<td>
				<p>Sets if the report is displayed in interactive mode or in print preview.</p>
				<p>The available values are:</p>
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
				<p>Sets if the report is displayed in Single page or Continuous scroll mode.</p>
				<p>The available values are:</p>
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
				<p>Specifies how the viewer should [print reports]({%slug
				telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}).</p>
				<p>The available values are:</p>
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
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the viewer's parameters area is displayed if any parameter editor exists.</p>
				<p>Default value: <strong>false</strong></p>
			</td>
		</tr>
		<tr>
			<td>DocumentMapVisible</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the viewer's document map is displayed if any bookmark is defined.</p>
				<p>Default value: <strong>false</strong></p>
			</td>
		</tr>
		<tr>
			<td>KeepClientAlive</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the client will be kept alive. When set to <i>true</i>, expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's <strong>ClientSessionTimeout</strong>.</p>
				<p>Default value: <strong>true</strong></p>
			</td>
		</tr>
		<tr>
			<td>EnableSendEmail</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the Send Email functionality is enabled. If set to <i>false</i> the Send Email button will not be displayed in the toolbar.</p>
				<p>Default value: <strong>true</strong></p>
			</td>
		</tr>
		<tr>
			<td>Width</td>
			<td>
				<p><i>string, optional;</i></p>
				<p>The width of the component.</p>
				<p>Default value: <strong>100%</strong></p>
			</td>
		</tr>
		<tr>
			<td>Height</td>
			<td>
				<p><i>string, optional;</i></p>
				<p>The height of the component.</p>
				<p>Default value: <strong>700px</strong></p>
			</td>
		</tr>
		<tr>
			<td>Tools</td>
			<td>
				<p><i>List&lt;IReportViewerTool&gt;, optional;</i></p>
				<p>A collection of tools that will be displayed in the toolbar.</p>
				<p>By default populates <strong>all available tools</strong> as listed in the [Customize the Toolbar of the Blazor Native Report Viewer]({%slug native-blazor-report-viewer/toolbar-customization%}) article.</p>
			</td>
		</tr>
		<tr>
			<td>AuthenticationToken</td>
			<td>
				<p><i>string, optional;</i></p>
				<p> If provided, a `Bearer` token will be set in the `Authorization` header for requests to the Reporting REST service. The token is not sent only when requesting [document resources]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource%}). The reason is that resources like images are referenced with relative URLs in the HTML of the report document, hence the requests for them are made by the browser.</p>
			</td>
		</tr>
	</table>
</body>
