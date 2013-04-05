module Widgetify
  module Config
    attr_accessor :embedly_key, :embedly_user_agent,
                  :facebook_app_id, :facebook_secret

    class << self
      def option_keys
        @options_keys ||= [:embedly_key, :embedly_user_agent]
      end
    end

    def options
      Hash[Widgetify::Config.option_keys.map {|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    def configure
      yield self
      self
    end
  end
end