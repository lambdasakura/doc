require "benchmark"
a = []
puts Benchmark::CAPTION
puts Benchmark.measure {
  10000000.times do
    a.push(rand 100)
  end
}
class Charactor 
  attr_accessor :x, :y
  def initialize(x,y)
    x,y = x,y
  end
end

puts Benchmark::CAPTION
puts Benchmark.measure {
  10000000.times do
    Charactor.new(rand(640),rand(480))
  end
}


