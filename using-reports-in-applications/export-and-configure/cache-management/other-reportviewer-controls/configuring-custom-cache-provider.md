---
title: Configuring Custom Cache Provider
page_title: Configuring Custom Cache Provider | for Telerik Reporting Documentation
description: Configuring Custom Cache Provider
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-custom-cache-provider
tags: configuring,custom,cache,provider
published: True
position: 4
---

# Configuring Custom Cache Provider



>important The cache settings mentioned in this article are not obligatory, and they do not apply to the            __HTML5 Viewer__  or its Angular, WebForms and MVC wrappers. Details about the Cache Storage of the Reporting REST           Service that works with the HTML5 Viewer are available in           [Cache Management: HTML5 Report Viewer and Reporting REST services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})           and [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).         


Except the preconfigured cache providers, additional providers can be used. To do that create a __MyCache__  class that implements         the Telerik.Reporting.Cache.Interfaces.ICache interface. Then implement the Telerik.Reporting.Cache.Interfaces.ICacheProvider         interface and its only method should return a new instance of the __MyCache__  class.       

>important The cache provider should have a parameterless constructor in order to be instantiated by the Reporting engine.         


## 

{{source=CodeSnippets\CS\API\Telerik\Reporting\CustomCacheProviderSnippets.cs region=CustomCacheProviderImplementation}}
````C#
	
	    public class MyCacheProvider : Telerik.Reporting.Cache.Interfaces.ICacheProvider
	    {
	        public Cache.Interfaces.ICache CreateCache(System.Collections.IDictionary parameters)
	        {
	            return new MyCache(parameters);
	        }
	    }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CustomCacheProviderSnippets.vb region=CustomCacheProviderImplementation}}
````VB
	
	    Public Class MyCacheProvider
	        Implements Telerik.Reporting.Cache.Interfaces.ICacheProvider
	
	        Public Function CreateCache(parameters As IDictionary) As Telerik.Reporting.Cache.Interfaces.ICache Implements ICacheProvider.CreateCache
	            Return New MyCache(parameters)
	        End Function
	
	    End Class
	
````
{{source=CodeSnippets\CS\API\Telerik\Reporting\CustomCacheProviderSnippets.cs region=CustomCacheImplementation}}
````C#
	    
	    public class MyCache : Telerik.Reporting.Cache.Interfaces.ICache
	    {
	        readonly System.Collections.Generic.IDictionary<string, byte[]> cache;
	
	        public MyCache(System.Collections.IDictionary parameters)
	        {
	            // The 'parameters' dictionary is initialized from the Telerik.Reporting/Cache configuration section.
	
	            this.cache = new System.Collections.Generic.Dictionary<string, byte[]>();
	        }
	
	        public bool HasValue(string key)
	        {
	            return this.cache.ContainsKey(key);
	        }
	
	        public byte[] GetValue(string key)
	        {
	            return this.cache[key];
	        }
	
	        public void SetValue(string key, byte[] value)
	        {
	            this.cache[key] = value;
	        }
	
	        public void Clear()
	        {
	            this.cache.Clear();
	        }
	
	        public void Dispose()
	        {
	            this.Clear();
	        }
	    }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CustomCacheProviderSnippets.vb region=CustomCacheImplementation}}
````VB
	
	    Public Class MyCache
	        Implements Telerik.Reporting.Cache.Interfaces.ICache
	
	        ReadOnly cache As System.Collections.Generic.Dictionary(Of String, Byte())
	
	        Public Sub New(parameters As System.Collections.IDictionary)
	
	            ' The 'parameters' dictionary is initialized from the Telerik.Reporting/Cache configuration section.
	
	            Me.cache = New System.Collections.Generic.Dictionary(Of String, Byte())()
	        End Sub
	
	        Public Function HasValue(key As String) As Boolean Implements ICache.HasValue
	            Return Me.cache.ContainsKey(key)
	        End Function
	
	        Public Function GetValue(key As String) As Byte() Implements ICache.GetValue
	            Return Me.cache(key)
	        End Function
	
	        Public Sub SetValue(key As String, value As Byte()) Implements ICache.SetValue
	            Me.cache(key) = value
	        End Sub
	
	        Public Sub Clear() Implements ICache.Clear
	            Me.cache.Clear()
	        End Sub
	
	        Public Sub Dispose() Implements IDisposable.Dispose
	            Me.Clear()
	        End Sub
	    End Class
	
````



To register this new provider set the __provider__  attribute of the "Cache" element to the class name which implements ICacheProvider.           Under "Providers" child element of the "Cache" element, create a "Provider" element with the same __name__            attribute as the __provider__  attribute of the "Cache" element. The __type__  attribute           should be the  [assembly qualified name](http://msdn.microsoft.com/en-us/library/system.type.assemblyqualifiedname.aspx)  of MyCacheProvider type. The following code snippet demonstrates how to configure such custom provider:         

	
````xml
<Telerik.Reporting>
  <Cache provider="MyCacheProvider">
    <Providers>
      <Provider name="MyCacheProvider" type="MyNameSpace.MyCacheProvider, AssemblyName, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
        <Parameters>
          <Parameter />
        </Parameters>
      </Provider>
    </Providers>
  </Cache>
</Telerik.Reporting>
````



# See Also


 * [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})

 * [Configuring the File Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider%})

 * [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})
