module ActionDispatch::Routing
  class Mapper
    def mount_ponytail
      namespace :ponytail do
        resources :migrations, only: [:index, :new, :create, :destroy]
        resources :schema, only: [:index, :show, :update]
      end
    end
  end
end
