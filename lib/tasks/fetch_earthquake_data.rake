namespace :earthquake_data do
  desc "Fetch earthquake data from USGS"
  task fetch: :environment do
    require 'httparty'
    require 'logger'

    logger = Logger.new(STDOUT)
    url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    begin
      response = HTTParty.get(url)
      if response.code == 200
        features = response.parsed_response['features'] || []
        logger.info "Fetched #{features.size} features from USGS."

        features.each do |feature|
          next if feature['properties']['mag'].nil? || feature['properties']['place'].nil?
          next unless feature['properties']['mag'].between?(-1.0, 10.0)
          next unless feature['geometry']['coordinates'][0].between?(-180.0, 180.0) && feature['geometry']['coordinates'][1].between?(-90.0, 90.0)

          earthquake = Feature.create(
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

          if earthquake.persisted?
            logger.info "Successfully created feature with external ID: #{feature['id']}."
          else
            logger.error "Failed to create feature: #{earthquake.errors.full_messages.join(", ")}."
          end
        end
      else
        logger.error "Failed to fetch data: HTTP Status Code #{response.code}"
      end
    rescue StandardError => e
      logger.error "An error occurred: #{e.message}"
    end
  end
end

  