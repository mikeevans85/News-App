# json.array! @feed.each do |feed|
#   json.partial! "usersource.json.jbuilder", feed: feed
# end

json.feed @feed
