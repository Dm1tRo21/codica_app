class User < ApplicationRecord
  belongs_to :department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def admin?
    user_type == 'admin'
  end

  def doctor?
    user_type == 'doctor'
  end

end
