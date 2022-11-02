require "test_helper"

class GossiptagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gossiptag = gossiptags(:one)
  end

  test "should get index" do
    get gossiptags_url
    assert_response :success
  end

  test "should get new" do
    get new_gossiptag_url
    assert_response :success
  end

  test "should create gossiptag" do
    assert_difference("Gossiptag.count") do
      post gossiptags_url, params: { gossiptag: {  } }
    end

    assert_redirected_to gossiptag_url(Gossiptag.last)
  end

  test "should show gossiptag" do
    get gossiptag_url(@gossiptag)
    assert_response :success
  end

  test "should get edit" do
    get edit_gossiptag_url(@gossiptag)
    assert_response :success
  end

  test "should update gossiptag" do
    patch gossiptag_url(@gossiptag), params: { gossiptag: {  } }
    assert_redirected_to gossiptag_url(@gossiptag)
  end

  test "should destroy gossiptag" do
    assert_difference("Gossiptag.count", -1) do
      delete gossiptag_url(@gossiptag)
    end

    assert_redirected_to gossiptags_url
  end
end
