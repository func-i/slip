module Slip
  module Slideshare
    class Request
      require 'digest/sha1'
      require 'net/https'
      require "addressable/uri"
      require 'uri'      

      def initialize
        @endpoint = "https://www.slideshare.net/api/2/"        
      end

      def set_auth(api_key, shared_key)
        @api_key, @shared_key = api_key, shared_key
      end

      def start(method, options)

        # => Use the addressable gem to build the query string params
        uri = Addressable::URI.new    
        uri.query_values = options
        params = uri.query

        timestamp = Time.now.to_i
        hash = Digest::SHA1.hexdigest @shared_key + timestamp.to_s    

        uri = URI.parse(@endpoint + method.to_s + "?#{params}&api_key=#{@api_key}&hash=#{hash}&ts=#{timestamp}")
        puts uri
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)        

        # => Return the response back as a hash
        parser = Slip::Slideshare::Parser.new(response.body)
        parser.parse
      end
    end
  end
end