module Figaro
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "figaro.load", before: :load_environment_config do
        Figaro.load
      end
      rake_tasks do
        Dir[File.join(File.dirname(__FILE__),'/*.rake')].each { |f| load f }
      end
    end
  end
end
