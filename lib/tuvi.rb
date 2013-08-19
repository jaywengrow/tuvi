require_relative "tuvi/version"
require_relative "tuvi/step"

module Tuvi

  def step(position, &block)
    @steps ||= {}
    @steps[position] = Step.new(position, &block)
  end

  def run
    current_step = 1
    while true do
      puts @steps[current_step].get_message
      input = gets.chomp
      current_step = input.to_i
    end
  end

end
