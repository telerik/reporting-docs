---
title: How to Bind to a BusinessObject
page_title: How to Bind to a BusinessObject | for Telerik Reporting Documentation
description: How to Bind to a BusinessObject
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject
tags: how,to,bind,to,a,businessobject
published: True
position: 0
---

# How to Bind to a BusinessObject

The following code sample illustrates a custom middle-tier business object that can be used with an __ObjectDataSource__ component that specifies a strongly typed source object. 

## Remarks

The business object exposes several methods which return different data types. They represent only part of the data types which are supported by __Telerik Reporting__ and can be used to feed an item with data. Additionally, methods with arguments are implemented which can be also invoked from the __ObjectDataSource__ component. When the data method contains parameters the __Parameters__ collection of the __ObjectDataSource__ should be used to pass values to them at runtime. To successfully invoke the data method, the parameters number, their names and types should match. The order of the parameters in the __Parameters__ collection is not important. If there is a discrepancy between __ObjectDataSource__ parameters and the method parameters you will receive a runtime exception that the method cannot be resolved. 

The business object is marked with the __DataObjectAttribute__ which indicates that the object is suitable for data binding. Objects marked with this attribute will be shown in the __ObjectDataSource__ wizard when "*Show only data components*" checkbox is checked. Respectively the methods used for data retrieval are marked with the __DataObjectMethod__ attribute. 

## Example

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToBusinessObjectSnippet}}
````C#
class Product
{
    public string Name { get; set; }
    public string ProductNumber { get; set; }
    public decimal ListPrice { get; set; }
    public int ProductModelID { get; set; }
    public string Color { get; set; }
}

[DataObject]
class Products
{
    const string SelectCommandText =
            "SELECT Name, ProductNumber, ListPrice, ProductModelID, Color" +
            "  FROM Production.Product" +
            "  WHERE ProductModelID is not NULL" +
            "    AND Color is not NULL";

