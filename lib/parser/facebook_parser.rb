require 'nokogiri'
require 'open-uri'
require_relative 'parser'

module Widgetify

  class FacebookParser < Parser
    def initialize(url, facebook_access_token)
      @url = url
      @facebook_access_token = facebook_access_token
      parse_facebook if self.parseable?(@url)
    end

    protected

      def parse_facebook
        uri = URI.parse(@url)
        query = Rack::Utils.parse_nested_query(uri.query)

        if query['v']
          # Video item: not supported yet
          #graph = Koala::Facebook::API.new(@facebook_access_token)
          #video = graph.get_object(query['v'])

          #self[:videos] = [video]
        elsif query['fbid']
          # image item
          graph = Koala::Facebook::API.new(@facebook_access_token)
          image = graph.get_object(query['fbid'])
          image['url'] = image['source']

          self[:title] = image['name']
          self[:source_url] = image['url']
          self[:image_url] = image['url']
          self[:site_name] = 'Facebook'
          self[:type] = 'photo'

          self[:images] = [image]
        end
      end

    class << self
      def parseable?(url)
        uri = URI.parse(url)
        return (uri.host == 'www.facebook.com' && uri.path == '/photo.php')
      end
    end

  end

end