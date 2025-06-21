module MyExtension
  class Engine < ::Rails::Engine
    isolate_namespace MyExtension

    initializer "my_extension.assets.precompile" do |app|
      app.config.assets.precompile += %w[
        spree/backend/my_extension/template_designer.css
      ]
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match?(root.to_s)
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    initializer "my_extension.load_decorators" do |app|
      Dir.glob(Engine.root.join("app/controllers/**/*_decorator.rb")).each do |decorator|
        require_dependency(decorator)
      end

      Dir.glob(Engine.root.join("app/models/**/*_decorator.rb")).each do |decorator|
        require_dependency(decorator)
      end
    end
  end
end
