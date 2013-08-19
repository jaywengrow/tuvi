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
      exit if @steps[current_step].exit_program
      puts @steps[current_step].formatted_answers
      input = gets.downcase.chomp
      if @steps[current_step].answer_paths[input]
        current_step = @steps[current_step].answer_paths[input]
      else
        puts "Sorry, I don't understand that answer. Please try again:"
      end
    end
  end

end
