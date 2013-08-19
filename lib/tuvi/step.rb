class Step

  attr_accessor :position, :answer_paths, :exit_program

  def initialize(position, &block)
    @position = position
    @answer_paths = {}
    instance_eval(&block) if block_given?
  end

  def message(text)
    @message = text
  end

  def get_message
    @message
  end

  def answer(input, step_number)
    @answer_paths[input.downcase] = step_number
  end

  def stop
    @exit_program = true
  end

end