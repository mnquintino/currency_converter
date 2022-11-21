Rails.application.routes.draw do
  resources :posts
 get "currency" => "currency#index"
end
