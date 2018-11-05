  require 'test_helper'

  class UsersControllerTest < ActionDispatch::IntegrationTest


     setup do
       @user = users(:one)
     end

     test "the truth" do
       assert true
     end

    test "should not save user without name" do
      user = User.new
      assert_not user.save
    end

    test "should get index" do
      get users_url
      assert_response :success
    end

    test "should get new" do
      get new_user_url
      assert_response :success
    end

    test "should create user AVEC DONNEES COMPLETES" do
        assert_difference('User.count') do
          post users_url, params: { user: { name: 'moi' ,firstname: 'moiaussi', email: 'moi@gmail.com'} }
        end
        assert_redirected_to user_url(User.last)
    end

#    test "should create user AVEC un mail DEJA UTILISE" do
#            assert_raises(NameError) do
#
  #          post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
#            post users_url, params: { user: { name: 'moi2' ,firstname: 'moi2aussi', email: 'moi@gmail.com' {:uniqueness => true }} }
#          end
#          assert_not user.save

#    end

    test "should create user AVEC un mail DEJA UTILISE" do
        user_copy = users.dup
        @user.save
        assert_not @user.save

    end


    test "should NOT create user AVEC NAME VIDE" do
      assert_raises(NameError) do
#          post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
          post users_url, params: { user: { name: '' ,firstname: 'moiaussi', email: 'moi@gmail.Com'} }
          assert_not user.save
      end
    end

    test "should NOT create user AVEC NAME A BLANC" do
        assert_raises(NameError) do

#         post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
          post users_url, params: { user: { name: '    ' ,firstname: 'moiaussi', email: 'moi@gmail.Com'} }
          assert_not user.save
        end
    end


  test "C H R I S T I N E should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

    test "should show user" do
      get user_url(@user)
      assert_response :success
    end

    test "should get edit" do
      get edit_user_url(@user)
      assert_response :success
    end

    test "should update user" do
      patch user_url(@user),  params: { user: { name: 'Pierre' ,firstname: 'Paul' , email: 'Paul@gmail.Com' } }
      assert_redirected_to user_url(@user)
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete user_url(@user)
      end

      assert_redirected_to users_url
    end
  end
