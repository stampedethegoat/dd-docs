---
title: Template Variables
kind: documentation
aliases:
    - graphing/dashboards/template_variables/correlate-metrics-and-events-using-dashboard-template-variables
    - graphing/dashboards/template_variables/how-do-i-overlay-events-onto-my-dashboards
further_reading:
- link: "graphing/dashboards/"
  tag: "Documentation"
  text: Learn how to create Dashboards in Datadog
- link: "graphing/dashboards/shared_graph"
  tag: "Documentation"
  text: Share your Graphs outside of Datadog
- link: "graphing/dashboards/widgets"
  tag: "Documentation"
  text: Discover all available widget for your Dashboard
---

## Overview

Template Variables allow you to apply a new scope to one or more graphs on your dashboard. 

This allows you to dynamically explore metrics across different sets of tags by using variables.

## Define a Template Variable

Dashboards start with no template variables applied. Click on the pencil icon to open the template variable edit mode:

{{< img src="graphing/dashboards/template_variables/edit_mode_template_variable.png" alt="Edit template variable" responsive="true" style="width:40%;">}}

Once in the edit mode click on **Add Variable +** to create your first Template Variable, it is defined by:

* **Name**: Value of your Template Variable displayed in your graphs query.
* **Tag Group**: Tag Group is the  `key` of your tags.
* **Default Tag** (optional): Default value for your Template Variable Tag Group.

Once created, you will have statistics on your template variables usage.

In the picture below, the template variable is not used in both graph of the dashboard:

{{< img src="graphing/dashboards/template_variables/stats_tv.png" alt="statistic TV" responsive="true" style="width:40%;">}}

You can remove/add Template Variables to all of your graphs with **Remove From All** and **Add to All** buttons.

## Template Variable in Graphs

Once you have defined a template variable, it appears in the options displayed in the `from`  field:

{{< img src="graphing/dashboards/template_variables/tv_in_graph.png" alt="Template variable in graphs" responsive="true" style="width:50%;">}}

After the graph is saved, the value of this Template Variable will be the one selected on top of your Dashboard:

{{< img src="graphing/dashboards/template_variables/selecting_template_variables.png" alt="Selecting template variables" responsive="true" style="width:75%;">}}

## Template Variables and Events
[The event overlay][1] search is helpful to correlate metrics to events.

You can use Template Variables to find events that share certain tags with the metrics on your dashboard. 

The event overlay search is [applied through an individual graph][2].

Values from template variables can be captured by using the `$variable.value` syntax in the event search field.

**Note**: Template Variables must be metric tags; event-supplied tags cannot be used.

For example, to search for events in the event stream with the same region tag, use: `tags:region:$region.value`.

{{< img src="graphing/dashboards/template_variables/tv5.png" alt="tv5" responsive="true" style="width:75%;">}}

In the following example, the template variable resolves to `tags:region:ap-south-1`. 

After those events are brought up in the event search overlay, the timing of the events are marked by pink bars:

{{< img src="graphing/dashboards/template_variables/tv7.png" alt="tv7" responsive="true" style="width:85%;">}}

Use multiple template variables in the search field and the event overlay search displays all events tagged with the values. 

The following example uses the query `tags:role:$role.value,env:$env.value`

{{< img src="graphing/dashboards/template_variables/tv8.png" alt="tv8" responsive="true" style="width:85%;">}}

Since the `$variable.value` syntax captures the resolved key value from the template variable, it can be used with other filters, such as `hosts:`.

Here is an example that uses the tags field together with the hosts: field in the search term `tags:env:$env.value hosts:$host.value`

{{< img src="graphing/dashboards/template_variables/tv9.png" alt="tv9" responsive="true" style="width:85%;">}}

## Template variables and Logs

Template variables work by default on Log widgets, as Metrics and Logs share the same tags.

It is possible to define specific Log Template variables based on your [Log Facets][4]. Log Facet variables start with `@`.

{{< img src="graphing/dashboards/template_variables/log_template_variables.png" alt="log template variables" responsive="true" style="width:85%;">}}

Using the `Add to all` button adds this template variable to all log widgets. Wildcards can also be used.

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /graphing/event_stream
[2]: /graphing/dashboards/template_variables/how-do-i-overlay-events-onto-my-dashboards
[3]: /tagging/#tags-best-practices
[4]: /logs/explorer/search/#facets
