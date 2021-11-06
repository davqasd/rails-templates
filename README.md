# Rails templates
- https://guides.rubyonrails.org/rails_application_templates.html

## Usage
```bash
$ git clone git@github.com:davqasd/rails-templates.git

$ rails new -d postgresql --skip-action-cable --skip-turbolinks --skip-test \
  -m rails_templates/react_postgresql/template.rb app_name
```

## Templates
### react_postgresql
Key technologies: **PostgreSQL**, **React**, **Rspec**, **Rubocop**, **Eslint**.

Main runs:
- **Rspec** with one simple test;
- **Rubocop** with parameter `-A`;
- standard **Eslint** with parameter `--fix`;
- **Puma** to show up that everything works correctly.
