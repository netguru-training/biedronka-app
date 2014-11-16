class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def verify_admin
    unless current_user.admin?
      flash[:error] = "You have insufficient right to do this."
      redirect_to root_path
    end
  end

  def is_signed_in
    redirect_to root_path, notice: 'Sorry, you are not signed in!' unless user_signed_in?
  end

end
