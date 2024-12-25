# frozen_string_literal: true

class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :took, presence: true
  validate :returned_must_be_after_took

  private
  def returned_must_be_after_took
    if returned.present? && returned < took
      errors.add(:returned, "должна быть не меньше, чем дата в took")
    end
  end
end
