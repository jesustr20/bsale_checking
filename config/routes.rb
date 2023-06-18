# frozen_string_literal: true
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      #get '/flights/:id/passengers', to: 'flights#show'
      get '/flights/:id/passengers', to: 'flights#passengers'
    end
  end
end
