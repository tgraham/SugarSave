require 'test_helper'

class HighlightTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Highlight.new.valid?
  end
end
