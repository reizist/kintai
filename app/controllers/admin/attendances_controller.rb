class Admin::AttendancesController < ApplicationController
  def index
    @records = Attendance.where(date: Date.today, user: User.first)
  end
end