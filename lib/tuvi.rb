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
      current_step = execute_step(current_step)
    end
  end

  def execute_step(current_step)
    puts @steps[current_step].get_message
    exit if @steps[current_step].exit_program
    puts @steps[current_step].formatted_answers
    determine_next_step(current_step)
  end

  def determine_next_step(current_step)
    input = gets.downcase.chomp
    if @steps[current_step].answer_paths[input]
      next_step = @steps[current_step].answer_paths[input]
    else
      puts "Sorry, I don't understand that answer. Please try again:"
      next_step = current_step
    end
    next_step
  end

end
