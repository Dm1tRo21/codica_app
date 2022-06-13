class User < ApplicationRecord
  belongs_to :department, optional: true
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: 'patient_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  
  has_one_attached :photo
  
  scope :user, -> { where(user_role: 'user') }
  scope :doctor, -> { where(user_role: 'doctor') }
  scope :admin, -> { where(user_role: 'admin') }

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def admin?
    user_role == 'admin'
  end

  def doctor?
    user_role == 'doctor'
  end

  def patient?
    user_role == 'user'
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
