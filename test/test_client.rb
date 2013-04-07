require 'helper'

class TestClient < Test::Unit::TestCase
  should "require an api_key and shared_key when instantiating" do
    assert_raise ArgumentError do 
      Slip::Slideshare::Client.new
    end
  end

  should "create a new client with a request object when api_key and shared_key are provided" do
    slip_client = Slip::Slideshare::Client.new("test_api_key", "test_shared_key")
    assert_not_nil slip_client.request
    assert_equal Slip::Slideshare::Request, slip_client.request.class
  end

  should "respond to Slideshow module methods" do
    slip_client = Slip::Slideshare::Client.new("test_api_key", "test_shared_key")
    assert slip_client.respond_to? :get_slideshow
    assert slip_client.respond_to? :get_slideshows
    assert slip_client.respond_to? :search_slideshows
    assert slip_client.respond_to? :edit_slideshow
    assert slip_client.respond_to? :delete_slideshow
    assert slip_client.respond_to? :upload_slideshow
  end
end
