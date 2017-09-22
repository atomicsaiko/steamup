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
  end
end
