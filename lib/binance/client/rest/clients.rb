
require 'faraday_middleware'

module Binance
  module Client
    class REST
      def public_client(adapter, proxy = nil)
        Faraday.new("#{BASE_URL}/api", get_conn_option(proxy)) do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          if proxy
            conn.adapter :em_http
          else
            conn.adapter adapter
          end
        end
      end

      def verified_client(api_key, adapter, proxy = nil)
        Faraday.new("#{BASE_URL}/api", get_conn_option(proxy)) do |conn|
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          if proxy
            conn.adapter :em_http
          else
            conn.adapter adapter
          end
        end
      end

      def signed_client(api_key, secret_key, adapter, proxy = nil)
        Faraday.new("#{BASE_URL}/api", get_conn_option(proxy)) do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          conn.use TimestampRequestMiddleware
          conn.use SignRequestMiddleware, secret_key
          if proxy
            conn.adapter :em_http
          else
            conn.adapter adapter
          end
        end
      end

      def public_withdraw_client(adapter, proxy = nil)
        Faraday.new("#{BASE_URL}/wapi", get_conn_option(proxy)) do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          if proxy
            conn.adapter :em_http
          else
            conn.adapter adapter
          end
        end
      end

      def withdraw_client(api_key, secret_key, adapter, proxy = nil)
        Faraday.new("#{BASE_URL}/wapi", get_conn_option(proxy)) do |conn|
          conn.request :url_encoded
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          conn.use TimestampRequestMiddleware
          conn.use SignRequestMiddleware, secret_key
          if proxy
            conn.adapter :em_http
          else
            conn.adapter adapter
          end
        end
      end
      private
      def get_conn_option(proxy)
        if proxy
            conn_options = { ssl: {verify: false} }
            conn_options[:proxy] = proxy
            return conn_options
        else
          return nil
        end
      end
    end
  end
end