    const string ConnectionString =
            "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataTable GetDataTableSource()
    {
        DataTable dataTable = new DataTable();
        SqlDataAdapter dataAdapter;
        using (dataAdapter = new SqlDataAdapter(SelectCommandText, ConnectionString))
        {
            dataAdapter.Fill(dataTable);
        }
        return dataTable;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public IDataAdapter GetDataAdapterSource()
    {
        return new SqlDataAdapter(SelectCommandText, ConnectionString);
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataView GetDataViewSource(string name)
    {
        SqlDataAdapter dataAdapter = new SqlDataAdapter(SelectCommandText, ConnectionString);
        DataTable dataTable = new DataTable();

        dataAdapter.Fill(dataTable);

        DataView dataView = dataTable.DefaultView;
        dataView.RowFilter = string.Format("Name like '%{0}%'", name);

        return dataView;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public Product[] GetArraySource()
    {
        return this.GetAllProducts().ToArray();
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public ArrayList GetArrayListSource()
    {
        ArrayList arrayList = new ArrayList();
        foreach (var product in this.GetAllProducts())
        {
            arrayList.Add(product);
        }
        return arrayList;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Product> GetAllProducts()
    {
        SqlConnection connection = new SqlConnection(ConnectionString);
        SqlCommand command = new SqlCommand(SelectCommandText, connection);
        SqlDataReader reader = null;
        List<Product> products = new List<Product>();

        try
        {
            connection.Open();

            reader = command.ExecuteReader();

            while (reader.Read())
            {
                products.Add(new Product()
                {
                    Name = reader.GetString(0),
                    ProductNumber = reader.GetString(1),
                    ListPrice = reader.GetDecimal(2),
                    ProductModelID = reader.GetInt32(3),
                    Color = reader.GetString(4)
                });
            }
        }
        catch
        {
            // Handle exception.
        }
        finally
        {
            if (reader != null)
            {
                reader.Close();
            }
            connection.Close();
        }
        return products;
    }

    // Gets products bellow a specified max price.
    [DataObjectMethod(DataObjectMethodType.Select)]
    public IList<Product> GetProducts(decimal maxPrice)
    {
        return this.GetAllProducts().FindAll(product => product.ListPrice <= maxPrice);
    }

    // Gets products of specific model and a color.
    [DataObjectMethod(DataObjectMethodType.Select)]
    public IList<Product> GetProducts(int productModelID, string color)
    {
        return this.GetAllProducts().FindAll(product => (product.ProductModelID == productModelID && product.Color == color));
    }
}

void Form1_Load(object sender, EventArgs e)
{
    // Creating and configuring the ObjectDataSource component:
    var objectDataSource = new Telerik.Reporting.ObjectDataSource();
    objectDataSource.DataSource = typeof(Products); // Specifying the business object type
    objectDataSource.DataMember = "GetProducts"; // Specifying the name of the data object method
    objectDataSource.CalculatedFields.Add(new Telerik.Reporting.CalculatedField("FullName", typeof(string), "=Fields.Name + ' ' + Fields.ProductNumber")); // Adding a sample calculated field.

    // Specify the parameters, their types and values
    objectDataSource.Parameters.Add(new Telerik.Reporting.ObjectDataSourceParameter("color", typeof(string), "Silver"));
    objectDataSource.Parameters.Add(new Telerik.Reporting.ObjectDataSourceParameter("productModelID", typeof(int), 23));

    // Creating a new report
    var report = new Report1();

    // Assigning the ObjectDataSource component to the DataSource property of the report.
    report.DataSource = objectDataSource;

    // Use the InstanceReportSource to pass the report to the viewer for displaying
    var reportSource = new Telerik.Reporting.InstanceReportSource();
    reportSource.ReportDocument = report;

    // Assigning the report to the report viewer.
    reportViewer1.ReportSource = reportSource;

    // Calling the RefreshReport method in case this is a WinForms application.
    reportViewer1.RefreshReport();
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToBusinessObjectSnippet}}
````VB
Class Product
    Dim mName As String
    Dim mProductNumber As String
    Dim mListPrice As Decimal
    Dim mProductModelID As Integer
    Dim mColor As String

    Public Property Name() As String
        Get
            Return mName
        End Get
        Set(ByVal value As String)
            mName = value
        End Set
    End Property
    Public Property ProductNumber() As String
        Get
            Return mProductNumber
        End Get
        Set(ByVal value As String)
            mProductNumber = value
        End Set
    End Property
    Public Property ListPrice() As Decimal
        Get
            Return mListPrice
        End Get
        Set(ByVal value As Decimal)
            mListPrice = value
        End Set
    End Property
    Public Property ProductModelID() As Integer
        Get
            Return mProductModelID
        End Get
        Set(ByVal value As Integer)
            mProductModelID = value
        End Set
    End Property
    Public Property Color() As String
        Get
            Return mColor
        End Get
        Set(ByVal value As String)
            mColor = value
        End Set
    End Property
End Class

<DataObject()>
Class Products
    Const SelectCommandText As String = "SELECT Name, ProductNumber, ListPrice, ProductModelID, Color" + "  FROM Production.Product" + "  WHERE ProductModelID is not NULL" + "    AND Color is not NULL"

    Const ConnectionString As String = "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Function GetDataTableSource() As DataTable
        Dim dataTable = New DataTable()
        Using dataAdapter = New SqlDataAdapter(SelectCommandText, ConnectionString)
            dataAdapter.Fill(dataTable)
        End Using
        Return dataTable
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Function GetDataAdapterSource() As IDataAdapter
        Return New SqlDataAdapter(SelectCommandText, ConnectionString)
    End Function

    <DataObjectMethod(DataObjectMethodType.[Select])>
    Public Function GetDataViewSource(ByVal name As String) As DataView
        Dim dataAdapter = New SqlDataAdapter(SelectCommandText, ConnectionString)
        Dim dataTable = New DataTable()

        dataAdapter.Fill(dataTable)

        Dim dataView = dataTable.DefaultView
        dataView.RowFilter = String.Format("Name like '%{0}%'", name)

        Return dataView
    End Function

    <DataObjectMethod(DataObjectMethodType.[Select])>
    Public Function GetArraySource() As Product()
        Return Me.GetAllProducts().ToArray()
    End Function

    <DataObjectMethod(DataObjectMethodType.[Select])>
    Public Function GetArrayListSource() As ArrayList
        Dim arrayList As New ArrayList()
        For Each product In Me.GetAllProducts()
            arrayList.Add(product)
        Next
        Return arrayList
    End Function

    <DataObjectMethod(DataObjectMethodType.[Select])>
    Public Function GetAllProducts() As List(Of Product)
        Dim connection As New SqlConnection(ConnectionString)
        Dim command As New SqlCommand(SelectCommandText, connection)
        Dim reader As SqlDataReader = Nothing
        Dim products As New List(Of Product)()
        Try
            connection.Open()
            reader = command.ExecuteReader()
            While reader.Read()
                Dim product As New Product()
                product.Name = reader.GetString(0)
                product.ProductNumber = reader.GetString(1)
                product.ListPrice = reader.GetDecimal(2)
                product.ProductModelID = reader.GetInt32(3)
                product.Color = reader.GetString(4)
                products.Add(product)
            End While
            ' Handle exception.
        Catch ex As SqlException
        Finally
            If Not reader Is Nothing Then
                reader.Close()
            End If
            connection.Close()
        End Try
        Return products
    End Function

    ' Gets products bellow a specified max price.
    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Function GetProducts(ByVal maxPrice As Decimal) As IList(Of Product)
        Return Me.GetAllProducts().FindAll(Function(product) product.ListPrice <= maxPrice)
    End Function

    ' Gets products of specific model and a color.
    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Function GetProducts(ByVal productModelID As Integer, ByVal color As String) As IList(Of Product)
        Return Me.GetAllProducts().FindAll(Function(product) (product.ProductModelID = productModelID AndAlso product.Color = color))
    End Function
End Class

Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

    ' Creating and configuring the ObjectDataSource component:
    Dim objectDataSource As New Telerik.Reporting.ObjectDataSource()
    objectDataSource.DataSource = GetType(Products) ' Specifying the business object type
    objectDataSource.DataMember = "GetProducts" ' Specifying the name of the method for retrieving the data
    objectDataSource.CalculatedFields.Add(New Telerik.Reporting.CalculatedField("FullName", GetType(String), "=Fields.Name + ' ' + Fields.ProductNumber")) ' Adding a sample calculated field.


    'Specifying the parameters, their types and values that should be passed to the method at runtime
    objectDataSource.Parameters.Add(New Telerik.Reporting.ObjectDataSourceParameter("color", GetType(String), "Silver"))
    objectDataSource.Parameters.Add(New Telerik.Reporting.ObjectDataSourceParameter("productModelID", GetType(Integer), 23))

    'Creating a new report
    Dim report As New Report1()

    ' Assigning the ObjectDataSource component to the DataSource property of the report.
    report.DataSource = objectDataSource

    ' Use the InstanceReportSource to pass the report to the viewer for displaying.
    Dim reportSource As New InstanceReportSource
    reportSource.ReportDocument = report

    ' Assigning the report to the report viewer.
    reportViewer1.ReportSource = reportSource

    ' Calling the RefreshReport method in case this is a WinForms application.
    reportViewer1.RefreshReport()

End Sub
````

