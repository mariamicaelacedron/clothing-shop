# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpiar la base de datos
puts "Limpiando la base de datos..."
User.destroy_all

# Crear usuario admin
puts "Creando usuario admin..."
admin = User.create!(
  email: 'admin@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: true
)
puts "Usuario admin creado: #{admin.email}"

# Crear usuario normal
puts "Creando usuario normal..."
user = User.create!(
  email: 'usuario@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: false
)
puts "Usuario normal creado: #{user.email}"

puts "¡Seed completado!"
puts "Credenciales de acceso:"
puts "Admin:"
puts "  Email: admin@example.com"
puts "  Contraseña: password123"
puts "\nUsuario normal:"
puts "  Email: usuario@example.com"
puts "  Contraseña: password123"
