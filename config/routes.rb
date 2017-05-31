Rails.application.routes.draw do
  devise_for :podcasts

	resources :podcasts, only: [:index, :show] do
		resources :episodes
	end

	# if you're not sign in, the root will be wellcome#index; else the root will be podcasts#dashboard
	authenticated :podcast do
    root 'podcasts#dashboard', as: :authenticated_root
  end
  root 'welcome#index' 
end
