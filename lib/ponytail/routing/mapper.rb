module ActionDispatch::Routing
  class Mapper
    def mount_ponytail
      namespace :ponytail do
        resources :migrations, only: [:index, :new, :create, :destroy]
        resources :tables, only: [:index, :show], path: :schema, as: :schema
        resource :schema, only: :update, controller: :schema
      end
    end
  end
end
