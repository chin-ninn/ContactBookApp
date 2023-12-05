class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :name_reading, :postal_code, :prefecture_id, :city,
      :house_number, :building_name, :phone_number, :fax_number, :admin_id
    ])
  end
end
