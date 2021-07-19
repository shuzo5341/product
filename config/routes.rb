Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  get'hello/link'=>'hello#link'
  get'toppage/index'=>'toppage#index'
  get'posts'=>'posts#index'
  get'posts/new'=>'posts#new'
  post 'posts' =>'posts#create'
  get'groups'=>'groups#index'
  get'groups/new'=>'groups#new'
  post'groups'=>'groups#create'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end