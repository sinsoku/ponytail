module ActionDispatch::Routing
  class Mapper
    def mount_ponytail
      resources :migrations, only: [:index, :new, :create, :destroy], module: :ponytail, path: 'rails/migrations' do
        collection do
          post :migrate
          post :rollback
        end
      end
    end
  end
end
