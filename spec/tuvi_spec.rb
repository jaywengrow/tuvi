require 'spec_helper'

describe Tuvi do

  class Program
    include Tuvi
  end

  before(:each) do
    @program = Program.new
  end

  describe "The Tuvi language helper methods" do

    describe "step" do

      it "should return a new step" do
        @program.step(1)
        @program.instance_eval{@steps[1]}.class.should == Step
      end

      it "should assign number parameter to step's position" do
        @program.step(1)
        @program.instance_eval{@steps[1]}.position.should == 1
      end

      it "should assign a message based on message passed in block" do
        @program.step(1){message "Hello!"}
        @program.instance_eval{@steps[1]}.get_message.should == "Hello!"
      end

      it "should assign answer paths based on answers passed in block" do
        @program.step(1){answer "yes", 2}
        @program.instance_eval{@steps[1]}.answer_paths["yes"].should == 2
      end

      it "should mark a step as exit_program if 'stop' is passed in block" do
        @program.step(1){stop}
        @program.instance_eval{@steps[1]}.exit_program.should be_true
      end
    end

    describe "run" do

    end

  end

end