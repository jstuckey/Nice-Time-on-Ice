require 'rake/testtask'
require 'rails/test_unit/sub_test_task'

namespace :test do

  Rails::TestTask.new(poros: "test:prepare") do |t|
    t.pattern = 'test/poros/**/*_test.rb'
  end

  Rails::TestTask.new(presenters: "test:prepare") do |t|
    t.pattern = 'test/presenters/**/*_test.rb'
  end

  Rake::Task["test:units"].clear
  Rails::TestTask.new(units: "test:prepare") do |t|
    t.pattern = "test/{models,helpers,unit,poros,presenters}/**/*_test.rb"
  end

end
