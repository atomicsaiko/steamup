class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @students = Student.all
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def promote_to_admin
    student = Student.find(params[:id])
    Admin.create!(email: student.email, password: student.encrypted_password)
    student.destroy

    redirect_to admins_path, notice: "Succesfully promoted Student to Admin!"
  end

  def demote_to_student
    admin = Admin.find(params[:id])
    total_admins = Admin.all.count

    if total_admins > 1
      Student.create!(email: admin.email, password: admin.encrypted_password)
      admin.destroy
      redirect_to admins_path, notice: "Succesfully demoted Student to Admin!"
    else
      redirect_to admins_path, notice: "Can't delete last Admin!"
    end
  end
end
