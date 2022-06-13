class CabinetDoctor::CabinetController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_doctor

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to cabinet_doctor_appointments_path, alert: exception.message
  end

  layout 'cabinet_doctor'

  def authenticate_doctor
    redirect_to home_index_path unless current_user.doctor?
  end

end
