json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :author, :abstract, :rating, :google_url, :journal
  json.url publication_url(publication, format: :json)
end
