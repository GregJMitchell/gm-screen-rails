class ApplicationController < ActionController::Base
  include Breadcrumber
  include Pagy::Backend

  def is_current_user
    redirect_to new_user_session_path unless current_user
  end
end
