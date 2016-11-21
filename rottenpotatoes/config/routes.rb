Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  get 'movies_with_same_director', to:'movies#movies_with_same_director'
end
