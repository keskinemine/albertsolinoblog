Rails.application.routes.draw do
  devise_for :authors
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "readers/home#index"

  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  get 'about'  => 'readers/pages#about', as: :about
  get 'contact'  => 'readers/pages#contact', as: :contact


  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
end
