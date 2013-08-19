# Tuvi

Tuvi is a computer language for kids to create text-based games and applications. It is a Ruby DSL which provides a simple way to declare the flow of the program as a series of steps. Although the below example demonstrates the use of Tuvi in creating a Choose-Your-Own-Adventure type game, it can be used for any text game or application. Tuvi was written in order to introduce programming to my son, Tuvi!

## Installation

Install Tuvi simply with:

    $ gem install tuvi

## Usage

Here is a basic example program followed by an explanation:

    require 'tuvi'

    class ExampleProgram

      extend Tuvi

      step 1 do
        message "Welcome to KrazyMaze. Will you ever get out? BWAAHAAA! You have a choice to make: Go right or left"
        answer "right", 2
        answer "left", 3
      end

      step 2 do
        message "You're in the middle of the maze. Go right or left or straight."
        answer "right", 3
        answer "left", 4
        answer "straight", 3
      end

      step 3 do
        message "You've encountered a monster! You can either go straight, or punch the monster."
        answer "straight", 2
        answer "punch", 5
      end

      step 4 do
        message "Drat. You've reached the end of the maze! I'll get you next time..."
        stop
      end

      step 5 do
        message "The monster was stronger than you! You died."
        stop
      end

      run

    end

First, create a ruby file and on the first line require the Tuvi library with `require 'tuvi'`

Then, create a class with any name you desire. The first thing to do inside this class is: `extend Tuvi`.

From here on in, the Tuvi language is used. As you can see, the program is divided into steps, which represent a step in the program where the program provides some instructions, and either prompts the user for input or simply exits.

Every step needs a `message`, which sets the computer's instructions for that step.

Every step can establish one or more lines declaring an `answer` which is followed first by a valid user response, a comma, and then by the step number that that particular user response should lead to.

Some steps, instead of having answers, can simply end the program using the `stop` keyword.

Finally, after all the steps have been declared (but still within the class), the `run` keyword actually runs the steps.

You can run this file like any other Ruby file, using `ruby filename.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
