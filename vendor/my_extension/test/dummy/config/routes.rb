Rails.application.routes.draw do
  mount MyExtension::Engine => "/my_extension"
end
