require_relative "tuvi/version"
require_relative "tuvi/step"
require_relative "tuvi/application_runner"

module Tuvi

  def step(id, &block)
    @steps ||= {}
    @steps[id] = Step.new(id, &block)
  end

  def run
    ApplicationRunner.new(@steps).run
  end

end

extend Tuvi
