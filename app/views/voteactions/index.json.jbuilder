json.array!(@voteactions) do |voteaction|
  json.extract! voteaction, :id
  json.url voteaction_url(voteaction, format: :json)
end
