Rails.application.routes.draw do
  resources :migrations, only: [:index, :new, :create], module: :ponytail, path: 'rails/migrations' do
    collection do
      post :migrate
      post :rollback
    end
  end
end
