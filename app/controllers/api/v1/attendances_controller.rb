class Api::V1::AttendancesController < Api::V1::BaseController
  def record
    Attendance.record(current_user)
    render text: 'ok', status: 200
  end
end