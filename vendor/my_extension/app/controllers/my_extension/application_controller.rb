module MyExtension
  class ApplicationController < ActionController::Base
    around_action :set_active_storage_host

    private

    def set_active_storage_host(&block)
      ActiveStorage::Current.url_options = { host: request.base_url }
      yield
    ensure
      ActiveStorage::Current.url_options = nil
    end
  end
end
