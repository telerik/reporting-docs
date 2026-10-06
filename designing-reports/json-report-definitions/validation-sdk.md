---
title: Validating JSON Report Definitions
page_title: Validating Telerik Reporting Definitions with the SDK and Command-Line Tool
description: "Validate Telerik Reporting JSON definitions with the Schema SDK or the ReportDefinitionValidator command-line tool."
slug: json-validation-sdk
tags: telerik, reporting, validation, schema, json, trdj, cli
published: True
position: 2
reportingArea: General
components: [general]
---

# Validating JSON Report Definitions

The `Telerik.Reporting.Schema` package includes APIs for validating JSON for Telerik Reporting model types. These APIs can be used to validate JSON fragments generated or modified with AI assistance before they are incorporated into a report definition. For complete `.trdj` report definitions, Telerik Reporting also includes the `ReportDefinitionValidator.exe` command-line tool. For an overview of the schemas used during validation, see [JSON Schema for Telerik Reporting Types](slug:json-schema).

## Validating in a .NET Application

The `ReportSchemaService` class provides APIs for validating Telerik Reporting JSON definitions against the corresponding reporting-model schemas. Validation can be performed either against the root object only or recursively against all nested reporting types contained within the definition.

### Available Methods

The validation API provides both shallow and recursive validation options:

| Method | Scope | Description |
| --- | --- | --- |
| `Validate(string typeName, string jsonDefinition)` | Top-level validation | Validates the root properties of the JSON definition against the schema of the specified model type. Does not recursively validate nested objects. |
| `Validate(Type type, string jsonDefinition)` | Top-level validation | Overload that accepts the target `Type` reference instead of a string name. |
| `ValidateDeep(string typeName, string jsonDefinition)` | Deep validation | Recursively validates all child objects and collection items against their respective schemas. |
| `ValidateDeep(Type type, string jsonDefinition)` | Deep validation | Overload that accepts the target `Type` reference instead of a string name. |

Both methods return **JSON text** containing an `isValid` boolean flag and an `errors` array.

### Validation Example

The following C# example validates a JSON `TextBox` definition and prints the result:

```csharp
using Telerik.Reporting.Schema;

string textBoxDefinitionJson = """
{
  "NetType": "TextBox",
  "Width": "2.16in",
  "Height": "0.22in",
  "Left": "8.25in",
  "Top": "0.22in",
  "Value": "Quarterly Sales Summary",
  "Name": "textBox6",
  "Style": {
    "Color": "195, 47, 11",
    "TextAlign": "Right",
    "Font": {
      "Name": "Segoe UI"
    }
  }
}
""";

// Example result for a valid definition: {"isValid":true,"errors":[]}
Console.WriteLine(ReportSchemaService.ValidateDeep("TextBox", textBoxDefinitionJson));
```

### Result Format and Error Keywords

An accepted definition returns the following JSON result:

```json
{"isValid":true,"errors":[]}
```

When validation fails, `isValid` is `false`. Each entry in `errors` contains a `path` to the affected JSON value, a `keyword` that identifies the check, and a diagnostic `message`. For example, an unsupported property can produce an error like this:

```json
{
  "isValid": false,
  "errors": [
    {
      "path": "/NonExistentProperty",
      "keyword": "additionalProperties",
      "message": "Property 'NonExistentProperty' is not allowed."
    }
  ]
}
```

The following table lists common error keywords returned by the validator:

| Keyword | Condition |
| --- | --- |
| `additionalProperties` | The definition contains a property not defined in the schema, such as an unrecognized or hallucinated property name. |
| `required` | A mandatory property is missing from the definition, such as `NetType` or a required item property. |
| `type` | A property value does not match the expected JSON data type. |
| `enum` | A property value does not match any of the allowed enumeration strings. |
| `tool` | The input string is malformed JSON or names an unknown Reporting model type. |
| `deserialize` | Schema checks succeeded, but the definition failed .NET deserialization into a runtime Telerik Reporting component. |

License failures and invalid API arguments raise exceptions rather than returning validation error objects. Handle exceptions separately from an `isValid: false` result.

## Validating Report Files from the Command Line

The Telerik Reporting installer places `ReportDefinitionValidator.exe` in the `Tools` folder under the product installation directory. By default, the executable is located at `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Tools`.

The executable accepts one or more file paths, directories, or glob patterns. Only `.trdj` report files are validated.

Directory inputs are searched recursively. Glob patterns support `*`, `?`, and `**`.

For example, run the following commands from the `Tools` directory:

```powershell
.\ReportDefinitionValidator.exe '.\reports\monthly.trdj'
.\ReportDefinitionValidator.exe '.\reports' '.\archive\**\*.trdj'
.\ReportDefinitionValidator.exe --help
```

The first command validates a single report file. The second validates all `.trdj` files found under a directory and those that match a recursive glob pattern. The `--help` option displays usage information without validating inputs.

### Reading the Results

The tool returns one of the following process exit codes:

| Exit code | Meaning |
| --- | --- |
| `0` | All matched reports are valid, or help was requested. Valid reports produce no output. |
| `1` | A report failed validation, could not be read, or could not be processed. |
| `2` | An input was invalid, no arguments were supplied, or an input matched no `.trdj` files. |

Invalid reports are printed to standard output as a path followed by the validation JSON result. Input errors are printed to standard error. File-reading and validation-processing errors are also printed to standard error. If one input is invalid, the final exit code is `2` even when a different matched report fails validation.

## See Also

* [Editing and Validating Existing JSON Reports with an AI Skill](slug:validate-ai-generated-json-report-definitions)
* [JSON Schema for Telerik Reporting Types](slug:json-schema)
* [Serializing and Deserializing Report Definitions](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml)
