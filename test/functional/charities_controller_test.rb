require 'test_helper'

class CharitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Charity.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Charity.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Charity.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to charity_url(assigns(:charity))
  end
  
  def test_edit
    get :edit, :id => Charity.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Charity.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Charity.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Charity.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Charity.first
    assert_redirected_to charity_url(assigns(:charity))
  end
  
  def test_destroy
    charity = Charity.first
    delete :destroy, :id => charity
    assert_redirected_to charities_url
    assert !Charity.exists?(charity.id)
  end
end
