module ActionDispatch::Routing
  class Mapper
    def mount_ponytail
      namespace :ponytail do
        resources :migrations, only: [:index, :new, :create, :destroy]
        resource :schema, only: [:show, :update]
      end
    end
  end
end
