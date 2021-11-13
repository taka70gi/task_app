class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_on, presence: true
    validates :end_on, presence: true

    validate :date_before_start
    validate :date_before_finish

    def date_before_start
        errors.add(:start_on, "は今日以降のものを選択してください") if start_on < Date.today
    end

    def date_before_finish
        errors.add(:end_on, "は開始日以降のものを選択してください") if end_on < start_on
    end
end
