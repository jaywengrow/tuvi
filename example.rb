require_relative 'lib/tuvi.rb'

class Example

  extend Tuvi

  step 1 do
    message "Howdy"
  end

  step 2 do
    message "Doody"
  end

  run

end