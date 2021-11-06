# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      # TODO
    end
  end

  get '*page', to: 'static#index', constraints: lambda { |req|
    !req.xhr? && req.format.html?
  }
end
