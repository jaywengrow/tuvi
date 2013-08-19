class Step

  attr_accessor :position

  def initialize(position, &block)
    @position = position
    instance_eval(&block) if block_given?
  end

  def message(text)
    @message = text
  end

  def get_message
    @message
  end

end