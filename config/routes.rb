Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :incomes
    # resources :outcomes, except: :show
    resources :outcomes
    resources :memberships, except: :update
  end
  resources :users

  # resources :outcomes, only: [:show, :destroy]
  resources :outcomes, only: :destroy
  resources :incomes, only: :destroy

  resources :memberships, only: :update do
    collection do
      get "/invites", to: "memberships#invites", as: "invites"
      delete "/:id/deny", to: "memberships#deny", as: "deny"
    end
  end
end
