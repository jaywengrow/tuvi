require_relative 'lib/tuvi.rb'

step "start" do
  say "You have just woken up from a fitful sleep. You get out of your bed ... and you realize that you are not in your bedroom. As your eyes take in your surroundings, you realize that you are in some sort of dungeon. 'How did I get here?' you wonder. You see a small table with with a key on it."
  response "take key" => "door"
end

step "door" do
  say "You're holding the key. In front of you is a locked door with 3 locks. One is painted red, one is painted blue, and one is painted black. Which lock do you want to try the key on?"
  response "red" => "locked door"
  response "blue" => "locked door"
  response "black" => "open door"
end

step "locked door" do
  say "Hmmm. That didn't work. Perhaps the key would work on a different lock..."
  response "red" => "locked door"
  response "blue" => "locked door"
  response "black" => "open door"
end

step "open door" do
  say "It worked! The door swings open slowly, and you enter what seems to be a dark hallway. Eventually the hallway comes to a pair of staircases, one of which goes up, and the other of which goes down. You hear footsteps on the floor above you, and you wonder which staircase you should take."
  response "up" => "second floor"
  response "down" => "basement"
end

step "second floor" do
  say "You walk up the stairs and see a strange creature. It comes towards you and..."
  stop
end

step "basement" do
  say "There's an open door in front of you, and you make your escape from the haunted castle!"
  stop
end