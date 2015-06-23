News::Application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
 		resources :authors     
    end
  end
end
