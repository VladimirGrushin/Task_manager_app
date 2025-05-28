class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "У вас нет прав для выполнения этого действия."
    redirect_to(request.referrer || root_path)
  end
end
