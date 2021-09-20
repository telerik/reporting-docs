---
title: How to Customize the WPF Report Viewer
description: Edit WPF Report Viewer template
type: how-to
page_title: Customize the WPF Report Viewer appearance
slug: customize-wpf-report-viewer
position: 
tags: 
ticketid: 1533694
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
			<td>WPF</td>
		</tr>
	</tbody>
</table>


## Description
The article explains how to customize the appearance of the [WPF Report Viewer](../wpf-report-viewer-intro)

## Suggested Workarounds
We'll demonstrate two approaches of using custom commands by the WPF Report Viewer, each one of them executed by clicking a dedicated button on the report viewer's toolbar. In our demo we'll modify the report viewer template for the _Office 2019_ theme, which by default is located at _(TelerikReporting_Installation_Folder)\Wpf\Themes\Office2019\Telerik.ReportViewer.Wpf.xaml_. 
Make sure you merge the resource dictionaries from the XAML files rather than from the default _Telerik.ReportViewer.Wpf.Themes_ assembly. See the article section [Setting Customizable Implicit Style for the WPF Report Viewer Example](../wpf-report-viewer-implicit-styles#setting-customizable-implicit-style-for-the-wpf-report-viewer-example) for details. The reason is that we need to modify the XAML files to add new controls and functionality to the viewer.

Let's add two new buttons to the viewer's markup, as shown below::
```XAML
<ResourceDictionary
    ...
    xmlns:local="clr-namespace:CSharp.NetFramework.WpfIntegrationDemo">	<!-- The namespace for the custom RoutedUICommand -->
    ...
    <!-- Office2019 -->
	  ...
    <Style TargetType="telerikReporting:ReportViewer">
        ...
        <Setter Property="Template">
            <Setter.Value>
                <ControlTemplate TargetType="telerikReporting:ReportViewer">
                    <Grid x:Name="LayoutRoot">
                        <Border Background="{TemplateBinding Background}"
                    BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}">
                            <Grid Margin="{TemplateBinding Padding}">
                                ...
                                <!-- Toolbar -->
                                <telerikNav:RadToolBar Grid.Row="0" Margin="0">
                                    ...
                                    <telerikNav:RadToolBarSeparator />
                                    
                                    <!-- the new Buttons in the ReportViewer's Toolbar -->
                                    <Button x:Name="CustomCommandAButton" Command="{Binding Path=MyCommand, RelativeSource={RelativeSource AncestorType=Window}}">Main Window Command</Button>
                                    <Button x:Name="CustomCommandBButton" Command="local:CustomReportViewerCommands.MyCommand" CommandParameter="Param AAA">RoutedUICommand</Button>
									                  
                                    <telerikNav:RadToolBarSeparator />
                                    ...
                                </telerikNav:RadToolBar>
                                ...
                            </Grid>
                        </Border>
                    </Grid>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
</ResourceDictionary>
```

1. You may bind the custom control to a property of the main window "Window1" hosting the ReportViewer - the _CustomCommandAButton_ button "Main Window Command" in the above example. Here is how the code behind related to the new custom functionality may look like:

```C#
namespace CSharp.NetFramework.WpfIntegrationDemo
{
    using System;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Media;
    using Telerik.Windows.Controls;

    public partial class Window1 : Window
    {

        ...

        public Window1()
        {
            this.InitializeComponent();

            MyCommand = new DelegateCommand(OnMyCommandExecuted);
        }

        private void OnMyCommandExecuted(object obj)
        {
            // YOUR CUSTOM CODE HERE
        }

        public DelegateCommand MyCommand { get; set; }

        ...
}
}
```

The main drawback of this approach is that you couple the viewer's template with the particular window _Window1_, which in most cases is not desired.

2. The better approach is to use the [RoutedUICommand](https://docs.microsoft.com/en-us/dotnet/api/system.windows.input.routeduicommand?view=net-5.0). 
This is applied to the second custom button _CustomCommandBButton_ "RoutedUICommand" in the example. Note that you may easily send parameters with this approach. 
Here is the sample code for the _CustomReportViewerCommands_ class. Note that in the XAML you need to register the Namespace of the class:

```C#
namespace CSharp.NetFramework.WpfIntegrationDemo
{
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Input;

    public static class CustomReportViewerCommands
    {
        public static RoutedUICommand MyCommand { get; private set; }

        static CustomReportViewerCommands()
        {
            MyCommand = new RoutedUICommand("MyCommand", "MyCommand", typeof(Button));
            var binding = new CommandBinding(MyCommand, OnMyCommandExecuted);
            CommandManager.RegisterClassCommandBinding(typeof(Button), binding);
        }

        private static void OnMyCommandExecuted(object sender, ExecutedRoutedEventArgs e)
        {
	    // YOUR CUSTOM CODE HERE. You may get the command parameter value from 'e.Parameter'
        }
    }
}
```

You need to implement the proper logic to replace the placeholders denoted with "// YOUR CUSTOM CODE HERE" depending on the exact requirements.
