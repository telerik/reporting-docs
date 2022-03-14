---
title: How to Rank by total result/score/value
description: Sort categories on total of a field with custom ranking aggregate
type: how-to
page_title: Rank category field based on total of another field with custom aggregate function
slug: how-to-rank-categories-based-on-total-of-another-field-with-custom-aggregate
position: 
tags: 
ticketid: 1363830
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
Sometimes it is necessary to determine the rank of a category value (e.g. competitor ID) based on some aggregate value (e.g. total score from several competitions).

## Solution
It is necessary to create a [Custom Aggregate](../expressions-user-aggregate-functions) that achieves such requirement. Here is a sample code :

```CSharp
using System.Collections.Generic;
using System.Linq;
using Telerik.Reporting.Expressions;

namespace CustomAggregates
{
    [AggregateFunction(Name = "RankByCategory",
        Description = "Defines an aggregate function to get the rank of a field based on total value of another field.")]

    public class RankByCategoryAggregate : IAggregateFunction
    {
        private Dictionary<string, double> sums;
        private Ranks result;

        /// <summary>
        /// Initializes the current aggregate function to its initial
        /// state ready to accumulate and merge values.
        /// </summary>
        /// <remarks>
        /// This method is called every time the accumulation of values 
        /// must start over for a new subset of records from the data source.
        /// </remarks>
        public void Init()
        {
            this.sums = new Dictionary<string, double>();
        }

        /// <summary>
        /// Accumulates new argument values to the current aggregate function.
        /// </summary>
        /// <remarks>
        /// This aggregate function accepts one argument:
        /// number - a numeric value to accumulate to the aggregate function;
        /// </remarks>

        public void Accumulate(object[] values)
        {
            this.AccumulateCore((string)values[0], (double)values[1]);
        }

        void AccumulateCore(string key, double value)
        {
            double currentValue;
            if (this.sums.TryGetValue(key, out currentValue))
            {
                this.sums[key] = currentValue + value;
            }
            else
            {
                this.sums[key] = value;
            }
            this.result = null;
        }


        /// <summary>
        /// Merges the specified aggregate function to the current one.
        /// </summary>
        /// <param name="Aggregate">
        /// Specifies an aggregate function to be merged to the current one.
        /// </param>
        /// <remarks>
        /// This method allows the reporting engine to merge two accumulated
        /// subsets of the same aggregate function into a single result.
        /// </remarks>
        public void Merge(IAggregateFunction aggregate)
        {
            // Accumulate the values of the specified aggregate function.
            foreach (KeyValuePair<string, double> pair in ((RankByCategoryAggregate)aggregate).sums)
            {
                this.AccumulateCore(pair.Key, pair.Value);
            }
        }

        /// <summary>
        /// Returns the currently accumulated value of the aggregate function.
        /// </summary>
        /// <returns>
        /// The currently accumulated numeric value of the aggregate function.
        /// </returns>
        public object GetValue()
        {
            if (this.result == null)
            {
                this.result = Ranks.FromValues(this.sums);
            }

            return this.result;
        }
    }

    class Ranks
    {
        private Dictionary<string, int> ranks;

        public Ranks(Dictionary<string, int> newRanks)
        {
            this.ranks = newRanks;
        }

        public static Ranks FromValues(Dictionary<string, double> values)
        {
            List<KeyValuePair<string, double>> myList = values.ToList();

            myList.Sort(
                delegate (KeyValuePair<string, double> firstPair,
                KeyValuePair<string, double> nextPair)
                {
                    // Sort descending
                    return nextPair.Value.CompareTo(firstPair.Value);
                });

            int currentRank = 1;
            double currentValue = double.MaxValue;
            Dictionary<string, int> newRanks = new Dictionary<string, int>();
            for (int i = 0; i < myList.Count; i++)
            {
                // Same values will result in the same rank. Next ranks will be skipped (i.e. Values [2.2, 2.2, 0] -> Ranks [1, 1, 3])
                if (currentValue != myList[i].Value)
                {
                    currentRank = i + 1;
                    currentValue = myList[i].Value;
                }

                newRanks.Add(myList[i].Key, currentRank);
            }

            return new Ranks(newRanks);
        }

        public int GetRank(string key)
        {
            return this.ranks[key];
        }
    }
}
```

Note that with the above implementation the equal values will be ranked equally and the next ranks will be skipped, i.e.
 - Values [2.2, 2.2, 0] -> Ranks [1, 1, 3]
 - Values [2, 2.2, 0] -> Ranks [2, 1, 3]

The aggregate function can be used in an [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) like :
```
= Exec('crosstab1', RankByCategory(Fields.AssociateName, CDbl(Fields.CalculatedScore))).GetRank(Fields.AssociateName)
```

The above expression will rank _Fields.AssociateName_ based on the sum of _Fields.CalculatedScore_ for the row groups of _crosstab1_ grouped by _Fields.AssociateName_.
