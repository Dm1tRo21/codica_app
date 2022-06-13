class CabinetPatient::CabinetController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to cabinet_patient_appointments_path, alert: exception.message
  end

  layout 'cabinet_patient'

  def authenticate_user
    redirect_to home_index_path unless current_user.patient?
  end
end
