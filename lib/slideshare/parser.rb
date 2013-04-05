require 'active_support/core_ext/hash/conversions'

module Slip::Slideshare
  class Parser
    
    def initialize(response)
      @response = response      
    end

    def parse      
      Hash.from_xml(@response)
    end
  end
end