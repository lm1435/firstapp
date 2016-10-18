Rails.application.routes.draw do
	devise_for :users, :controllers => { :registrations => "user_registrations" }
	resources :users
	resources :orders, only: [:index, :show, :create, :destroy]
	resources :products do
		resources :comments
	end
	get 'static_pages/about'

	get 'static_pages/contact'

	root 'static_pages#landing_page'

	post 'static_pages/thank_you'

  get 'payments/create'

  post 'payments/create'

  mount ActionCable.server => '/cable'

end
# devise_for :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'},
