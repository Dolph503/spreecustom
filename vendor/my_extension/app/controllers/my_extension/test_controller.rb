module MyExtension
  class TestController < ApplicationController
    def index
      @message = "Hello from MyExtension!"
    end
  end
end
