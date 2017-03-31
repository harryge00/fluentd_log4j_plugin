# fluentd_log4j_plugin

This plugin will parse `{"log":"Date=XXX, Category=XXXX, Priority=XXXX, Message=XXXXXXX"}` to `{"log":"Date=XXX, Category=XXXX, Priority=XXXX, Message=XXXXXXX", "Date=XXX", "Category=XXXX", "Priority=XXXX", "Message=XXXXXXX"}`

## Fluentd config
```
<source>
 @type tail
 path /path/to/file
 format log4j_parser
 tag your.tag
</source>
```

## TODO
What if "Message" or other fileds contain special characters like ",", "="?
