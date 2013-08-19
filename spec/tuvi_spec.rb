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
        @program.instance_eval{@steps.last}.class.should == Step
      end

      it "should assign number parameter to step's position" do
        @program.step(1)
        @program.instance_eval{@steps.last}.position.should == 1
      end

      it "should assign a message based on message passed in block" do
        @program.step(1){|s| s.message "Hello!"}
        @program.instance_eval{@steps.last}.get_message.should == "Hello!"
      end
    end

    describe "run" do

    end

  end

end