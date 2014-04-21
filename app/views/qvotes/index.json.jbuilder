json.array!(@qvotes) do |qvote|
  json.extract! qvote, :id, :user_id, :question_id
  json.url qvote_url(qvote, format: :json)
end
