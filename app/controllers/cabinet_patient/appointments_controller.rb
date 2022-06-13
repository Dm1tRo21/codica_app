class CabinetPatient::AppointmentsController < CabinetPatient::CabinetController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def index
    @appointment = Appointment.where(patient_id: current_user.id)
  end

  def show
    authorize! :read, @appointment
  end

  def add
    @department = Department.all
  end

  def new
    @appointment = Appointment.new
    @department_id = params['department_id']
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_user.id
    @appointment.recommendation = ''

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to cabinet_patient_appointments_path, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :start_time)
  end
end
