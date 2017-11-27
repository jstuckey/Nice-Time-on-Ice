# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :test do
  additional_tests = %w[poros presenters]
  additional_tests.each do |name|
    task name => 'test:prepare' do
      $LOAD_PATH << 'test'
      Rails::TestUnit::Runner.rake_run(["test/#{name}"])
    end
  end
end
