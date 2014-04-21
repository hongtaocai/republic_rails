json.array!(@questions) do |question|
  json.extract! question, :id, :title, :user_id, :vote, :publication_id, :created_time, :content
  json.url question_url(question, format: :json)
end
