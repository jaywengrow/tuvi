class Step

  attr_accessor :id, :answer_paths, :exit_program, :code_blocks

  def initialize(id, &block)
    @id = id
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

  def answer(answer_path)
    answer = answer_path.first[0].downcase
    next_step = answer_path.first[1]
    @answer_paths[answer] = next_step
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