class StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :get_date # :get_date

  def show
    @student = Student.find(params[:id])
    @student2 = Studentpair.find_by(date: @date)
    @partner = Studentpair.find_by(date: @date, student1: @student.id.to_i) ||
               Studentpair.find_by(date: @date, student2: @student.id.to_i)
    @partner1_email = Student.find(@partner.student1).email
    @partner2_email = Student.find(@partner.student2).email

    # Needs a catch
  end

  private

  def get_date
    # Date.today.strftime("%A")
    @date = Date.today
  end

  def get_date_dummy
    @date = '2019-09-21'
  end
end
