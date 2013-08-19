require_relative 'lib/tuvi.rb'

class Example

  extend Tuvi

  step 1 do |s|
    s.message "Howdy"
  end

  step 2 do |s|
    s.message "Doody"
  end

  run

end