module Spree
  module Admin
    module MyExtension
      class TemplateDesignerController < Spree::Admin::BaseController
        wrap_parameters format: [:json]

        def index
          @fonts = Font.all 
          @gallery_images = Gallery.all
          @assets = ::Asset.all
          
        end

        def font
          @fonts = Font.all  
          
        end
        def preview
          @templates = Template.all  
          
        end
        def customizer
          @fonts = Font.all 
          @gallery_images = Gallery.all
          
        end
        def create_font
          uploaded_file = params[:font][:file]
        
          @font = Font.new(font_params.except(:file)) # Prevent mass-assignment of file
        
          if uploaded_file.present?
            filename = File.basename(uploaded_file.original_filename, ".*")
            @font.name = filename
            @font.file.attach(uploaded_file)  # ✅ Attach file here
          end
        
          if @font.save
            redirect_to spree.admin_template_designer_font_path, notice: 'Font uploaded successfully.'
          else
            render :font, alert: 'Failed to upload font.'
          end
        end

        def destroy_font
          @font = Font.find(params[:id])
          @font.destroy
          redirect_to spree.admin_template_designer_font_path, notice: 'Font deleted successfully.'
        end

        def gallery
          @gallery_images = Gallery.all
        end
        
        def update_asset
          asset_id = params[:id].to_i
          @asset = ::Asset.find(asset_id)
          if @asset.update(asset_params)
            render json: { message: 'Asset updated successfully.', redirect_url: admin_template_designer_asset_path(@asset) }, status: :ok
          else
            render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def create_gallery_image
          uploaded_file = params[:gallery][:image]
          @gallery_image = Gallery.new(gallery_params)
        
          
          @gallery_image.title = uploaded_file.original_filename if uploaded_file.present?
        
          if @gallery_image.save
            redirect_to spree.admin_template_designer_gallery_path, notice: 'Image uploaded successfully.'
          else
            render :gallery, alert: 'Failed to upload image.'
          end
        end

        def destroy_gallery_image
          @gallery_image = Gallery.find(params[:id])
          @gallery_image.destroy
          redirect_to spree.admin_template_designer_gallery_path, notice: 'Image deleted successfully.'
        end
        def assets
          @assets = ::Asset.order(created_at: :desc)
        end
        
        def new_asset
          @asset = ::Asset.new
          @gallery_images = []
        end
        
        def create_asset
          @asset = ::Asset.new(asset_params)
        
          if @asset.save
            render json: { message: 'Asset created successfully.', redirect_url: admin_template_designer_assets_path }, status: :ok
          else
            render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
          end
        end
      
        def destroy_asset
          @asset = ::Asset.find(params[:id])
          @asset.destroy
          redirect_to spree.admin_template_designer_assets_path, notice: 'Asset deleted successfully.'
        end

        def show_asset
          asset = ::Asset.find_by(id: params[:id])
        
          if asset
            render json: {
              id: asset.id,
              name: asset.name,
              data: asset.data,
              created_at: asset.created_at
            }
          else
            render json: { error: 'Asset not found' }, status: :not_found
          end
        end
        
        
        
        private

        def gallery_params
          params.require(:gallery).permit(:title, :image)
        end

        def font_params
          params.require(:font).permit(:name, :file)
        end

        def asset_params
          params.require(:asset).permit(:name, data: {})
        end

      end
    end
  end
end
