# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :lint do
  # puts "TODO enable rubocop linting with custom config"
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run(%w(--auto-correct))
end
