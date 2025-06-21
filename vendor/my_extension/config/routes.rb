Spree::Core::Engine.routes.draw do             # 1️⃣ opens Spree engine

  namespace :admin do                          # 2️⃣ opens admin namespace

    get '/design-template', to: 'my_extension/template_designer#index', as: :template_designer
    get '/template-designer/preview', to: 'my_extension/template_designer#preview', as: :template_preview
    get '/template-designer/customizer/:id', to: 'my_extension/template_designer#customizer', as: :template_customizer
    get '/template-designer/font', to: 'my_extension/template_designer#font', as: :template_designer_font
    get '/template-designer/gallery', to: 'my_extension/template_designer#gallery', as: :template_designer_gallery
    post '/template-designer/gallery', to: 'my_extension/template_designer#create_gallery_image', as: :create_gallery_image
    delete '/template_designer/gallery_image/:id', to: 'my_extension/template_designer#destroy_gallery_image', as: :destroy_gallery_image

    # Asset routes
    get '/template-designer-assets', to: 'my_extension/template_designer#assets', as: :template_designer_assets
    get '/template-designer/assets', to: 'my_extension/template_designer#new_asset', as: :new_template_designer_asset
    post '/template-designer-assets', to: 'my_extension/template_designer#create_asset', as: :create_template_designer_asset
    delete 'template-designer-assets/:id', to: 'my_extension/template_designer#destroy_asset', as: :destroy_template_designer_asset
    get '/template-designer-assets/:id', to: 'my_extension/template_designer#show_asset', as: :template_designer_asset
    patch '/template-designer-assets/:id', to: 'my_extension/template_designer#update_asset', as: :update_template_designer_asset



    # Font
    post '/template-designer/font', to: 'my_extension/template_designer#create_font', as: :create_font
    delete '/template_designer/font/:id', to: 'my_extension/template_designer#destroy_font', as: :destroy_font

    # Misc
    get "/gallery_images", to: "gallery_images#index"
    get "/font", to: "font#index"

    resources :templates

  end   # 👈 closes admin namespace

  namespace :api do                     # 3️⃣ opens api namespace
    namespace :v1 do                    # 4️⃣ opens v1
      resources :fonts, only: [:index, :show, :create, :update, :destroy]
      resources :gallerys, only: [:index, :show, :create, :update, :destroy]
    end   # 👈 closes v1
  end     # 👈 closes api

end       # 👈 closes Spree::Core::Engine.routes.draw
