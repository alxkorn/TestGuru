Rails.application.routes.draw do
  get 'about', to: 'about#project'
  get 'about/author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
