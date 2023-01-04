---
title: Using the WPF Report Viewer in an MVVM scenario
description: How to use the WPF Report Viewer in an MVVM scenario.
type: how-to
page_title: Implementing the WPF Report Viewer in an MVVM scenario
slug: using-the-wpf-report-viewer-in-an-mvvm-scenario
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

Only dependency properties of the WPF Report Viewer control, designed for the WPF technology, can be bound to properties of a model. A model can have a **ReportSource** property bound to the viewer's ReportSource.  
  
## Solution  
  
- Consider the following example of a model:  

```cs
class ViewModel : INotifyPropertyChanged
{
    private int testCounter = 0;
    public event PropertyChangedEventHandler PropertyChanged;
    Telerik.Reporting.ReportSource _myReportSource;
    public Telerik.Reporting.ReportSource MyReportSource
    {
        get { return this._myReportSource; }
        set
        {
            if (this._myReportSource != value)
            {
                this._myReportSource = value;
                if (null != this.PropertyChanged)
                {
                    this.PropertyChanged(this, new PropertyChangedEventArgs("MyReportSource"));
                   
                }
            }
        }
    }
    public ViewModel()
    {
        this.MyReportSource = null;// new InstanceReportSource { ReportDocument = null };
        _thisCommand = new Telerik.Windows.Controls.DelegateCommand(x => ChangeReport());
    }
    ICommand _thisCommand;
    public ICommand ThisCommand
    {
        get
        {
            return _thisCommand;
        }
    }
    public void ChangeReport()
    {
        if (testCounter % 2 == 1)
            this.MyReportSource = new InstanceReportSource { ReportDocument = new Report1() };
        else
            this.MyReportSource = new InstanceReportSource { ReportDocument = new Report2() };
        testCounter++;
    }
}
```
  
- The above model can be related to the WPF ReportViewer as follows:  

```XML
<Window.DataContext>
    <vm:ViewModel />
</Window.DataContext>
<Grid>
    <Grid.RowDefinitions>
        <RowDefinition Height="50" />
        <RowDefinition Height="*" />
    </Grid.RowDefinitions>
    <Button x:Name="ChangeReportButton" Grid.Row="0" Height="30" Width="100" Command="{Binding ThisCommand}" Content="Change Report"  >
    </Button>
    <tr:ReportViewer Grid.Row="1" x:Name="ReportViewer1" HorizontalAlignment="Stretch" ReportSource="{Binding MyReportSource}" >
    </tr:ReportViewer>
</Grid>
```
  
## Notes

Reports have a general purpose and can be reused in different types of projects. Reports do not have dependency properties. If you need to change the data in a report, on trigger the change event of other control you can update [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})' DataSource properties in code. Then update the model's ReportSource in order to refresh the viewer. 

## See Also

[ReportSource Class](/api/telerik.reporting.reportsource)
