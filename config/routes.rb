Rails.application.routes.draw do

root 'home#index'

post '/search', to: 'search#display'

end
