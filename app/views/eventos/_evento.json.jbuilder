json.extract! evento, :id, :eventName, :description, :start_time, :end_time, :created_at, :updated_at
json.url evento_url(evento, format: :json)
