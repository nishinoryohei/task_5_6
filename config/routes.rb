Rails.application.routes.draw do
  devise_for :users,controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    resources :users,only:[:show] do
      get :cart, on: :member
  end
	resources :items do
		resource :cart, only:[:create,:update,:destroy,]
	end
	root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
