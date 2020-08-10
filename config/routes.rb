Rails.application.routes.draw do
  get 'games/new', to: 'games#new'
  post 'games/score', to: 'games#score'
end
