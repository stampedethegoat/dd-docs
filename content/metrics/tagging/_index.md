---
title: Tagging 101
kind: documentation
aliases:
    - /getting_started/getting_started_with_tags
    - /guides/tagging/
    - /developers/tagging/
    - /getting_started/tagging
further_reading:
- link: "tagging/assigning_tags"
  tag: "Documentation"
  text: Assigning Tags
- link: "tagging/using_tags"
  tag: "Documentation"
  text: Using Tags
---

## Introduction

In a nutshell, tagging is a method to scope aggregated data and adds dimensions to metrics.

[Using tags][1] enables you to observe performance across a # of hosts and narrow the set based on specific elements. 

Tags are extremely powerful, and they are found everywhere in Datadog. 

They can be applied to all core elements, including alerts and host maps.

## Why It Matters
It's better to look at CPU across a collection of hosts that represents a service, rather than CPU for A or B separately.

Containers & cloud environments regularly churn through hosts, so it is critical to tag these to allow for aggregation of the metrics.

## Tags best practices
A few best practices on tags:

1. Tags must **start with a letter**, and after that may contain:
    * Alphanumerics (abc123)
    * Underscores (__)
    * Minuses (-)
    * Colons (:)
    * Periods (.)
    * Slashes (/)

    Other special characters get converted to underscores.
    **Note**: A tag cannot end with a colon (e.g., `tag:`)
2. Tags can be **up to 200 characters** long and support unicode.
3. Tags are converted to lowercase.
4. A tag can have a `value` or a `key:value` syntax:  
    **For optimal functionality, we recommend constructing tags that use the `key:value` syntax.**   
    * `role:database:mysql` --> **key**:`role` --> **value**:`database:mysql`
    * `role_database:mysql` --> **key**:`role_database` --> **value**:`mysql`

    Examples of commonly used keys are `env`, `instance`, `name`, and `role`.

5. `device`, `host`, and `source` are **reserved tag keys** and cannot be specified.

6. Tags shouldn't originate from unbounded sources, such as EPOCH timestamps or user IDs. These tags may impact platform performance and billing.

## Applying Tags

Tags may be added using any (or all) of the following methods:

* Agent Tags (`datadog.yaml`)
* [DogStatsD][2] Tags
* Integration/Check Tags (each check on the local host supports tags by editing the yaml)
* Tags generated by other services such as [AWS][3], [Azure][4], [GCE][5], etc.
* Tags in the [API][6] - note other endpoints support tags as well such as Events and Metrics
* [Chef Roles][7] and [Puppet][8] Tags (Chef and Puppet use the API - this may obviously be extended to other configuration management tools by you or Datadog)
* Manually adding tags using the [Infrastructure List][9] (hover over host->select "Inspect"->"Edit Tags")

## Examples using Time-series Chart
Here no tags have been applied and we're observing avg CPU across all hosts:  

{{< img src="tagging/Tags_1.png" alt="Tags_1" responsive="true" style="width:75%;">}}

Here we've applied a tag `region:eastus` that enables us to look at CPU across the US East Region. 

{{< img src="tagging/Tags_2.png" alt="Tags_2" responsive="true" style="width:75%;">}}

Here the 2nd empty field labeled as "everything" by option shows an individual timeseries line for each host.   
Now we're seeing server CPU for individual hosts running in the US East Region.

{{< img src="tagging/Tags_3.png" alt="Tags_3" responsive="true" style="width:75%;">}}

We can also add additional tags to narrow down our scope even further - for example, hosts in `region:eastus` and `env:production`. 

### Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /tagging/using_tags
[2]: /developers/dogstatsd
[3]: /integrations/amazon_web_services
[4]: /integrations/azure
[5]: /integrations/google_app_engine
[6]: /api
[7]: /integrations/chef
[8]: /integrations/puppet
[9]: /graphing/infrastructure
[10]: /developers/metrics/custom_metrics