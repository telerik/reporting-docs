---
title: The path is not of a legal form error message on processing a Telerik Report in a project targeting .NET 4.6.2 framework
description: The path is not of a legal form error message on processing a Telerik Report in a project targeting .NET 4.6.2 framework
type: how-to
page_title: The path is not of a legal form error message on processing a Telerik Report in a project targeting .NET 4.6.2 framework
slug: the-path-is-not-of-a-legal-form-error-message-on-processing-a-telerik-report-net462-framework
res_type: kb
---

  
## Description  
**The path is not of a legal form** error message on processing a Telerik Report in a project targeting **.NET 4.6.2 framework**.  
  
 The Exception occurs on processing a Telerik Report that contains a resourced specified by file path e.g. ='C:\Pictures\MyImage.png.' used as **PictureBox.Value** property.  
  
 The stack trace looks as follows:  


`
An exception has occurred while processing 'pictureBox' item:
System.InvalidOperationException: Invalid image data. ---> System.ArgumentException: The path is not of a legal form.
   at System.IO.Path.NewNormalizePathLimitedChecks(String path, Int32 maxPathLength, Boolean expandShortPaths)
   at System.IO.Path.NormalizePath(String path, Boolean fullCheck, Int32 maxPathLength, Boolean expandShortPaths)
   at System.IO.Path.InternalGetDirectoryName(String path)
   at Telerik.Reporting.Processing.Imaging.ImageUtils.ResolveBasePath()
   at Telerik.Reporting.Processing.Imaging.ImageUtils.GetImageData(Object value)
   --- End of inner exception stack trace ---
   at Telerik.Reporting.Processing.Imaging.ImageUtils.GetImageData(Object value)
   at Telerik.Reporting.Processing.Imaging.ImageDataHelper.StoreImageData(Object key, Object value, IImageInfoMap imageInfoMap, ICache cache, String& imageDataKey)
   at Telerik.Reporting.Processing.PictureBox.ResolveImage(Object value)
   at Telerik.Reporting.Processing.PictureBox.ProcessItem()
   at Telerik.Reporting.Processing.ReportItemBase.ProcessElement()
   at Telerik.Reporting.Processing.ProcessingElement.Process(IDataMember dataContext)
`

  
  
## Solution

 Add the following setting in the running application's configuration file, in the runtime section:  

```html
<runtime>
    <AppContextSwitchOverrides value="Switch.System.IO.UseLegacyPathHandling=true"/>  
</runtime>
```

 The setting will be applied only to the running application. It lets file paths to be specified as before .NET 4.6.2 framework without getting *System.ArgumentException*.  
  
 For more details, please check <a href="https://msdn.microsoft.com/en-us/library/system.appcontext%28v=vs.110%29.aspx" target="_blank">AppContext Class (msdn)</a>

