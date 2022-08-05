module KeyGenerator
  def self.generate
    5.times.map { rand(0..9).to_s }.join("")
  end
end
