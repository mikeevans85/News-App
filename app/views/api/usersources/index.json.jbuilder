# json.array! @stuff.each do |stuff|
#   json.partial! "usersource.json.jbuilder", stuff: stuff
# end

json.array! @articles
# json.stuff @stuff