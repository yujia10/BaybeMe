class Application < ApplicationRecord
  belongs_to :childcare
  belongs_to :child
  validates :start_date, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end
