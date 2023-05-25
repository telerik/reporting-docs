---
title: Add Interactivity to Report in WPF Viewer
description: "Learn how to implement interactivity in the report through action event handlers in the WPF report viewer."
type: how-to
page_title: Using action event handlers in WPF viewer for interactivity
slug: how-to-add-interactivity-to-a-report-using-action-event-handlers-in-wpf-report-viewer
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
			<td>WPF Report Viewer</td>
		</tr>
	</tbody>
</table>

## Desciption

The report viewers provide handlers for three types of events that are associated with interactive actions – `Executing`, `Enter` and `Leave`.

In this article we will show how to use these events to add more interactivity and allow further customization for your reports.

We will use the `CSharp.NetFramework.WpfIntegrationDemo` project that is shipped with your Telerik Reporting installation and is part of the `CSharp.ReportExamples.VSxxxx` solution that can be found by default in `C:\Program Files (x86)\Progress\\<Version\>\Examples\CSharp`.

The report we chose for this example is part of our `ReportLibrary` and is called `PopulationDensity`. It displays a *choropleth* based on the world population by countries. We will show how to change the colors and display an informational tooltip for the country under the mouse cursor, using a [Custom]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/custom-action%}) action.

Additionally, we will show you how to cancel a [NavigateToUrl]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action%}) action before it is executed, depending on a confirmation dialog.

## Solution

* Start Visual Studio, open the solution file and locate the `CSharp.ReportLibrary` project. Navigate to `Choropleth/PopulationDensity.cs` file and open it. Add the following code snippet in the report *constructor* right after the `InitializeComponent()` call:

	````CSharp
textBoxTitle.Action = new NavigateToUrlAction()
	{
		Url = "https://en.wikipedia.org/wiki/Population_density" ,
		Target = UrlTarget.NewWindow
	};

	var customAction = new CustomAction();
	customAction.Parameters.Add( new Parameter( "country" , "=Fields.CNTRY_NAME" ));
	customAction.Parameters.Add( new Parameter( "area" , "=Fields.SQKM" ));
	customAction.Parameters.Add( new Parameter( "population" , "=Fields.POP_CNTRY" ));
	customAction.Parameters.Add( new Parameter( "populationDensity" , "=CInt(Fields.POP_CNTRY / Fields.SQKM)" ));
	shapeMapSeries1.SeriesGroup.Action = customAction;
````

	The above code modifies the report definition, adding `NavigateToUrlAction` instance to the title text box and `CustomAction` instance with four parameters to the `ShapeMap` series group, which means that every data point (every shape in the choropleth) will trigger a custom action.

	> Please note that modifying the report definition programmatically is not recommended and we use it here for demonstration purpose - otherwise we strongly advise to use the Report Designer for such tasks.

* Open the `CSharp.NetFramework.WpfIntegrationDemo` project and locate `Window1.xaml.cs` file. Add the following two private fields to the `Window1` body (we will explain about them later):

	````CSharp
System.Windows.Media.Brush fillBrush;
	System.Windows.Media.Brush stroke;
````


* Add the following code snippet in the report viewer *constructor* after `InitializeComponent()` line:

	````CSharp
// This code block sets the report viewer's ReportSource property and creates the handlers to the interactive actions.
	this .ReportViewer1.ReportSource = new Telerik.Reporting.TypeReportSource()
	{
		TypeName = typeof (Telerik.Reporting.Examples.CSharp.Choropleth.PopulationDensity).AssemblyQualifiedName
	};

	this.ReportViewer1.InteractiveActionEnter += Choropleth_ActionEnter;
	this.ReportViewer1.InteractiveActionLeave += Choropleth_ActionLeave;
	this.ReportViewer1.InteractiveActionExecuting += Choropleth_ActionExecuting;
````


* To create the method for the `Choropleth\_ActionEnter`  handler, add the following code snippet to the `.cs` file:

	````CSharp
void Choropleth_ActionEnter( object sender, Telerik.ReportViewer.Wpf.InteractiveActionEventArgs args)
	{
		if (args.Action.ReportItemName == "textBoxTitle" )
		{
			var b = args.Element as System.Windows.Controls.Border;
			if ( null != b)
			{
				b.BorderThickness = new Thickness(0, 0, 0, 1.33);
				b.BorderBrush = System.Windows.Media.Brushes.RoyalBlue;
			}
		}
		else
		{
			var p = args.Element as System.Windows.Shapes.Path;
			if (p != null )
			{
				this .fillBrush = p.Fill;
				this .stroke = p.Stroke;
				p.Stroke = System.Windows.Media.Brushes.SaddleBrown;
				p.Fill = System.Windows.Media.Brushes.MediumSeaGreen;
			}
			var action = args.Action as Telerik.Reporting.Processing.CustomAction;               
			if ( null != action)
			{
				p.ToolTip = this .GetCountryInfo(action.Parameters);
			}
		}
	}

	string GetCountryInfo(System.Collections.Generic.IDictionary< string , object > paramValues)
	{
		var strB = new System.Text.StringBuilder();
		strB.AppendFormat( "Country: {0}{1}" , paramValues[ "country" ], Environment.NewLine);
		strB.AppendFormat( "Area: {0} km²{1}" , paramValues[ "area" ], Environment.NewLine);
		strB.AppendFormat( "Population: {0}{1}" , paramValues[ "population" ], Environment.NewLine);
		strB.AppendFormat( "Density: {0} ppl/km²" , paramValues[ "populationDensity" ]);
		return strB.ToString();
	}
