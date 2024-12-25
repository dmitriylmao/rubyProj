# frozen_string_literal: true

class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :took, presence: true
end
