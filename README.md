# Tuvi

Tuvi is a computer language for kids to create text-based games and applications. It is a Ruby DSL which provides a simple way to declare the flow of the program as a series of steps. Although the below example demonstrates the use of Tuvi in creating a Choose-Your-Own-Adventure type game, it can be used for any text game or application. Tuvi was written in order to introduce programming to my son, Tuvi!

## Installation

Install Tuvi simply with:

    $ gem install tuvi

## Usage

Here is a basic example program followed by an explanation:

    require 'tuvi'

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
      say "You walk up the stairs and see a strange creature. It comes towards you with its mouth gaping open and..."
      stop
    end

    step "basement" do
      say "There's an open door in front of you, and you make your escape from the haunted castle!"
      stop
    end

First, create a ruby file and on the first line require the Tuvi library with `require 'tuvi'`

From here on in, the Tuvi language is used. As you can see, the program is divided into Steps, which represent a step in the program where the program provides some instructions, and either prompts the user for input or simply exits.

Every step needs a `say`, which sets the computer's instructions for that step.

Every step can establish one or more lines declaring a `response` which is followed first by a valid user response, a hashrocket arrow, and then by the Step title (as a string) that that particular user response should lead to.

Some steps, instead of having responses, can simply `say` a message and then end the program using the `stop` keyword.

You can run this file like any other Ruby file, using `ruby filename.rb`.

You can also add arbitrary Ruby code by placing it in a block passed to the `code` method. If you set a variable, you'll have to do it as global variable. For example:

    step "start" do
      code {$points = 0}
      say "Welcome to KrazyMaze. Will you ever get out? BWAAHAAA! You have a choice to make: Go right or left"
      response "right" => "middle"
      response "left" => "east end"
    end

    step "middle" do
      code do
        $points += 1
        puts "You have #{$points} points."
      end
      say "You're in the middle of the maze. Go right or left or straight."
      response "right" => "west end"
      response "left" => "start"
      response "straight" => "dungeon"
    end

## Contributing (please do!)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
