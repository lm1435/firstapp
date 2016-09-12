Rails.application.routes.draw do
  resources :products
  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#landing_page'

  post 'static_pages/thank_you'
  
  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


