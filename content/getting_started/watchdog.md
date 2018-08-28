---
title: Watchdog
kind: Documentation
description: Automatically detect potential application and infrastructure issues
aliases:
  - /tracing/watchdog
further_reading:
- link: "logs/"
  tag: "Documentation"
  text: Collect your logs
- link: "graphing/infrastructure/process"
  tag: "Documentation"
  text: Collect your processes
- link: "tracing"
  tag: "Documentation"
  text: Collect your traces
---

{{< vimeo 278057125 >}}

## Overview

Watchdog is a feature that **detects potential application and infrastructure issues**. 

Watchdog **observes trends and patterns** in application metrics - like error rate, request rate, and latency - and unexpected behavior. 

Watchdog does this without the need to configure a single monitor.

Watchdog looks for irregularities in metrics, like a sudden spike in hit rate. 

For each irregularity, the [Watchdog page][1] displays a **story**. 

Each story includes a graph of the metric irregularity and information about the timeframe and endpoints. 

Stories can be filtered by environment and availability zone, as well as by the type of service or resource. 

Typing in the "Filter stories" search box allows user to filter stories by service/resource.


{{< img src="watchdog/watchdog_overview.png" alt="Watchdog overview" responsive="true" >}}

Clicking on the Story shows further details about requests, errors, and latency at the time of the irregularity. 

{{< img src="watchdog/watchdog_story.png" alt="Watchdog story" responsive="true" >}}

Selecting *Show expected bounds* reveals upper and lower thresholds of expected behavior on the graph.

{{< img src="watchdog/watchdog_expected_values.png" alt="Watchdog expected value" responsive="true" >}}

## Watchdog in the APM Services List

When an irregularity in a metric is detected, the yellow icon appears next to the affected service in the [APM Services List][2]. 

The number next to the icon indicates the number of issues noticed within that service.

{{< img src="watchdog/service_list.png" alt="Watchdog service list" responsive="true" >}}

If Watchdog has discovered something out of the ordinary in a specific service, viewing the corresponding [APM Services List][2] reveals a dedicated Watchdog section in the middle of the page, between the application performance graphs and the latency distribution section. The Watchdog section displays any relevant Watchdog Stories.

{{< img src="watchdog/watchdog_story_bis.png" alt="Watchdog story bis" responsive="true" >}}

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: https://app.datadoghq.com/apm/watchdog
[2]: /tracing/visualization/services_list/
