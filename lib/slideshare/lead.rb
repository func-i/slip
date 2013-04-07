module Slip
  module Slideshare
    module Lead

      # @see http://www.slideshare.net/developers/documentation#get_user_campaign_leads
      # Get user campaign leads
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Integer] campaign_id Campaign id to select the leads form
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def get_user_campaign_leads(username, password, campaign_id, options = {})
        options.merge!(username: username, password: password, campaign_id: campaign_id)
        request.start(:get_user_campaign_leads, options)
      end

      # @see http://www.slideshare.net/developers/documentation#get_user_campaigns
      # Get user campaigns
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @return [Hash] The response hash
      def get_user_campaigns(username, password)
        request.start(:get_user_campaigns, {username: username, password: password})
      end

      # @see http://www.slideshare.net/developers/documentation#get_user_leads
      # Get user leads
      # @param [String] username The username for the slideshare account
      # @param [String] password The password for the slideshare account
      # @param [Hash] options Additional options to pass to the API
      # @return [Hash] The response hash
      def get_user_leads(username, password, options = {})
        options.merge(username: username, password: password)
        request.start(:get_user_leads, options)
      end
    end
  end
end