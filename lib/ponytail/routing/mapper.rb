module ActionDispatch::Routing
  class Mapper
    def mount_ponytail
      namespace :ponytail do
        resources :migrations, only: [:index, :new, :create, :destroy]
        resources :tables, only: [:index, :show, :create, :update, :destroy] do
          resources :columns, only: [:create, :update, :destroy]
          resources :indexes, only: [:create, :update, :destroy]
        end
        resource :schema, only: :update, controller: :schema
      end
    end
  end
end
