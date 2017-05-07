Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  root 'static_pages#home'
  get  'static_pages/home'
  get  'static_pages/about'
  get  'static_pages/use'
  get  'static_pages/contact'
  get  'static_pages/send_message'
end
