require 'figaro/cli/heroku_set'

namespace :figaro do
  desc "Configure Heroku according to application.yml"
  task :heroku, [:environment,:app] => :environment do |_, args|
    Figaro::CLI::HerokuSet.new({ path: Figaro.application.path }.merge(args)).run
  end
end
