class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    def authenticated?
      redirect_to signin_path unless signed_in?
    end
end
