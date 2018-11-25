json.api_list @feed.each do |feed|
  json.api_url feed.source.api_url
end