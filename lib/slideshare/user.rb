module Slip
  module Slideshare
    module User

      # @see http://www.slideshare.net/developers/documentation#get_user_favorites
      # Returns user favorites
      # @param [String] username_for Username of user whose contacts are being requested
      # @return [Hash] The response hash
      def get_user_favorites(username_for)
        request.start(:get_user_favorites, {username_for: username_for})
      end
      alias :get_user_favourites :get_user_favorites # Oh Canada

      # @see http://www.slideshare.net/developers/documentation#get_user_contacts
      # Returns user contacts
      # @param [String] username_for Username of user whose contacts are being requested
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def get_user_contacts(username_for, options = {limit: 10})
        options.merge!(username_for: username_for)
        request.start(:get_user_contacts, options)
      end

      # @see http://www.slideshare.net/developers/documentation#get_user_groups
      # Returns user groups
      # @param [String] username_for Username of user whose contacts are being requested
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def get_user_groups(username_for, options = {limit: 10})
        options.merge!(username_for: username_for)
        request.start(:get_user_groups, options)
      end

      #@see http://www.slideshare.net/developers/documentation#get_user_tags
      # Returns user tags
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @return [Hash] The response hash
      def get_user_tags(username, password)
        request.start(:get_user_tags, {username: username, password: password})
      end
    end
  end
end 