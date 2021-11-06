# frozen_string_literal: true

require 'find'

FILES_PATH = "#{File.dirname(__FILE__)}/project/"

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
  run 'rubocop -A'
  run 'rspec'

  run 'npx npm-add-script -k dev -v "./bin/webpack --watch --progress"'
  run 'yarn add eslint eslint-plugin-react eslint-config-standard ' \
    'eslint-plugin-promise eslint-plugin-import eslint-plugin-node'
  run './node_modules/.bin/eslint --fix app/javascript'

  replace_default_db
  run 'rails db:create db:migrate'
end

init

after_bundle do
  git :init

  rails_command 'server'
end
