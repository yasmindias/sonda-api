Rails.application.routes.draw do
  root to: 'sonda#initialize'

  get 'sonda/init', to: 'sonda#initialize'
  put 'sonda/move', to: 'sonda#move'
  get 'sonda/current', to: 'sonda#current'
end
