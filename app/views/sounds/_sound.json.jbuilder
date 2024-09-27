json.extract! sound, :id, :title, :description, :file, :created_at, :updated_at
json.url sound_url(sound, format: :json)
json.file url_for(sound.file)
