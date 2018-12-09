json.name source.name
json.id source.id
json.api_url source.api_url
json.source_language source.source_language
json.place_of_pub source.place_of_pub
json.description source.description
json.image_url source.image_url
json.subscribed current_user.sources.include? source if current_user