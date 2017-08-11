Rails.application.routes.draw do

     resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts, except: [:index]
   end

   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end

  

  resources :users, only: [:new, :create]

  resources :questions

  resources :advertisements

  resources :sessions, only: [:new, :create, :destroy]

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote

  post 'users/confrim' => 'users#confirm'

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
