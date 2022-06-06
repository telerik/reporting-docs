---
title: Using external assemblies with custom CLR objects in the Report Designer
description: Add you own user functions or bind to custom CLR object, data models or custom external assemblies in Telerik Report Designer. 
type: how-to
page_title: Use custom user functions from external assemblies in the Report Designer
slug: how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer
res_type: kb
category: knowledge-base
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>All</td>
		</tr>
	</tbody>
</table>


## Description  
This article provides required steps to use external assemblies with custom user functions in Telerik Report Designer.

It is a common requirement to add your own <a href="/expressions-user-functions" target="_blank">User Functions</a> or bind to custom CLR objects, data models (such as an OpenAccess ORM model), external assemblies with custom data source objects, data feeds (including OData) and web services.

## Solution 
In order to expose your data, so it can be utilized by the Object/OpenAccess/Entity <a href="/connecting-to-data-data-source-components" target="_blank">data source components</a>, or extend the default behavior of the Telerik Reporting engine with custom user functions, you have to use the <a href="/configuring-telerik-reporting-assemblyreferences" target="_blank">AssemblyReferences Element</a> of the Telerik.Reporting configuration section to reference your custom assembly.

### Create an Assembly with Custom User Functions
The steps below can be used as an example on how to create an assembly with custom user functions. We will use this assembly in the following sections of the current article.
1. Open Visual Studio and create a new Class Library project named MyAssembly.
2. Add a reference to Telerik.Reporting.dll. When the assembly is used in the Report Designer its version will be resolved according to the Report Designer version of Telerik Reporting assemblies.
3. Create your custom objects:

````C#
namespace MyAssembly
{
    using System.Collections;
    using System.Collections.Generic;
  
    public class Car
    {
        string model;
        int year;
  
        public Car(string model, int year)
        {
            this.model = model;
            this.year = year;
        }
  
        public string Model
        {
            get { return this.model; }
            set { this.model = value; }
        }
  
        public int Year
        {
            get { return this.year; }
            set { this.year = value; }
        }
    }
  
    public class Cars : List<Car>
    {
        public Cars()
        {
            Car car;
            car = new Car("Honda NSX GT", 2003);
            this.Add(car);
  
            car = new Car("Nissan Skyline R34 GT-R", 2005);
            this.Add(car);
        }
    }
}
````
````VB
Imports System.Collections
Imports System.Collections.Generic
 
Public Class Car
    Private m_model As String
    Private m_year As Integer
 
    Public Sub New(model As String, year As Integer)
        Me.m_model = model
        Me.m_year = year
    End Sub
 
    Public Property Model() As String
        Get
            Return Me.m_model
        End Get
        Set(value As String)
            Me.m_model = value
        End Set
    End Property
 
    Public Property Year() As Integer
        Get
            Return Me.m_year
        End Get
        Set(value As Integer)
            Me.m_year = value
        End Set
    End Property
End Class
 
Public Class Cars
    Inherits List(Of Car)
    Public Sub New()
        Dim car As Car
        car = New Car("Honda NSX GT", 2003)
        Me.Add(car)
 
        car = New Car("Nissan Skyline R34 GT-R", 2005)
        Me.Add(car)
    End Sub
End Class
````

4. Build your project.

### Extend the Report Designer Configuration
Once the assembly with our custom logic is built, it should be placed in the folder or a subfolder of the Report Designer executable file. The default installation folder is "C:\Program Files (x86)\Telerik\Reporting QX XXXX\Report Designer" ("C:\Program         Files\Telerik\Reporting QX XXXX\Report Designer" on 32 bit machines), where QX XXXX stands for the release version and year, e.g Q1 2021.

1. Locate Telerik Report Designer executable and its configuration file on your machine (**Telerik.ReportDesigner.exe** and **Telerik.ReportDesigner.exe.config**)
2. Place MyAssembly.dll into the folder or a subfolder of where **Telerik.ReportDesigner.exe** resides.
  
![MyAssembly.dll](./resources/myAssembly.png)  

3. Open the Report Designer’s configuration file with a text editor and navigate to the \<AssemblyReferences\> element.
4. Uncomment the section and change the name attribute to MyAssembly. Notice that the assembly is referred only by its name without specifying the extension:

```
<!-- Add assembly references -->
  
<!--
<Telerik.Reporting>
    <AssemblyReferences>
        <add name="MyAssembly" version="1.0.0.0" />
    </AssemblyReferences>
</Telerik.Reporting>
-->
```

> Note
> <br>
> Additionally you can add culture and publicKeyToken attributes to identify the assembly in the \<add\> element if necessary.

A possible configuration extending the Report Designer with the functionality in MyAssembly.dll assembly.

````
<configuration>
  ...
    <runtime>
        <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
            <probing privatePath="MySubDir; MySubDir\SubDir"/>
        </assemblyBinding>
    </runtime>
 
    <Telerik.Reporting>
        <AssemblyReferences>
            <add name="MyAssembly" version="1.0.0.0"/>
        </AssemblyReferences>
    </Telerik.Reporting>
  ...
</configuration>
````

The Report Designer will look for MyAssembly.dll in its own folder (i.e. where the Telerik.ReportDesigner.exe resides) and in MySubDir and MySubDir\SubDir (using the specified relative paths in the <a href="http://msdn.microsoft.com/en-US/library/823z9h8w%28v=vs.80%29" target="_blank">.NET \<probing\> element</a>).
5. Reopen the Report Designer and explore the extended functionality

![Use object from MyAssembly.dll](./resources/useObjectFromMyAssembly.png)

### Use Assembly Located in non-Relative Path
Telerik.Reporting AssemblyReferences section is trying to load the assemblies according the .NET rules. Thus, in order to use a signed assembly located in directory different from the application directory or GAC, you have to add dependentAssembly section to point the .NET framework where to look for your assembly. For more information check out the <a href="https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/codebase-element" target="_blank">CodeBase Element</a> MSDN article.

## Notes
If the external assembly extending the Report Designer depends on other assemblies, all related assemblies have to be placed in the folder where the Report Designer is located.

In order to deploy report that uses external assembly check out the KB article - <a href="/knowledge-base/deploying-trdx-(xml-report-definition)-that-uses-external-assembly" target="_blank">Deploying trdx (XML report definition) that uses external assembly</a>.
