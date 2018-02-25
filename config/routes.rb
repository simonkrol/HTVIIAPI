Rails.application.routes.draw do
	post '/query' => 'application#query'
	post '/api' => 'application#api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
