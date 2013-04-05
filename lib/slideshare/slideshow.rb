module Slip
  module Slideshare
    module Slideshow
      def get_slideshow(attrs = {})
        # => Break if one or the other isn't provided
        raise "Slideshow Id or Url required" unless attrs[:slideshow_id] || attrs[:slideshow_url]
        attrs.merge!(detailed: 1)

        # => Use the addressable gem to build the query string params
        uri = Addressable::URI.new    
        uri.query_values = attrs

        # => Send the request to slideshare
        @request.start(:get_slideshow, uri.query)
      end

      def upload_slideshow(attrs = {})
        uri = Addressable::URI.new
        uri.query_values = attrs
        @request.start(:upload_slideshow, uri.query)
      end
    end
  end
end