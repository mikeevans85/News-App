array = []
@feed.each do |feed|
  array << feed.source_id
end

api_array = []
index = 0

array.length.times do 
  @source = Source.find_by(id: array[index])
  api_array << @source.api_url
  index +=1
end

json.array api_array
