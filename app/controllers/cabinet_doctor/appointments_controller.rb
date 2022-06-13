class CabinetDoctor::AppointmentsController < CabinetDoctor::CabinetController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def index
    @appointment = Appointment.where(doctor_id: current_user.id)
  end

  def show
    authorize! :read, @appointment
  end

  def edit
    authorize! :edit, @appointment
  end

  def update
    @appointment.status = 'closed'
    @appointment.update(appointment_params)
    redirect_to cabinet_doctor_appointments_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end
end
