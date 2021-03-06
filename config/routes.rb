Rails.application.routes.draw do
  devise_for :users,controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    resources :users,only:[:show,:edit,:update] do
      resource :cart, only:[:show]
      resource :order, only:[:create,:show]  
      get :exhibitor, on: :member
  end
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
	resources :items do
		resource :cart, only:[:create,:update,:destroy]
	end
  get '/category/:area' => 'categories#category',as: :category
	root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
