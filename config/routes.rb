Rails.application.routes.draw do
  resources :parkings do
    member do 
      put :out
      put :pay
    end
  end
  get '/historic/:plate', to: "parkings#historic"
end
