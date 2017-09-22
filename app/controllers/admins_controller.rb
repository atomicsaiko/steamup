require 'date'

class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_date

  def show
    @admin = Admin.find(params[:id])
  end

  private

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

end
