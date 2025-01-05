# frozen_string_literal: true

class AdminDashboardController < ApplicationController
  before_action :authenticate_admin
  def index

  end
end
