require 'slideshare/favorite'
require 'slideshare/lead'
require 'slideshare/slideshow'
require 'slideshare/user'

module Slip
  module Slideshare
    class Client      
      include Slip::Slideshare::Favorite
      include Slip::Slideshare::Lead
      include Slip::Slideshare::Slideshow
      include Slip::Slideshare::User

      attr_reader :request

      def initialize(api_key, shared_key)
        # => Initialize the object with the api access keys
        @request = Slip::Slideshare::Request.new
        @request.set_auth(api_key, shared_key)
      end      
    end
  end
end