---
title: Export Report in Silverlight
page_title: Export Report in Silverlight | for Telerik Reporting Documentation
description: Export Report in Silverlight
slug: telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/export-report-in-silverlight
tags: export,report,in,silverlight
published: False
position: 1
---

# Export Report in Silverlight



To export a Telerik report from a Silverlight application without a Silverligh Report Viewer you have to instantiate the  [Telerik.Reporting.Service.SilverlightClient.ReportServiceClient](/reporting/api/Telerik.Reporting.Service.SilverlightClient.ReportServiceClient)  class, which plays the role of proxy to the [Telerik Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}). 	  

To specify that you want to render the report we use the 		 [Telerik.Reporting.Service.SilverlightClient.ReportServiceClient.RenderAsync](/reporting/api/Telerik.Reporting.Service.SilverlightClient.ReportServiceClient#Telerik_Reporting_Service_SilverlightClient_ReportServiceClient_RenderAsync_System_String_System_String_Telerik_Reporting_Service_NameValueDictionary_Telerik_Reporting_Service_NameValueDictionary_)  		  method of the ReportServiceClient, which invokes the respective method on the server (remember that it serves as proxy) 		  that would return the rendered report. 	  

Since we’ve used an asynchronous method and we do not know when the render would finish, we need to handle the 		 [Telerik.Reporting.Service.SilverlightClient.ReportServiceClient.RenderCompleted](/reporting/api/Telerik.Reporting.Service.SilverlightClient.ReportServiceClient#Telerik_Reporting_Service_SilverlightClient_ReportServiceClient_RenderCompleted)  		  event. In the RenderCompleted event we get the result from the rendering and decide what to do with it -  in this case write down the report. 	  

>note We invoke the       [ShowDialog](http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog.showdialog(VS.95).aspx)        method prior to having the rendered report, because the dialog box, can only be called from user-initiated code, such as a button Click event. If ShowDialog is called from code that is not user-initiated, a SecurityException is thrown.         


	
````C#
		public partial class MainPage : UserControl
		    {
		        public MainPage()
		        {
		            InitializeComponent();
		        }
		        Stream file;
		        private void Button_Click(object sender, RoutedEventArgs e)
		        { 
		            var fileDlg = new SaveFileDialog();
		            fileDlg.Filter = "PDF files|*.pdf|All files|*.*";
		            if (fileDlg.ShowDialog() == true)
		            {
                        //set any deviceInfo settings if necessary
                        var deviceInfo = new NameValueDictionary();
                        //set any report parameter value if necessary
                        var parameters = new NameValueDictionary();
                        this.file = fileDlg.OpenFile();
		                var serviceClient = new ReportServiceClient(new Uri(App.Current.Host.Source, "../ReportService.svc"));
		                serviceClient.RenderAsync("PDF", 
		                    "ClassLibrary1.Report1, ClassLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", 
		                    deviceInfo, 
		                    parameters);
		                serviceClient.RenderCompleted += new EventHandler<RenderEventArgs>(serviceClient_RenderCompleted);
		            }
		        }
		        void serviceClient_RenderCompleted(object sender, RenderEventArgs e)
		        {
		            var result = e.RenderingResult;
		            if (this.file != null)
		            {
		                this.file.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
		                this.file.Close();
		                this.file.Dispose();
		                this.file = null;
		            }
		        }    
		    }
````
````VB.NET
    Public Sub New()
        InitializeComponent()
    End Sub
    Private file As Stream
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.Windows.RoutedEventArgs) Handles Button1.Click
        Dim fileDlg = New SaveFileDialog()
        fileDlg.Filter = "PDF files|*.pdf|All files|*.*"
        If fileDlg.ShowDialog() = True Then
            'set any deviceInfo settings if necessary
            Dim deviceInfo As New NameValueDictionary()
            'set any report parameter value if necessary
            Dim parameters As New NameValueDictionary()
            Me.file = fileDlg.OpenFile()
            Dim serviceClient = New ReportServiceClient(New Uri(App.Current.Host.Source, "../ReportService.svc"))
            serviceClient.RenderAsync("PDF", "ClassLibrary1.Report1, ClassLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", deviceInfo, parameters)
            AddHandler serviceClient.RenderCompleted, AddressOf Me.serviceClient_RenderCompleted
        End If
    End Sub
    Private Sub serviceClient_RenderCompleted(ByVal sender As Object, ByVal e As RenderEventArgs)
        Dim result = e.RenderingResult
        If Me.file IsNot Nothing Then
            Me.file.Write(result.DocumentBytes, 0, result.DocumentBytes.Length)
            Me.file.Close()
            Me.file.Dispose()
            Me.file = Nothing
        End If
    End Sub
End Class
````



# See Also
 * [Telerik.Reporting.Service.SilverlightClient.ReportServiceClient](/reporting/api/Telerik.Reporting.Service.SilverlightClient.ReportServiceClient) 
