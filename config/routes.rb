Rails.application.routes.draw do

  #ユーザー側
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/search' => 'searches#search'

    resources :users, only: [:show, :edit, :update] do
      get 'unsubscribe'
      patch 'withdraw'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :bookmarks
        get :favorites
      end
    end

    resources :campsites do
      resources :campsite_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:index, :create, :destroy]
    end

    resources :post_items do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end
  end


  #管理者側
  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :edit, :update]
    resources :campsites, only: [:index, :show, :destroy] do
      resources :campsite_comments, only: [:destroy]
    end

    resources :post_items, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }



  #ゲストユーザー
  devise_scope :user do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
