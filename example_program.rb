require_relative 'lib/tuvi.rb'

step 1 do
  code {$x = "hello"}
  say "This is Step 1. Type yes to go to Step 2. Type no to go to Step 3."
  response "Yes" => 2
  response "No" => 3
end

step 2 do
  code {puts $x}
  say "This is Step 2. Type hi to go to Step 3. Type bye to go to step 1."
  response "Hi" => 3
  response "Bye" => 1
end

step 3 do
  say "You've reached the end!"
  stop
end

run