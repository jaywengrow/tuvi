class Step

  attr_accessor :id, :response_paths, :exit_program, :code_blocks

  def initialize(id, &block)
    @id = id
    @response_paths = {}
    @code_blocks = []
    instance_eval(&block) if block_given?
  end

  def say(text)
    @say = text
  end

  def get_say
    @say
  end

  def response(response_path)
    response = response_path.first[0].downcase
    next_step = response_path.first[1]
    @response_paths[response] = next_step
  end

  def stop
    @exit_program = true
  end

  def formatted_responses
    "Choose a command: [#{@response_paths.keys.join(", ")}]"
  end

  def code(&block)
    code_blocks << block
  end

end