namespace :earthquake_data do
    desc "Fetch earthquake data from USGS"
    task fetch: :environment do
      require 'httparty'
  
      response = HTTParty.get('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson')
      features = response.parsed_response['features'] || []
      
      features.each do |feature|
        next if feature['properties']['mag'].nil? || feature['properties']['place'].nil?
        next unless feature['properties']['mag'].between?(-1.0, 10.0)
        next unless feature['geometry']['coordinates'][0].between?(-180.0, 180.0) && feature['geometry']['coordinates'][1].between?(-90.0, 90.0)
  
        Feature.create(
          external_id: feature['id'],
          magnitude: feature['properties']['mag'],
          place: feature['properties']['place'],
          time: Time.at(feature['properties']['time'] / 1000),
          tsunami: feature['properties']['tsunami'] == 1,
          mag_type: feature['properties']['magType'],
          title: feature['properties']['title'],
          longitude: feature['geometry']['coordinates'][0],
          latitude: feature['geometry']['coordinates'][1]
        )
      end
    end
  end
  
