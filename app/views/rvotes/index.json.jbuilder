json.array!(@rvotes) do |rvote|
  json.extract! rvote, :id, :user_id, :review_id
  json.url rvote_url(rvote, format: :json)
end
