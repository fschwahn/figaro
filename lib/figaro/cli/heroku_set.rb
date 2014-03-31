require "figaro/cli/task"

module Figaro
  class CLI < Thor
    class HerokuSet < Task
      def run
        system(configuration, command)
      end

      private

      def command
        "heroku config:set #{for_app} #{vars}"
      end

      def for_app
        options[:app] ? "--app #{options[:app]}" : nil
      end

      def vars
        configuration.keys.map { |k| %(#{k.upcase}="$#{k}") }.join(" ")
      end
    end
  end
end
