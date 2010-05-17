require 'test_helper'

class CharityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Charity.new.valid?
  end
end
