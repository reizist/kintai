class AttendancesController < ApplicationController
  def index
    @records = Attendance.where(user: current_user, date: Time.now.getutc.to_date).to_a
  end

  def record
    Attendance.record(current_user)
  end
end