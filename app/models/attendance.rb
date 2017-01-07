class Attendance < ApplicationRecord
  belongs_to :user
  enum status: { stay: 0, leave: 1 }

  def self.record(user)
    today = Date.today
    attendance = self.new(user: user, date: today)
    last_record = where(user: user, date: today).last
    case last_record.try(&:status).try(&:to_sym)
    when :stay
      attendance.status = :leave
      last_record.duration = ((Time.now - last_record.created_at)/3600.0).round(2)
    when :leave
      attendance.status = :stay
    else
    end
    ApplicationRecord.transaction do
      last_record.save! if last_record.try(&:changed?)
      attendance.save!
    end
  end
end
