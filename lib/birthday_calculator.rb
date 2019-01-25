require 'date'

class Birthday_calculator

  def initialize(day, month)
    @day = day
    @month = month
  end

  def today
    Date.today.jd
  end

  def birthday
    Date.new(Date.today.year, @month.to_i, @day.to_i).jd
  end

  def days_away
    self.birthday - self.today
  end

  def birthday_calc
    if days_away == 0
      0
    elsif days_away < 0
      self.days_away + 365
    else
      self.days_away
    end
  end
end
