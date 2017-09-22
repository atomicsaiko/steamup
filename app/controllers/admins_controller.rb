class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @students = Student.all
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end
end
