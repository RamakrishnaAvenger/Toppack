Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'repo/index'
  root 'repo#index'
  post '/save_data' => 'repo#save_data'
  get '/top_packages' => 'repo#top_packages'
  post '/top_packages' => 'repo#top_packages'
  get '/barchart' => 'repo#barchart'
  get '/top_repos' => 'repo#top_repos'
end
