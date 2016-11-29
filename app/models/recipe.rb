class Recipe < ApplicationRecord
  belongs_to :user

  def ingredients_list
    return ingredients.split(", ")
  end

  def directions_list
    return directions.split(", ")
  end

  def pretty_time
    return created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end
