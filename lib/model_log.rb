require "model_log/version"
require "model_log/config"
require "model_log/store"
require "model_log/controller"
require "model_log/modeller"
require "model_log/logger"
require "model_log/context"
require "model_log/log/initializer"
require "model_log/log/content"
require "model_log/log/processor"
require "model_log/helpers/context"
require "model_log/default/formatter"

module ModelLog
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end

    def logger
      @_logger ||= Logger.new("model_log_#{::Rails.env}.log")
    end

    def requester
      Store.requester
    end

    def requester_exist?
      !!requester
    end

    def current_user
      Store.current_user
    end

    def current_user_exist?
      !!current_user
    end
  end
end

