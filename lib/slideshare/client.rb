require 'slideshare/slideshow'

module Slip
  module Slideshare
    class Client
      require 'net/https'
      require "addressable/uri"
      require 'uri'

      include Slip::Slideshare::Slideshow
      
      attr_reader :request

      def initialize(api_key, shared_key)
        # => Initialize the object with the api access keys
        @request = Slip::Slideshare::Request.new
        @request.set_auth(api_key, shared_key)
      end      
    end
  end
end