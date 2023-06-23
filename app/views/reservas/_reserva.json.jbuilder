json.extract! reserva, :id, :email, :horario, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
