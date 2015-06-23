require 'test_helper'

class ReceipeTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.create(chefname: "Ramu", email: "ramu@example.com")
        @receipe = @chef.receipes.build(name: "Pongal", summary: "Good morning breakfast", 
        description: "Put rice, dhall, little salt in cooker, allow for  whistles, add oil, ghee, pepper and cashews at the end")
    end
    
    test "receipe should be valid" do
        assert @receipe.valid?    
    end
    
    test "chef_id should be present" do
        @receipe.chef_id = nil
        assert_not @receipe.valid?
    end
    
    test "name should be present" do
        @receipe.name = " "
        assert_not @receipe.valid?    
    end
    
    test "name should not be too long" do
        @receipe.name = "a" * 101
        assert_not @receipe.valid?
    end
    
    test "name should not be too short" do
        @receipe.name = "aaaa"
        assert_not @receipe.valid?
    end

    test "summmary should be present" do
        @receipe.summary = " "
        assert_not @receipe.valid?    
    end
    
    test "summary should not be too long" do
        @receipe.summary = "a" * 151
        assert_not @receipe.valid?
    end
    
    test "summary should not be too short" do
        @receipe.summary = "a" * 9
        assert_not @receipe.valid?
    end
    
    test "description should be present" do
        @receipe.description = " "
        assert_not @receipe.valid?    
    end
    
    test "description should not be too long" do
        @receipe.description = "a" * 501
        assert_not @receipe.valid?
    end
    
    test "description should not be too short" do
        @receipe.description = "a" * 19
        assert_not @receipe.valid?
    end

end
