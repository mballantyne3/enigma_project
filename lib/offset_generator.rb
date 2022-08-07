module OffsetGenerator
  def self.generate(date = Date.today.strftime("%d%m%y"))
    date_squared = date.to_i ** 2
    date_squared.to_s.chars.last(4)
  end
end
