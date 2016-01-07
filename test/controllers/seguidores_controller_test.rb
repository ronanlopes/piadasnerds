require 'test_helper'

class SeguidoresControllerTest < ActionController::TestCase
  setup do
    @seguidor = seguidores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguidores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguidor" do
    assert_difference('Seguidor.count') do
      post :create, seguidor: { description: @seguidor.description, favourites_count: @seguidor.favourites_count, followers_count: @seguidor.followers_count, following: @seguidor.following, friends_count: @seguidor.friends_count, lang: @seguidor.lang, listed_count: @seguidor.listed_count, location: @seguidor.location, name: @seguidor.name, profile_background_image_url: @seguidor.profile_background_image_url, profile_image_url: @seguidor.profile_image_url, screen_name: @seguidor.screen_name, statuses_count: @seguidor.statuses_count, url: @seguidor.url, verified: @seguidor.verified }
    end

    assert_redirected_to seguidor_path(assigns(:seguidor))
  end

  test "should show seguidor" do
    get :show, id: @seguidor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguidor
    assert_response :success
  end

  test "should update seguidor" do
    patch :update, id: @seguidor, seguidor: { description: @seguidor.description, favourites_count: @seguidor.favourites_count, followers_count: @seguidor.followers_count, following: @seguidor.following, friends_count: @seguidor.friends_count, lang: @seguidor.lang, listed_count: @seguidor.listed_count, location: @seguidor.location, name: @seguidor.name, profile_background_image_url: @seguidor.profile_background_image_url, profile_image_url: @seguidor.profile_image_url, screen_name: @seguidor.screen_name, statuses_count: @seguidor.statuses_count, url: @seguidor.url, verified: @seguidor.verified }
    assert_redirected_to seguidor_path(assigns(:seguidor))
  end

  test "should destroy seguidor" do
    assert_difference('Seguidor.count', -1) do
      delete :destroy, id: @seguidor
    end

    assert_redirected_to seguidores_path
  end
end
