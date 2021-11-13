class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_on, presence: true
    validates :end_on, presence: true

    validate :date_before_start
    validate :date_before_finish

    def date_before_start
        return if end_on.blank? || start_on.blank?
        errors.add(:start_on, "は今日以降のものを選択してください") if start_on.to_date < Date.today
    end

    def date_before_finish
        return if end_on.blank? || start_on.blank?
        return errors.add(:end_on, "は開始日以降のものを選択してください") if end_on < start_on
    end
end
