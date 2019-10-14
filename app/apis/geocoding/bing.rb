module Geocoding
  class Bing
    API_ENDPOINT = 'https://dev.virtualearth.net'.freeze
    TOKEN = 'AgelPq2xsLLllKrPwizrnRavEseePp6SIjrap9SFbaEqQ7H9T0bsnvMnDJFpsVig'.freeze

    def search(keywords, locale = nil)
      locale_url = "/#{locale}" if locale.present?
      map_to_markers(
          request(
              http_method: :get,
              endpoint: "/REST/v1/Locations#{locale_url}/#{keywords}",
              params: {key: TOKEN}
          )
      )
    end

    def reverse(lat, long)
      request(
          http_method: :get,
          endpoint: "/REST/v1/LocationRecog/#{lat},#{long}",
          params: {key: TOKEN}
      )
    end

    private

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        # client.response :logger
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      Oj.load(response.success? ? response.body : {})
    end

    def map_to_markers(geocoding_result)
      markers = []
      resource_sets = geocoding_result['resourceSets']
      if resource_sets.present? && resource_sets.count > 0 && resource_sets[0]['estimatedTotal'] > 0
        resource_sets[0]['resources'].each do |res|
          coord = res['point']['coordinates']
          marker = Marker.new(
              {
                  title: res['name'],
                  lat: coord[0],
                  lng: coord[1],
                  desc: res['address']['countryRegion'],
              }
          )
          markers << marker
        end
      end
      markers
    end
  end
end