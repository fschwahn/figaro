module Figaro
  module Rails
    class Application < Figaro::Application
      private

      def default_path
        rails_not_initialized! unless ::Rails.root

        if File.exists?(::Rails.root.join("config", "application.yml.enc"))
          ::Rails.root.join("config", "application.yml.enc")
        else
          ::Rails.root.join("config", "application.yml")
        end
      end

      def default_environment
        ::Rails.env
      end

      def rails_not_initialized!
        raise RailsNotInitialized
      end
    end
  end
end
