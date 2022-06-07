module ApplicationHelper
  def cabinet_by_role
    return home_index_path unless current_user
    return admin_root_path if current_user.admin?
    return cabinet_doctor_cabinet_index_path if current_user.doctor?
    cabinet_patient_cabinet_index_path
  end
end
