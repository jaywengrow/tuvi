require_relative "tuvi/version"
require_relative "tuvi/step"
require 'ostruct'

module Tuvi

  def step(position, &block)
    @steps ||= {}
    @steps[position] = Step.new(position, &block)
  end

  def run
    current_step_position = 1
    while true do
      current_step_position = execute_step(current_step_position)
    end
  end

  def execute_step(step_position)
    current_step = @steps[step_position]
    current_step.code_blocks.each do |block|
      block.call
    end
    puts current_step.get_message
    exit if current_step.exit_program
    puts current_step.formatted_answers
    input = gets.downcase.chomp
    exit_program if input == "exit"
    determine_next_step(current_step, input)
  end

  def determine_next_step(current_step, input)
    if current_step.answer_paths[input]
      next_step_position = current_step.answer_paths[input]
    else
      puts "Sorry, I don't understand that answer. Please try again:"
      next_step_position = current_step.position
    end
    next_step_position
  end

  def exit_program
    puts "Bye!"
    exit
  end

end

extend Tuvi
