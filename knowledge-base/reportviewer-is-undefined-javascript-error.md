---
title: ReportViewer is undefined JavaScript error
description: ReportViewer is undefined JavaScript error
type: how-to
page_title: ReportViewer is undefined JavaScript error
slug: reportviewer-is-undefined-javascript-error
res_type: kb
---

> **NOTE**
> <br/>
> This article relates only to the [Legacry Report Viewer](../asp-net-report-viewer). You may be looking for [HTML5 Report Viewer Troubleshooting](../html5-viewer-troubleshooting)

## Description 

The following javascript error is  thrown, when opening a page containing the web ReportViewer control:  
   
***'ReportViewer' is undefined***  
     
## Solution   

 This error usually indicates that the ReportViewer control has not been able to load its resources for some reason - JavaScript, CSS and images. It could be due to one of the following things:  
   
 
1. Missing preCondition attribute of the report viewer handler's registration in the **&lt;system.webServer&gt;&lt;handlers&gt;** section, when the application is hosted on **IIS7**, i.e. the handler should look like this:  

  ```xml
  <system.webServer>  
    <handlers>  
       <add name="Telerik.ReportViewer.axd_*" path="Telerik.ReportViewer.axd" verb="*" type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" preCondition="integratedMode"   />  
    </handlers>  
    <validation validateIntegratedModeConfiguration="false" />    
</system.webServer>  
  ``` 

2. Try changing the *application pool* between **DefaultAppPool** and **Classic .Net AppPool**.
3. **Remove/disable** compression modules (if any) as they may somehow interfere with the viewer's handler.
4. Run the application, open a new tab in the browser and directly request the viewer's resource by using the following url:  
   
 **http://devmachine/MyApplication/Telerik.ReportViewer.axd?name=Resources.ReportViewer.js&optype=Resource&version=x.x.x.x**  
   

 This should give a more detailed information about the error.

5. If authorization is used, it is possible that this somehow restricts the access to the http handler used by the viewer. Please, add the following **&lt;location&gt;** element to your **web.config** to make sure the handler is accessible at all times:  
   
 ```xml
 <location path="Telerik.ReportViewer.axd">   
          <system.web>  
            <authorization>  
              <allow users="*"/>   
            </authorization>  
          </system.web>  
 </location> 
 ```

6. Might also occur if you're trying to reference the viewer's client-side object prior to the control registration on the page i.e:  

  ```xml
  <script type="text/javascript"> 
var viewer = <%=ReportViewer1.ClientID%> 
</script> 
<telerik:reportviewer id="ReportViewer1" runat="server"></telerik:reportviewer> 
  ```  

 If still having problems, please use a web debugging proxy (e.g.  [Fiddler Jam](https://jam.getfiddler.com)) and check what is the response for the **/ReportViewer.axd?name=Resources.ReportViewer.js&version=x.x.x.x&optype=Resource** request or any request of such kind. 
   
 >**Note** 
 > <br/>
 >Substitute **Version=X.X.X.X** with the **exact** assembly version you are using!  


