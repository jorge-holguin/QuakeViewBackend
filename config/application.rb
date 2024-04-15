require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    config.load_defaults 7.1

    # Configuración de CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # Permitir solicitudes desde cualquier origen

        # Configuración para permitir los métodos HTTP y los encabezados necesarios
        resource '/api/*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]

        # Si necesitas configuraciones específicas para otros recursos,
        # agrégalas aquí utilizando el mismo formato.
      end
    end

    # Ignorar subdirectorios de lib que no contienen archivos .rb
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib', 'services') # Ejemplo de cómo agregar un subdirectorio específico de lib

    # Otros ajustes de configuración de la aplicación van aquí
  end
end
