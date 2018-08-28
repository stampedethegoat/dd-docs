---
title: Graphing
kind: documentation
aliases:
    - /guides/graphing
    - /graphing/miscellaneous/metrics_arithmetic
    - /graphing/faq/is-there-a-way-for-me-to-set-the-maximum-and-minimum-values-on-the-y-axis-of-a-graph
    - /graphing/faq/is-it-possible-to-adjust-the-y-axis-for-my-graphs
description: Visualize your data to gain insight
---
Graphs are at the heart of monitoring and observability, so it is essential to understand how to define great graphs.

Graphs are the window to your monitored systems. Most of the time:  
* You will look at [dashboards][8] made up of graphs.   
* You will see email notifications that include a graph of some fluctuation in the system.   
* You will see graphs in Slack, HipChat, and other chat clients documenting the changes in metrics.  

## Graphing Editor

There are 2 ways to interact with the Graphing Editor:   
* using the GUI (the default method)   
* writing JSON (the more verbose method)

This page covers using the GUI. To learn more about using JSON, visit the [JSON Graphing Primer Page][1]

On each graph there is a pencil icon that opens the graph editor.

{{< img src="graphing/index/references-graphing-overview.png" alt="Graphing Overview" responsive="true" style="width:75%;" >}}

The graphing editor has 3 tabs: 

* **Edit**: Default tab to to select graphing options and settings.  
* **JSON**: The more flexible editor, but it requires knowledge of the graph language to make use of it.
* **Share**: Allows you to embed the graph to external web pages (Only available on Timeboards.).

Below is an example of the preset graph in the standard Postgres Integration dashboard:

{{< img src="graphing/index/references-graphing-edit-window-with-y.png" alt="Graphing Edit Tab" responsive="true" style="width:75%;" >}}

## Steps to build a Graph

1. [Choose a Metric][9]
2. [Select the visualization][10]
3. [Filter][11] 
4. [Aggregate and Rollup][12] 
5. [Arithmetic][13]
6. [Enhancements][14]
7. [Create a Title][15]
8. Save

## Choose a Metric

Explore what metric you want through these 3 links:   
* [Metrics Explorer][2] - Allows you to play around with different graph settings  
* [Metrics Summary][3]  - Allows you to learn more about the type of metric and set the default unit  
* [Notebook][7]   

Then select the metric in the 1st dropdown. 

## Select the visualization

Once you have chosen a metric, select your [visualization][4].

## Filter

Once you have selected a visualization, filter down the hosts to be graphed using tags. 

Select a tag in the 2nd dropdown to filter. Click this and choose the [tag(s)][5] you want to filter by. 

## Aggregate and rollup
### Aggregation method

Next to the filter dropdown is the aggregation method. 

This defaults to **avg by** but can be changed to **max by**, **min by**, or **sum by**. 

In most cases, the metric has many values for each time interval, coming from many hosts or instances.  

The aggregation method chosen determines how the metrics is aggregated into a single line. 

So if you are graphing a metric that is from 100 hosts, **sum by** adds up all of those values and display the sum.

### Aggregation groups

After the aggregation method you can determine what constitutes a line or grouping in a graph. 

If you choose host, then you have a line for every host. 

If you choose role, then there is a line for every role. 

Then that line is made up of metrics from all the hosts in that role, aggregated using the method you chose above.

### Rollup to aggregate over time

Each graph we display has ~300 points shown at any given time.

There is always aggregation of data due to the physical size constraints of the graph window. 

If a metric is updated per 1s and you are looking at 4 hours of data, you need 14,400 points to display everything. 

In the example above, each point displayed on the screen represents 48 data points. 

In practice, metrics are collected by the Agent every 15-20 seconds. 

So one day's worth of data is 4,320 data points. 

A rollup function looks at 5-10 minutes worth of data.

To use the rollup function, click the `+` and choose `rollup` from the dropdown. 

Then choose how you want to aggregate the data and the interval in seconds.

Example of a single line that represents the total available disk space on avg across all machines rolled up in 60s:

{{< img src="graphing/index/references-graphing-rollup-example.png" alt="rollup example" responsive="true" style="width:90%;">}}

When switching to the JSON view, the query looks like this:

    "q": "avg:system.disk.free{*}.rollup(avg, 60)"

## Arithmetic

