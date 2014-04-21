json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_id, :vote, :created_time, :content, :question_id
  json.url answer_url(answer, format: :json)
end
