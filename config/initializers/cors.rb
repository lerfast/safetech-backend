# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001'  # Asegúrate de permitir solicitudes desde el puerto donde se ejecuta tu frontend
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true  # Si estás manejando cookies u autenticación basada en sesiones
    end
  end
  