class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_date # :get_date
  before_action :get_week_number

  def show
    @admin = Admin.find(params[:id])
    @monday = Studentpair.where(date: '2017-09-25')
    @tuesday = Studentpair.where(date: '2017-09-26')
    @wednesday = Studentpair.where(date: '2017-09-27')
    @thursday = Studentpair.where(date: '2017-09-28')
    @friday = Studentpair.where(date: '2017-09-29')
  end

  private

  def get_date
    # Date.today.strftime("%A")
    @date = Date.today
    @dayofweek = Date.today.strftime("%A")
  end

  def get_date_dummy
    @date = '2019-09-21'
  end

  def get_week_number
    @weeknumber = Time.now.strftime('%U')
  end
end
