---
title: Constants
page_title: Constants at a Glance
description: "Learn more about the built-in Constants in Telerik Reporting and how you may use them in report expressions."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/constants
tags: constants,expression,report,built-in
published: True
position: 1
previous_url: /expressions-constants
reportingArea: General
components: [general]
---

# Constants Overview

## Built-in constants

`False` , `True` , `null`.

## Telerik Reporting Constants

The report expression context registers the following enum types. Use an enum member in an expression as `=EnumType.Member`.

| Enum                 | Members                                                                             | Purpose                                                          |
| -------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `AccessibleRoles`    | `Ignored`                                                                           | Excludes an item and its descendants from the accessibility tree |
| `AnchoringStyles`    | `None`, `Top`, `Bottom`, `Left`, `Right`                                            | Anchors an item to its container edges                           |
| `BackgroundRepeat`   | `NoRepeat`, `RepeatX`, `RepeatY`, `Repeat`                                          | Sets how a background image repeats                              |
| `BorderType`         | `None`, `Solid`, `Dotted`, `Dashed`, `Double`, `Groove`, `Ridge`, `Inset`, `Outset` | Sets a border line type                                          |
| `DockingStyle`       | `None`, `Top`, `Bottom`, `Left`, `Right`, `Fill`                                    | Docks an item to its container edges                             |
| `HorizontalAlign`    | `Left`, `Center`, `Right`, `Justify`                                                | Sets horizontal text alignment                                   |
| `ImageSizeMode`      | `AutoSize`, `Center`, `Normal`, `Stretch`, `ScaleProportional`                      | Sets how an image fits in its item                               |
| `ImageRotation`      | `None`, `Auto`, `Rotate90`, `Rotate180`, `Rotate270`                                | Sets image rotation                                              |
| `LineStyle`          | `Solid`, `Dashed`, `Dotted`                                                         | Sets the appearance of a line item                               |
| `PageBreak`          | `None`, `Before`, `After`, `BeforeAndAfter`                                         | Sets page breaks around a report section                         |
| `PageNumberingStyle` | `Restart` (obsolete), `ResetNumbering`, `ResetNumberingAndCount`, `Continue`        | Controls page numbering in a report book                         |
| `VerticalAlign`      | `Top`, `Middle`, `Bottom`                                                           | Sets vertical text or object alignment                           |

> note The `PageNumberingStyle.Restart` member is obsolete. Use `PageNumberingStyle.ResetNumbering` instead.

## Literal text

In an expression, literal text is text that is enclosed in single or double quotation marks.

Example:

`="Product name: " + Fields.ProductName`

or

`='Product name: ' + Fields.ProductName`

> note Because quotation marks are special characters inside the literal text, you need to double the quotation mark to escape it. Other option is to use the other quotation marks as literal delimiters (then our quotation mark will not be a special symbol). The following table shows some examples of quotation mark combinations in an expression and their result:

| Expression          | Result           |
| ------------------- | ---------------- |
| 'It''s my birthday' | It's my birthday |
| "It""s my birthday" | It"s my birthday |
| 'It"s my birthday'  | It"s my birthday |
| "It's my birthday"  | It's my birthday |

Some report item properties allow the usage of [ Embedded Expressions ](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions), which provide easy concatenation of string literals with expression terms.

## Numeric constants

They are resolved to:

- `Integer` if decimal point is not used - for example `1`, `256`, `65000`
- `Decimal` if decimal point is used - for example `1.0`, `25.6`

Example:

`= Fields.LineTotal < 100`

## Date-time constants

`Date` values should be enclosed within pound signs `#`.

Example:

`=Fields.Birthdate < #1/31/82#`
