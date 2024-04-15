# QuakeWatch Backend

## Description
QuakeWatch is an application for monitoring and visualizing real-time earthquake data, using data provided by the USGS (United States Geological Survey). This backend is developed in Ruby on Rails and is responsible for processing and serving earthquake data through a REST API.

## Environment Setup
### Requirements
- Ruby 3.2.3
- Rails 7.1.3.2
- PostgreSQL
git ad
### Installation
Clone the repository and install dependencies:
```bash
git clone https://github.com/jorge-holguin/QuakeViewBackend.git
cd QuakeWatch/backend
bundle install
```

### Database Configuration
Make sure to configure your connection string in the config/database.yml file and set the DATABASE_URL environment variable.

Running Migrations
To set up your database, run:

```bash
rails db:create db:migrate
```

### Scheduled Tasks
To import earthquake data from the USGS API, run:

```bash
rake earthquake_data:fetch
```
### Deployment on Fly.io
This project is configured to deploy on Fly.io. Follow the steps in Fly.io's official documentation to set up deployment.

### Environment Variables
Define necessary variables like DATABASE_URL using flyctl secrets set.

### Usage
The Rails server can be started locally with:

```bash
rails server
```

To access the API, navigate to http://localhost:3000/api/features.

### Contributions
Contributions are welcome. Please submit your pull requests to the main branch.

### License
MIT License