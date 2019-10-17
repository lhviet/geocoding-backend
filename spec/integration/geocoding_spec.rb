require 'swagger_helper'

describe 'GeoCoding API' do

  path '/geocoding/query' do

    get 'Geocoding query' do
      tags 'Geocoding'
      produces 'application/json', 'application/xml'
      parameter name: :l, :in => :query, :type => :string
      parameter name: :q, :in => :query, :type => :string

      response '200', 'locations found' do
        schema type: :object,
               properties: {
                   title: { type: :string },
                   lat: { type: :string },
                   lng: { type: :float },
                   desc: { type: :string }
               },
               required: [ 'title', 'desc', 'lat', 'lng' ]

        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

  end

end
