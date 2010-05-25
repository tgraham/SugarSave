require 'test_helper'

class FinePrintsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => FinePrint.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    FinePrint.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    FinePrint.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to fine_print_url(assigns(:fine_print))
  end
  
  def test_edit
    get :edit, :id => FinePrint.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    FinePrint.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FinePrint.first
    assert_template 'edit'
  end
  
  def test_update_valid
    FinePrint.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FinePrint.first
    assert_redirected_to fine_print_url(assigns(:fine_print))
  end
  
  def test_destroy
    fine_print = FinePrint.first
    delete :destroy, :id => fine_print
    assert_redirected_to fine_prints_url
    assert !FinePrint.exists?(fine_print.id)
  end
end
