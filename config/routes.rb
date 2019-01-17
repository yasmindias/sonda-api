Rails.application.routes.draw do
  root to: 'sonda#initialize'

  get 'sonda/start', to: 'sonda#start'
  post 'sonda/move', to: 'sonda#move'
  get 'sonda/current', to: 'sonda#currentpos'
end
