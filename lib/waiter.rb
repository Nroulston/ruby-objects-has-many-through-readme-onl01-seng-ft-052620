
class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    self.name = name
    self.yrs_experience = yrs_experience
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer_instance, total, tip = 0)
    Meal.new(self, customer_instance, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end
end
