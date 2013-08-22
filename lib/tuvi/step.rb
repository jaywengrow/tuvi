class Step

  attr_accessor :position, :answer_paths, :exit_program, :code_blocks

  def initialize(position, &block)
    @position = position
    @answer_paths = {}
    @code_blocks = []
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

  def formatted_answers
    "You can type one of the following: [#{@answer_paths.keys.join(", ")}] Enter 'exit' to quit."
  end

  def code(&block)
    code_blocks << block
  end

end