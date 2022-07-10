json.extract! registration, :id, :name, :date, :group, :created_at, :updated_at
json.url registration_url(registration, format: :json)
