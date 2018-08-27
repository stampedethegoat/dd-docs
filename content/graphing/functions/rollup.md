---
title: Rollup
kind: documentation
---

`.rollup()`

Datadog rolls up data points automatically, based on the in-app metric type: `gauge` metrics are averaged by default, whereas `count` and `rate` metrics are summed. 

Appending this function to the end of a query allows you to override the default behavior: to control the rollup method, or the number of raw points rolled up into a single point plotted on the graph.

The function takes 2 parameters, method and time: `.rollup(method, time)`. 

The method can be sum/min/max/count/avg and time is in seconds. 

You can use either 1 individually, or both together like `.rollup(sum, 120)`. 

We impose a limit of 350 points per time range. 

For example, if you're requesting `.rollup(20)` for a month-long window, we return data at a rollup far greater than 20 seconds in order to prevent returning a gigantic number of points. 

Note that rollups should usually be avoided in [monitor][7] queries, because of the possibility of misalignment between the rollup interval and the evaluation window of the monitor. 

The start and end of rollup intervals are aligned to UNIX time, not to monitor queries, which means that a monitor may evaluate (and trigger on) an incomplete rollup interval containing only a small sample of data. 

To avoid this issue, users should delay the evaluation of the monitor by (at least) the length of the rollup interval.

## .as_count() or as_rate()

These functions are only intended for metrics submitted as rates or counters via StatsD. 

These functions have no effect for other metric types. 

For more details about how to use `.as_count()` and `.as_rate()` see [our blog post][1].

Note: [The only available query with `as_count()` is `sum()`][4] (unless using a rollup summary), which is the only mathematical accurate function with such behavior.

[1]: https://www.datadoghq.com/blog/visualize-statsd-metrics-counts-graphing/
[4]: /graphing/faq/as_count_validation
[7]: /monitors/monitor_types/metric/
