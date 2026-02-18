---
title: How to use ObjectDataSource with ExpandoObject
description: Fix The expression contains object 'PropertyName' that is not defined in the current context error when using ObjectDataSource with ExpandoObject
type: how-to
page_title: How to use one ObjectDataSource with multiple properties with ExpandoObject
slug: how-to-use-objectdatasource-with-expandoobject
position:
tags: olapdataengine, databinding
ticketid: 1153025
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

When binding [ObjectDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) to a collection of [ExpandoObject](<https://msdn.microsoft.com/en-us/library/system.dynamic.expandoobject(v=vs.110).aspx>) instances the Reporting engine expects the collection to contain a list of business objects with _known properties_.
As ExpandoObject uses an internal dictionary of string and object (IDictionary<string,object>) to store the dynamically added properties the engine is not able to find them and throws an error:
_"The expression contains object 'PropertyName' that is not defined in the current context"._

## Solution

In order to expose ExpandoObject properties to Reporting engine, a custom TypeDescriptor needs to be provided that will determine the actual properties of the object.

```C#
	public class ExpandoObjectTypeDescriptionProvider : TypeDescriptionProvider
    {
        private static readonly TypeDescriptionProvider m_Default = TypeDescriptor.GetProvider(typeof(ExpandoObject));
        public ExpandoObjectTypeDescriptionProvider()
            :base(m_Default)
        {
        }
        public override ICustomTypeDescriptor GetTypeDescriptor(Type objectType, object instance)
        {
            var defaultDescriptor = base.GetTypeDescriptor(objectType, instance);
            return instance == null ? defaultDescriptor :
                       new ExpandoObjectTypeDescriptor(instance);
        }
    }
	public class ExpandoObjectTypeDescriptor : ICustomTypeDescriptor
    {
        private readonly IDictionary<string,object> m_Instance;
        public ExpandoObjectTypeDescriptor(dynamic instance)
        {
            m_Instance = instance as IDictionary<string, object>;
        }
        public string GetComponentName()
        {
            return TypeDescriptor.GetComponentName(this, true);
        }
        public EventDescriptor GetDefaultEvent()
        {
            return TypeDescriptor.GetDefaultEvent(this, true);
        }
        public string GetClassName()
        {
            return TypeDescriptor.GetClassName(this, true);
        }
        public EventDescriptorCollection GetEvents(Attribute[] attributes)
        {
            return TypeDescriptor.GetEvents(this, attributes, true);
        }
        EventDescriptorCollection ICustomTypeDescriptor.GetEvents()
        {
            return TypeDescriptor.GetEvents(this, true);
        }
        public TypeConverter GetConverter()
        {
            return TypeDescriptor.GetConverter(this, true);
        }
        public object GetPropertyOwner(PropertyDescriptor pd)
        {
            return m_Instance;
        }
        public AttributeCollection GetAttributes()
        {
            return TypeDescriptor.GetAttributes(this, true);
        }
        public object GetEditor(Type editorBaseType)
        {
            return TypeDescriptor.GetEditor(this, editorBaseType, true);
        }
        public PropertyDescriptor GetDefaultProperty()
        {
            return null;
        }
        PropertyDescriptorCollection ICustomTypeDescriptor.GetProperties()
        {
            return ((ICustomTypeDescriptor)this).GetProperties(new Attribute[0]);
        }
        public PropertyDescriptorCollection GetProperties(Attribute[] attributes)
        {
            return new PropertyDescriptorCollection(
                m_Instance.Keys
                          .Select(x => new ExpandoObjectPropertyDescriptor(m_Instance, x))
                          .ToArray<PropertyDescriptor>());
        }
        class ExpandoObjectPropertyDescriptor : PropertyDescriptor
        {
            private readonly IDictionary<string, object> m_Instance;
            private readonly string m_Name;
            public ExpandoObjectPropertyDescriptor(IDictionary<string, object> instance, string name)
                : base(name, null)
            {
                m_Instance = instance;
                m_Name = name;
            }
            public override Type PropertyType
            {
                get { return m_Instance[m_Name].GetType(); }
            }
            public override void SetValue(object component, object value)
            {
                m_Instance[m_Name] = value;
            }
            public override object GetValue(object component)
            {
                return (((IDictionary<string, object>)component))[m_Name];
            }
            public override bool IsReadOnly
            {
                get
                {
                    return false;
                }
            }
            public override Type ComponentType
            {
                get { return null; }
            }
            public override bool CanResetValue(object component)
            {
                return false;
            }
            public override void ResetValue(object component)
            {
            }
            public override bool ShouldSerializeValue(object component)
            {
                return false;
            }
            public override string Category
            {
                get { return string.Empty; }
            }
            public override string Description
            {
                get { return string.Empty; }
            }
        }
    }
```

Custom provider can be attached to a single instance or to all instances of ExpandoObject type:

```C#
//attach to a single instance
dynamic newObj = new ExpandoObject();
TypeDescriptor.AddProvider(new ExpandoObjectTypeDescriptionProvider(), newObj);
//attach to all instances
TypeDescriptor.AddProvider(new ExpandoObjectTypeDescriptionProvider(), typeof(ExpandoObject));
```

## Suggested Workarounds

In case if you want to add a second data item with a second list of ExpandoObjects (having different properties) it shows error: "The expression contains object 'ProperyName' that is not defined in the current context." on the second one.

> The Telerik Reporting engine expects the _ObjectDataSource_ collection to include a list of business objects with _known properties_ and there is no out-of-the-box functionality to contain collection of _ExpandoObject_. So, only the first ExpandoObject properties that are added to a collection would be available in the report to feed the ObjectDataSource.

However, the possible workaround is available by following these steps:

1. Create one ExpandoObject with all properties that would be used later in the report;
2. Add it to a collection (make sure that it is the first item in the collection);
3. Register the ExpandoObject type in the application Main method using the following code:

   ```C#
   TypeDescriptor.AddProvider(new ExpandoObjectTypeDescriptionProvider(), typeof(ExpandoObject));
   ```

4. Bind an ObjectDataSource to the created collection from step 2;
5. In the report create a Data Item with property Visible = false;
6. Set the DataSource of the hidden data item to be the newly created ObjectDataSource.
