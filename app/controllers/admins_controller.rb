class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_date

  def index
    @students = Student.all
    @admins = Admin.all
  end

  def show
    @studentpair_count = Studentpair.all.count
    @admin = Admin.find(params[:id])
  end

  #private

  def get_date
    @date = Date.today + (7 - Date.today.strftime('%u').to_i).days
    @date = @date + 2.day if @date.wday == 6
    @date = @date + 1.day if @date.wday == 0
    @week = Date.today.strftime('%V').to_i + 1
    year = @date.year
    @wkBegin = Date.commercial(year, @week, 1)
    @wkEnd = Date.commercial(year, @week, 6)
    @pairs = Studentpair.where(date: @wkBegin..@wkEnd).all
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

  def create_studentpairs
    admin = Admin.find(params[:id])
    Studentpair.steamup

    redirect_to admin_path(admin), notice: "Created Studentpairs"
  end

  def delete_studentpairs
    admin = Admin.find(params[:id])
    Studentpair.destroy_all

    redirect_to admin_path(admin), notice: "Deleted all Studentpairs"
  end
end
