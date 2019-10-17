# README
### Introduction
The backend supports two main tasks:
1. CRUD for Marker `/api/v1/markers`
2. Geocoding `/api/v1/geocoding/query`, and `/api/v1/geocoding/reverse`

#### Demo
- Live at 
http://ec2-15-164-215-34.ap-northeast-2.compute.amazonaws.com:3000

- Swagger docs (partially completed)
http://ec2-15-164-215-34.ap-northeast-2.compute.amazonaws.com:3000/api-docs

### Feature
- Users are allowed to interact with Markers to create, update, delete, and read
- A Marker contains information includes:
```
- id: number, the id of the Marker
- title: string, the title of the Marker (required)
- lat: number, the latitude value of the Marker location (required)
- lng: number, the longitude value of the Marker location (required)
- desc: string, the description of the Marker
- info: json, the advaned information, metadata, for future usages, i.e., color of the Marker
- created_at: timestamp of the Marker creation
- updated_at: timestamp of the Marker latest modification
```
- Geocoding using Bing Maps API services (free, for testing). For advanced usages, Google Maps API is better with a lot of information, however, it will cost.
- `/api/v1/geocoding/query` receives two query params: `l` for locale, i.e., `l=DE` for Germany, and `q` for query keyworks, i.e., `q=lake sammamish`
- `/api/v1/geocoding/query?l=de&q=lake sammamish`
- `/api/v1/geocoding/query?q=berlin`
- `/api/v1/geocoding/reverse?lat=47.610679194331169&lng=-122.107886597a51415`

#### Implementation
- Partial Swagger docs
- Partial tests. Tests in /test/**, i.e., `/test/controllers/api/v1/`
- Marker CRUD
- Geocoding, reverse

#### Current configs
- CORS allows all-traffic
- Whitelist all hostnames

#### How to Deploy
- Environment: AWS EC2 Ubuntu 18 LTS

**Ruby** 
- Recommend version 2.5.1 (to install/compile smoothly), but 2.6.5 is Ok.

- `sudo apt install ruby`

**Setup**

*1. Manually install nokogiri if it fails `bundle install`*

https://nokogiri.org/tutorials/installing_nokogiri.html
- `sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev`
- `gem install nokogiri`

*2. Manually install sqlite3 if it fails `bundle install`*
- `sudo apt-get install sqlite3`
- `sudo apt-get install -y sqlite3 libsqlite3-dev`

*3. Install rails*
- `sudo apt install ruby-railties`
- `sudo gem install rails`

*4. You need to modify the ./Gemfile for your Ruby version, i.e. 2.5.1*
- The Gemfile now is using Ruby 2.6.5.

*5. Install dependencies*
- `bundle install`

*6. Migrate datbase*
- `rake db:migrate`

*7. Run the server in the background & publish at 0.0.0.0*
- `rails s -b 0.0.0.0 -d`