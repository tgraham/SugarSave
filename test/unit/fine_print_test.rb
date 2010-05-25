require 'test_helper'

class FinePrintTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FinePrint.new.valid?
  end
end
