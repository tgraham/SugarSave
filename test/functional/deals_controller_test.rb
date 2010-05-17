require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Deal.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Deal.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Deal.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to deal_url(assigns(:deal))
  end
  
  def test_edit
    get :edit, :id => Deal.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Deal.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Deal.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Deal.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Deal.first
    assert_redirected_to deal_url(assigns(:deal))
  end
  
  def test_destroy
    deal = Deal.first
    delete :destroy, :id => deal
    assert_redirected_to deals_url
    assert !Deal.exists?(deal.id)
  end
end
