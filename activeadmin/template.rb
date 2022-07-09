# frozen_string_literal: true

require 'find'

FILES_PATH = "#{File.dirname(__FILE__)}/project/".freeze

def replace_default_db
  filename = "#{FILES_PATH}/config/database.yml.example"
  data = File.read(filename)
             .sub('ENV[\'POSTGRES_DB\']', "ENV['POSTGRES_DB'] || '#{app_name}_development'")
             .sub('ENV[\'TEST_POSTGRES_DB\']', "ENV['POSTGRES_DB'] || '#{app_name}_test'")

  file 'config/database.yml', data, force: true
end

def replace_project_files
  Find.find(FILES_PATH) do |filename|
    next unless File.file?(filename)

    file filename.sub(FILES_PATH, ''), File.read(filename), force: true
  end
end

def init
  replace_project_files

  run 'bundle install'

  replace_default_db
  generate 'active_admin:install', 'User'
  File.delete('./spec/models/user_spec.rb')

  run 'rails db:create db:migrate'
end

init

after_bundle do
  run 'rubocop -A'
  run 'rspec'

  git :init

  rails_command 'server'
end
