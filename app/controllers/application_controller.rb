class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :sort_column, :sort_direction

  def after_sign_in_path_for(user)
    root_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  private
  def user_not_authorized
    flash[:alert] = 'You do not have permission to view/edit this content.'
    redirect_to request.referrer || root_path
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end