````

	The above code is executed when the mouse enters the interactive action area. Since it is fired for every action, we need to check the `ReportItemName` value so our code will react accordingly. If we are hovering over the title text box, the action element will be of `System.Windows.Controls.Border` type and we can setup the bottom border line, underscoring the text.

	In any other case, the event should be raised when the cursor is over a *map data point*, which means that the current element will be of a `System.Windows.Shapes.Path` type. The current shape fill and stroke is preserved in the fields created earlier so they will be restored when the mouse cursor leaves the current shape. The action in the arguments is cast to `CustomAction` and the current element’s tooltip is set to the output of the `GetCountryInfo()` method.

* To create the method for the `Choropleth\_ActionLeave` handler, add the following code snippet to the `.cs` file:

	````CSharp
// The code here restores the default state of the framework elements, changed during the Choropleth\_ActionEnter  event.
	void Choropleth_ActionLeave( object sender, Telerik.ReportViewer.Wpf.InteractiveActionEventArgs args)
	{
		if (args.Action.ReportItemName == "textBoxTitle" )
		{
			var b = args.Element as System.Windows.Controls.Border;
			if ( null != b)
			{
				b.BorderThickness = new Thickness(0);
				b.BorderBrush = null ;
			}
		}
		else
		{
			var p = args.Element as System.Windows.Shapes.Path;
			if (p != null )
			{
				p.Fill = this .fillBrush;
				p.Stroke = this .stroke;
			}
		}
	}
````


* To create the method for the `Choropleth\_ActionExecuting` handler, add the following code snippet to the `.cs` file:

	````CSharp
void Choropleth_ActionExecuting( object sender, Telerik.ReportViewer.Wpf.InteractiveActionCancelEventArgs args)
	{
		if (args.Action.ReportItemName == "textBoxTitle" )
		{
			args.Cancel = MessageBox.Show( "Do you want to learn more about the world population density?" , "More information" , MessageBoxButton.YesNo) != MessageBoxResult.Yes;
		}
		else
		{
			var customAction = (Telerik.Reporting.Processing.CustomAction)args.Action;
			string countryName = customAction.Parameters[ "country" ].ToString();
			var msg = string .Format( "{0}{1}{1}Do you want to learn more about {2} ?" ,
				this .GetCountryInfo(customAction.Parameters),
				Environment.NewLine,
				countryName);

			if (MessageBox.Show(msg, "More information" , MessageBoxButton.YesNo) == MessageBoxResult.Yes)
			{
				System.Diagnostics.Process.Start( string .Format( "https://en.wikipedia.org/wiki/{0}" , countryName));
			}
		}
	}
````

	Again, we need to check the `ReportItemName` property to be sure which report item raised the event. If the action is triggered from the title text box, the viewer will display a confirmation box and its result will be assigned to the **Cancel** property, so the `NavigateToUrl` action will not be executed if Cancel is set to `true`. However, when using a CustomAction, the Cancel property doesn’t affect the workflow, so in this case we will display a confirmation box with some details and will open a browser window, navigating to a wiki page of the current country, whose name is obtained through the `CustomAction` parameters.

When you're done, run the project and hover your mouse over the choropleth. It should look like the one below:

![Choropleth with tooltip shown over Sweden](resources/customactionswpfviewer_choropleth.PNG)

## Notes

In this article we demonstrated how to add interactivity and customizations to a report with a few lines of code. This approach can be used in all the current report viewers with slight modifications due to the rendering technology.

## See Also

* [Designing Reports - Actions]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%})
* [Custom Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/custom-action%})
* [Add Interactivity to Report in WinForms Viewer]({%slug how-to-add-interactivity-to-a-report-using-action-event-handlers-in-winforms-report-viewer%})
* [Add Interactivity to Report in HTML5-based Viewers]({%slug how-to-add-interactivity-to-a-report-using-action-event-handlers-with-html5-based-report-viewers%})
