---
title: Grouping Data Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview
tags: overview
published: True
position: 0
---

# Grouping Data Overview



In Telerik Reporting, data items can aggregate and summarize data, display         it in visual hierarchies or create different views, thus helping the user/         decision maker understand and analyze data in a more efficient manner.       

## 

In Telerik Reporting, groups are named sets of data that are bound to           a data item. You specify groups by defining their names and grouping           criteria (expression).         

To create a grouping expression you add Grouping objects to the           __Grouping__  collection. The set of group           expressions can be a single data field reference or a combination of           multiple expressions. At runtime, group expressions are combined and           applied together to the data.         

Depending on the grouping expressions, groups may be static,           dynamic or detail:         

* __Static groups__  are defined by empty (no)               expression or expression that evaluates to the same value,               disregarding the data (ex.: =1 + 2). Static groups always produce               a single member that contains all the data.             

* __Dynamic groups__  are defined by expressions               that produce different results according to the current data               (ex.: =Fields.County). This way the items of the data source are               partitioned into groups according to the values of the grouping               expressions.             

* __Details groups__  are defined by a single               __Grouping__  object that has no expression               (empty __Grouping__ ) and produce one member               for each item of the data source. Detail groups can be applied to               __Table__ , __Crosstab__                or __List__  items; *for backwards compatibility reasons, the Report item treats the detail groups as static groups* .             

Groups support filtering and sorting that allows you to limit and order           the members of the group according to your needs. For more information see           [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) and           [Ordering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%}).         

Groups are internally organized as members of one or more hierarchies           for each data item. A group hierarchy has parent/child groups that are           nested and can have adjacent groups. As groups have names, the group           hierarchy defines the named scope hierarchy for the report items and           expressions.         

Data items support groups in different manner according to their           structure and application. The following list summarizes how the data           items work with groups:         

* __Report__  – Report groups are defined by               adding __Group__  objects to the report’s               __Groups__  collection. Report groups are               always nested according to the order in the __Groups__  collection. To display group data one should use the               __GroupHeaderSection__  and __GroupFooterSection__  that appear once for each group               member, respectively at start and end. The __DetailSection__  displays detail data in a report and always appears               inside the innermost group (if any).             

* __Table item__  – If you think of the parent/               child groups as a tree structure, each group hierarchy is a forest               of tree structures. The __Table__  data item               includes row and column group hierarchies. Data associated with               row group members expand horizontally across the page and data               associated with column group members expand vertically down the               page. __The Group Explorer__  tool window               displays row group and column group members for the currently               selected __Table__  data item on the design               surface. To create a group one should create a __TableGroup__  object and add it to the corresponding               group hierarchy. According to their different specialization the               three derivatives of the __Table__  item works               with groups in different manner:               

* 

__Table__  – define nested row groups                     and adjacent row groups. By default, a table includes a                     details group.                   

* 

__Crosstab__  – define nested row and                     column groups, and adjacent row and column groups.                   

* 

__List__  – by default, supports the                     details group. Typical use is to support one level of grouping.                   

* 

__Chart__  – use the __DataGroupColumn__  to define the name of the field to group the data by.
              At runtime the __Chart__  item will create new
              series for each member of the group. Currently this property does
              not support expressions.
            

# See Also


 * [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})

 * [Ordering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%})
