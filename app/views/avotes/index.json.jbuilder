json.array!(@avotes) do |avote|
  json.extract! avote, :id, :user_id, :answer_id
  json.url avote_url(avote, format: :json)
end
