class RegistrationsController < Devise::RegistrationsController

  def edit
    @notifications = Notification.where(user_id: current_user)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
