---
title: Rank
kind: documentation
---

## Top

| Function | Description               | Example                                              |
| :----    | :-------                  | :---------                                           |
| `top()`  | Graph the top N elements. | `top(<METRIC_NAME>{*}, <LIMIT_TO>, '<BY>', '<DIR>')` |

The `top()` function has 3 parameters:

* `LIMIT_TO`: The number of series to be displayed:
    - `5`
    - `10`
    - `25`
    - `50`
    - `100`
* `BY`: Aggregation method:
    - `max`    : Maximum of all metrics values.
    - `mean`   : Mean of all metrics values.
    - `min`    : Min of all metrics values.
    - `sum`    : Sum of all metrics values.
    - `last`   : Last metrics value.
    - `l2norm` : Uses the [norm][1] of the timeseries, which is always positive, to rank the series.
    - `area`   : Signed area under the curve being graphed, which can be negative
    
* `DIR`: The direction of ranking:
    - `asc`  : Rank the results in ascending order.
    - `desc` : Rank the results in descending order.

The `top()` method also has convenience functions of the following form, all of which take a single series list as input:

`[top, bottom][5, 10, 15, 20]_[mean, min, max, last, area, l2norm]()`

For example, `bottom10_min()` retrieves the 10 lowest-valued series using the `min` metric.

[1]: http://en.wikipedia.org/wiki/Norm_(mathematics)#p-normL2
