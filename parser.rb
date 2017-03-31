require 'fluent/parser'

module Fluent
  class TextParser
    class JsonLogParser < Parser
      # Register this parser as "json_log"
      Plugin.register_parser("log4j_parser", self)

      # This is the main method. The input "text" is the unit of data to be parsed.
      # If this is the in_tail plugin, it would be a line. If this is for in_syslog,
      # it is a single syslog message.
      # Parse {"log":"Date=XXX, Category=XXXX, Priority=XXXX, Message=XXXXXXX"}
      # to {"log":"Date=XXX, Category=XXXX, Priority=XXXX, Message=XXXXXXX", "Date=XXX", 
      #  "Category=XXXX", "Priority=XXXX", "Message=XXXXXXX"}
      def parse(text)
        data = JSON.parse(text)
        log = data["log"]
        log.split(", ").each { |field|
          k,v = field.split("=", 2)
          data[k] = v
        }
        puts data
        yield Engine.now, data
      end
    end
  end
end