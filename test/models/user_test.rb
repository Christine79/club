require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  require 'test_helper'

  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
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

#          post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
          post users_url, params: { user: { name: 'moi' ,firstname: 'moiaussi', email: 'moi@gmail.Com'} }
        end
        assert_redirected_to user_url(User.last)
    end


    test "should create user AVEC NAME VIDE" do
        assert_difference('User.count') do

#          post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
          post users_url, params: { user: { name: '' ,firstname: 'moiaussi', email: 'moi@gmail.Com'} }
        end
        assert_redirected_to user_url(User.last)
    end

    test "should create user AVEC NAME A BLANC" do
        assert_difference('User.count') do

#          post users_url, params: { user: { name: @user.name ,firstname: @user.firstname, email: @user.email } }
          post users_url, params: { user: { name: '    ' ,firstname: 'moiaussi', email: 'moi@gmail.Com'} }
        end
        assert_redirected_to user_url(User.last)
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


end
