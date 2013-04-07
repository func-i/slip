module Slip
  module Slideshare
    module Lead

      def get_user_campaign_leads(username, password, campaign_id, options = {})
        options.merge!(username: username, password: password, campaign_id: campaign_id)
        request.start(:get_user_campaign_leads, options)
      end

      def get_user_campaigns(username, password)
        request.start(:get_user_campaigns, {username: username, password: password})
      end

      def get_user_leads(username, password, options = {})
        options.merge(username: username, password: password)
        request.start(:get_user_leads, options)
      end
    end
  end
end