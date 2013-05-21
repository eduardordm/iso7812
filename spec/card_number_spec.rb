require 'spec_helper'

include Iso7812::CardNumber

describe "CardNumber" do

	it "should correctly validates a card" do
		valid?("378761728695330").should eq true
		valid?("4485006611888499").should eq true
		valid?("5351196743543506").should eq true
		valid?("6011925914749389").should eq true

		valid?("378761728695331").should eq false
		valid?("4485006611888491").should eq false
		valid?("5351196743543501").should eq false
		valid?("6011925914749381").should eq false

		valid?("6011").should eq false
	end

	it "should correctly generate a card" do
		generate("448500", "661188849").should eq("4485006611888499")
	end

end