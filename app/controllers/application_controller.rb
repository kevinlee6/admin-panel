class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  def after_sign_in_path_for(user)
    root_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end