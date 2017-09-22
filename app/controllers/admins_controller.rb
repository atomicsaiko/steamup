require 'date'

class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_date # :get_date
  before_action :get_week_number
  # before_action :get_current_workday_dates

  def show
    @admin = Admin.find(params[:id])
    @monday_date = Date.today.strftime('%F')

    @monday = Studentpair.where(date: '2017-09-25')
    @tuesday = Studentpair.where(date: '2017-09-26')
    @wednesday = Studentpair.where(date: '2017-09-27')
    @thursday = Studentpair.where(date: '2017-09-28')
    @friday = Studentpair.where(date: '2017-09-29')
  end

  private

  def get_date
    @date = Date.today
    @dayofweek = Date.today.strftime("%A")
  end

  # def get_date_dummy
  #   @date = '2019-09-21'
  # end

  def get_week_number
    @weeknumber = Time.now.strftime('%U')
  end

  def get_current_workday_dates
    week = Time.now.strftime('%U').to_i
    year = Date.today.year.to_i

    # Date.commercial(2017,38,1).to_s
    # @monday_date = Date.commercial(year, week, 1).to_s
    # @monday_date = '2017-09-25'
    # @monday_date = Date.commercial(2017, 38, 1).to_s
    @tuesday_date = Date.commercial(year, week, 2)
    @wednesday_date = Date.commercial(year, week, 3)
    @thurday_date = Date.commercial(year, week, 4)
    @friday_date = Date.commercial(year, week, 5)
  end

end
