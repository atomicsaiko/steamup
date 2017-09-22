class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # def promote_to_admin
  #   student = Student.find(params[:id])
  #   Admin.create!(email: student.email, password: student.encrypted_password)
  #   student.destroy
  # end
end
