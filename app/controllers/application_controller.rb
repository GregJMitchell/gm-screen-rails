class ApplicationController < ActionController::Base
  def is_current_user
    redirect_to new_user_session_path unless current_user
  end
end
