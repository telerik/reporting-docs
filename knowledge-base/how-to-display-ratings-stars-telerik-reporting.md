---
title: Displaying Ratings with Stars in Telerik Report Designer Using JSON Data
description: Learn how to visually represent ratings by stars in Telerik Reporting using data from a JSON data source.
type: how-to
page_title: How to Show Ratings by Stars in Reports
slug: how-to-display-ratings-stars
tags: reporting, telerik, json, data source, conditional formatting, shape, list, parameters
res_type: kb
ticketid: 1684841
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Progress® Telerik® Reporting</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>18.2.24.806</td>
        </tr>
    </tbody>
</table>

## Description

The requirement is to display ratings in a Telerik Report using stars, based on data sourced from JSON. The goal is to visually represent ratings between 1 and 5 stars, where the number of stars is determined by the data. This knowledge base article also answers the following questions:
* How to use JSON data to display ratings in a report?
* How to use shapes for visual representation in Telerik Reporting?

## Solution

To display ratings by stars using a JSON data source in Telerik Reporting, follow these steps:

1. **Prepare the JSON Data Source**: Use the following sample JSON structure as the data source for the report:

    ```json
    [
        { "product": "Product A", "rating": 4 },
        { "product": "Product B", "rating": 5 },
        { "product": "Product C", "rating": 3 }
    ]
    ```

2. **Create Report Parameters**: Define three report parameters: `MinRating`, `MaxRating`, and `RatingDataPoints`.
    * `MinRating` (integer) and `MaxRating` (integer) determine the range of the ratings. For a 5-star rating system, set `MinRating` to 0 and `MaxRating` to 4.
    * `RatingDataPoints` uses the expression `= Space(CInt(Parameters.MaxRating.Value))` to generate a string with spaces equal to the maximum rating, which will later be split into individual elements for each star.

3. **Add a List to the Detail Section**: Insert a [List]({%slug table_template_items%}) in the detail section of the report and bind it with the expression `= Split(" ", Parameters.RatingDataPoints.Value)`.

4. **Insert a Star Shape**: Within the list, add a [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%}), and set its `ShapeType` property to a star.

5. **Apply Conditional Formatting**: To visually represent the actual ratings, apply conditional formatting to the star shapes. This step involves comparing each item's rating against the row number to determine whether the star should be filled or not.

6. **Utilize Functions**: The solution makes use of several Telerik Reporting functions, including `Space()`, `CInt()`, and `Split()`, for manipulating data and bindings. More about these functions can be found in the [Telerik Reporting Functions Reference]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/overview%}).

By following these steps, you create a visual representation of ratings using stars based on JSON data in Telerik Reporting. This approach can be customized to suit different rating scales and visual preferences.

## Sample Report

* [RatingStars.trdp](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/RatingStars/RatingStars.trdp)
