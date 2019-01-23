Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # ログイン画面をホームにする
  devise_scope :user do
    root :to => "users/sessions#new"
    get '/users/mypage' => 'users/registrations#mypage'
  end
  
  get '/posts' => 'posts#show'
  get '/posts/write' => 'posts#write'
  post '/posts/create' => 'posts#create'
  
  get '/posts/delete/:post_id' => 'posts#delete'
  get '/posts/modify/:post_id' => 'posts#modify'
  post '/posts/update/:post_id' => 'posts#update'
  
  get '/search' => 'user#index'
end
