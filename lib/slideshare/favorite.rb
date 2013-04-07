module Slip
  module Slideshare
    module Favorite

      # @see http://www.slideshare.net/developers/documentation#check_favorite
      # Check user favorites
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Integer] slideshow_id The slideshare slideshow id
      def check_favorite(username, password, slideshow_id)
        request.start(:check_favorite, {username: username, password: password, slideshow_id: slideshow_id})
      end
      alias :check_favourite :check_favorite # Oh Canada

      # @see http://www.slideshare.net/developers/documentation#add_favorite
      # Favorites slideshow (identified by slideshow_id)
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Integer] slideshow_id The slideshare slideshow id
      def add_favorite(username, password, slideshow_id)
        request.start(:add_favorite, {username: username, password: password, slideshow_id: slideshow_id})
      end
      alias :add_favourite :add_favorite # Oh Canada
    end
  end
end