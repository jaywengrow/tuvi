# Tuvi

Tuvi is a computer language for kids to create text-based games and applications. It is a Ruby DSL which provides a simple way to declare the flow of the program as a series of steps. Although the below example demonstrates the use of Tuvi in creating a Choose-Your-Own-Adventure type game, it can be used for any text game or application. Tuvi was written in order to introduce programming to my son, Tuvi!

## Installation

Install Tuvi simply with:

    $ gem install tuvi

## Usage

Here is a basic example program followed by an explanation:

    require 'tuvi'

    step 1 do
      say "Welcome to KrazyMaze. Will you ever get out? BWAAHAAA! You have a choice to make: Go right or left"
      response "right" => 2
      response "left" => 3
    end

    step 2 do
      say "You're in the middle of the maze. Go right or left or straight."
      response "right" => 3
      response "left" => 4
      response "straight" => 3
    end

    step 3 do
      say "You've encountered a monster! You can either go straight, or punch the monster."
      response "straight" => 2
      response "punch" => 5
    end

    step 4 do
      say "Drat. You've reached the end of the maze! I'll get you next time..."
      stop
    end

    step 5 do
      say "The monster was stronger than you! You died."
      stop
    end

    run


First, create a ruby file and on the first line require the Tuvi library with `require 'tuvi'`

From here on in, the Tuvi language is used. As you can see, the program is divided into steps, which represent a step in the program where the program provides some instructions, and either prompts the user for input or simply exits.

Every step needs a `say`, which sets the computer's instructions for that step.

Every step can establish one or more lines declaring an `response` which is followed first by a valid user response, a hashrocket arrow, and then by the step number that that particular user response should lead to.

Some steps, instead of having responses, can simply end the program using the `stop` keyword.

Finally, after all the steps have been declared (but still within the class), the `run` keyword actually runs the steps.

You can run this file like any other Ruby file, using `ruby filename.rb`.

You can also add any custom Ruby code by placing it block passed to the `code` method. Also note that variables should be set as globals. For example:

    step 1 do
      code {$steps = 1}
      say "Welcome to KrazyMaze. Will you ever get out? BWAAHAAA! You have a choice to make: Go right or left"
      response "right" => 2
      response "left" => 3
    end

    step 2 do
      code do
        $steps += 1
        puts "You have taken #{$steps} steps."
      end
      say "You're in the middle of the maze. Go right or left or straight."
      response "right" => 3
      response "left" => 4
      response "straight" => 3
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
