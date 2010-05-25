require 'test_helper'

class HighlightsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Highlight.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Highlight.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Highlight.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to highlight_url(assigns(:highlight))
  end
  
  def test_edit
    get :edit, :id => Highlight.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Highlight.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Highlight.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Highlight.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Highlight.first
    assert_redirected_to highlight_url(assigns(:highlight))
  end
  
  def test_destroy
    highlight = Highlight.first
    delete :destroy, :id => highlight
    assert_redirected_to highlights_url
    assert !Highlight.exists?(highlight.id)
  end
end
