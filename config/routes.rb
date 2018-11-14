Rails.application.routes.draw do
  get "session/new"
  root "session#new"
  get "/signup", to: "user#new"
  post "/signup", to: "user#create"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  get "user/show", to: "user#show"

  resources :exam do
    collection do
      get "filter_show", to: "exam#filter_show"
      get "create_show", to: "exam#create_show"
      post "create_exam", to: "exam#create_exam"
      post "update_exam", to: "exam#update_exam"
      post "student_on_flag", to: "exam#student_on_flag"
      post "student_off_flag", to: "exam#student_off_flag"
      post "update_happening_status", to: "exam#update_happening_status"
      post "read_student", to: "exam#read_student"
      post "upload", to: "exam#upload"
    end
    member do
      get "info_show", to: "exam#info_show"
      get "task_detail", to: "exam#task_detail"
    end
  end

  resources :warning do
    collection do
      get "not_found", to: "warning#not_found"
    end
    member do
    end
  end

  resources :user
end
