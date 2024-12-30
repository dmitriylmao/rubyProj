# frozen_string_literal: true

class Book < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :author, presence: true
  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
