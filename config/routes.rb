Rails.application.routes.draw do
  root to: "parkings#index"
  get '/historic/:plate', to: "parkings#historic"
  
  resources :parkings do
    member do 
      put :out
      put :pay
    end
  end
end
