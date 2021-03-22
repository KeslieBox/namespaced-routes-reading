Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #scope allows us to prefix a block of routes under one grouping
  #telling scope that we want to use /admin as a URL prefix, and 
  # we're also letting Rails know that all of the included routes 
  # will be handled by controllers in the admin module.

  #achieves the same results as #namespace below, but is less dry:
  #only difference is in the url helpers: 
  #helper is now prefixed with admin_, so stats_path becomes admin_stats_path
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  #this is more dry and does same as above
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
