---
title: Timeboard
kind: documentation
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

## Read Only

[An Admin][1] can make a Timeboard read-only by clicking the gear icon and clicking the **Permissions** link:

{{< img src="graphing/dashboards/timeboard/read_only.png" alt="Read Only" responsive="true" style="width:30%;">}}

**Click "Yes" on the confirmation window to make the Timeboard read-only**

Only [Account Admins][1] can activate read-only mode for a Timeboard. 

However, any user in the organization can sign up to receive change notifications for a Timeboard.

If a user decides to track changes for a Timeboard, the changes are reported to the user through the [event stream][2]:

1. Text changes (title, description)
2. Tile changes
3. Timeboard cloning and deletion

In order to prevent the above changes, an admin can activate read-only view disabling all non-admin user edits to tiles or text in the Timeboard.  

Even in read-only mode, non-admins can still clone, edit, snapshot and view the tile in full screen. 

Any tile rearrangement by a non-admin does not persist if the Timeboard is set to read-only.

## Tracking Changes

A user can find all events to the Timeboard by searching `tags:audit, <Timeboard>` in the main event stream.

Each notification event is tagged with those two tags.

## Auditing Dashboards

In dashboards, notifications provide the ability to track changes for audit purposes. 

Any changes creates an event in the event stream that explains the change and displays the user that made the change.

If any changes are made to your dashboards, see them with the following event search:

https://app.datadoghq.com/event/stream?per_page=30&query=tags:audit%20status:all

This feature can be enabled by following these simple steps:

1. At the top right corner of a dashboard, click on the gear icon:
    {{< img src="graphing/dashboards/faq/enable_notifications.png" alt="enable notifications" responsive="true" style="width:30%;">}}

2. Select **Notifications** option and enable the notifications:
    {{< img src="graphing/dashboards/faq/notifications_pop_up.png" alt=" notifications pop up" responsive="true" style="width:30%;">}}

## Backup my Timeboard

Using our [APIs][3] it's possible to write a script to backup your Timeboard definitions as code. 

See the following projects as examples of how these backups can be accomplished:

* https://github.com/brightcove/dog-watcher
* https://github.com/Shopify/doggy
* https://github.com/grosser/kennel

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /account_management/team/#datadog-user-roles
[2]: /graphing/event_stream
[3]: /api
[4]: https://www.brightcove.com/
[5]: https://www.shopify.com/
[6]: https://www.zendesk.com/
