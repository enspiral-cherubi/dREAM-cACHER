Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :dreams, except: [:edit, :update, :destroy]

  get 'user/dreams', to: 'dreams#mine'

  get 'dream/tags', to: 'tags#from_dream'

  get 'tag/dreams', to: 'dreams#from_tag'

  resources :views, only: [:create]
end
