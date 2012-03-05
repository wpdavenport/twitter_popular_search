TwitterSearch::Application.routes.draw do
  resources :trends do
    match 'results' => 'results#show'
  end

  root :to => 'trends#index'
end
