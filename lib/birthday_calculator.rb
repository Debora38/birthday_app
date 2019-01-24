require 'date'

class Birthday_calculator

  def initialize(day, month)
    @day = day
    @month = month
  end

  def today
    Date.today.jd
  end

  def month
    {
      January: '01',
      February: '02',
      March: '03',
      April: '04',
      May: '05',
      June: '06',
      July: '07',
      August: '08',
      September: '09',
      October: '10',
      November: '11',
      December: '12'
    }
  end

  def birthday_month
    self.month[@month.to_sym]
  end

  def birthday
    Date.strptime("#{@day}-#{self.birthday_month}-2019", "%d-%m-%Y").jd
  end

  def days_away
    self.birthday - self.today
  end

end
