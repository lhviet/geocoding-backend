require 'swagger_helper'

describe 'Markers API' do

  path '/markers' do

    post 'Creates a Marker' do
      tags 'Markers'
      consumes 'application/json', 'application/xml'
      parameter name: :marker, in: :body, schema: {
          type: :object,
          properties: {
              title: { type: :string },
              lat: { type: :string },
              lng: { type: :float },
              desc: { type: :string },
              info: { type: :json }
          },
          required: [ 'title', 'lat', 'lng' ]
      }

      response '201', 'Marker created' do
        let(:marker) { { title: 'Dump Marker', lat: 80.123, lng: 120.456 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:marker) { { title: 'Invalid Marker' } }
        run_test!
      end
    end
  end

  path '/markers/{id}' do

    get 'Retrieves a Marker' do
      tags 'Markers'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'marker found' do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   lat: { type: :string },
                   lng: { type: :float },
                   desc: { type: :string },
                   info: { type: :json },
                   updated_at: { type: :string },
                   created_at: { type: :string }
               },
               required: [ 'id', 'title', 'lat', 'lng' ]

        let(:id) { Marker.create(title: 'Dump Marker', lat: 80.123, lng: 120.456).id }
        run_test!
      end

      response '404', 'marker not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end
