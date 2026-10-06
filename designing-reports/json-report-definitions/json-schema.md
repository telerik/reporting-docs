---
title: JSON Schema for Telerik Reporting Types
page_title: JSON Schema for Telerik Reporting Types
description: "Install Telerik.Reporting.Schema and retrieve per-type JSON schemas for Telerik Reporting types."
slug: json-schema
tags: telerik, reporting, schema, json, trdj, validation
published: True
position: 1
reportingArea: General
components: [general]
---

# JSON Schema for Telerik Reporting Types

The `Telerik.Reporting.Schema` package provides APIs for retrieving JSON schemas that describe Telerik Reporting model types as they appear in JSON report definitions. Telerik Reporting stores JSON report definitions in `.trdj` files; see [Report Definition](slug:on-telerik-reporting#report-definition) for an overview of the supported report-definition formats. Each schema describes a specific Reporting type, including its properties, supported values, and relationships to other Reporting types.

These schemas are primarily intended to support AI-assisted interactions with report definitions. For example, when an LLM is analyzing or modifying an existing report, it can retrieve the schema for a report item to determine which properties, values, and nested reporting elements are supported. This allows the model to validate its assumptions against the actual Telerik Reporting model instead of relying on guesses or incomplete context.

The package also provides validation APIs, which are covered in [Validating JSON Report Definitions](slug:json-validation-sdk).

## Installing the Schema Package

To retrieve schemas for Telerik Reporting model types or validate report definitions, you will need to install the `Telerik.Reporting.Schema` NuGet package in your project.

The following command adds the package with the .NET CLI:

```bash
dotnet add package Telerik.Reporting.Schema
```

The package requires an active Telerik Reporting subscription or trial license. If you haven't already, configure a license key by following [Setting Up Your Telerik Reporting License Key](slug:license-key). Calls to the schema retrieval and validation APIs throw an `InvalidOperationException` if a valid trial or subscription license is not available.

### Supported Target Frameworks

The `Telerik.Reporting.Schema` package supports the following target frameworks:

| Target framework | Supported applications |
| --- | --- |
| `net462` | .NET Framework 4.6.2 and later. |
| `netstandard2.0` | Applications compatible with .NET Standard 2.0. For supported .NET versions, see [Telerik Reporting system requirements](slug:system-requirements). |

To ensure compatibility between the schema APIs and the Telerik Reporting model used by your application, use the same version of `Telerik.Reporting.Schema` and `Telerik.Reporting`. Keeping the package versions aligned helps ensure that retrieved schemas accurately reflect the available reporting types, properties, and serialization behavior.

## Retrieving Schemas with the SDK

The `ReportSchemaService` class provides APIs for discovering supported Telerik Reporting model types and retrieving their JSON schemas. Each schema describes a specific reporting type and its supported properties.

Schemas are retrieved on a per-type basis. The service does not return a combined schema for an entire report definition or automatically expand the schemas of nested reporting types. Related types can instead be discovered and retrieved separately as needed.

### Retrieve a Schema

Use the `GetSchema` method to retrieve the JSON Schema document for a supported Telerik Reporting model type.

| Method | Description |
| --- | --- |
| `GetSchema(string typeName)` | Returns the Draft 2020-12 JSON Schema document for the specified Reporting model type as JSON text. Accepts either a short name, such as `Graph` or `TextBox`, or a fully qualified name, such as `Telerik.Reporting.Graph`. Matching is case-insensitive. |
| `GetSchema(Type type)` | Returns the Draft 2020-12 JSON Schema document for the specified `Type` instance as JSON text. |

The following example retrieves the schema for `TextBox`:

```csharp
string textBoxSchemaJson = ReportSchemaService.GetSchema("TextBox");
Console.WriteLine(textBoxSchemaJson);
```

### Discover Supported Types

If you do not know the name of the reporting type whose schema you want to retrieve, use the discovery APIs to enumerate the Telerik Reporting model types supported by the installed Reporting version.

The following methods can be used to discover the supported types:

| Method | Description |
| --- | --- |
| `GetKnownTypes()` | Returns the Reporting `Type` objects available for schema retrieval. |
| `GetKnownTypeNames()` | Returns the full CLR names of the Reporting types available for schema retrieval. |

The following example prints the first five type names returned by `GetKnownTypeNames()`:

```csharp
using System;
using System.Linq;
using Telerik.Reporting.Schema;

var availableTypeNames = ReportSchemaService.GetKnownTypeNames();

foreach (string typeName in availableTypeNames.Take(5))
{
    Console.WriteLine(typeName);
}
```

## Understanding the Retrieved Schema

Each schema returned by `ReportSchemaService` describes a single Telerik Reporting model type. The schema uses standard JSON Schema keywords to describe properties, value types, constraints, and validation rules.

In addition to standard JSON Schema constructs, Telerik Reporting adds custom annotations that describe relationships between reporting types. These annotations can be used to discover related reporting types and retrieve their schemas separately when additional information is needed.

The following table summarizes the most common standard JSON Schema keywords and Telerik-specific annotations that appear in retrieved schemas:

| Keyword or annotation | Meaning |
| --- | --- |
| `type`, `properties`, `items`, `required`, `const`, and `enum` | Standard JSON Schema keywords that describe JSON values, object properties, array items, requirements, and allowed values. |
| `description` | A standard JSON Schema annotation that provides descriptive text about a property or type. |
| `x-netType` | A Reporting-specific annotation that identifies the Telerik Reporting type associated with a nested object or collection item. |
| `x-netType-oneOf` | A Reporting-specific annotation that lists multiple Telerik Reporting types that may be used for a nested object or collection item. It is not equivalent to the standard JSON Schema `oneOf` keyword. |

For example, the following excerpt shows a simplified portion of the schema returned for the `Graph` reporting type:

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  ...
  "properties": {
    "NetType": {
      "type": "string",
      "const": "Graph"
    },
    ...
    "ColorPalette": {
      "type": "object",
      "x-netType-oneOf": [
        {
          "type": "ColorPalette"
        },
        {
          "type": "GradientPalette"
        },
        {
          "type": "MonochromaticPalette"
        }
      ]
    },
    ...
  },
  "required": [
    ...
  ]
}
```

The standard JSON Schema `type` keyword indicates that the `ColorPalette` property is represented as a JSON object.

As shown in the example above, the `x-netType-oneOf` annotation indicates that the `ColorPalette` property can contain a `ColorPalette`, `GradientPalette`, or `MonochromaticPalette` object. The schema for each of these types can be retrieved separately with `GetSchema`.

The `x-netType-oneOf` annotation lists the reporting types supported by the `ColorPalette` property. If the property contains a `GradientPalette`, its `NetType` value will be `GradientPalette`. Likewise, a `ColorPalette` object uses `ColorPalette` as its `NetType` value.

## See Also

* [AI-Assisted JSON Report Editing](slug:validate-ai-generated-json-report-definitions)
* [Validating JSON Report Definitions](slug:json-validation-sdk)
* [Serializing and Deserializing Report Definitions](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml)
* [Graph API reference](/api/telerik.reporting.graph)
* [Style API reference](/api/telerik.reporting.drawing.style)
* [Unit API reference](/api/telerik.reporting.drawing.unit)
