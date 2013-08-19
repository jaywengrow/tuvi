class Step

  attr_accessor :position

  def initialize(position)
    @position = position
    yield self if block_given?
  end

  def message(text)
    @message = text
  end

  def get_message
    @message
  end

end