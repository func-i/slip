module Slip
  module Slideshare
    module Slideshow
      # @see http://www.slideshare.net/developers/documentation#get_slideshow
      # Gets a slideshow based on id or url.  Either slideshow_id or slideshow_url MUST be present
      # @param [Hash] options A hash of options to pass to the API
      # @return [Hash] The response hash
      def get_slideshow(options = {})
        # => Break if one or the other isn't provided
        raise "Slideshow Id or Url required" unless options[:slideshow_id] || options[:slideshow_url]
        options.merge!(detailed: 1)

        # => Send the request to slideshare
        @request.start(:get_slideshow, options)
      end

      # @see http://www.slideshare.net/developers/documentation#get_slideshows_by_tag
      # @see http://www.slideshare.net/developers/documentation#get_slideshows_by_group
      # @see http://www.slideshare.net/developers/documentation#get_slideshows_by_user
      # Consolidated get_slideshows for the methods get_slideshows_by_tag, get_slideshows_by_group and get_slideshows_by_user
      # @param [Hash] options A hash with one of the keywords which will make the appropriate API call
      # @return [Hash] The response hash
      def get_slideshows(options = {})
        if options[:tag]
          api_method = :get_slideshows_by_tag
        elsif options[:group]
          api_method = :get_slideshows_by_group
        elsif options[:username_for]
          api_method = :get_slideshows_by_user
        end
        if api_method
          @request.start(api_method, options)
        else
          raise "You must search by tag, group or username_for"
        end
      end

      # @see http://www.slideshare.net/developers/documentation#search_slideshows
      # Search all the slideshows based on a keyword
      # @param [String] keyword The keyword to query Slideshare for
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def search_slideshows(keyword, options = {limit: 10})
        options.merge!(q: keyword)
        request.start(:search_slideshows, options)
      end

      # @see http://www.slideshare.net/developers/documentation#edit_slideshow
      # Edit an existing slideshow
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Integer] slideshow_id The slideshare slideshow id to modify
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def edit_slideshow(username, password, slideshow_id, options = {})
        options.merge!(username: username, password: password, slideshow_id: slideshow_id)
        request.start(:edit_slideshow, options)
      end

      # @see http://www.slideshare.net/developers/documentation#delete_slideshow
      # Delete an existing slideshow
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Integer] slideshow_id The slideshare slideshow id to delete
      # @return [Hash] The response hash
      def delete_slideshow(username, password, slideshow_id, options = {})
        options.merge!(username: username, password: password, slideshow_id: slideshow_id)
        request.start(:delete_slideshow, options)
      end

      # @see http://www.slideshare.net/developers/documentation#upload_slideshow
      # Uploads a file from a url to Slideshare
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [String] url The url for the file you wish to send to slideshare
      # @param [String] title The title for the file in slideshare
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def upload_slideshow(username, password, upload_url, title, options = {})
        options.merge!(username: username, password: password, upload_url: upload_url, slideshow_title: title)
        request.start(:upload_slideshow, options)
      end
    end
  end
end