---
title: Dashboards
kind: documentation
aliases:
    - /guides/templating/
further_reading:
- link: "graphing/dashboards/template_variables"
  tag: "Documentation"
  text: Enhance your Dashboards with Template Variables
- link: "graphing/dashboards/shared_graph"
  tag: "Documentation"
  text: Share your Graphs outside of Datadog
- link: "graphing/dashboards/widgets"
  tag: "Documentation"
  text: Discover all available widget for your Dashboard
---

After clicking `New Dashboard`, select a [Timeboard][3] or a [Screenboard][4].

{{< img src="graphing/dashboards/board_selection.jpg" alt="Dashboard selection" responsive="true" >}}

## Screenboard vs Timeboard

To better understand the differences between the two, consider the following:

|                                | [Timeboards][6]                  | [Screenboards][5]                                 |
| ---                            | ------------                     | -------------                                     |
| Time Scope                     | All graphs share same time scope | All graphs can have individual time scope         |
| Layout                         | Graphs appear in a fixed grid    | Graphs are placed anywhere you like on the canvas |
| Can Share Graphs Individually  | Yes                              | No                                                |
| Can Share the Entire Dashboard | No                               | Yes                                               |
| Sharing can be Read-Only       | Yes                              | Yes                                               |

## Template Variables

Datadog allows you to use template variables like `$scope` or `$redis` in place of tags or hosts. 

You can then explore the metrics across different sets of tags. 

Select a new variable value in the dropdown menu, and that value applies across the dashboard.

To create, edit, delete template variables click the gear icon, then select `Edit Template Variables`.

{{< img src="graphing/dashboards/edit-template-variables.png" alt="edit template variable" responsive="true" style="width:30%;">}}

This open the template variable editing panel.

{{< img src="graphing/dashboards/redis-template-var.png" alt="Redis template var" responsive="true" style="width:50%;">}}

A template variable is defined by a name and optional parameters for `Tag Group` and `Default Tag.`

A tag group is a prefix shared among tags, like `redis_port` for the tags `redis_port:6379` and `redis_port:6380`. 

Setting a tag group eliminates irrelevant tags from the variable's scope selector and removes the prefix from the listed values.

In this case, you'll see `6379` and `6380` in the 'Default Tag' dropdown instead. 

The `Default Tag` option determines the initial value for the variable on dashboard load.

## Using Template Variables in Graph Editors/Widgets

{{< img src="graphing/dashboards/redis-tpl-graph-editor.png" alt="Redis-tpl graph editor" responsive="true" style="width:70%;" >}}

Once defined, template variables appear alongside normal tag and host options in graph editors. 

If you set `6379` as the value of `$redis`, all graphs defined with `$redis` is scoped to `redis_port:6379`.

{{< img src="graphing/dashboards/redis-tpl-selected.png" alt="Redis tpl selected" responsive="true" style="width:70%;">}}

You can also use them explicitly in widgets such as Event Stream, with a query of the form `tags:$redis`.

## Event Correlation (Overlaying Events)

### At Design Time
Event Correlation refers to overlaying events on top of a dashboard graph. 

You can setup overlaying at 2 different times: When you setup the dashboard or at the time you view the dashboard.

{{< img src="graphing/dashboards/guides-eventcorrelation-screenboard.png" alt="guides-eventcorrelation-screenboard" responsive="true" style="width:90%;">}}

Setup event correlation at design time by editing any graph on both Timeboards and Screenboards and adding events to the graph. 

To learn more about this, visit the [Graphing Primer][1]. 

You can find details about adding events [using the UI][2] or via the JSON interface further down the page.

### At View Time

{{< img src="graphing/dashboards/guides-eventcorrelation-searchbox.png" alt="guides event correlation" responsive="true" style="width:90%;">}}

Setup event overlaying at view time by adding a query in the Search box at the top left of any Timeboard dashboard window. 

This replaces any events added at design time, but applies the events to all graphs on that particular dashboard.

## Correlation between Logs and Metrics

### Log Correlation

Use the following shortcut from any dashboard timeseries graphs to open a menu with the most related logs.

{{< img src="graphing/dashboards/related_logs.png" alt="Related logs" responsive="true" style="width:80%;">}}

Select `View related logs` to jump to the Log Explorer page with all the current context of your graph.

### How do we define the search query ?

To define the most related logs, we use the following parameters:

* **Timeframe**          : Focused on the data point and uses the graph bucket size to display data before and after.
* **Integration prefix** : Datadog filters on the `source` attribute from integrations.
* **Tags**               : All tags used in the graph (*template variable*, *split by*, *filter by*) are automatically added.

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /graphing/
[2]: /graphing/event_stream/
[3]: /graphing/dashboards/timeboard/
[4]: /graphing/dashboards/screenboard/
[5]: /graphing/dashboards/screenboard
[6]: /graphing/dashboards/timeboard



