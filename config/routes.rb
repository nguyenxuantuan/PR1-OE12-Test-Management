Rails.application.routes.draw do
  get "session/new"
  post "/signup", to: "user#create"
  get "/signup", to: "user#new"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :exam do
    collection do
      get "filter_show", to: "exam#filter_show"
    end
  end
  resources :user
end
