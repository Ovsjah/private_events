class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    def authenticate
      redirect_to signin_path unless signed_in?
    end
end
