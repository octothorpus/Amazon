Rails.application.routes.draw do
  # resources :users, only: [:new, :create]
  # get "/contact" => "contact#new", as: :new_contact
  # post "/contact" => "contact#create", as: :contact
  # get "/products/:id" => "products#show", as: :products_show
  # get "/products" => "products#index", as: :products_index

  resources :products

  resources :users, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :contacts, only: [:new, :create]

  get "/about" => "welcome#about"

  root 'welcome#index'
end

# Build home and about pages for your Amazon application that just display simple text. Build nav bar to link to both pages.
