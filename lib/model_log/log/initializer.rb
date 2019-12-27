module ModelLog
  module Log
    module Initializer
      # {
      #   resource:     object_active_record,
      #   action:       create|update|destroy,
      # }
      def initialize(resource, action)
        @resource = resource
        @action = action
        verify_action!
      end

      private

      def verify_action!
        unless %i(create destory update).include? @action
          raise StandardError, "invalid action given #{@action}"
        end
      end
    end
  end
end