You may choose to apply other mathematical functions to the query like rates, derivatives, smoothing, and [more][6].

The Datadog UI supports the ability to graph your metrics with various arithmetic options. `+`, `-`, `/`, `*`.

This syntax allows for both integer values as well as arithmetic using multiple metrics.

### Arithmetic with a Constant

You can perform an arithmetic operation on a metric. 

For example, if you would like to double a specific metric, `system.load.5`.  

Click on the Graph Editor and select **Advanced...** .  

From there, enter your arithmetic in the `Formula` box, in this case: `a * 2`. 

{{< img src="graphing/index/arithmetic_2.png" alt="Arithmetic 2" responsive="true" style="width:75%;" >}}

### Arithmetic between 2 Metrics

If you would like to visualize `memory` % used for instance, perform the following from metrics already being reported: 

`memory / memory_max`

This can be done in the same manner as above, utilizing the **Advanced...** option in the Graph Editor. From there, select:

* `Add Query +`

Notice they are each assigned a letter: the 1st metric is represented by **a**, the second metric is represented **b**, and so on. 

Then in the `Formula` box, enter the arithmetic you would like, in this case: `( a / b )`: 

{{< img src="graphing/index/arithmetic_3.png" alt="Arithmetic 3" responsive="true" style="width:75%;" >}}

To display only your formula, un-check your metrics **a** and **b**:

{{< img src="graphing/index/arithmetic_3_bis.png" alt="Arithmetic 3 bis" responsive="true" style="width:75%;" >}}

**Note**: Formula are not lettered, you cannot do Arithmetic between formulas.

## Enhancements

### Aliasing

Each query or formula can be aliased. The alias overrides the display on the graph and legend to clarify a formula.  

At the end of your query/formula click on the **as...** button, then enter your metric alias:  

{{< img src="graphing/index/metric_alias.png" alt="metric alias" responsive="true" style="width:75%;" >}}

### Y-axis scale

The Datadog y-axis controls are available via the UI and the JSON editor. They allow you to:

* Clip y-axis to specific ranges  
* Remove outliers either by specifying a percentage or an absolute value
* Change y-axis scale from linear to `log`, `sqrt` or `power` scale  

Change the Y-axis scale with the **Show Y-Axis Controls** button:

{{< img src="graphing/index/y_axis_control.png" alt="y axis control" responsive="true" style="width:75%;" >}}

There are 3 configuration settings:

* `Min`/`max` (optional): Specifies min/max value to show on y-axis. It takes a number, or "auto" for default behavior. 

* `Scale` (optional): Specifies the scale type. Possible values:
    
    * *linear*: A linear scale (default scale)
    * *log*: A logarithmic scale 
    * *pow*: A Power of scale (2 is default, but can be modified in json)
    * *sqrt*: A square root scale

* `Always include zero` (optional): Specifies whether or not to include 0 or fit axis to the data range. Default is to include 0.

**Note:** The log function doesn't accept values < 0, log scale only works if values are of the same sign (> 0 or < 0). 

### Overlay Events 

Add events from related system to add more context to your graph. 

An example would be to add Github commits, Jenkins deploys, or Docker creation events. 

Click the Overlay Events button and enter a query to find and display your events.  

To show anything from a source such as Github, use `sources:github`. 

For all events with tag role:web, use `tag:role:web`.

{{< img src="graphing/index/overlay_events.png" alt="Overlay Events" responsive="true" style="width:75%;" >}}

## Create a title

We automatically generate a title based on the selections you have made. 

But it is encouraged to create a title that describes the purpose of the graph.

## Save

The final step is to click Save. You can always come back and tweak the graph further depending on your needs.

[1]: /graphing/graphing_json/
[2]: https://app.datadoghq.com/metric/explorer/
[3]: https://app.datadoghq.com/metric/summary/
[4]: /graphing/dashboards/widgets/
[5]: /tagging/
[6]: /graphing/functions/
[7]: https://app.datadoghq.com/notebook/list
[8]: /graphing/dashboards
[9]: /graphing/#choose-the-metric-to-graph
[10]: /graphing/#select-your-visualization
[11]: /graphing/#filter
[12]: /graphing/#aggregate-and-rollup
[13]: /graphing/#advanced-graphing
[14]: /graphing/#graphs-enhancement
[15]: /graphing/#create-a-title
[16]: /graphing/dashboards
