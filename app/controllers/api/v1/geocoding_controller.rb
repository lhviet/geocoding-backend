class Api::V1::GeocodingController < ApplicationController
  @@geocoding = Geocoding::Bing.new

  def query
    locale = request.query_parameters[:l]
    keywords = request.query_parameters[:q]

    # Set the local as nil if it is blank or having an invalid value, i.e., "^^&&&#@$#"
    is_locale_valid = !locale.present? ? false : URI.parse(locale) rescue false
    locale = is_locale_valid ? URI.encode(locale) : nil

    if keywords.present?
      render json: @@geocoding.search(URI.encode(keywords), locale)
    else
      render json: []
    end
  end

  def reverse
    lat = request.query_parameters[:lat]
    lng = request.query_parameters[:lng]
    render json: @@geocoding.reverse(lat, lng)
  end
end
