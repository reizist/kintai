class AttendancesController < ApplicationController
  def index
    @records = Attendance.where(user: current_user, date: Date.today).to_a
  end

  def record
    Attendance.record(current_user)
  end
end