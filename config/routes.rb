Rails.application.routes.draw do
  get '/' => 'homes#top'
  #resoucesでのルーティングでupdate
  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :books
end
