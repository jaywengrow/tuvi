require_relative "tuvi/version"
require_relative "tuvi/step"

module Tuvi

  def step(position, &block)
    @steps ||= []
    @steps << Step.new(position, &block)
  end

  def run
    @steps.each do |step|
      puts step.get_message
    end
  end

end
