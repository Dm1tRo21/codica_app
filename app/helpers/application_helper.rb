module ApplicationHelper
  def cabinet_by_role
    return home_index_path unless current_user
    return admin_root_path if current_user.admin?
    return cabinet_doctor_appointments_path if current_user.doctor?
    cabinet_patient_appointments_path
  end
end
