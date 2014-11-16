class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :is_signed_in
  before_action :verify_admin, only: [:index,:show]

  expose(:users)
  expose(:user)


  def show
    unless user == current_user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  

end
