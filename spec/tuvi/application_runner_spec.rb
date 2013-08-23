require 'spec_helper'

describe ApplicationRunner do

  before(:each) do
    @step = Step.new(1) do
      @answer_paths = {"yes" => 2}
    end
    @application_runner = ApplicationRunner.new([@step])
  end

  describe "Running the Tuvi program" do

    describe "determine_next_step" do

      it "should determine the next step based on answer paths" do
        @application_runner.determine_next_step(@step, "yes").should == 2
      end

      it "should set the next step to be the current step if input is invalid" do
        @application_runner.determine_next_step(@step, "blah").should == 1
      end

    end

  end
end