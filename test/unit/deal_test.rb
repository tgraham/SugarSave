require 'test_helper'

class DealTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Deal.new.valid?
  end
end
