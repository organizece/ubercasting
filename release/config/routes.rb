Ubercasting::Application.routes.draw do

  devise_for :agencies, :controllers => { :sessions => "agencies/sessions" }

  resources :models do
    resources :photos, except: [:edit, :update, :index]
    match "gallery/" => "photos#index"
  end

  resources :agencies, except: [:index]

  match "find_cep/:cep" => "utilities#find_cep", via: :get, as: :find_cep

  root :to => 'agencies#show'

  # See how all your routes lay out with "rake routes"
end
