Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'blogs', to: "blogs#get_all"
  get 'blogs/:id', to: "blogs#get_one"
  post 'blog', to: "blogs#add"
  put 'blog/:id', to: "blogs#update"
  delete 'blog/:id', to: "blogs#delete"
  get 'getownall/:id', to: "blogs#get_his_own_blogs"
end
