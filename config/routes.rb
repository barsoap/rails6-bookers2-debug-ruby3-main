Rails.application.routes.draw do
  get 'relationships/followers'
  get 'relationships/following'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :post_comments, only: [:create, :destroy] #post_commentsコントローラのアクション
    resource :like, only: [:create, :destroy] #単数形にすると、/:idがURLに含まれなくなる。(いいね削除の際いいねのID必要ない為)
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followers" => "relationships#followers", as: "followers"
    get "following" => "relationships#following", as: "following"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end