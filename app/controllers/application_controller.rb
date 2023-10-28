class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:name, :name_reading, :postal_number, :prefecture_id, :city, :house_number, :building_name,
        :phone_number, :fax_number, :sex_id, :relationship_id, :primary_care, :emergency_contact, :role])
  end
end
