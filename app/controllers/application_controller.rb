class ApplicationController < ActionController::Base
    helper_method :calculate_total_price

  private

  def calculate_total_price(foods)
    foods.sum(&:price)
  end
end
