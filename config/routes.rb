Rails.application.routes.draw do
  root :to => 'homes#top'
  #resoucesでのルーティングでupdate
  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :books
end
