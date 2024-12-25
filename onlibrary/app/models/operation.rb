# frozen_string_literal: true

class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :took, presence: true
  validates :user_id, uniqueness: { scope: :book_id,
                                     message: "может взять одну и ту же книгу только один раз",
                                    conditions: -> { where(returned: nil) } }
  validate :returned_must_be_after_took


  private
  def returned_must_be_after_took
    if returned.present? && returned.is_a?(ActiveSupport::TimeWithZone) && took.present? && returned < took
      errors.add(:returned, "должна быть не меньше, чем дата в took")
    end
  end
end
