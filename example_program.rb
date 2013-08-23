require_relative 'lib/tuvi.rb'

step 1 do
  code {$x = "hello"}
  message "This is Step 1. Type yes to go to Step 2. Type no to go to Step 3."
  answer "Yes" => 2
  answer "No" => 3
end

step 2 do
  code {puts $x}
  message "This is Step 2. Type hi to go to Step 3. Type bye to go to step 1."
  answer "Hi" => 3
  answer "Bye" => 1
end

step 3 do
  message "You've reached the end!"
  stop
end

run